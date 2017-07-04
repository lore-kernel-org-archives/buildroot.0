From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:45 +0200
Subject: [Buildroot] [git commit] make: use the new gettext logic
Message-ID: <20170704233517.7CFDD7FB2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e1d2b3e5ae45dd2578870d379690141a512105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/Config.in | 1 -
 package/make/make.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/make/Config.in b/package/make/Config.in
index f576b7b..e8aa912 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
diff --git a/package/make/make.mk b/package/make/make.mk
index 41a7023..5717628 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,7 +7,7 @@
 MAKE_VERSION = 4.2.1
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 MAKE_LICENSE = GPL-3.0+
 MAKE_LICENSE_FILES = COPYING
 
