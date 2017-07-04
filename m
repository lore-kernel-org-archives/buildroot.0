From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:47:55 +0200
Subject: [Buildroot] [PATCH 015/100] binutils: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-16-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - using TARGET_NLS_LIBS to force linking against libintl. This wasn't
   done so far, but is needed for the build to work, because uClibc
   now has a stub gettext implementation, which is mistaken as being
   the full gettext implementation by the configure script

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in   | 1 -
 package/binutils/binutils.mk | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 360dd5e..e17a8ec 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	depends on !BR2_nios2
 	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Install binutils on the target
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 0dc20a0..c64ec47 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -24,7 +24,8 @@ BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 
-- 
2.9.4
