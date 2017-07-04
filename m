From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:27:24 +0200
Subject: [Buildroot] [git commit] ding-libs: use the new gettext logic
Message-ID: <20170704233514.321EC7F8A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9494e46a07d82ff781a92af0b63676f15a5ecb85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

The BR2_USE_WCHAR dependency was only needed for gettext. But now, we
no longer need gettext unconditionally, so this dependency on
BR2_USE_WCHAR is removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ding-libs/Config.in    | 6 ------
 package/ding-libs/ding-libs.mk | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index d397f29..6dc2a80 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_DING_LIBS
 	bool "ding-libs"
-	depends on BR2_USE_WCHAR || !BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The ding-libs packages contain a set of libraries used by
@@ -16,7 +14,3 @@ config BR2_PACKAGE_DING_LIBS
 	  structure (libini_config).
 
 	  https://git.fedorahosted.org/git/ding-libs.git
-
-comment "ding-libs needs a toolchain w/ wchar"
-	depends on BR2_NEEDS_GETTEXT
-	depends on !BR2_USE_WCHAR
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index 4b045be..e9508cc 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -8,7 +8,7 @@ DING_LIBS_VERSION = 0_4_0
 DING_LIBS_SOURCE = ding_libs-$(DING_LIBS_VERSION).tar.xz
 DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot
 DING_LIBS_DEPENDENCIES = host-pkgconf \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
+	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 DING_LIBS_INSTALL_STAGING = YES
 DING_LIBS_LICENSE = LGPL-3.0+ (library),GPL-3.0+ (test programs)
