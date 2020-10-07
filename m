From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 7 Oct 2020 11:12:22 +0200
Subject: [Buildroot] [PATCH 11/17] Support/scripts/cpedb.py: Convert to
 Python 3
In-Reply-To: <20201006134250.22738-12-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
 <20201006134250.22738-12-gregory.clement@bootlin.com>
Message-ID: <CAEyMn7Ym5OAfxk71B9_QGpkO7ttC7FwTr9SJjMvV8hMODKMR7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gregory, Hi Matt,

Am Di., 6. Okt. 2020 um 15:43 Uhr schrieb Gregory CLEMENT
<gregory.clement@bootlin.com>:
>
> Switch the script to be used with pyhton 3

I tried to use the cpe-report script with python 3 but get some errors
with the urllib3. It seems that this lib does not provide the urlopen
methods compared to the urllib2.

I added a new function that replaces the download, decompress and xml
parse stuff and now it works for me with python3.

--- [snip ---
    def _get_cpedb(self, url):
        print("CPE: Fetching xml manifest from [" + url + "]")
        c = urllib3.PoolManager()
        try:
            rsp = c.request('GET', url)
        except urllib3.exceptions.HTTPError:
            print("CPE: HTTP Error: %s" % url)
            sys.exit(1)

        print("CPE: Unzipping xml manifest...")
        nist_cpe_file = gzip.decompress(rsp.data)

        print("CPE: Converting xml manifest to dict...")
        all_cpedb = xmltodict.parse(nist_cpe_file)

        return all_cpedb
--- [snip ---]

> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  support/scripts/cpedb.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
> index 0369536f6f..6e48772b5e 100644
> --- a/support/scripts/cpedb.py
> +++ b/support/scripts/cpedb.py
> @@ -1,9 +1,9 @@
>  import sys
> -import urllib2
> +import urllib3
>  from collections import OrderedDict
>  import xmltodict
>  import gzip
> -from StringIO import StringIO
> +from io import StringIO
>  import os
>  import pickle
>
> @@ -65,7 +65,7 @@ class CPEDB:
>      def get_new_xml_dict(self, url):
>          print("CPE: Fetching xml manifest from [" + url + "]")
>          try:
> -            compressed_cpe_file = urllib2.urlopen(url)
> +            compressed_cpe_file = urllib3.urlopen(url)
>              print("CPE: Unzipping xml manifest...")
>              nist_cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
>              print("CPE: Converting xml manifest to dict...")
> @@ -113,10 +113,10 @@ class CPEDB:
>                  # latest version in the NIST dict)
>                  self.all_cpes_no_version.update({cpe_str_no_version: item})
>
> -        except urllib2.HTTPError:
> +        except urllib3.HTTPError:
>              print("CPE: HTTP Error: %s" % url)
>              sys.exit(1)
> -        except urllib2.URLError:
> +        except urllib3.URLError:
>              print("CPE: URL Error: %s" % url)
>              sys.exit(1)
>
> @@ -156,7 +156,7 @@ class CPEDB:
>
>      def get_nvd_url(self, cpe_str):
>          return "https://nvd.nist.gov/products/cpe/search/results?keyword=" + \
> -                urllib2.quote(cpe_str) + \
> +                urllib3.quote(cpe_str) + \
>                  "&status=FINAL&orderBy=CPEURI&namingFormat=2.3"
>
>      def get_cpe_no_version(self, cpe):
> --
> 2.28.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
