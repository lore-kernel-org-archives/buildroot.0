From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:07:25 -0300
Subject: [Buildroot] [PATCH v3 06/15] package infra: drop non-lfs support
In-Reply-To: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427749654-30153-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427749654-30153-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that largefile is mandatory remove support for non-lfs
tweaks/variables in the package infra and the gcc build.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in                | 7 -------
 package/gcc/gcc-final/gcc-final.mk | 1 -
 package/pkg-autotools.mk           | 1 -
 3 files changed, 9 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..fc57427 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -136,10 +136,7 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
-
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
@@ -373,10 +370,6 @@ else
 DISABLE_NLS :=--disable-nls
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-DISABLE_LARGEFILE = --disable-largefile
-endif
-
 ifeq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6 = --enable-ipv6
 else
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index c014bc5..d76eb31 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -49,7 +49,6 @@ GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGE
 HOST_GCC_FINAL_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
-	$(DISABLE_LARGEFILE) \
 	--enable-poison-system-directories \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d2f15fa..2ecf7d8 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -201,7 +201,6 @@ define $(2)_CONFIGURE_CMDS
 		--with-fop=no \
 		--disable-dependency-tracking \
 		$$(DISABLE_NLS) \
-		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
 		$$(ENABLE_DEBUG) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
-- 
2.0.5
