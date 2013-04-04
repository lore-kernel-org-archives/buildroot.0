From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Apr 2013 18:32:53 -0300
Subject: [Buildroot] [PATCHv2] openvpn: adjust iproute2 path logic
Message-ID: <1365111173-29701-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported in bug #6164 when using busybox iproute2 openvpn can fail to
locate the 'ip' utility.
This was correct until busybox 1.21.0 was released since it changed the
location of /bin/ip to /sbin/ip (what iproute2 proper does).
So adjust the ip path accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openvpn/openvpn.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index c911465..7a4385b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -17,10 +17,14 @@ OPENVPN_CONF_OPT += --enable-small --disable-plugins \
 	--disable-debug --disable-eurephia
 endif
 
+# Busybox 1.21+ places the ip applet in the "correct" place
+# but previous versions didn't.
 ifeq ($(BR2_PACKAGE_IPROUTE2),y)
 OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
-else
+else ifeq ($(BR2_BUSYBOX_VERSION_1_19_X)$(BR2_BUSYBOX_VERSION_1_20_X),y)
 OPENVPN_CONF_ENV += IPROUTE=/bin/ip
+else
+OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
-- 
1.8.1.5
