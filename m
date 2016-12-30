From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:27 +0100
Subject: [Buildroot] [PATCH 26/52] package/asterisk: add support for dahdi
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <25522b423317e68208b6f3f227468d65daa39fb4.1483093662.git.yann.morin.1998@free.fr>
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
index a63579a..a307fa2 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -34,7 +34,6 @@ ASTERISK_CONF_OPTS += \
 	--without-cap \
 	--without-cpg \
 	--without-curses \
-	--without-dahdi \
 	--without-gtk2 \
 	--without-gmime \
 	--without-h323 \
@@ -77,7 +76,6 @@ ASTERISK_CONF_OPTS += \
 	--without-termcap \
 	--without-timerfd \
 	--without-tinfo \
-	--without-tonezone \
 	--without-unbound \
 	--without-unixodbc \
 	--without-vpb \
@@ -184,6 +182,13 @@ else
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
2.7.4
