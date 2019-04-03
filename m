From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed,  3 Apr 2019 18:40:55 +0300
Subject: [Buildroot] [PATCH 1/1] pkg-autotools-infra: disable NLS for the
 host by default
Message-ID: <1554306055-16183-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

There is no need for language translaion feature for the host packages,
anyway some of them disable it explicitly, so lets do it automatically
at least for the host-autotools- kind of packages.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/acl/acl.mk                     | 1 -
 package/attr/attr.mk                   | 1 -
 package/gcc/gcc-initial/gcc-initial.mk | 1 -
 package/gutenprint/gutenprint.mk       | 2 --
 package/pkg-autotools.mk               | 2 ++
 package/vim/vim.mk                     | 3 +--
 6 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 038bc7a..8dce274 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -15,7 +15,6 @@ HOST_ACL_DEPENDENCIES = host-attr
 ACL_INSTALL_STAGING = YES
 
 ACL_CONF_OPTS = --disable-nls
-HOST_ACL_CONF_OPTS = --disable-nls
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 348dcd2..ba77e80 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -12,7 +12,6 @@ ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ATTR_INSTALL_STAGING = YES
 
 ATTR_CONF_OPTS = --disable-nls
-HOST_ATTR_CONF_OPTS = --disable-nls
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1decca8..f5bc6c5 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -38,7 +38,6 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 	--disable-threads \
 	--with-newlib \
 	--disable-largefile \
-	--disable-nls \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
 HOST_GCC_INITIAL_CONF_ENV = \
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 65b8d31..6c42319 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -61,8 +61,6 @@ HOST_GUTENPRINT_CONF_OPTS = \
 	--disable-samples \
 	--without-gimp2 \
 	--without-doc \
-	--disable-nls \
-	--disable-nls-macos \
 	--without-foomatic \
 	--without-foomatic3 \
 	--disable-escputil \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45de993..3f139f8 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -232,6 +232,8 @@ define $(2)_CONFIGURE_CMDS
 		--disable-debug \
 		--with-xmlto=no \
 		--with-fop=no \
+		--disable-nls \
+		--disable-nls-macos \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 56716cb..c19d835 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -86,8 +86,7 @@ HOST_VIM_CONF_OPTS = \
 	--without-x \
 	--disable-acl \
 	--disable-gpm \
-	--disable-selinux \
-	--disable-nls
+	--disable-selinux
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.7.4
