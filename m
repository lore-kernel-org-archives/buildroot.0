From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 3 Dec 2019 19:11:37 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: make
 it Python 3.x compatible
In-Reply-To: <20191203165457.1100390-1-thomas.petazzoni@bootlin.com>
References: <20191203165457.1100390-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191203171137.7aqw4tjmx24fgnqm@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 03, 2019 at 05:54:57PM +0100, Thomas Petazzoni wrote:
> With Python 3.7, the autobuild-run did not work due to the following
> issues:
> 
>  - The urlparse module no longer exists, it's not urllib.parse

s/not/now/

> 
>  - 0022 is no longer recognized as an octal value, we must use 0o022,
>    which also works in Python 2.x
> 
>  - reading the CSV file with the list of branches through the CSV
>    parser failed due to the lack of decoding, as urlopen_closing()
>    returns a stream of bytes and not strings. So we need to call
>    decode_bytes() on each element of the CSV array. Since the CSV file
>    is typically 3 or 4 lines long, we don't really need to optimize
>    things.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  scripts/autobuild-run | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/autobuild-run b/scripts/autobuild-run
> index 5921edd..e475ea8 100755
> --- a/scripts/autobuild-run
> +++ b/scripts/autobuild-run
> @@ -145,14 +145,15 @@ from distutils.version import StrictVersion
>  import platform
>  from threading import Thread, Event
>  import datetime
> -import urlparse
>  
>  if sys.hexversion >= 0x3000000:
>      import configparser
>      import urllib.request as _urllib
> +    import urllib.parse as urlparse

Would that work with any Python 3.x?

>  else:
>      import ConfigParser as configparser
>      import urllib2 as _urllib
> +    import urlparse
>  
>  urlopen = _urllib.urlopen
>  urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
> @@ -307,8 +308,10 @@ class Builder:
>          list. This way, branches with a higher weight are more likely to
>          be selected.
>          """
> +        csv_branches = []
>          with urlopen_closing(urlparse.urljoin(self.http_url, 'branches')) as r:
> -            csv_branches = r.readlines()
> +            for l in r.readlines():
> +                csv_branches.append(decode_bytes(l))
>          branches = []
>          for branch in csv.reader(csv_branches):
>              branches += [branch[0]] * int(branch[1])
> @@ -830,7 +833,7 @@ def main():
>      # Enforce the sanest umask here, to avoid buildroot doing it on its
>      # own and causing a double-make call, thus adding extraneous lines
>      # in case of failures.
> -    os.umask(0022)
> +    os.umask(0o022)
>  
>      def sigterm_handler(signum, frame):
>          """Kill all children"""

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
