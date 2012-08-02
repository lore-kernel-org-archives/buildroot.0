From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:19 -0000
Subject: [Buildroot] [git commit branch/next] libpcap: don't fail on kernels
	without netfilter support
Message-ID: <20120802195239.3F48288D21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4bcf12d104da408361410ad6cd187021dd8eda5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From upstream git.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libpcap-dont-fail-on-missing-netfilter.patch   |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch b/package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch
new file mode 100644
index 0000000..b0efbc7
--- /dev/null
+++ b/package/libpcap/libpcap-dont-fail-on-missing-netfilter.patch
@@ -0,0 +1,30 @@
+From d55b6f4f1b2bfab96ad57e0239b0b2b57785df77 Mon Sep 17 00:00:00 2001
+From: Jiri Slaby <jirislaby@gmail.com>
+Date: Wed, 29 Feb 2012 01:19:18 -0800
+Subject: [PATCH] Don't fail if netfilter isn't enabled in the kernel.
+
+Check for EPROTONOSUPPORT as well as EAFNOSUPPORT.
+
+Reviewed-By: Guy Harris <guy@alum.mit.edu>
+---
+ pcap-netfilter-linux.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pcap-netfilter-linux.c b/pcap-netfilter-linux.c
+index 225e49f..f9c6bef 100644
+--- a/pcap-netfilter-linux.c
++++ b/pcap-netfilter-linux.c
+@@ -452,8 +452,8 @@ netfilter_platform_finddevs(pcap_if_t **alldevsp, char *err_str)
+ 	
+ 	sock = socket(AF_NETLINK, SOCK_RAW, NETLINK_NETFILTER);
+ 	if (sock < 0) {
+-		/* if netlink is not supported this this is not fatal */
+-		if (errno == EAFNOSUPPORT)
++		/* if netlink is not supported this is not fatal */
++		if (errno == EAFNOSUPPORT || errno == EPROTONOSUPPORT)
+ 			return 0;
+ 		snprintf(err_str, PCAP_ERRBUF_SIZE, "Can't open netlink socket %d:%s",
+ 			errno, pcap_strerror(errno));
+-- 
+1.7.10
+
