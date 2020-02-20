From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 12:42:14 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <97bf24b6-a272-3707-b825-676c9410d60a@railnova.eu> (Titouan
 Christophe's message of "Thu, 20 Feb 2020 11:26:38 +0100")
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
 <20200219194858.11b317f6@windsurf>
 <CAAXf6LV8MSXPGrQW2GUhJcR4pjupw2EHFb7H6x4R0OkbrYFiMQ@mail.gmail.com>
 <97bf24b6-a272-3707-b825-676c9410d60a@railnova.eu>
Message-ID: <871rqpcwo9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

Hi,

 > I tried to evaluate how much memory the NVD JSON files actually use
 > when loaded as Python objects. To do that, I used the function given
 > here:
 > https://goshippo.com/blog/measure-real-size-any-python-object/.

 > I used the file for the year 2018 as example. This file weights 10MB
 > in compressed form, and 254MB when uncompressed. I then call the
 > function get_size on
 > json.load(gzip.GzipFile("nvdcve-1.0-2018.json.gz"))

 > In Python 2.7, the total size used is as high as 1531882276 Bytes  (or
 > ~1.5GB) ! The same test in Python 3.6 gives me 718038090 Bytes
 > (~718MB).

Wow!

 >> 
 >> I did a full run to verify these findings, observing the free memory with 'top'.
 >> Even though this is not a fully scientific method, the 'used' memory
 >> before was ~4800 MB and while the CVE parsing was ongoing I saw peaks
 >> up to ~7900 MB. So yes, it seems there is a large memory footprint.
 >> As my machine has enough RAM, the analysis does complete and results
 >> seem correct.
 >> 
 >> 
 >> This seems to be caused mostly by the fact that we load the entire
 >> json file in memory.
 >> As a test, I just loaded the file from an interactive python session.

 > I guess we should then process the CVE files in streaming. This is
 > quite easy to do in the CVE.read_nvd_dir() method. I'll give it a try
 > today.

Yes, should not be too bad as we process the CVEs one at a time. What
will you use? ijson?

-- 
Bye, Peter Korsgaard
