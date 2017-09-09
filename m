From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:29 +0200
Subject: [Buildroot] [PATCH 23/49 v2] package/asterisk: add support for dahdi
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <c2afce6c45caa52c0e9d8ef0e9a274515330e7ce.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DAHDI is the 'framework' to drive actual telehony cards. Using telephony
cards without signalling is pretty much meaningless, so signalling will
be added in later commits.

libtonezone is provided by dhadi-tools, while the dahdi headers are
provided by dahdi-linux. Go figure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 5a9eb2ced3..27448fda0d 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -45,7 +45,6 @@ ASTERISK_CONF_OPTS = \
 	--without-cap \
 	--without-cpg \
 	--without-curses \
-	--without-dahdi \
 	--without-gtk2 \
 	--without-gmime \
 	--without-h323 \
@@ -88,7 +87,6 @@ ASTERISK_CONF_OPTS = \
 	--without-termcap \
 	--without-timerfd \
 	--without-tinfo \
-	--without-tonezone \
 	--without-unbound \
 	--without-unixodbc \
 	--without-vpb \
@@ -202,6 +200,13 @@ else
 ASTERISK_CONF_OPTS += --without-radius
 endif
 
+ifeq ($(BR2_PACKAGE_DAHDI_LINUX)$(BR2_PACKAGE_DAHDI_TOOLS),yy)
+ASTERISK_DEPENDENCIES += dahdi-linux dahdi-tools
+ASTERISK_CONF_OPTS += --with-dahdi --with-tonezone
+else
+ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone
+endif # DAHDI
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.11.0
