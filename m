From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 13:57:22 +0100
Subject: [Buildroot] [git commit] package/iprutils: bump version to 2.4.10
Message-ID: <20160207131412.38811817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d80aee73d977dfdc37413ed61ac1d3d29ad3540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream now provides a new autoconf-based build system, therefore
our patches for Makefile are not needed anymore.

We adapt the gettext patch to make sure that the configure script
doesn't check for libintl.h, and we add an additional patch to fix the
libm check.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: rework patches.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iprutils/0001-Don-t-use-gettext.patch      | 32 ---------------
 .../iprutils/0001-iprutils-Don-t-use-gettext.patch | 48 ++++++++++++++++++++++
 ...low-CFLAGS-to-be-extended-from-the-enviro.patch | 31 --------------
 ...c-use-pow-instead-of-matherr-for-libm-che.patch | 36 ++++++++++++++++
 ...x-static-build-by-passing-the-libraries-i.patch | 35 ----------------
 package/iprutils/iprutils.hash                     |  2 +-
 package/iprutils/iprutils.mk                       | 19 +++------
 7 files changed, 91 insertions(+), 112 deletions(-)

diff --git a/package/iprutils/0001-Don-t-use-gettext.patch b/package/iprutils/0001-Don-t-use-gettext.patch
deleted file mode 100644
index a80cc87..0000000
--- a/package/iprutils/0001-Don-t-use-gettext.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 34fb0785f1d66ba1f79b470223426031f6258782 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Wed, 17 Sep 2014 17:48:54 +0100
-Subject: [PATCH 1/3] iprutils: Don't use gettext
-
-... since we don't have any translation.
-
-Based on the former patch by Jeremy Kerr.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- iprconfig.h |    4 +---
- 1 files changed, 1 insertions(+), 3 deletions(-)
-
-diff --git a/iprconfig.h b/iprconfig.h
-index cad591a..4a1fa0d 100644
---- a/iprconfig.h
-+++ b/iprconfig.h
-@@ -11,9 +11,7 @@
-  *
-  **/
- 
--#include <libintl.h>
--
--#define _(string) gettext(string)
-+#define _(string) (string)
- #define __(string) (string)
- #define EXIT_FLAG		0x8000	/* stops at given screen on exit call */
- #define CANCEL_FLAG		0x4000	/* stops at given screen on quit call */
--- 
-1.7.1
-
diff --git a/package/iprutils/0001-iprutils-Don-t-use-gettext.patch b/package/iprutils/0001-iprutils-Don-t-use-gettext.patch
new file mode 100644
index 0000000..680bb07
--- /dev/null
+++ b/package/iprutils/0001-iprutils-Don-t-use-gettext.patch
@@ -0,0 +1,48 @@
+From 4ce3545b704588c5889b8dd7b100fcdb88ae2e1a Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 17 Sep 2014 17:48:54 +0100
+Subject: [PATCH] iprutils: Don't use gettext
+
+... since we don't have any translation.
+
+Based on the former patch by Jeremy Kerr.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Thomas: adapt to the new autotools build system.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ iprconfig.h  | 4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ee69bee..c1a4f70 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -137,7 +137,7 @@ AC_SUBST([IPRCONFIG_LIBS])
+ LIBS="$save_LIBS"
+ 
+ # Checks for header files.
+-AC_CHECK_HEADERS([fcntl.h libintl.h locale.h netinet/in.h nl_types.h \
++AC_CHECK_HEADERS([fcntl.h locale.h netinet/in.h nl_types.h \
+ 		 paths.h stddef.h stdint.h stdlib.h string.h sys/file.h \
+ 		 sys/ioctl.h sys/mount.h sys/socket.h syslog.h \
+ 		 unistd.h ncurses.h form.h menu.h], [],
+diff --git a/iprconfig.h b/iprconfig.h
+index 9bce950..751a737 100644
+--- a/iprconfig.h
++++ b/iprconfig.h
+@@ -11,9 +11,7 @@
+  *
+  **/
+ 
+-#include <libintl.h>
+-
+-#define _(string) gettext(string)
++#define _(string) (string)
+ #define __(string) (string)
+ #define EXIT_FLAG		0x8000	/* stops at given screen on exit call */
+ #define CANCEL_FLAG		0x4000	/* stops at given screen on quit call */
+-- 
+2.6.4
+
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
diff --git a/package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch b/package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
new file mode 100644
index 0000000..ea7a683
--- /dev/null
+++ b/package/iprutils/0002-configure.ac-use-pow-instead-of-matherr-for-libm-che.patch
@@ -0,0 +1,36 @@
+From 62a41abffa028a3a4c4ae0803d48c559a14e97f1 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 7 Feb 2016 13:54:10 +0100
+Subject: [PATCH] configure.ac: use pow() instead of matherr() for libm check
+
+In certain configurations of uClibc, the matherr() function may not be
+provided by the C library, which makes the current configure.ac check
+for libm fail. However, iprutils does not use matherr(), so using this
+function for the test makes little sense.
+
+This patch adjusts configure.ac to test for pow() instead, which is
+actually used by iprutils, and more commonly available, including in
+uClibc.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1a4f70..e430554 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,7 +129,7 @@ save_LIBS="$LIBS"
+ AC_CHECK_LIB([ncurses], [curses_version], [],
+ 	     [AC_ERROR("libncurses not found.")])
+ AC_CHECK_LIB([form], [free_form], [], [AC_ERROR("libform not found.")])
+-AC_CHECK_LIB([m], [matherr], [], [AC_ERROR("libm not found.")])
++AC_CHECK_LIB([m], [pow], [], [AC_ERROR("libm not found.")])
+ AC_CHECK_LIB([menu], [new_menu], [], [AC_ERROR("libmenu not found.")])
+ AC_CHECK_LIB([panel], [show_panel], [], [AC_ERROR("libpanel not found.")])
+ IPRCONFIG_LIBS="$LIBS"
+-- 
+2.6.4
+
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
index b2fe4cf..2d3d62e 100644
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
+# Patches touching configure.ac
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
