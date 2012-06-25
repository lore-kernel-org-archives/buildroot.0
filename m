From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jun 2012 10:06:45 +0200
Subject: [Buildroot] [git commit] libpcap: bump to version 1.3.0
Message-ID: <20120625081956.B86F68B4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=843d934165910488acb3ec360a8eab7a9581b02f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libpcap-dont-fail-on-missing-netfilter.patch   |   30 --------------------
 package/libpcap/libpcap.mk                         |    2 +-
 2 files changed, 1 insertions(+), 31 deletions(-)

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
