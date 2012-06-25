From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jun 2012 10:07:35 +0300
Subject: [Buildroot] [PATCHv2] libpcap: bump to version 1.3.0
Message-ID: <4cb520504e0c57eb586091cd4c9de83f6c005fe7.1340607805.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: remove patch applied upstream.

 .../libpcap-dont-fail-on-missing-netfilter.patch   |   30 --------------------
 package/libpcap/libpcap.mk                         |    2 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch

diff --git a/package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch b/package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch
deleted file mode 100644
index b0efbc7..0000000
--- a/package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d55b6f4f1b2bfab96ad57e0239b0b2b57785df77 Mon Sep 17 00:00:00 2001
-From: Jiri Slaby <jirislaby@gmail.com>
-Date: Wed, 29 Feb 2012 01:19:18 -0800
-Subject: [PATCH] Don't fail if netfilter isn't enabled in the kernel.
-
-Check for EPROTONOSUPPORT as well as EAFNOSUPPORT.
-
-Reviewed-By: Guy Harris <guy@alum.mit.edu>
----
- pcap-netfilter-linux.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pcap-netfilter-linux.c b/pcap-netfilter-linux.c
-index 225e49f..f9c6bef 100644
---- a/pcap-netfilter-linux.c
-+++ b/pcap-netfilter-linux.c
-@@ -452,8 +452,8 @@ netfilter_platform_finddevs(pcap_if_t **alldevsp, char *err_str)
- 	
- 	sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_NETFILTER);
- 	if (sock < 0) {
--		/* if netlink is not supported this this is not fatal */
--		if (errno == EAFNOSUPPORT)
-+		/* if netlink is not supported this is not fatal */
-+		if (errno == EAFNOSUPPORT || errno == EPROTONOSUPPORT)
- 			return 0;
- 		snprintf(err_str, PCAP_ERRBUF_SIZE, "Can't open netlink socket %d:%s",
- 			errno, pcap_strerror(errno));
--- 
-1.7.10
-
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 0b88a42..51e1106 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBPCAP_VERSION = 1.2.1
+LIBPCAP_VERSION = 1.3.0
 LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_INSTALL_STAGING = YES
 # doesn't have an install-strip
-- 
1.7.10
