From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat,  4 May 2019 15:55:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/swupdate: bump to version 2019.04
Message-ID: <1556978156-1626-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New features in this release:

- Improved documentation
- delta updates based on rdiff library
- support for libubootenv
- dry-run option
- CA certificates for signed images
- Fix security leak in parser

This commit also drop upstreamed patch.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../swupdate/0001-Makefile-fix-static-build.patch  | 62 ----------------------
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/swupdate/0001-Makefile-fix-static-build.patch

diff --git a/package/swupdate/0001-Makefile-fix-static-build.patch b/package/swupdate/0001-Makefile-fix-static-build.patch
deleted file mode 100644
index 56901f9..0000000
--- a/package/swupdate/0001-Makefile-fix-static-build.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 15a324f8c67548f219256a5a75ba8123cc5bdac6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 4 Mar 2019 21:51:36 +0100
-Subject: [PATCH] Makefile: fix static build
-
-Don't build and install lua_swupdate.so if HAVE_LUA isn't set to y
-otherwise build will fail if the toolchain only suports building static
-libraries
-
-Fixes:
- - http://autobuild.buildroot.org/results/c11c4d26983e0347d96f3dda62e6d72b031967bb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/sbabic/swupdate/pull/49]
----
- Makefile | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index cfeb9a6..cac99b5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -369,11 +369,15 @@ tools-bins	:= $(patsubst $(tools-y)/%.c,$(tools-y)/%,$(wildcard $(tools-y)/*.c))
- tools-bins-unstr:= $(patsubst %,%_unstripped,$(tools-bins))
- tools-all	:= $(tools-objs)
- 
-+ifeq ($(HAVE_LUA),y)
-+lua_swupdate	:= lua_swupdate.so
-+endif
-+
- shared-dirs	:= $(shareds-y)
- shared-libs	:= $(patsubst %,%/built-in.o, $(shareds-y))
- shared-all	:= $(shared-libs)
- 
--all: swupdate ${tools-bins} lua_swupdate.so
-+all: swupdate ${tools-bins} ${lua_swupdate}
- 
- # Do modpost on a prelinked vmlinux. The finally linked vmlinux has
- # relevant sections renamed as per the linker script.
-@@ -434,7 +438,6 @@ install: all
- 	install -d ${DESTDIR}/usr/bin
- 	install -d ${DESTDIR}/usr/include
- 	install -d ${DESTDIR}/usr/lib
--	install -d ${DESTDIR}/usr/lib/lua/$(LUAVER)
- 	install -m 755 swupdate ${DESTDIR}/usr/bin
- 	for i in ${tools-bins};do \
- 		install -m 755 $$i ${DESTDIR}/usr/bin; \
-@@ -443,7 +446,10 @@ install: all
- 	install -m 0644 include/swupdate_status.h ${DESTDIR}/usr/include
- 	install -m 0644 include/progress_ipc.h ${DESTDIR}/usr/include
- 	install -m 0755 ipc/lib.a ${DESTDIR}/usr/lib/libswupdate.a
--	install -m 0755 lua_swupdate.so $(DESTDIR)/usr/lib/lua/$(LUAVER)
-+	if [ $(HAVE_LUA) = y ]; then \
-+		install -d ${DESTDIR}/usr/lib/lua/$(LUAVER); \
-+		install -m 0755 ${lua_swupdate} $(DESTDIR)/usr/lib/lua/$(LUAVER); \
-+	fi
- 
- PHONY += run-tests
- tests: \
--- 
-2.14.1
-
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 138bd6d..8194de6 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a65884ca18523cde1b0744d952d6f91462dbd4ad07941305f5684c6d4ec833dc  swupdate-2018.11.tar.gz
+sha256  96b2c59558e847ddb7c23b666c1bbe61e03ab90a64c30d233bd5e9029df8519b  swupdate-2019.04.tar.gz
 sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 78f23ec..4626a16 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2018.11
+SWUPDATE_VERSION = 2019.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
 SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
-- 
2.7.4
