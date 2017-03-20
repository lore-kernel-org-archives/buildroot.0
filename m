From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Mar 2017 21:39:39 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
In-Reply-To: <20170320202708.75f88379@gmx.net>
References: <20170315210828.3784-1-ps.report@gmx.net>
 <20170318141428.0c4b6d36@free-electrons.com>
 <20170319222409.205633ad@gmx.net>
 <53182259-8ac8-de42-4ffb-ecd79e2597fe@mind.be>
 <1cda02af-597a-5254-253e-5bcc84ac7ddd@mind.be>
 <20170320202708.75f88379@gmx.net>
Message-ID: <09ab824d-407e-e491-7e59-3521b8bd0ec7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-03-17 20:27, Peter Seiderer wrote:
> Hello Arnout, Yann, Thomas,
> 
> On Sun, 19 Mar 2017 23:31:36 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
[snip]
>>  Oh, maybe it's in the timestamps, so also compare the output of
>>
>> tar tvf ~/src/buildroot/dl/wiringpi-2.44.tar.gz
>>
>> with https://gitlab.com/snippets/1655090/raw
>>
> 
> sha256sums and timestamps are all the same, the difference is in the atime and ctime,
> comparing the output of two different downloads on my system
> 
> 	$ tar -xf t001/wiringpi-2.44.tar --to-command='echo $TAR_FILENAME $TAR_ATIME $TAR_MTIME $TAR_CTIME' > t001/files_atime_mtime_ctime.txt
> 	$ tar -xf t002/wiringpi-2.44.tar --to-command='echo $TAR_FILENAME $TAR_ATIME $TAR_MTIME $TAR_CTIME' > t002/files_atime_mtime_ctime.txt

 atime and ctime are (as far as I know) not encoded in the tar file. Run the
command twice with the same tar file and you'll get different atime and ctime.

> 
> 	$ head t001/files_atime_mtime_ctime.txt
> wiringpi-2.44/.gitignore 1489958464.60118197 1488369319 1489958464.464182585

 This is a little weird, however:

 - atime is normally the current time, but these timestamps are from yesterday.
 - ctime is normally equal to atime.

 So maybe your tar *does* encode the atime and ctime?

 Checking the source code... Looks like atime and ctime are preserved when either:

1. gnu or oldgnu format is used, and the incremental (-G) option is used; or
2. posix format is used (even then there are a few exceptions).

 Since we don't add -G, I guess you create archives in posix format. Quoting the
info pages:


   The default format for GNU 'tar' is defined at compilation time.  You
may check it by running 'tar --help', and examining the last lines of
its output.  Usually, GNU 'tar' is configured to create archives in
'gnu' format, however, future version will switch to 'posix'.


 Since our hashes are currently based on GNU format, I guess we should add
--format=gnu to our tar commands.

 Patch follows.

 Regards,
 Arnout


> wiringpi-2.44/COPYING.LESSER 1489958464.60118197 1488369319 1489958464.464182585
> wiringpi-2.44/INSTALL 1489958464.602181965 1488369319 1489958464.464182585
> wiringpi-2.44/People 1489958464.602181965 1488369319 1489958464.464182585
> wiringpi-2.44/README.TXT 1489958464.602181965 1488369319 1489958464.464182585
> wiringpi-2.44/VERSION 1489958464.602181965 1488369319 1489958464.464182585
> wiringpi-2.44/build 1489958464.602181965 1488369319 1489958464.464182585
> wiringpi-2.44/debian-template/wiringPi/DEBIAN/control 1489958464.602181965 1488369319 1489958464.465182581
> wiringpi-2.44/debian-template/wiringPi/DEBIAN/postinst 1489958464.602181965 1488369319 1489958464.465182581
> wiringpi-2.44/debian-template/wiringPi/DEBIAN/postrm 1489958464.602181965 1488369319 1489958464.465182581
> 
> 	$ head t002/files_atime_mtime_ctime.txt
> wiringpi-2.44/.gitignore 1490036719.006803894 1488369319 1490036718.876804412
> wiringpi-2.44/COPYING.LESSER 1490036719.006803894 1488369319 1490036718.876804412
> wiringpi-2.44/INSTALL 1490036719.007803891 1488369319 1490036718.876804412
> wiringpi-2.44/People 1490036719.007803891 1488369319 1490036718.877804408
> wiringpi-2.44/README.TXT 1490036719.007803891 1488369319 1490036718.877804408
> wiringpi-2.44/VERSION 1490036719.007803891 1488369319 1490036718.877804408
> wiringpi-2.44/build 1490036719.007803891 1488369319 1490036718.877804408
> wiringpi-2.44/debian-template/wiringPi/DEBIAN/control 1490036719.007803891 1488369319 1490036718.878804404
> wiringpi-2.44/debian-template/wiringPi/DEBIAN/postinst 1490036719.007803891 1488369319 1490036718.878804404
> wiringpi-2.44/debian-template/wiringPi/DEBIAN/postrm 1490036719.007803891 1488369319 1490036718.878804404
> 
> 	
> 	$ git --version
> git version 2.11.0
> 
> 	$ tar --version
> tar (GNU tar) 1.28
> 
> Regards,
> Peter
> 
> 
>>  Regards,
>>  Arnout
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
