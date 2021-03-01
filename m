From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 22:28:19 +0100
Subject: [Buildroot] [git commit branch/next] package/s390-tools: bump to
 version 2.16.0
Message-ID: <20210301210606.64B1186241@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b82b58a8ddc3d079aa2976b3dafbc965b6107648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Remove patch 0001-zkey-ekmfweb-fix-linking-of-libekmfweb.patch which has
  been merged.
- Also update the GitHub URL because the project has been renamed.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
[Peter: also update Config.in URL]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-osasnmpd-Makefile-fix-cross-compilation.patch} |  0
 ...01-zkey-ekmfweb-fix-linking-of-libekmfweb.patch | 53 ----------------------
 package/s390-tools/Config.in                       |  2 +-
 package/s390-tools/s390-tools.hash                 |  2 +-
 package/s390-tools/s390-tools.mk                   |  4 +-
 5 files changed, 4 insertions(+), 57 deletions(-)

diff --git a/package/s390-tools/0002-osasnmpd-Makefile-fix-cross-compilation.patch b/package/s390-tools/0001-osasnmpd-Makefile-fix-cross-compilation.patch
similarity index 100%
rename from package/s390-tools/0002-osasnmpd-Makefile-fix-cross-compilation.patch
rename to package/s390-tools/0001-osasnmpd-Makefile-fix-cross-compilation.patch
diff --git a/package/s390-tools/0001-zkey-ekmfweb-fix-linking-of-libekmfweb.patch b/package/s390-tools/0001-zkey-ekmfweb-fix-linking-of-libekmfweb.patch
deleted file mode 100644
index 76a642af70..0000000000
--- a/package/s390-tools/0001-zkey-ekmfweb-fix-linking-of-libekmfweb.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a4e6f7239d8cee37e58eac974482d6deefa8a137 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar@linux.ibm.com>
-Date: Thu, 5 Nov 2020 17:42:58 +0100
-Subject: [PATCH 1/1] zkey/ekmfweb: fix linking of libekmfweb
-
-Use -L compiler's parameter instead of the environment variable
-LIBRARY_PATH.
-
-Fixes the following problem on buildroot:
-
-buildroot/qemu-s390x/host/bin/s390x-linux-gcc -shared -Wl,--version-script=zkey-ekmfweb.map -Wl,-z,defs,-Bsymbolic -Wl,-soname,zkey-ekmfweb.so.1 zkey-ekmfweb.o properties.o pkey.o cca.o ep11.o utils.o ../..//libutil/libutil.a -lekmfweb -ldl -lcrypto -o zkey-ekmfweb.so
-buildroot/qemu-s390x/host/bin/s390x-linux-gcc -I ../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I ../include -std=gnu99 -Wno-unused-parameter -Wno-missing-field-initializers -DS390_TOOLS_RELEASE=2.15.1-build-20201105 -DS390_TOOLS_LIBDIR=/lib/s390-tools -DS390_TOOLS_DATADIR=/usr/share/s390-tools -DS390_TOOLS_SYSCONFDIR=/etc -DS390_TOOLS_BINDIR=/sbin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_GNU_SOURCE -c udev_ccwgroup.c -o udev_ccwgroup.o
-buildroot/qemu-s390x/host/bin/s390x-linux-gcc -I ../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I ../include -std=gnu99 -Wno-unused-parameter -Wno-missing-field-initializers -DS390_TOOLS_RELEASE=2.15.1-build-20201105 -DS390_TOOLS_LIBDIR=/lib/s390-tools -DS390_TOOLS_DATADIR=/usr/share/s390-tools -DS390_TOOLS_SYSCONFDIR=/etc -DS390_TOOLS_BINDIR=/sbin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_GNU_SOURCE -c iscsi.c -o iscsi.o
-buildroot/qemu-s390x/host/bin/s390x-linux-gcc -I ../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I ../include -std=gnu99 -Wno-unused-parameter -Wno-missing-field-initializers -DS390_TOOLS_RELEASE=2.15.1-build-20201105 -DS390_TOOLS_LIBDIR=/lib/s390-tools -DS390_TOOLS_DATADIR=/usr/share/s390-tools -DS390_TOOLS_SYSCONFDIR=/etc -DS390_TOOLS_BINDIR=/sbin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_GNU_SOURCE -c dasd.c -o dasd.o
-buildroot/qemu-s390x/host/opt/ext-toolchain/bin/../lib/gcc/s390x-buildroot-linux-gnu/9.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: cannot find -lekmfweb
-collect2: error: ld returned 1 exit status
-make[4]: *** [Makefile:36: zkey-ekmfweb.so] Error 1
-make[3]: *** [Makefile:128: ekmfweb] Error 2
-buildroot/qemu-s390x/host/bin/s390x-linux-gcc -I ../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I ../include -std=gnu99 -Wno-unused-parameter -Wno-missing-field-initializers -DS390_TOOLS_RELEASE=2.15.1-build-20201105 -DS390_TOOLS_LIBDIR=/lib/s390-tools -DS390_TOOLS_DATADIR=/usr/share/s390-tools -DS390_TOOLS_SYSCONFDIR=/etc -DS390_TOOLS_BINDIR=/sbin -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_GNU_SOURCE -c zfcp.c -o zfcp.o
-make[2]: *** [Makefile:43: zkey] Error 2
-make[2]: *** Waiting for unfinished jobs....
-
-Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
-Acked-by: Ingo Franzki <ifranzki@linux.ibm.com>
----
- zkey/ekmfweb/Makefile | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/zkey/ekmfweb/Makefile b/zkey/ekmfweb/Makefile
-index 79a16cb5..1a3a4977 100644
---- a/zkey/ekmfweb/Makefile
-+++ b/zkey/ekmfweb/Makefile
-@@ -7,8 +7,6 @@ all: zkey-ekmfweb.so
- 
- libs = $(rootdir)/libutil/libutil.a
- 
--export LIBRARY_PATH = $(rootdir)/libekmfweb:$LIBRARY_PATH
--
- zkey-ekmfweb.o: zkey-ekmfweb.c zkey-ekmfweb.h ../kms-plugin.h \
- 	../cca.h ../utils.h ../pkey.h ../properties.h \
- 	$(rootdir)include/ekmfweb/ekmfweb.h libekmfweb.dep
-@@ -29,7 +27,7 @@ utils.o: ../utils.c ../utils.h ../pkey.h ../cca.h ../ep11.h
- 	$(CC) $(ALL_CPPFLAGS) $(ALL_CFLAGS) -fPIC -c $< -o $@
- 
- zkey-ekmfweb.so: ALL_CFLAGS += -fPIC
--zkey-ekmfweb.so: LDLIBS = -lekmfweb -ldl -lcrypto
-+zkey-ekmfweb.so: LDLIBS = -L$(rootdir)/libekmfweb -lekmfweb -ldl -lcrypto
- zkey-ekmfweb.so: ALL_LDFLAGS += -shared -Wl,--version-script=zkey-ekmfweb.map \
- 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,zkey-ekmfweb.so.$(VERM)
- zkey-ekmfweb.so: zkey-ekmfweb.o properties.o pkey.o cca.o ep11.o utils.o $(libs)
--- 
-2.26.2
-
diff --git a/package/s390-tools/Config.in b/package/s390-tools/Config.in
index 4aede4e265..23b7d31db6 100644
--- a/package/s390-tools/Config.in
+++ b/package/s390-tools/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_S390_TOOLS
 	help
 	  Tools for use with the s390 Linux kernel and device drivers.
 
-	  https://github.com/ibm-s390-tools/s390-tools
+	  https://github.com/ibm-s390-linux/s390-tools
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index 1de2399e03..bf007286b4 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8dc1180031018756ccd5acf6c26c4175bcac79e512e8a2ea8569fdf5d3f9bd6c  s390-tools-2.15.1.tar.gz
+sha256  b789d5c9d8587b288e1fd9b1c1c4512bb3439e1f389519cb257f1c7c302da58f  s390-tools-2.16.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 535caf208e..326262b475 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.15.1
-S390_TOOLS_SITE = $(call github,ibm-s390-tools,s390-tools,v$(S390_TOOLS_VERSION))
+S390_TOOLS_VERSION = 2.16.0
+S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
 S390_TOOLS_DEPENDENCIES = zlib
