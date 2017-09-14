From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Sep 2017 13:47:48 +0930
Subject: [Buildroot] [PATCH] openipmi: bump to version 2.0.24
Message-ID: <20170914041748.30905-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some changes in addition to the version bump:

 - The uint32_t patch is now upstream
 - Drop --no-glib12 flag as support was removed in 2.0.23
 - The host library path patch was refreshed

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../0001-Avoid-searching-host-library-path.patch   | 44 +++++++++++-----------
 package/openipmi/openipmi.hash                     |  5 ++-
 package/openipmi/openipmi.mk                       |  5 +--
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/package/openipmi/0001-Avoid-searching-host-library-path.patch b/package/openipmi/0001-Avoid-searching-host-library-path.patch
index 9a51d97e2796..44a57dcfb4d9 100644
--- a/package/openipmi/0001-Avoid-searching-host-library-path.patch
+++ b/package/openipmi/0001-Avoid-searching-host-library-path.patch
@@ -1,4 +1,4 @@
-From ca6e99d9fa4bf503a883407e964eaad5e18d51c7 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 22 Jul 2015 07:04:33 +0300
 Subject: [PATCH] Avoid searching host library path
@@ -9,44 +9,44 @@ host libraries which may be different than target libraries. Don't use
 $(libdir) in the library search path.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Joel Stanley <joel@jms.id.au>
 ---
- cmdlang/Makefile.am | 2 +-
- unix/Makefile.am    | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ cmdlang/Makefile.am | 3 +--
+ unix/Makefile.am    | 6 ++----
+ 2 files changed, 3 insertions(+), 6 deletions(-)
 
 diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
-index e80090dd0c6f..b59ff244b9a8 100644
+index 264ee12be79f..0b3843784656 100644
 --- a/cmdlang/Makefile.am
 +++ b/cmdlang/Makefile.am
-@@ -16,7 +16,7 @@ libOpenIPMIcmdlang_la_LIBADD = -lm \
+@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
+ libOpenIPMIcmdlang_la_LIBADD = -lm \
  	$(top_builddir)/utils/libOpenIPMIutils.la \
  	$(top_builddir)/lib/libOpenIPMI.la
- libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIcmdlang.map -L$(libdir)
-+	-Wl,-Map -Wl,libOpenIPMIcmdlang.map
+-libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
  
  bin_PROGRAMS = openipmish
  
 diff --git a/unix/Makefile.am b/unix/Makefile.am
-index a7921477e1c4..a108bc679c9a 100644
+index 5128839dad13..bd0f897ba8d6 100644
 --- a/unix/Makefile.am
 +++ b/unix/Makefile.am
-@@ -11,13 +11,13 @@ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
+@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
+ libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
  libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
- 	$(top_builddir)/utils/libOpenIPMIutils.la
- libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIpthread.map -L$(libdir)
-+	-Wl,-Map -Wl,libOpenIPMIpthread.map
+ 	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
+-libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
  
  libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
  libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
- 	$(GDBM_LIB)
- libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-Wl,-Map -Wl,libOpenIPMIposix.map -L$(libdir)
-+	-Wl,-Map -Wl,libOpenIPMIposix.map
+ 	$(GDBM_LIB) $(RT_LIB)
+-libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir)
++libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
  
  noinst_HEADERS = heap.h
  
--- 
-2.1.4
-
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index 30e37634ef51..219cfd4f788e 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,5 +1,6 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1 826081e7ed0ad430de9b8fdb75a9eaa10c99b660 OpenIPMI-2.0.22.tar.gz
+sha1 f37656813a826a3147ed557c32408f8daa399c28 OpenIPMI-2.0.24.tar.gz
 # Locally computed
-sha256	4988900043c35fcfa9b2bf275d6593904f6429221befb770ba6ecb5502108e55	OpenIPMI-2.0.22.tar.gz
+sha256	bca39a27071278a8b74610181ede8df51e155e5e9031bc8eaa3699d1720292b4	OpenIPMI-2.0.24.tar.gz
+
 sha256	0eafaa502ccf752899c5089159574081067d0c4ac53ea0ace33a5087f33ea32a	0001-ui-use-standard-uint32_t.patch
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 3f4f11113b9d..8e91e4ed031f 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.22
+OPENIPMI_VERSION = 2.0.24
 OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
-OPENIPMI_PATCH = \
-	http://sourceforge.net/p/openipmi/patches/26/attachment/0001-ui-use-standard-uint32_t.patch
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
@@ -17,7 +15,6 @@ OPENIPMI_AUTORECONF = YES
 OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
 OPENIPMI_CONF_OPTS = \
 	--with-glib=no \
-	--with-glib12=no \
 	--with-tcl=no \
 	--with-perl=no \
 	--with-python=no \
-- 
2.14.1
