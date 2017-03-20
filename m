From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Mar 2017 20:27:08 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
In-Reply-To: <1cda02af-597a-5254-253e-5bcc84ac7ddd@mind.be>
References: <20170315210828.3784-1-ps.report@gmx.net>
 <20170318141428.0c4b6d36@free-electrons.com>
 <20170319222409.205633ad@gmx.net>
 <53182259-8ac8-de42-4ffb-ecd79e2597fe@mind.be>
 <1cda02af-597a-5254-253e-5bcc84ac7ddd@mind.be>
Message-ID: <20170320202708.75f88379@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Yann, Thomas,

On Sun, 19 Mar 2017 23:31:36 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 19-03-17 23:28, Arnout Vandecappelle wrote:
> > 
> > 
> > On 19-03-17 22:24, Peter Seiderer wrote:
> >> Hello Thomas,
> >>
> >> On Sat, 18 Mar 2017 14:14:28 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> >>
> >>> Hello,
> >>>
> >>> On Wed, 15 Mar 2017 22:08:28 +0100, Peter Seiderer wrote:
> >>>> - rebase 0001-Adjust-for-buildroot-build.patch
> >>>> - delete 0002-include-asm-ioctl.h-directly-for-_IOC_SIZEBITS.patch
> >>>>   (all changes are incorporated into wiringpi-2.44)
> >>>> - remove useless hash file (git download)
> >>> Git downloads now generate reproducible tarballs, so we in fact want to
> >>> add hashes for them as well. However, it is true that the hash is not
> >>> checked currently. This has been on the TODO-list for a while.
> >> Mhhh, tried several times, every time I get a different checksum:
> >>
> >> 	$ sha256sum dl/wiringpi-2.44.tar.gz 
> >> 5324ed452b7adfb77d049ea49dfe8878605c6198cb5c706ae2b285a70fb9d096  dl/wiringpi-2.44.tar.gz
> >>
> >> 	$ sha256sum dl/wiringpi-2.44.tar.gz 
> >> 65e6b3a916b940eec085222a28a5859b09e79e0020de2f2b07563d910426180c  dl/wiringpi-2.44.tar.gz
> > 
> > 
> >  Really weird, both Yann and I tested and we got the same sha256sum as Thomas
> > put in wiringpi.hash... So we are clearly still doing something wrong in the
> > download helper.
> > 
> >  To help us nail down the problem, could you do:
> > 
> > tar -xf dl/wiringpi-2.44.tar.gz
> > tar -tf dl/wiringpi-2.44.tar.gz | xargs sha256sum
> > 
> > and compare the output with https://gitlab.com/snippets/1655089/raw ?
> 
>  Oh, maybe it's in the timestamps, so also compare the output of
> 
> tar tvf ~/src/buildroot/dl/wiringpi-2.44.tar.gz
> 
> with https://gitlab.com/snippets/1655090/raw
> 

sha256sums and timestamps are all the same, the difference is in the atime and ctime,
comparing the output of two different downloads on my system

	$ tar -xf t001/wiringpi-2.44.tar --to-command='echo $TAR_FILENAME $TAR_ATIME $TAR_MTIME $TAR_CTIME' > t001/files_atime_mtime_ctime.txt
	$ tar -xf t002/wiringpi-2.44.tar --to-command='echo $TAR_FILENAME $TAR_ATIME $TAR_MTIME $TAR_CTIME' > t002/files_atime_mtime_ctime.txt

	$ head t001/files_atime_mtime_ctime.txt
wiringpi-2.44/.gitignore 1489958464.60118197 1488369319 1489958464.464182585
wiringpi-2.44/COPYING.LESSER 1489958464.60118197 1488369319 1489958464.464182585
wiringpi-2.44/INSTALL 1489958464.602181965 1488369319 1489958464.464182585
wiringpi-2.44/People 1489958464.602181965 1488369319 1489958464.464182585
wiringpi-2.44/README.TXT 1489958464.602181965 1488369319 1489958464.464182585
wiringpi-2.44/VERSION 1489958464.602181965 1488369319 1489958464.464182585
wiringpi-2.44/build 1489958464.602181965 1488369319 1489958464.464182585
wiringpi-2.44/debian-template/wiringPi/DEBIAN/control 1489958464.602181965 1488369319 1489958464.465182581
wiringpi-2.44/debian-template/wiringPi/DEBIAN/postinst 1489958464.602181965 1488369319 1489958464.465182581
wiringpi-2.44/debian-template/wiringPi/DEBIAN/postrm 1489958464.602181965 1488369319 1489958464.465182581

	$ head t002/files_atime_mtime_ctime.txt
wiringpi-2.44/.gitignore 1490036719.006803894 1488369319 1490036718.876804412
wiringpi-2.44/COPYING.LESSER 1490036719.006803894 1488369319 1490036718.876804412
wiringpi-2.44/INSTALL 1490036719.007803891 1488369319 1490036718.876804412
wiringpi-2.44/People 1490036719.007803891 1488369319 1490036718.877804408
wiringpi-2.44/README.TXT 1490036719.007803891 1488369319 1490036718.877804408
wiringpi-2.44/VERSION 1490036719.007803891 1488369319 1490036718.877804408
wiringpi-2.44/build 1490036719.007803891 1488369319 1490036718.877804408
wiringpi-2.44/debian-template/wiringPi/DEBIAN/control 1490036719.007803891 1488369319 1490036718.878804404
wiringpi-2.44/debian-template/wiringPi/DEBIAN/postinst 1490036719.007803891 1488369319 1490036718.878804404
wiringpi-2.44/debian-template/wiringPi/DEBIAN/postrm 1490036719.007803891 1488369319 1490036718.878804404

	
	$ git --version
git version 2.11.0

	$ tar --version
tar (GNU tar) 1.28

Regards,
Peter


>  Regards,
>  Arnout
