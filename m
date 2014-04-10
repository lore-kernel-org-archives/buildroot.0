From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Apr 2014 12:34:12 +0300
Subject: [Buildroot] [PATCH] gd: fix static build with threads
Message-ID: <8ad85faf59980e86c03369986b09387e8858a193.1397122452.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4b4/4b4272876385cc21dd06ee946d658b8f9e225d78/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gd/gd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 60c1c514375c..146ad6f9fde9 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -16,6 +16,11 @@ GD_LICENSE_FILES = COPYING
 GD_CONFIG_SCRIPTS = gdlib-config
 GD_CONF_OPT = --without-x --disable-rpath
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_PREFER_STATIC_LIB),yy)
+# add -pthread when linking executables statically
+GD_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -pthread"
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 GD_DEPENDENCIES += fontconfig
 GD_CONF_OPT += --with-fontconfig
-- 
1.9.1
