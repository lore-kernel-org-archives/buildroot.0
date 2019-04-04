From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:47:25 +0200
Subject: [Buildroot] [git commit] package/pkg-autotools: disable NLS for
 host packages by default
Message-ID: <20190404204348.D2AA98D4DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bce7d7de9476633eeb7392f54a070409dc5f8f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no need for language translaion feature for the host
packages, anyway some of them disable it explicitly, so lets do it
automatically at least for the host-autotools- kind of packages.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acl/acl.mk                     | 1 -
 package/attr/attr.mk                   | 1 -
 package/gcc/gcc-initial/gcc-initial.mk | 1 -
 package/gutenprint/gutenprint.mk       | 2 --
 package/pkg-autotools.mk               | 1 +
 package/vim/vim.mk                     | 3 +--
 6 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 038bc7a050..8dce274150 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -15,7 +15,6 @@ HOST_ACL_DEPENDENCIES = host-attr
 ACL_INSTALL_STAGING = YES
 
 ACL_CONF_OPTS = --disable-nls
-HOST_ACL_CONF_OPTS = --disable-nls
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 348dcd2f87..ba77e802d2 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -12,7 +12,6 @@ ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ATTR_INSTALL_STAGING = YES
 
 ATTR_CONF_OPTS = --disable-nls
-HOST_ATTR_CONF_OPTS = --disable-nls
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1decca8259..f5bc6c5b77 100644
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
index 65b8d31091..6c42319977 100644
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
index 45de99356f..daa688dab6 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -232,6 +232,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-debug \
 		--with-xmlto=no \
 		--with-fop=no \
+		--disable-nls \
 		$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
 		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 56716cbdd0..c19d835632 100644
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
