From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 11 Feb 2020 12:15:29 +0100
Subject: [Buildroot] [PATCH v2 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <CAAXf6LUu-2M24MvoqZnTgE0CYe0LK+0C4ov84Y2JejrbcEnoWw@mail.gmail.com>
References: <20200208215752.13628-1-titouan.christophe@railnova.eu>
 <20200208215752.13628-2-titouan.christophe@railnova.eu>
 <CAAXf6LUu-2M24MvoqZnTgE0CYe0LK+0C4ov84Y2JejrbcEnoWw@mail.gmail.com>
Message-ID: <7e98b20a-a1e3-e5fd-8506-0e6ae65de819@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Thanks for your review !

On 2/11/20 11:02 AM, Thomas De Schampheleire wrote:
> Hi Titouan, Thomas,
> 
> El s?b., 8 feb. 2020 a las 22:58, Titouan Christophe
> (<titouan.christophe@railnova.eu>) escribi?:
>>
>> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>
>> This commit extends the pkg-stats script to grab information about the
>> CVEs affecting the Buildroot packages.
>>
> 
> While I was testing and playing around, I found that the when the
> json.gz file is removed, it is not redownloaded.
> This is because here, the json.gz path is returned without checking
> that it exists.
> (I have some patch for this and next suggestions at the end of this mail).

Good catch, that probably happened because I flipped around the conditions.

> 
> During testing I initially got an error in the 2017 file:
> 
> Traceback (most recent call last):
>    File "support/scripts/pkg-stats", line 917, in <module>
>      __main__()
>    File "support/scripts/pkg-stats", line 906, in __main__
>      check_package_cves(args.nvd_path, {p.name: p for p in packages})
>    File "support/scripts/pkg-stats", line 484, in check_package_cves
>      for cve in CVE.read_nvd_dir(nvd_path):
>    File "support/scripts/pkg-stats", line 231, in read_nvd_dir
>      content = json.load(gzip.GzipFile(filename))
>    File "/usr/lib64/python2.7/json/__init__.py", line 287, in load
>      return loads(fp.read(),
>    File "/usr/lib64/python2.7/gzip.py", line 260, in read
>      self._read(readsize)
>    File "/usr/lib64/python2.7/gzip.py", line 314, in _read
>      self._read_eof()
>    File "/usr/lib64/python2.7/gzip.py", line 353, in _read_eof
>      hex(self.crc)))
> IOError: CRC check failed 0x9b7b00d7 != 0x790947a4L

I'm curious to understand how that happened :o

> 
> I'm not sure how this happened, but after removing the file and
> redownloading it got fixed.
> I then tried reproducing such problem by manually messing with the
> json.gz file, and this created another error:
> 
> Traceback (most recent call last):
>    File "support/scripts/pkg-stats", line 919, in <module>
>      __main__()
>    File "support/scripts/pkg-stats", line 908, in __main__
>      check_package_cves(args.nvd_path, {p.name: p for p in packages})
>    File "support/scripts/pkg-stats", line 486, in check_package_cves
>      for cve in CVE.read_nvd_dir(nvd_path):
>    File "support/scripts/pkg-stats", line 233, in read_nvd_dir
>      content = json.load(gzip.GzipFile(filename))
>    File "/usr/lib64/python2.7/json/__init__.py", line 287, in load
>      return loads(fp.read(),
>    File "/usr/lib64/python2.7/gzip.py", line 260, in read
>      self._read(readsize)
>    File "/usr/lib64/python2.7/gzip.py", line 318, in _read
>      uncompress = self.decompress.decompress(buf)
> zlib.error: Error -3 while decompressing: invalid distance too far back
> 
> I suggest a better error handling for such case (see below).

[SNIP]

> If the the passed nvd path does not exist, the script will fail. I
> suggest creating the dir automatically.
> 
> 
> The below changes implement the suggestions above:
> 
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 2784a43d05..e8f708537e 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -27,8 +27,10 @@ import requests  # URL checking
>   import json
>   import certifi
>   import distutils.version
> +import sys
>   import time
>   import gzip
> +import zlib
>   from urllib3 import HTTPSConnectionPool
>   from urllib3.exceptions import HTTPError
>   from multiprocessing import Pool
> @@ -201,10 +203,12 @@ class CVE:
>           print("Getting %s" % url)
>           page_meta = requests.get(url)
>           page_meta.raise_for_status()
> -        if os.path.exists(path_metaf):
> -            # If the meta file already existed, we compare the existing
> -            # one with the data newly downloaded. If they are different,
> -            # we need to re-download the database.
> +        # If the meta file already existed, we compare the existing
> +        # one with the data newly downloaded. If they are different,
> +        # we need to re-download the database.
> +        # If the database does not exist locally, we need to redownload it in
> +        # any case.
> +        if os.path.exists(path_metaf) and os.path.exists(path_jsonf_gz):
>               meta_known = open(path_metaf, "r").read()
>               if page_meta.text == meta_known:
>                   return path_jsonf_gz

=> agreed

> @@ -227,7 +231,13 @@ class CVE:
>           """
>           for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
>               filename = CVE.download_nvd_year(nvd_dir, year)
> -            content = json.load(gzip.GzipFile(filename))
> +            try:
> +                content = json.load(gzip.GzipFile(filename))
> +            except (zlib.error, IOError) as e:
> +                print('ERROR: problem reading %s, please remove the
> file and rerun this script.' % filename)
> +                print(e)
> +                sys.exit(1)
> +

I don't find it pythonic to catch the exception then exit. Unless 
there's a really good reason to do so, I'd prefer to let the exception 
bubble up, as it helps diagnosing the issue. Maybe something like:

try:
     content = json.load(gzip.GzipFile(filename))
except:
     # Display an informative message about the problematic file
     print("ERROR: cannot read %s. Please remove the file then rerun 
this script" % filename)
     # Then bubble up the exception
     raise

(Also, exit() is included in the global namespace, so no need to import 
the sys module for that)

>               for cve in content["CVE_Items"]:
>                   yield cls(cve['cve'])
> 
> @@ -892,6 +902,8 @@ def __main__():
>       check_package_latest_version(packages)
>       if args.nvd_path:
>           print("Checking packages CVEs")
> +        if not os.path.exists(args.nvd_path):
> +            os.makedirs(args.nvd_path)

I thought that not creating the directory was a design choice, but this 
indeed makes much more sense.

>           check_package_cves(args.nvd_path, {p.name: p for p in packages})
>       print("Calculate stats")
>       stats = calculate_stats(packages)
> 
> 
> Best regards,
> Thomas
> 

Regards,

Titouan
