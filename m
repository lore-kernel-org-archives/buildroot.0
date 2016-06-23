From: Yann E. MORIN <yann.morin@orange.com>
Date: Thu, 23 Jun 2016 09:12:43 +0200
Subject: [Buildroot] [PATCH] package/rrdtool: add support for perl bindings
Message-ID: <1466665963-5543-1-git-send-email-yann.morin@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Cedric Chedaleux <cedric.chedaleux@orange.com>

Signed-off-by: Cedric Chedaleux <cedric.chedaleux@orange.com>
[yann.morin at orange.com: slight cleanup in code layout, change leading
spaces with leading tabs, rebase on top of master]
Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
---
 package/rrdtool/rrdtool.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 6d6ab0c..589e4a3 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -19,11 +19,22 @@ RRDTOOL_CONF_OPTS = \
 	--disable-librados \
 	--disable-libwrap \
 	--disable-lua \
-	--disable-perl \
 	--disable-python \
 	--disable-ruby \
 	--disable-tcl
 
+ifeq ($(BR2_PACKAGE_PERL),y)
+RRDTOOL_DEPENDENCIES += host-perl
+RRDTOOL_CONF_OPTS += --enable-perl
+RRDTOOL_CONF_ENV += \
+	ac_cv_path_PERL=$(HOST_DIR)/usr/bin/perl \
+	PERLCC="$(TARGET_CC_NOCCACHE)" \
+	PERLCCFLAGS="$(TARGET_CFLAGS)" \
+	PERLLDFLAGS="$(TARGET_LDFLAGS)"
+else
+RRDTOOL_CONF_OPTS += --disable-perl
+endif
+
 ifeq ($(BR2_PACKAGE_RRDTOOL_RRDGRAPH),y)
 RRDTOOL_DEPENDENCIES += cairo pango
 else
-- 
1.9.1
