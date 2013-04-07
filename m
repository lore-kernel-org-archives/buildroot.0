From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Apr 2013 09:43:32 +0200
Subject: [Buildroot] [git commit] openvpn: adjust iproute2 path logic
Message-ID: <20130407074450.EE5A39B4F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1627fb54715406d6c76461d5104ee11dabbf5870
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in bug #6164 when using busybox iproute2 openvpn can fail to
locate the 'ip' utility.
This was correct until busybox 1.21.0 was released since it changed the
location of /bin/ip to /sbin/ip (what iproute2 proper does).
So adjust the ip path accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openvpn/openvpn.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
