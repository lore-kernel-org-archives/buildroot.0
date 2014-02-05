From: Sven Neumann <neumann@teufel.de>
Date: Wed,  5 Feb 2014 09:14:39 +0100
Subject: [Buildroot] [PATCH] opus: allow to select fixed-point implementation
Message-ID: <1391588079-15608-1-git-send-email-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default of choosing the fixed-point implementation if
the target hardware does not have floating-point unit is not
always the best choice. Modern ARM hardware has floating
point support but most likely the fixed-point implementation
in Opus will still perform better. In particular if your CPU
supports the NEON extension.

This commit allows to select the fixed-point implementation
manually and sets the default based on the availability of
a floating-point unit.

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/opus/Config.in | 11 +++++++++++
 package/opus/opus.mk   |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/opus/Config.in b/package/opus/Config.in
index 12bdfbb..1cd991a 100644
--- a/package/opus/Config.in
+++ b/package/opus/Config.in
@@ -13,3 +13,14 @@ config BR2_PACKAGE_OPUS
 	  quality stereo music.
 
 	  http://opus-codec.org
+
+if BR2_PACKAGE_OPUS
+
+config BR2_PACKAGE_OPUS_FIXED_POINT
+	bool "opus fixed-point implementation"
+	default y if BR2_SOFT_FLOAT
+	help
+	  Compile without floating point operations (for machines without
+	  a fast enough FPU).
+
+endif
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 007cf16..1fc1048 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -12,7 +12,7 @@ OPUS_INSTALL_STAGING = YES
 OPUS_CONF_OPT = --disable-doc
 OPUS_AUTORECONF = YES
 
-ifeq ($(BR2_SOFT_FLOAT),y)
+ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
 OPUS_CONF_OPT += --enable-fixed-point
 endif
 
-- 
1.8.3.2
