From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 22:58:39 +0200
Subject: [Buildroot] [git commit] gcc-initial: new package
Message-ID: <20130704095649.EC37F9A29F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d616718b14efc032d572585d3441e007a3c64e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc-initial/gcc-initial.mk |   37 ++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
new file mode 100644
index 0000000..e07783e
--- /dev/null
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# gcc-initial
+#
+################################################################################
+
+GCC_INITIAL_VERSION = $(GCC_VERSION)
+GCC_INITIAL_SITE    = $(GCC_SITE)
+GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
+
+HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
+
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+HOST_GCC_INITIAL_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+endif
+
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_APPLY_PATCHES
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_INITIAL_SUBDIR = build
+
+HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+
+HOST_GCC_INITIAL_CONF_OPT = \
+	$(HOST_GCC_COMMON_CONF_OPT) \
+	--enable-languages=c \
+	--disable-shared \
+	--without-headers \
+	--with-newlib \
+	--disable-largefile \
+	--disable-nls
+
+HOST_GCC_INITIAL_MAKE_OPT = all-gcc
+HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
+
+$(eval $(host-autotools-package))
