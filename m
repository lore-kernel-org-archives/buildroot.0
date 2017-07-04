From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:44 +0200
Subject: [Buildroot] [git commit] libidn: use the new gettext logic
Message-ID: <20170704233516.214AF802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9d8d754f30e6bc927c6a1318430ac50c10e0478
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libidn/Config.in | 1 -
 package/libidn/libidn.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libidn/Config.in b/package/libidn/Config.in
index 7b558c7..20e0e2b 100644
--- a/package/libidn/Config.in
+++ b/package/libidn/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBIDN
 	bool "libidn"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Libidn's purpose is to encode and decode internationalized
 	  domain names.
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 18e28e0..b96e742 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -9,7 +9,7 @@ LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
-LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
 
