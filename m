From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Oct 2013 22:54:23 -0400
Subject: [Buildroot] [PATCH 2/3] ccache: change default cache directory path
	to match config setting
In-Reply-To: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
References: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1383188064-2380-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 433290761fceb476b095548eec10adf72405e050 changed the hard-coded
ccache directory location to use BUILDROOT_CACHE_DIR, which is exported
by Makefile based on the BR2_CCACHE_DIR config option.  This allowed the
cache location to be changed on-the-fly by setting an environment
variable, but left the default location of ccache's normal default at
"$HOME/.ccache".  Since this location does not match the default for
BR2_CCACHE_DIR, it is basically almost never correct, so direct invocation
of ccache outside of the buildroot Makefile becomes cumbersome.

This patch changes the last-ditch cache location from "$HOME/.ccache" to
the BR2_CCACHE_DIR value at the time of host-ccache compilation.  Note
that the ability to override the location by BUILDROOT_CACHE_DIR is left
intact.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/ccache/ccache.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 9ad5129..1ebe974 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -50,12 +50,16 @@ HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 #
 #    + Filter out blanks, comments, and dont-care stuff, then sort, to try to make
 #      immune to minor kconfig organizational changes.
+#
+#  - Change hard-coded last-ditch default to match path in .config, to avoid the
+#    need to specify BUILDROOT_CACHE_DIR when invoking ccache directly.
 define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),' $(@D)/ccache.c
 	sed -n '1,/^# Commands/p; /^\# Toolchain/,/^\# System config/p' $(BUILDROOT_CONFIG) | \
 		grep -v -e '^$$' -e '^\#' -e GDB -e ECLIPSE | \
 		sort > $(STAMP_DIR)/ccache-toolchain-config
 	sed -i "s,getenv(\"CCACHE_COMPILERCHECK\"),\"%compiler% -v; echo \'$$(md5sum < $(STAMP_DIR)/ccache-toolchain-config)\'\"," $(@D)/ccache.c
+	sed -i 's,"%s/.ccache","$(BUILDROOT_CACHE_DIR)",' $(@D)/ccache.c
 endef
 
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
-- 
1.7.9.5
