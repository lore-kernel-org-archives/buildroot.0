From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 27 Jul 2018 21:40:32 +0200
Subject: [Buildroot] [PATCH v3] libostree: override path to gpg-error-config
Message-ID: <20180727194032.12451-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libostree has begun to use `gpg-error-config` in their configuration
script.
Point out gpg-error-config in staging dir to avoid using the one
installed on the host system.

Fixes:
 http://autobuild.buildroot.net/results/447b96e449e881cf1bd9644cda0f386aa4c75724

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
    	- override GPG_ERROR_CONFIG instead of ac_cv_path_GPG_ERROR_CONFIG
    v3:
    	- depend on libgpg-error

 package/libostree/Config.in    | 5 +++--
 package/libostree/libostree.mk | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libostree/Config.in b/package/libostree/Config.in
index b62f4ea0a1..4a6ab5464f 100644
--- a/package/libostree/Config.in
+++ b/package/libostree/Config.in
@@ -1,15 +1,16 @@
 config BR2_PACKAGE_LIBOSTREE
 	bool "libostree"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libgpg-error
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_USE_MMU # e2fsprogs, libfuse,libglib2, libgpgme
+	depends on BR2_USE_MMU # e2fsprogs, libfuse, libglib2, libgpgme
 	# doesn't build with musl due to lack of TEMP_FAILURE_RETRY()
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LIBFUSE
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGPGME
 	select BR2_PACKAGE_XZ
 	help
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 24eda0d1db..48eff74574 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -10,8 +10,9 @@ LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOST
 
 LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
-LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
+LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpg-error libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
+LIBOSTREE_CONF_ENV = GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
 
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
-- 
2.18.0
