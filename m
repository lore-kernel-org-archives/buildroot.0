From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Mar 2017 22:32:08 +0100
Subject: [Buildroot] [PATCH v1] wiringpi: bump to version 2.44
In-Reply-To: <09ab824d-407e-e491-7e59-3521b8bd0ec7@mind.be>
References: <20170315210828.3784-1-ps.report@gmx.net>
 <20170318141428.0c4b6d36@free-electrons.com>
 <20170319222409.205633ad@gmx.net>
 <53182259-8ac8-de42-4ffb-ecd79e2597fe@mind.be>
 <1cda02af-597a-5254-253e-5bcc84ac7ddd@mind.be>
 <20170320202708.75f88379@gmx.net>
 <09ab824d-407e-e491-7e59-3521b8bd0ec7@mind.be>
Message-ID: <20170320223208.4cc30f5d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,


On Mon, 20 Mar 2017 21:39:39 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> 
> 
> On 20-03-17 20:27, Peter Seiderer wrote:
> > Hello Arnout, Yann, Thomas,
> > 
> > On Sun, 19 Mar 2017 23:31:36 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> > 
> [snip]
> >>  Oh, maybe it's in the timestamps, so also compare the output of
> >>
> >> tar tvf ~/src/buildroot/dl/wiringpi-2.44.tar.gz
> >>
> >> with https://gitlab.com/snippets/1655090/raw
> >>
> > 
> > sha256sums and timestamps are all the same, the difference is in the atime and ctime,
> > comparing the output of two different downloads on my system
> > 
> > 	$ tar -xf t001/wiringpi-2.44.tar --to-command='echo $TAR_FILENAME $TAR_ATIME $TAR_MTIME $TAR_CTIME' > t001/files_atime_mtime_ctime.txt
> > 	$ tar -xf t002/wiringpi-2.44.tar --to-command='echo $TAR_FILENAME $TAR_ATIME $TAR_MTIME $TAR_CTIME' > t002/files_atime_mtime_ctime.txt
> 
>  atime and ctime are (as far as I know) not encoded in the tar file. Run the
> command twice with the same tar file and you'll get different atime and ctime.
> 
> > 
> > 	$ head t001/files_atime_mtime_ctime.txt
> > wiringpi-2.44/.gitignore 1489958464.60118197 1488369319 1489958464.464182585
> 
>  This is a little weird, however:
> 
>  - atime is normally the current time, but these timestamps are from yesterday.
>  - ctime is normally equal to atime.
> 
>  So maybe your tar *does* encode the atime and ctime?
> 

Seems so, here a diff of the (uncompressed) tar file hexdump:

-00000200  32 39 20 61 74 69 6d 65  3d 31 34 38 39 39 35 38  |29 atime=1489958|
-00000210  34 36 34 2e 36 30 31 31  38 31 39 37 0a 33 30 20  |464.60118197.30 |
-00000220  63 74 69 6d 65 3d 31 34  38 39 39 35 38 34 36 34  |ctime=1489958464|
-00000230  2e 34 36 34 31 38 32 35  38 35 0a 00 00 00 00 00  |.464182585......|
+00000200  33 30 20 61 74 69 6d 65  3d 31 34 39 30 30 33 36  |30 atime=1490036|
+00000210  37 31 39 2e 30 30 36 38  30 33 38 39 34 0a 33 30  |719.006803894.30|
+00000220  20 63 74 69 6d 65 3d 31  34 39 30 30 33 36 37 31  | ctime=149003671|
+00000230  38 2e 38 37 36 38 30 34  34 31 32 0a 00 00 00 00  |8.876804412.....|
 00000240  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|

>  Checking the source code... Looks like atime and ctime are preserved when either:
> 
> 1. gnu or oldgnu format is used, and the incremental (-G) option is used; or
> 2. posix format is used (even then there are a few exceptions).
> 
>  Since we don't add -G, I guess you create archives in posix format. Quoting the
> info pages:
> 
> 
>    The default format for GNU 'tar' is defined at compilation time.  You
> may check it by running 'tar --help', and examining the last lines of
> its output.  Usually, GNU 'tar' is configured to create archives in
> 'gnu' format, however, future version will switch to 'posix'.
> 

	$ tar --help | tail
  c-maybe
  escape
  locale
  clocale

*This* tar defaults to:
--format=posix -f- -b20 --quoting-style=escape --rmt-command=/usr/lib/rmt
--rsh-command=/usr/bin/rsh

Report bugs to <bug-tar@gnu.org>.

Host system is: openSUSE 13.2 (Harlequin) (x86_64)

> 
>  Since our hashes are currently based on GNU format, I guess we should add
> --format=gnu to our tar commands.
> 
>  Patch follows.
> 

O.k, will try...

Thanks for investigations.

Regards,
Peter


>  Regards,
>  Arnout
> 
> 
> > wiringpi-2.44/COPYING.LESSER 1489958464.60118197 1488369319 1489958464.464182585
> > wiringpi-2.44/INSTALL 1489958464.602181965 1488369319 1489958464.464182585
> > wiringpi-2.44/People 1489958464.602181965 1488369319 1489958464.464182585
> > wiringpi-2.44/README.TXT 1489958464.602181965 1488369319 1489958464.464182585
> > wiringpi-2.44/VERSION 1489958464.602181965 1488369319 1489958464.464182585
> > wiringpi-2.44/build 1489958464.602181965 1488369319 1489958464.464182585
> > wiringpi-2.44/debian-template/wiringPi/DEBIAN/control 1489958464.602181965 1488369319 1489958464.465182581
> > wiringpi-2.44/debian-template/wiringPi/DEBIAN/postinst 1489958464.602181965 1488369319 1489958464.465182581
> > wiringpi-2.44/debian-template/wiringPi/DEBIAN/postrm 1489958464.602181965 1488369319 1489958464.465182581
> > 
> > 	$ head t002/files_atime_mtime_ctime.txt
> > wiringpi-2.44/.gitignore 1490036719.006803894 1488369319 1490036718.876804412
> > wiringpi-2.44/COPYING.LESSER 1490036719.006803894 1488369319 1490036718.876804412
> > wiringpi-2.44/INSTALL 1490036719.007803891 1488369319 1490036718.876804412
> > wiringpi-2.44/People 1490036719.007803891 1488369319 1490036718.877804408
> > wiringpi-2.44/README.TXT 1490036719.007803891 1488369319 1490036718.877804408
> > wiringpi-2.44/VERSION 1490036719.007803891 1488369319 1490036718.877804408
> > wiringpi-2.44/build 1490036719.007803891 1488369319 1490036718.877804408
> > wiringpi-2.44/debian-template/wiringPi/DEBIAN/control 1490036719.007803891 1488369319 1490036718.878804404
> > wiringpi-2.44/debian-template/wiringPi/DEBIAN/postinst 1490036719.007803891 1488369319 1490036718.878804404
> > wiringpi-2.44/debian-template/wiringPi/DEBIAN/postrm 1490036719.007803891 1488369319 1490036718.878804404
> > 
> > 	
> > 	$ git --version
> > git version 2.11.0
> > 
> > 	$ tar --version
> > tar (GNU tar) 1.28
> > 
> > Regards,
> > Peter
> > 
> > 
> >>  Regards,
> >>  Arnout
> > 
> 
