From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Mar 2016 21:47:17 +0100
Subject: [Buildroot] [PATCH 2/2] cairo, icu,
	webkitgtk24: use BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <1457297237-4064-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457297237-4064-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1457297237-4064-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit modifies the cairo, icu and webkitgtk24 packages to use
BR2_TOOLCHAIN_HAS_LIBATOMIC when appropriate.

Fixes:

  http://autobuild.buildroot.net/results/ec4/ec4e48c0e4b8fa72d8bb7ef4ad67a166699c0b62/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cairo/cairo.mk             | 2 +-
 package/icu/icu.mk                 | 2 +-
 package/webkitgtk24/webkitgtk24.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6b54b28..b6ab54e 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -18,7 +18,7 @@ endif
 
 # cairo can use C++11 atomics when available, so we need to link with
 # libatomic for the architectures who need libatomic.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 CAIRO_CONF_ENV += LIBS="-latomic"
 endif
 
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index b4574e5..f245da2 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -21,7 +21,7 @@ ICU_CONF_OPTS = \
 # When available, icu prefers to use C++11 atomics, which rely on the
 # __atomic builtins. On certain architectures, this requires linking
 # with libatomic starting from gcc 4.8.
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_8),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ICU_CONF_ENV += LIBS="-latomic"
 endif
 
diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index d8e41b9..0438ceb 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -29,7 +29,7 @@ endif
 WEBKITGTK24_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
 
 # Some 32-bit architectures need libatomic support for 64-bit ops
-ifeq ($(BR2_i386)$(BR2_mips)$(BR2_mipsel)$(BR2_sh),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 WEBKITGTK24_CONF_ENV += LIBS="-latomic"
 endif
 
-- 
2.6.4
