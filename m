From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:00:32 +0100
Subject: [Buildroot] [git commit] libpcap: bump to version 1.5.3
Message-ID: <20140311220647.53A5E9BEFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa13d43881e5ecfdee417e6018ea6917182bbc7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TPACKET_V3 support issues fixed in 1.5.2/1.5.3 so the patch is no longer
necessary.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-fix-TPACKET_V3-initialization-GH-329.patch |   34 --------------------
 package/libpcap/libpcap.mk                         |    2 +-
 2 files changed, 1 insertions(+), 35 deletions(-)

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
