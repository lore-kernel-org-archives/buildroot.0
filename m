From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:44 -0000
Subject: [Buildroot] [git commit branch/next] Add package nss-mdns.
Message-ID: <20120802195243.162EB96EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28943cf00545e9c923364bfca4af044faaf6fc53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/nss-mdns/Config.in     |   13 +++++++++++++
 package/nss-mdns/nss-mdns.mk   |   15 +++++++++++++++
 package/nss-mdns/nsswitch.conf |   15 +++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d489b6a..c9b5e1a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -426,6 +426,7 @@ source "package/libsoup/Config.in"
 source "package/libtorrent/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/nss-mdns/Config.in"
 source "package/ortp/Config.in"
 source "package/zeromq/Config.in"
 endmenu
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
new file mode 100644
index 0000000..485cfcd
--- /dev/null
+++ b/package/nss-mdns/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NSS_MDNS
+	bool "nss-mdns"
+	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
+	depends on BR2_PACKAGE_AVAHI_DAEMON
+	help
+	  nss-mdns is a plugin for the GNU Name Service Switch (NSS)
+	  functionality of the GNU C Library (glibc) providing host
+	  name resolution via Multicast DNS (aka Zeroconf, aka Apple
+	  Rendezvous, aka Apple Bonjour), effectively allowing name
+	  resolution by common Unix/Linux programs in the ad-hoc
+	  mDNS domain .local.
+
+	  http://0pointer.de/lennart/projects/nss-mdns/
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
new file mode 100644
index 0000000..8f7d9a9
--- /dev/null
+++ b/package/nss-mdns/nss-mdns.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# nss_mdns
+#
+#############################################################
+NSS_MDNS_VERSION=0.10
+NSS_MDNS_SITE=http://0pointer.de/lennart/projects/nss-mdns
+
+define NSS_MDNS_INSTALL_CONFIG
+	$(INSTALL) -D -m 0664 package/nss-mdns/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf
+endef
+
+NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/nss-mdns/nsswitch.conf b/package/nss-mdns/nsswitch.conf
new file mode 100644
index 0000000..94174e0
--- /dev/null
+++ b/package/nss-mdns/nsswitch.conf
@@ -0,0 +1,15 @@
+# /etc/nsswitch.conf
+
+passwd:         compat
+group:          compat
+shadow:         compat
+
+hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4
+networks:       files
+
+protocols:      db files
+services:       db files
+ethers:         db files
+rpc:            db files
+
+netgroup:       nis
