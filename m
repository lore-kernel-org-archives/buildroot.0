From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Apr 2012 00:42:40 +0200
Subject: [Buildroot] [git commit] package: add ndisc6 (IPv6 network tools)
Message-ID: <20120426224515.6162C96BDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=524a8ab35cb955060f83649989ef769e8988d02f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/ndisc6/Config.in                           |   49 +++++++++++++++
 .../ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch   |   64 ++++++++++++++++++++
 package/ndisc6/ndisc6.mk                           |   37 +++++++++++
 4 files changed, 151 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 28a08d2..a310146 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ source "package/mrouted/Config.in"
 source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
+source "package/ndisc6/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
new file mode 100644
index 0000000..126bfa2
--- /dev/null
+++ b/package/ndisc6/Config.in
@@ -0,0 +1,49 @@
+comment "ndisc6 requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_NDISC6
+	bool "ndisc6 tools"
+	depends on BR2_INET_IPV6
+	help
+	  NDisc6 is a small collection of useful tools for IPv6 networking
+
+	  http://www.remlab.net/ndisc6/
+
+if BR2_PACKAGE_NDISC6
+
+config BR2_PACKAGE_NDISC6_NAME2ADDR
+	bool "name2addr"
+	help
+	  name2addr perform DNS lookups from scripts.
+
+config BR2_PACKAGE_NDISC6_NDISC6
+	bool "ndisc6"
+	help
+	  ndisc6 performs ICMPv6 Neighbor Discovery in userland.
+
+config BR2_PACKAGE_NDISC6_RDISC6
+	bool "rdisc6"
+	help
+	  rdisc6 performs ICMPv6 Router Discovery in userland.
+
+config BR2_PACKAGE_NDISC6_RDNSSD
+	bool "rdnssd"
+	help
+	  IPv6 Recursive DNS Server discovery Daemon.
+
+config BR2_PACKAGE_NDISC6_RLTRACEROUTE6
+	bool "rltraceroute6"
+	help
+	  rltraceroute6 is an IPv6 traceroute implementation.
+
+config BR2_PACKAGE_NDISC6_TCPTRACEROUTE6
+	bool "tcptraceroute6"
+	help
+	  tcptraceroute6 is an TCP/IPv6 traceroute implementation.
+
+config BR2_PACKAGE_NDISC6_TCPSPRAY
+	bool "tcpspray"
+	help
+	  TCP/IP bandwidth measurement tool (Discard and Echo client).
+
+endif
diff --git a/package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch b/package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch
new file mode 100644
index 0000000..f84719c
--- /dev/null
+++ b/package/ndisc6/ndisc6-trace-tcp-upd-uClibc-fix.patch
@@ -0,0 +1,64 @@
+From 0be2fe3a750b62cafca9794e37f040624d3a59de Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Thu, 26 Apr 2012 23:45:25 +0200
+Subject: [PATCH] trace-{tcp,udp}.c: fix build on uClibc
+
+Selection of the BSD variant of struct tcphdr/udphdr on uClibc fails
+because of config.h. This is caused by config.h setting _GNU_SOURCE
+and the compat handling (uClibc doesn't have inet6_rth_*) including
+sys/types.h which in term includes features.h, which figures out
+what bsd/gnu/posix variant to use because of:
+
+ /* If _BSD_SOURCE was defined by the user, favor BSD over POSIX.  */
+ #if defined _BSD_SOURCE && \
+    !(defined _POSIX_SOURCE || defined _POSIX_C_SOURCE || \
+      defined _XOPEN_SOURCE || defined _XOPEN_SOURCE_EXTENDED || \
+      defined _GNU_SOURCE || defined _SVID_SOURCE)
+ # define __FAVOR_BSD    1
+ #endif
+
+The current workaround of undefining _GNU_SOURCE after config.h doesn't
+work as features.h has already been evaluated by then. Instead, simply
+don't include config.h as it isn't needed in these two files.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/trace-tcp.c |    5 -----
+ src/trace-udp.c |    5 -----
+ 2 files changed, 10 deletions(-)
+
+diff --git a/src/trace-tcp.c b/src/trace-tcp.c
+index 6a7732d..91b64c2 100644
+--- a/src/trace-tcp.c
++++ b/src/trace-tcp.c
+@@ -17,11 +17,6 @@
+  *  along with this program. If not, see <http://www.gnu.org/licenses/>. *
+  *************************************************************************/
+ 
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#undef _GNU_SOURCE
+ #define _BSD_SOURCE 1
+ 
+ #include <string.h>
+diff --git a/src/trace-udp.c b/src/trace-udp.c
+index 821c24c..1754338 100644
+--- a/src/trace-udp.c
++++ b/src/trace-udp.c
+@@ -17,11 +17,6 @@
+  *  along with this program. If not, see <http://www.gnu.org/licenses/>. *
+  *************************************************************************/
+ 
+-#ifdef HAVE_CONFIG_H
+-# include <config.h>
+-#endif
+-
+-#undef _GNU_SOURCE
+ #define _BSD_SOURCE 1
+ 
+ #include <string.h>
+-- 
+1.7.10
+
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
new file mode 100644
index 0000000..8451e06
--- /dev/null
+++ b/package/ndisc6/ndisc6.mk
@@ -0,0 +1,37 @@
+#############################################################
+#
+# ndisc6
+#
+#############################################################
+
+NDISC6_VERSION = 1.0.2
+NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
+NDISC6_SITE = http://www.remlab.net/files/ndisc6/
+NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
+NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
+
+NDISC6_BIN_ += dnssort # perl script
+NDISC6_BIN_$(BR2_PACKAGE_NDISC6_NAME2ADDR) += name2addr addr2name
+NDISC6_BIN_$(BR2_PACKAGE_NDISC6_TCPSPRAY) += tcpspray tcpspray6
+
+NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_NDISC6) += ndisc6
+NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_RDISC6) += rdisc6
+NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_RDNSSD) += rdnssd
+NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_RLTRACEROUTE6) += rltraceroute6 tracert6
+NDISC6_SBIN_$(BR2_PACKAGE_NDISC6_TCPTRACEROUTE6) += tcptraceroute6
+
+NDISC6_MAN1_ = $(addsuffix .1,$(NDISC6_BIN_))
+NDISC6_MAN8_ = $(addsuffix .8,$(NDISC6_SBIN_))
+
+define NDISC6_REMOVE_UNNEEDED
+	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/,$(NDISC6_BIN_)) \
+	       $(addprefix $(TARGET_DIR)/usr/sbin/,$(NDISC6_SBIN_)) \
+	       $(addprefix $(TARGET_DIR)/usr/share/man/man1/,$(NDISC6_MAN1_)) \
+	       $(addprefix $(TARGET_DIR)/usr/share/man/man8/,$(NDISC6_MAN8_))
+	$(if $(BR2_PACKAGE_NDISC6_RDNSSD),,\
+		rm -rf $(TARGET_DIR)/etc/rdnssd $(TARGET_DIR)/var/run/rdnssd)
+endef
+
+NDISC6_POST_INSTALL_TARGET_HOOKS += NDISC6_REMOVE_UNNEEDED
+
+$(eval $(call AUTOTARGETS))
