From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:25:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/iprutils: bump version to 2.4.10
Message-ID: <1454167529-26085-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream now provides a new autoconf-based build system, therefore
our patches for Makefile are not needed anymore. The build system
checks for function matherr in libm, this test fails so check for
main().

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...low-CFLAGS-to-be-extended-from-the-enviro.patch | 31 -------------------
 package/iprutils/0002-libm.patch                   | 16 ++++++++++
 ...x-static-build-by-passing-the-libraries-i.patch | 35 ----------------------
 package/iprutils/iprutils.hash                     |  2 +-
 package/iprutils/iprutils.mk                       | 19 ++++--------
 5 files changed, 23 insertions(+), 80 deletions(-)
 delete mode 100644 package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
 create mode 100644 package/iprutils/0002-libm.patch
 delete mode 100644 package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch

diff --git a/package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch b/package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
deleted file mode 100644
index dbfa008..0000000
--- a/package/iprutils/0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9a46afebdc63ba67cd95748f898969d6c622a129 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 17 Sep 2014 18:08:31 +0100
-Subject: [PATCH 1/2] iprutils: Allow CFLAGS to be extended from the environment
-
-We also remove -g, since we don't necessarily want to build with
-debugging symbols. Buildroot will add -g if needed.
-
-Based on the former patch by Thomas Petazzoni.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- Makefile |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c4e2427..66c4942 100644
---- a/Makefile
-+++ b/Makefile
-@@ -9,7 +9,7 @@ CC = gcc
- 
- include version.mk
- 
--CFLAGS += -g -Wall $(IPR_DEFINES)
-+override CFLAGS += -Wall $(IPR_DEFINES)
- UTILS_VER = $(IPR_MAJOR_RELEASE).$(IPR_MINOR_RELEASE).$(IPR_FIX_LEVEL)
- TAR = cd .. && tar -zcpf iprutils-$(UTILS_VER)-src.tgz --exclude .git --exclude CVS --exclude applied-patches --exclude series --exclude txt --exclude pc --exclude patches --exclude debug --exclude *~* iprutils
- 
--- 
-1.7.1
-
diff --git a/package/iprutils/0002-libm.patch b/package/iprutils/0002-libm.patch
new file mode 100644
index 0000000..39ea20f
--- /dev/null
+++ b/package/iprutils/0002-libm.patch
@@ -0,0 +1,16 @@
+Fix libm detection
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr iprutils-2.4.10.1.org/configure.ac iprutils-2.4.10.1/configure.ac
+--- iprutils-2.4.10.1.org/configure.ac	2016-01-19 17:03:54.000000000 +0100
++++ iprutils-2.4.10.1/configure.ac	2016-01-30 10:59:56.803603012 +0100
+@@ -129,7 +129,7 @@
+ AC_CHECK_LIB([ncurses], [curses_version], [],
+ 	     [AC_ERROR("libncurses not found.")])
+ AC_CHECK_LIB([form], [free_form], [], [AC_ERROR("libform not found.")])
+-AC_CHECK_LIB([m], [matherr], [], [AC_ERROR("libm not found.")])
++AC_CHECK_LIB([m], [main], [], [AC_ERROR("libm not found.")])
+ AC_CHECK_LIB([menu], [new_menu], [], [AC_ERROR("libmenu not found.")])
+ AC_CHECK_LIB([panel], [show_panel], [], [AC_ERROR("libpanel not found.")])
+ IPRCONFIG_LIBS="$LIBS"
diff --git a/package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch b/package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch
deleted file mode 100644
index 5ea7d1b..0000000
--- a/package/iprutils/0003-Fix-static-build-by-passing-the-libraries-i.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1f62dd91314b0ce6378aeafb2a03566002036326 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 11 Dec 2014 23:36:55 +0100
-Subject: [PATCH 3/3] iprutils: Fix static build by passing the libraries in
- the right order
-
-This mistake was causing failures like this one:
-
-m_post.c:(.text+0x60): undefined reference to `wattr_on'
-
-http://autobuild.buildroot.net/results/500/5004e7b230635e0605acdd17d2b7d2d01fc5075c/build-end.log
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Romain: rebase on top of 2.4.5]
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 66c4942..18cea94 100644
---- a/Makefile
-+++ b/Makefile
-@@ -16,7 +16,7 @@ TAR = cd .. && tar -zcpf iprutils-$(UTILS_VER)-src.tgz --exclude .git --exclude
- all: iprconfig iprupdate iprdump iprinit iprdbg docs 
- 
- iprconfig: iprconfig.c iprlib.o iprconfig.h
--	$(CC) $(CFLAGS) $(INCLUDEDIR) -o iprconfig iprconfig.c iprlib.o $(LDFLAGS) -lform -lpanel -lncurses -lmenu -lm
-+	$(CC) $(CFLAGS) $(INCLUDEDIR) -o iprconfig iprconfig.c iprlib.o $(LDFLAGS) -lform -lpanel -lmenu -lncurses -lm
- 
- iprupdate: iprupdate.c iprlib.o
- 	$(CC) $(CFLAGS) $(INCLUDEDIR) -o iprupdate iprlib.o iprupdate.c $(LDFLAGS)
--- 
-1.9.3
-
diff --git a/package/iprutils/iprutils.hash b/package/iprutils/iprutils.hash
index 388c300..4b43a61 100644
--- a/package/iprutils/iprutils.hash
+++ b/package/iprutils/iprutils.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5c4fca20090b819dc5ab7409798519a3f16e1fce2475ef59f9f18c735b3bd871  iprutils-2.4.5-src.tgz
+sha256	99f28418fec505c4dfd532270569d4902a3792dcb2f08710b896f4e7bc0211e0	iprutils-2.4.10.1.tar.gz
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index b2fe4cf..2230a26 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -4,20 +4,13 @@
 #
 ################################################################################
 
-IPRUTILS_VERSION = 2.4.5
-IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
-IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz
+IPRUTILS_VERSION_MAJOR = 2.4.10
+IPRUTILS_VERSION = $(IPRUTILS_VERSION_MAJOR).1
+IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION_MAJOR)
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
 IPRUTILS_LICENSE = Common Public License Version 1.0
 IPRUTILS_LICENSE_FILES = LICENSE
+# 0002-libm.patch patches configure.ac
+IPRUTILS_AUTORECONF = YES
 
-define IPRUTILS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		INCLUDEDIR="-I." all
-endef
-
-define IPRUTILS_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) INSTALL_MOD_PATH=$(TARGET_DIR) -C $(@D) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.7.0.rc3
