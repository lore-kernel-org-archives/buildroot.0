From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 22:58:39 +0200
Subject: [Buildroot] [git commit] gcc-intermediate: new package
Message-ID: <20130704095650.308B69A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9342f478d90b88096d561eee1f24281d1cd538c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc-intermediate/gcc-intermediate.mk |   43 ++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
new file mode 100644
index 0000000..0c062a7
--- /dev/null
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# gcc-intermediate
+#
+################################################################################
+
+GCC_INTERMEDIATE_VERSION = $(GCC_VERSION)
+GCC_INTERMEDIATE_SITE    = $(GCC_SITE)
+GCC_INTERMEDIATE_SOURCE  = $(GCC_SOURCE)
+
+HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
+	$(HOST_GCC_COMMON_DEPENDENCIES) \
+	uclibc-configured
+
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+HOST_GCC_INTERMEDIATE_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+endif
+
+HOST_GCC_INTERMEDIATE_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_INTERMEDIATE_SUBDIR = build
+
+HOST_GCC_INTERMEDIATE_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+
+HOST_GCC_INTERMEDIATE_CONF_OPT = \
+	$(HOST_GCC_COMMON_CONF_OPT) \
+	--enable-languages=c \
+	--disable-largefile \
+	--disable-nls
+
+HOST_GCC_INTERMEDIATE_MAKE_OPT = all-gcc
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+HOST_GCC_INTERMEDIATE_MAKE_OPT += all-target-libgcc
+endif
+
+HOST_GCC_INTERMEDIATE_INSTALL_OPT = install-gcc
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+HOST_GCC_INTERMEDIATE_INSTALL_OPT += install-target-libgcc
+endif
+
+$(eval $(host-autotools-package))
