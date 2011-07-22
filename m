From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2011 09:08:36 +0200
Subject: [Buildroot] [git commit] ipset: new package
Message-ID: <20110722071021.6DE8885758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6a7611b540677a072656e481d4735f2b4b6a3381
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add ipset support package.
Note that this requires bleeding edge (>=2.6.39) kernel version or
patches.

[Peter: needs largefile, host-pkg-config]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/ipset/Config.in |   12 ++++++++++++
 package/ipset/ipset.mk  |   13 +++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/ipset/Config.in
 create mode 100644 package/ipset/ipset.mk

diff --git a/package/Config.in b/package/Config.in
index 981a633..b9bd529 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -407,6 +407,7 @@ source "package/ifplugd/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
+source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
diff --git a/package/ipset/Config.in b/package/ipset/Config.in
new file mode 100644
index 0000000..af16fa8
--- /dev/null
+++ b/package/ipset/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_IPSET
+	bool "ipset"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Utility to manage IP sets in the linux kernel.
+	  Requires a patched kernel or version >=2.6.39.
+
+	  http://ipset.netfilter.org/
+
+comment "ipset requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
new file mode 100644
index 0000000..9d901fc
--- /dev/null
+++ b/package/ipset/ipset.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# ipset
+#
+#############################################################
+
+IPSET_VERSION = 6.8
+IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
+IPSET_SITE = http://ipset.netfilter.org
+IPSET_AUTORECONF = YES
+IPSET_DEPENDENCIES = libmnl host-pkg-config
+
+$(eval $(call AUTOTARGETS,package,ipset))
-- 
1.7.3.4
