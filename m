From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2014 17:19:17 +0100
Subject: [Buildroot] [git commit] Compile static versions of gcc libraries
Message-ID: <20140112090836.B853B9C44E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d6c79ed887e67ccb87f993150c1ca65dec390cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since default configure options for host packages include
--disable-static, gcc was not configured to build static version of its
libraries (libgcc.a, libstdc++.a, ...).

This patch replace --disable-static by --enable-static in configure
command. Notice some options was removed sinces they was ignored by gcc
configure script.

Once it was compiled, this commit takes care to copy static libraries to
$STAGING

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Tested-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index b396382..49de481 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -26,6 +26,21 @@ HOST_GCC_FINAL_SUBDIR = build
 
 HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
+define  HOST_GCC_FINAL_CONFIGURE_CMDS
+        (cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
+                $(HOST_CONFIGURE_OPTS) \
+                CFLAGS="$(HOST_CFLAGS)" \
+                LDFLAGS="$(HOST_LDFLAGS)" \
+                $(HOST_GCC_FINAL_CONF_ENV) \
+                ./configure \
+                --prefix="$(HOST_DIR)/usr" \
+                --sysconfdir="$(HOST_DIR)/etc" \
+                --enable-shared --enable-static \
+                $(QUIET) $(HOST_GCC_FINAL_CONF_OPT) \
+        )
+endef
+
+
 # Languages supported by the cross-compiler
 GCC_FINAL_CROSS_LANGUAGES-y = c
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
@@ -133,6 +148,8 @@ define HOST_GCC_FINAL_INSTALL_USR_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
 		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
 			$(STAGING_DIR)/usr/lib/ ; \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
+			$(STAGING_DIR)/usr/lib/ ; \
 		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
 			$(TARGET_DIR)/usr/lib/ ; \
 	done
