From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Tue, 18 Nov 2014 20:30:19 +0100
Subject: [Buildroot] [PATCH 3/9] ifupdown: new package
In-Reply-To: <1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>
 <1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CABbD_XCy1Nayf0SrA0Ae-vsFaKoM8xskE6K6UafmzN4=6aamwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo, Arnout, all,

Unfortunately this fails for me while building:
First it complains about a non-existent "dpkg-architecture" program (I'm
building on Debian x64 and it is not installed on my build machine by
default) - then it fails arch.h no such file or directory - it is created
with the $DEB_HOST_ARCH_OS variable, which is set by the above utility.

This is the same perl script found in "dpkg" source 1.16.15 in the scripts
sub directory (which is already used by start-stop-daemon). It is part of
the dpkg-dev debian package in stable.

I think, that this program is not needed by us, as we only target Linux,
and dpkg-architecture is used to query 2 variables we are compiling for:
- DEB_HOST_ARCH_OS which is always "linux" (I guess this could be hurd or
netbsd, as Debian supports those kernels, not Buildroot though)
- DEB_BUILD_GNU_TYPE which is <architecture>-linux-gnu

Maybe add a small patch, that replaces all dpkg-architecture
DEB_HOST_ARCH_OS queries to a "linux" constant, and the DEB_BUILD_GNU_TYPE
query to a Buildroot specific macro which adds the target architecture?

This call appears in:
defn2c.pl - 5
defn2man.pl - 5
debian/rules - 41,43
debian/testbuild - 3

---

>>> ifupdown 0.7.49 Building
...BLAH...
Can't exec "dpkg-architecture": No such file or directory at ./defn2c.pl
line 5.
Use of uninitialized value $DEB_HOST_ARCH_OS in substitution (s///) at ./
defn2c.pl line 7.
Use of uninitialized value $DEB_HOST_ARCH_OS in string eq at ./defn2c.pl
line 33, <> line 2.
...BLAH...
/home/scythe/buildroot/output/host/usr/bin/x86_64-linux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
 -D'IFUPDOWN_VERSION="0.7.49"' -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -c -o link.o link.c
sed -e '/^##ADDRESSFAM##$/r inet.man' -e '/^##ADDRESSFAM##$/r ipx.man' -e
'/^##ADDRESSFAM##$/r inet6.man' -e '/^##ADDRESSFAM##$/r can.man' \
             -e '/^##ADDRESSFAM##$/d' < interfaces.5.pre > interfaces.5
meta.c:5:18: fatal error: arch.h: No such file or directory
 #include "arch.h"
                  ^
compilation terminated.
make[1]: *** [meta.o] Error 1

---

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141118/6a5cda13/attachment.html>
