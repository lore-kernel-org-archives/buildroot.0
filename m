From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 20 Feb 2020 11:26:38 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
 <20200219194858.11b317f6@windsurf>
 <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
Message-ID: <97bf24b6-a272-3707-b825-676c9410d60a@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas^2 and all,
On 2/19/20 9:33 PM, Thomas De Schampheleire wrote:
> El mi?., 19 feb. 2020 a las 19:49, Thomas Petazzoni
> (<thomas.petazzoni@bootlin.com>) escribi?:
>>
>> Hello Titouan,
>>
>> On Sat, 15 Feb 2020 13:44:16 +0100
>> Titouan Christophe <titouan.christophe@railnova.eu> wrote:
>>
>>> This commit extends the pkg-stats script to grab information about the
>>> CVEs affecting the Buildroot packages.
>>
>> Here the script consumes too much memory. On my 4 GB RAM server, the
>> script gets killed by the OOM killer. It goes like this:
>>

[--SNIP--]

>>
>> So Python needs more than 4.2 GB of virtual memory, and 3.6 GB of
>> resident memory. To me, it feels like there is something wrong going on
>> with the NVD files.

I tried to evaluate how much memory the NVD JSON files actually use when 
loaded as Python objects. To do that, I used the function given here:
https://goshippo.com/blog/measure-real-size-any-python-object/.

I used the file for the year 2018 as example. This file weights 10MB in 
compressed form, and 254MB when uncompressed. I then call the function 
get_size on json.load(gzip.GzipFile("nvdcve-1.0-2018.json.gz"))

In Python 2.7, the total size used is as high as 1531882276 Bytes  (or 
~1.5GB) ! The same test in Python 3.6 gives me 718038090 Bytes (~718MB).

> 
> I did a full run to verify these findings, observing the free memory with 'top'.
> Even though this is not a fully scientific method, the 'used' memory
> before was ~4800 MB and while the CVE parsing was ongoing I saw peaks
> up to ~7900 MB. So yes, it seems there is a large memory footprint.
> As my machine has enough RAM, the analysis does complete and results
> seem correct.
> 
> 
> This seems to be caused mostly by the fact that we load the entire
> json file in memory.
> As a test, I just loaded the file from an interactive python session.

I guess we should then process the CVE files in streaming. This is quite 
easy to do in the CVE.read_nvd_dir() method. I'll give it a try today.

[-- SNIP --]

> Doing some quick google search, I stumbled upon the 'pandas' python
> package, which has a read_json function too. During a quick test, it
> seemed to be more memory efficient, and the total memory size on
> subsequent reads stayed in the 2.x GB range.

You probably don't want to use pandas here, which is a large library 
(10MB) to process data on top of numpy (pydata ecosystem). I use it a 
lot for data analysis on other projects, but it is definitely overkill 
to simply read a json file :)

> 
> content = pandas.read_json('/tmp/nvd/nvdcve-1.0-2019.json.gz')
> content = pandas.read_json('/tmp/nvd/nvdcve-1.0-2018.json.gz')
> 
> In the full test of pkg-stats, I still saw a peak memory usage near
> the end, but it 'seemed' better :-)
> 
> Thomas, could you try this on your 4GB server?
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index c113cf9606..8b4035dfd4 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -29,6 +29,7 @@ import certifi
>   import distutils.version
>   import time
>   import gzip
> +import pandas
>   from urllib3 import HTTPSConnectionPool
>   from urllib3.exceptions import HTTPError
>   from multiprocessing import Pool
> @@ -231,7 +232,7 @@ class CVE:
>           for year in range(NVD_START_YEAR, datetime.datetime.now().year + 1):
>               filename = CVE.download_nvd_year(nvd_dir, year)
>               try:
> -                content = json.load(gzip.GzipFile(filename))
> +                content = pandas.read_json(gzip.GzipFile(filename))
>               except:
>                   print("ERROR: cannot read %s. Please remove the file
> then rerun this script" % filename)
>                   raise
> 
> 
> pandas can be installed with pip.
> 
> 
> Best regards,
> Thomas
> 

Kind regards,

Titouan
