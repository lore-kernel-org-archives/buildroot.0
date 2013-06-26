From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jun 2013 00:26:05 +0200
Subject: [Buildroot] [RFCv2 10/19] gcc-initial: new package
In-Reply-To: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372285574-29423-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372285574-29423-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/gcc/gcc-initial/gcc-initial.mk

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
new file mode 100644
index 0000000..37fb2bb
--- /dev/null
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# gcc-initial
+#
+#############################################################
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
-- 
1.8.1.2
