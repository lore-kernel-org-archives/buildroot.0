From: Alexander Yohananov <yohananov@gmail.com>
Date: Tue, 8 Mar 2011 16:22:57 +0200
Subject: [Buildroot] lockfile-progs depends on liblockfile
Message-ID: <AANLkTinAu+081B7_fk46-a6e0P0rqbMiMfYqo3k96b0E@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Compilation of lockfile-progs (which is one of dependencies of usbmount
that's what I actually need) ends up with the following errors:


>>> lockfile-progs 0.1.15 Extracting
>>> lockfile-progs 0.1.15 Patching package/lockfile-progs

Applying lockfile-progs-0.1.15-sus3v-legacy.patch using plaintext:
patching file lockfile-progs.c
Hunk #1 succeeded at 134 (offset 41 lines).
>>> lockfile-progs 0.1.15 Configuring
>>> lockfile-progs 0.1.15 Building
...
 ...
...
make[1]: Entering directory
`/home/sasha/violet/3party/buildroot/buildroot-2010.11/output/build/lockfile-progs-0.1.15'
/home/sasha/violet/3party/buildroot/buildroot-2010.11/output/staging/usr/bin/arm-unknown-linux-uclibc-gcc
--sysroot=/home/sasha/violet/3party/buildroot/buildroot-2010.11/output/staging
-pipe -Os -Os  -mtune=arm926ej-s -march=armv5te -mabi=apcs-gnu -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/sasha/violet/3party/buildroot/buildroot-2010.11/output/staging/usr/include
-I/home/sasha/violet/3party/buildroot/buildroot-2010.11/output/staging/include
  -c -o lockfile-progs.o lockfile-progs.c
lockfile-progs.c:19:22: error: lockfile.h: No such file or directory
lockfile-progs.c: In function 'get_status_code_string':
lockfile-progs.c:287: error: 'L_SUCCESS' undeclared (first use in this
function)
lockfile-progs.c:287: error: (Each undeclared identifier is reported only
once
lockfile-progs.c:287: error: for each function it appears in.)
lockfile-progs.c:291: error: 'L_NAMELEN' undeclared (first use in this
function)
lockfile-progs.c:295: error: 'L_TMPLOCK' undeclared (first use in this
function)
lockfile-progs.c:299: error: 'L_TMPWRITE' undeclared (first use in this
function)
lockfile-progs.c:303: error: 'L_MAXTRYS' undeclared (first use in this
function)
lockfile-progs.c:307: error: 'L_ERROR' undeclared (first use in this
function)
lockfile-progs.c: In function 'cmd_unlock':
lockfile-progs.c:322: error: 'L_SUCCESS' undeclared (first use in this
function)
lockfile-progs.c: In function 'cmd_lock':
lockfile-progs.c:331: error: 'L_PID' undeclared (first use in this function)
lockfile-progs.c:334: error: 'L_SUCCESS' undeclared (first use in this
function)
lockfile-progs.c: In function 'cmd_check':
lockfile-progs.c:366: error: 'L_PID' undeclared (first use in this function)
lockfile-progs.c: In function 'main':
lockfile-progs.c:377: error: 'L_SUCCESS' undeclared (first use in this
function)
make[1]: *** [lockfile-progs.o] Error 1


lockfile-progs obviously depends on liblockfile package, but
liblockfile.mklacks this definition.
The patch below fixed it to me:

--- a/lockfile-progs.mk 2011-03-08 15:40:51.145037713 +0200
+++ b/lockfile-progs.mk 2011-03-08 15:39:35.032038246 +0200
@@ -11,6 +11,8 @@
  $(addprefix lockfile-,check create remove touch) \
  $(addprefix mail-,lock touchlock unlock)

+LOCKFILE_PROGS_DEPENDENCIES = liblockfile
+
 define LOCKFILE_PROGS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef

The other possible fix is to add liblockfile to dependencies list in
usbmount.mk:
USBMOUNT_DEPENDENCIES = udev lockfile-progs liblockfile (I don't know
whether the order is important)

The problem exists on buildroot-2010.11, but since buildroot-2011.02
contains exactly the same usbmount, lockfile-progs and liblockfile it
apparently will appear there as well.

Best regards, Alexander.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/244a58eb/attachment.html>
