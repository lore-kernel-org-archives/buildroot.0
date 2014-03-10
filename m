From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:21 -0300
Subject: [Buildroot] [PATCH 01/14] libpcap: bump to version 1.5.3
Message-ID: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TPACKET_V3 support issues fixed in 1.5.2/1.5.3 so the patch is no longer
necessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...0002-fix-TPACKET_V3-initialization-GH-329.patch | 34 ----------------------
 package/libpcap/libpcap.mk                         |  2 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch

diff --git a/package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch b/package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch
deleted file mode 100644
index 9d16098..0000000
--- a/package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cd84bc9743d7595dee1ea4bc40bd236a619d6539 Mon Sep 17 00:00:00 2001
-From: Gabor Tatarka <gabor.tatarka@ericsson.com>
-Date: Mon, 2 Dec 2013 22:05:57 +0400
-Subject: [PATCH] fix TPACKET_V3 initialization (GH #329)
-
-libpcap would fail to initialize on Linux when compiled against kernel
-headers with TPACKET_V3 support but running on kernel without:
-
-"can't get TPACKET_V3 header len on packet socket: Invalid argument"
-
-Fix init_tpacket() to respect EINVAL because that is what the kernel
-returns for unsupported TPACKET versions.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- pcap-linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pcap-linux.c b/pcap-linux.c
-index 6c0723a..8800c96 100644
---- a/pcap-linux.c
-+++ b/pcap-linux.c
-@@ -3471,7 +3471,7 @@ init_tpacket(pcap_t *handle, int version, const char *version_str)
- 
- 	/* Probe whether kernel supports the specified TPACKET version */
- 	if (getsockopt(handle->fd, SOL_PACKET, PACKET_HDRLEN, &val, &len) < 0) {
--		if (errno == ENOPROTOOPT)
-+		if (errno == ENOPROTOOPT || errno == EINVAL)
- 			return 1;	/* no */
- 
- 		/* Failed to even find out; this is a fatal error. */
--- 
-1.8.5.1
-
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index aba2510..3681d4c 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.5.1
+LIBPCAP_VERSION = 1.5.3
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3c
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
1.8.3.2
