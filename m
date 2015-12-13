From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 17:57:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libass: Fix fontconfig detection
Message-ID: <1450025851-2594-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is a combination of the approaches by Vicente and Yann
discussed in http://patchwork.ozlabs.org/patch/553448/ to fix the
configure bug due to fontconfig being disabled.

Fixes
http://autobuild.buildroot.net/results/923/923e8688ab6a294b51fa146cd2ed23db20fe7341/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libass/libass.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 83939e2..72770e2 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -24,6 +24,15 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
 LIBASS_DEPENDENCIES += host-yasm
 endif
 
+# libass uses the concept of a "system font provider", in the linux case
+# this is currently only fontconfig. If fontconfig is disabled we need
+# the following configure option to avoid a configure error. This option
+# can be appended in the future when other linux packages are taking care
+# of the role as "system font provider".
+ifneq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBASS_CONF_OPTS = --disable-require-system-font-provider
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBASS_DEPENDENCIES += fontconfig
 LIBASS_CONF_OPTS += --enable-fontconfig
-- 
2.6.2
