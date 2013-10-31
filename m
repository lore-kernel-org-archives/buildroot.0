From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Oct 2013 22:54:22 -0400
Subject: [Buildroot] [PATCH 1/3] ccache: change compilercheck to use
	compiler and toolchain info
In-Reply-To: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
References: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1383188064-2380-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When CCACHE_COMPILERCHECK is set to "none", then ccache can be fooled in certain
circumstances, resulting in using objects compiled with, say, the wrong toolchain.
(This was discovered when compiling kmod from the same project, but with different
external toolchains.)

So let's try to make ccache use as safe as possible:

- Use "%compiler% -v" in CCACHE_COMPILERCHECK to capture changes purely in an
  externally provided toolchain.  See CCACHE_COMPILERCHECK and wrapper sections
  at http://ccache.samba.org/manual.html for more info.

- Additionally, use the hash of part of the .config to describe toolchain and
  C-library configuration that cannot be captured by the -v output:

  + Use first section of .config, "Target Architecture" - "1,/^# Commands/", to
    capture arch/cpu settings built into the external toolchain wrapper (for when
    external toolchain it used) and the toolchain/c-library compilation settings
    (for when toolchain is built).

  + Use "Toolchain" section of .config - "/^\# Toolchain/,/^\# System config/",
    for additional toolchain settings.

  + Filter out blanks, comments, and dont-care stuff, then sort, to try to make
    immune to minor kconfig organizational changes.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Mailing list thread: http://lists.busybox.net/pipermail/buildroot/2013-April/070819.html
---
 package/ccache/ccache.mk |   25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 82a53f3..9ad5129 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -26,13 +26,36 @@ HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 #    is already used by autotargets for the ccache package.
 #    BUILDROOT_CACHE_DIR is exported by Makefile based on config option
 #    BR2_CCACHE_DIR.
+#
 #  - ccache shouldn't use the compiler binary mtime to detect a change in
 #    the compiler, because in the context of Buildroot, that completely
 #    defeats the purpose of ccache. Of course, that leaves the user
 #    responsible for purging its cache when the compiler changes.
+#
+#    But let's try to make ccache use as safe as possible.  Let's use
+#    "%compiler% -v" in CCACHE_COMPILERCHECK to capture changes in external
+#    toolchains.  See CCACHE_COMPILERCHECK and wrapper sections at
+#    http://ccache.samba.org/manual.html for more info.
+#
+#    Additionally, use the hash of part of the .config to describe toolchain and
+#    C-library configuration that cannot be captured by the compiler's -v output:
+#
+#    + Use first section of .config, "Target Architecture" - "1,/^# Commands/", to
+#      capture arch/cpu settings built into the external toolchain wrapper (for when
+#      external toolchain it used) and the toolchain/c-library compilation settings
+#      (for when toolchain is built).
+#
+#    + Use "Toolchain" section of .config - "/^\# Toolchain/,/^\# System config/",
+#      for additional toolchain settings.
+#
+#    + Filter out blanks, comments, and dont-care stuff, then sort, to try to make
+#      immune to minor kconfig organizational changes.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
+	sed -n '1,/^# Commands/p; /^\# Toolchain/,/^\# System config/p' $(BUILDROOT_CONFIG) | \
+		grep -v -e '^$$' -e '^\#' -e GDB -e ECLIPSE | \
+		sort > $(STAMP_DIR)/ccache-toolchain-config
+	sed -i "s,getenv(\"CCACHE_COMPILERCHECK\"),\"%compiler% -v; echo \'$$(md5sum < $(STAMP_DIR)/ccache-toolchain-config)\'\"," $(@D)/ccache.c
 endef
 
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
-- 
1.7.9.5
