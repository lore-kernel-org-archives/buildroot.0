From: Peter Meerwald <pmeerw@pmeerw.net>
Date: Sat, 5 Apr 2014 15:29:00 +0200 (CEST)
Subject: [Buildroot] eudev build failure
Message-ID: <alpine.DEB.2.01.1404051520570.22206@pmeerw.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

commit 221fd0cd adds 
eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
which basically remove #include <fcntl.h> from a couple of file

this patch breaks the build for me (target: eglibc, kernel 3.14)

the prototype for open() is supposed to be in fnctl.h, hence the define is 
needed

I think the patch 
eudev-0001-Fix-issue-87-fails-to-build-on-linux-headers-3.13.patch
should be dropped, this is not the right way to fix

regards, p.

// snip
  CC       accelerometer.o
In file included from ../../src/libudev/libudev-private.h:31:0,
                 from accelerometer.c:65:
../../src/libudev/util.h:302:32: warning: ?struct ucred? declared inside parameter list [enabled by default]
 int getpeercred(int fd, struct ucred *ucred);
                                ^
../../src/libudev/util.h:302:32: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
accelerometer.c: In function ?test_orientation?:
accelerometer.c:203:9: warning: implicit declaration of function ?open? [-Wimplicit-function-declaration]
         fd = open(devpath, O_RDONLY|O_CLOEXEC);
         ^
accelerometer.c:203:28: error: ?O_RDONLY? undeclared (first use in this function)
         fd = open(devpath, O_RDONLY|O_CLOEXEC);
                            ^
accelerometer.c:203:28: note: each undeclared identifier is reported only once for each function it appears in accelerometer.c:203:37: error: ?O_CLOEXEC? undeclared (first use in this function)
         fd = open(devpath, O_RDONLY|O_CLOEXEC);
                                     ^
make[4]: *** [accelerometer.o] Error 1
// snip

thanks, regards, p.

-- 

Peter Meerwald
+43-664-2444418 (mobile)
