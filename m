From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Aug 2017 22:28:26 +0200
Subject: [Buildroot] [PATCH/next 1/3] package/kodi: bump to version 17.4
References: <20170822201526.3285-1-bernd.kuhls@t-online.de>
 <20170823155102.1843b9f8@windsurf>
Message-ID: <a4517exl1r.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi THomas,

Am Wed, 23 Aug 2017 15:51:02 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue, 22 Aug 2017 22:15:24 +0200, Bernd Kuhls wrote:
>> Removed patch 0003, applied upstream:
>> https://github.com/xbmc/xbmc/
commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
>> 
>> -DWITH_FFMPEG is needed due to commit
>> https://github.com/xbmc/xbmc/
commit/5ba6eb7cadc41d5eb86ef94e3661b833b62953ff
> 
> It is not clear to me what in this commit makes -DWITH_FFMPEG required.
> Could you explain?

the commit changes the ffmpeg version check from "at least version x.x" 
to "exactly version x.x":

https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/
FindFFMPEG.cmake#L40

If a system-provided ffmpeg version > 3.1 is found Kodi will compile 
ffmpeg itself which is something we do not want:

-- Downloading...
   dst='/home/buildroot/br5_next/output/build/kodi-17.4-Krypton/project/
cmake/build/download/ffmpeg-3.1.9-Krypton-17.4.tar.gz'
-- [download 1% complete]
-- [download 2% complete]
-- [download 3% complete]
-- [download 4% complete]
[...]

For details about the change please read https://forum.kodi.tv/
showthread.php?tid=317137&pid=2608648#pid2608648

To avoid the ffmpeg version check we need to use -DWITH_FFMPEG:
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/
FindFFMPEG.cmake#L49

The original bug which caused the discussion about system-provided ffmpeg 
vs. Kodi-built ffmpeg was also solved: https://github.com/xbmc/xbmc/
pull/12361 so imho there is no problem to bump Kodi to 17.4. I am using 
it for months without problems.

Regards, Bernd
