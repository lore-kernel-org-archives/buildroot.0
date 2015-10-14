From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 18:42:36 -0300
Subject: [Buildroot] [PATCH] guile: handle readline support explicitly
Message-ID: <1444858956-1045-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the host readline (+ncurses) development files can poison the
build causing breakage. Fixes:
http://autobuild.buildroot.net/results/d0a/d0a8ad9d3f19592e06df36408d6af745f7908165/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/guile/guile.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 2bd7198..0e0b1a3 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -32,6 +32,16 @@ ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
 
+# It can use readline, but on the condition that it was build against
+# ncurses. If both aren't present disable readline support since the
+# host readline/ncurses support can poison the build.
+ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
+GUILE_CONF_OPTS += --with-libreadline-prefix=$(STAGING_DIR)/usr
+GUILE_DEPENDENCIES += readline
+else
+GUILE_CONF_OPTS += --without-libreadline-prefix
+endif
+
 GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/usr/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
-- 
2.4.9
