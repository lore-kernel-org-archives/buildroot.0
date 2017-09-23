From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add support for dahdi
Message-ID: <20170923171328.082498103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1fba2c4adc6ff8aaa8a66140bb5260b82828db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DAHDI is the 'framework' to drive actual telehony cards. Using telephony
cards without signalling is pretty much meaningless, so signalling will
be added in later commits.

libtonezone is provided by dhadi-tools, while the dahdi headers are
provided by dahdi-linux. Go figure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e674565..55370c4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -52,7 +52,6 @@ ASTERISK_CONF_OPTS = \
 	--without-cap \
 	--without-cpg \
 	--without-curses \
-	--without-dahdi \
 	--without-gtk2 \
 	--without-gmime \
 	--without-h323 \
@@ -95,7 +94,6 @@ ASTERISK_CONF_OPTS = \
 	--without-termcap \
 	--without-timerfd \
 	--without-tinfo \
-	--without-tonezone \
 	--without-unbound \
 	--without-unixodbc \
 	--without-vpb \
@@ -196,6 +194,13 @@ else
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
