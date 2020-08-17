From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 17 Aug 2020 17:08:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/iptraf-ng: bump to version 1.2.1
Message-ID: <1597676921-9204-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

IPTraf-ng is a console-based network monitoring program for Linux that
displays information about IP traffic. It returns such information as:

- Current TCP connections
- UDP, ICMP, OSPF, and other types of IP packets
- Packet and byte counts on TCP connections
- IP, TCP, UDP, ICMP, non-IP, and other packet and byte counts
- TCP/UDP counts by ports
- Packet counts by packet sizes
- Packet and byte counts by IP address
- Interface activity
- Flag statuses on TCP packets
- LAN station statistics

V1.2.1 fixed multiple issues in V1.1.4 like :
- Introduce packet capturing abstraction: add recvmmsg(),
  TPACKET_V2 and TPACKET_V3 to capture in multigigabit speeds.
- Handling mlock() failures and carry on execution (without
  crashing iptraf-ng).
- Properly account non-IP packets.
- Show dropped packet count.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/iptraf-ng/Config.in      |  7 +++----
 package/iptraf-ng/iptraf-ng.hash |  3 +--
 package/iptraf-ng/iptraf-ng.mk   | 22 +++++++++++++++-------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/package/iptraf-ng/Config.in b/package/iptraf-ng/Config.in
index 5c3b484..f240daf 100644
--- a/package/iptraf-ng/Config.in
+++ b/package/iptraf-ng/Config.in
@@ -3,11 +3,10 @@ config BR2_PACKAGE_IPTRAF_NG
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
-	  IPTraf-ng is a ncurses-based network monitoring utility. It
-	  gathers data like TCP connection packet and byte counts,
-	  interface statistics and activity indicators.
+	  IPTraf-ng is a console-based network monitoring program for
+	  Linux that gathers displays information about IP traffic.
 
-	  https://fedorahosted.org/iptraf-ng/
+	  https://github.com/iptraf-ng/iptraf-ng
 
 	  IPTraf-ng is a fork of original IPTraf v3.0.0
 	  (http://iptraf.seul.org).
diff --git a/package/iptraf-ng/iptraf-ng.hash b/package/iptraf-ng/iptraf-ng.hash
index 0a257ec..67f0ee2 100644
--- a/package/iptraf-ng/iptraf-ng.hash
+++ b/package/iptraf-ng/iptraf-ng.hash
@@ -1,4 +1,3 @@
-# From https://fedorahosted.org/releases/i/p/iptraf-ng/iptraf-ng-1.1.4.tar.gz.sum
-sha1	a2e51b0dd6b8c80583fc25d055850c96b3d2f544	iptraf-ng-1.1.4.tar.gz
 # Locally computed
+sha256	a53fa7bd5472e7103c5922e067912432c2a2f2a549a49334d2d1727f2e98e1ec  iptraf-ng-v1.2.1.tar.gz
 sha256  4e49bef38f621aac4a870da4b30011c7b7abc7256b218daec1c425b08448ae1e  LICENSE
diff --git a/package/iptraf-ng/iptraf-ng.mk b/package/iptraf-ng/iptraf-ng.mk
index ac572b9..cc34e54 100644
--- a/package/iptraf-ng/iptraf-ng.mk
+++ b/package/iptraf-ng/iptraf-ng.mk
@@ -4,16 +4,24 @@
 #
 ################################################################################
 
-IPTRAF_NG_VERSION = 1.1.4
-IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng
+IPTRAF_NG_VERSION = v1.2.1
+IPTRAF_NG_SITE = $(call github,iptraf-ng,iptraf-ng,$(IPTRAF_NG_VERSION))
 IPTRAF_NG_LICENSE = GPL-2.0+
 IPTRAF_NG_LICENSE_FILES = LICENSE
 IPTRAF_NG_DEPENDENCIES = ncurses
 
-IPTRAF_NG_MAKE_ENV = \
-	NCURSES_LDFLAGS="-lpanel -lncurses"
+define IPTRAF_NG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
+			   LD="$(TARGET_CC)" \
+			   CFLAGS="$(TARGET_CFLAGS)" \
+			   LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
 
-IPTRAF_NG_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+# HOME should be overwritten, otherwise it falls on the value of
+# the cross compiling machine.
+define IPTRAF_NG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+			   HOME=$(TARGET_DIR)/usr install
+endef
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
-- 
2.7.4
