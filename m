From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jan 2010 11:10:32 +0100
Subject: [Buildroot] [git commit master] Bump iptables to 1.4.6
Message-ID: <20100120101207.9B969776FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0908e85ce30fe20c8aadcbab37f305b2930d0e79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #913.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    8 +++++---
 package/iptables/iptables-1.4.5-disable-ipv6.patch |   19 -------------------
 package/iptables/iptables.mk                       |    2 +-
 target/iso9660/iso9660.mk                          |    2 ++
 4 files changed, 8 insertions(+), 23 deletions(-)
 delete mode 100644 package/iptables/iptables-1.4.5-disable-ipv6.patch

diff --git a/CHANGES b/CHANGES
index 772a414..b7fdf01 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,9 +5,10 @@
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
-	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iw, jpeg,
-	libfuse, libpcap, libungif, lighttpd, mesa, mpg123, mtd-utils, neon,
-	pcre, qt, rpm, sshfs, tremor, u-boot, usbutils, xfsprogs
+	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
+	iw, jpeg, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
+	mtd-utils, neon, pcre, qt, rpm, sshfs, tremor, u-boot, usbutils,
+	xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -30,6 +31,7 @@
 	#823: Editor backup files (~) is copied from the target_skeleton
 	#827: Bump mtd-utils package to version 1.2.0
 	#841: Build error
+	#913: Bump iptables to 1.4.6
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/iptables/iptables-1.4.5-disable-ipv6.patch b/package/iptables/iptables-1.4.5-disable-ipv6.patch
deleted file mode 100644
index 9f22a0c..0000000
--- a/package/iptables/iptables-1.4.5-disable-ipv6.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- iptables-1.4.5/xtables.c.org	2009-09-14 18:36:55.000000000 +0200
-+++ iptables-1.4.5/xtables.c	2009-09-20 13:24:11.000000000 +0200
-@@ -1484,6 +1484,7 @@
- xtables_ip6parse_multiple(const char *name, struct in6_addr **addrpp,
- 		      struct in6_addr **maskpp, unsigned int *naddrs)
- {
-+	static const struct in6_addr zero_addr;
- 	struct in6_addr *addrp;
- 	char buf[256], *p;
- 	unsigned int len, i, j, n, count = 1;
-@@ -1526,7 +1527,7 @@
- 		memcpy(*maskpp + i, addrp, sizeof(*addrp));
- 
- 		/* if a null mask is given, the name is ignored, like in "any/0" */
--		if (memcmp(*maskpp + i, &in6addr_any, sizeof(in6addr_any)) == 0)
-+		if (memcmp(*maskpp + i, &zero_addr, sizeof(zero_addr)) == 0)
- 			strcpy(buf, "::");
- 
- 		addrp = ip6parse_hostnetwork(buf, &n);
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1c3d9be..f1c3768 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.5
+IPTABLES_VERSION = 1.4.6
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 94edf63..9571e47 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -9,6 +9,8 @@ MKISOFS_SITE:=ftp://ftp.berlios.de/pub/cdrecord/
 MKISOFS_DIR:=$(BUILD_DIR)/cdrtools-2.01
 MKISOFS_TARGET=$(MKISOFS_DIR)/mkisofs/OBJ/$(HOST_ARCH)-linux-cc/mkisofs
 
+hest:
+	@echo ARCH=$(BR2_ARCH) HOST_ARCH=$(HOST_ARCH)
 $(DL_DIR)/$(MKISOFS_SOURCE):
 	$(call DOWNLOAD,$(MKISOFS_SITE),$(MKISOFS_SOURCE))
 
-- 
1.6.3.3
