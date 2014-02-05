From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Feb 2014 09:34:01 +0100
Subject: [Buildroot] [git commit] opus: allow to select fixed-point
	implementation
Message-ID: <20140205083515.6A2F79C331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=38bab3635ac79d6d6fb1468713f092eda8d9ca7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default of choosing the fixed-point implementation if
the target hardware does not have floating-point unit is not
always the best choice. Modern ARM hardware has floating
point support but most likely the fixed-point implementation
in Opus will still perform better. In particular if your CPU
supports the NEON extension.

This commit allows to select the fixed-point implementation
manually and sets the default based on the availability of
a floating-point unit.

[Peter: force option for sw float, slightly reword]
Signed-off-by: Sven Neumann <neumann@teufel.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/Config.in |   11 +++++++++++
 package/opus/opus.mk   |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/opus/Config.in b/package/opus/Config.in
index 12bdfbb..22e7a55 100644
--- a/package/opus/Config.in
+++ b/package/opus/Config.in
@@ -13,3 +13,14 @@ config BR2_PACKAGE_OPUS
 	  quality stereo music.
 
 	  http://opus-codec.org
+
+if BR2_PACKAGE_OPUS
+
+config BR2_PACKAGE_OPUS_FIXED_POINT
+	bool "use fixed-point" if !BR2_SOFT_FLOAT
+	default y if BR2_SOFT_FLOAT
+	help
+	  Compile without floating point operations (for machines
+	  without a fast enough FPU).
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
 
