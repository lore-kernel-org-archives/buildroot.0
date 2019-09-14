From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Sep 2019 11:32:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/chrony: drop musl patch
In-Reply-To: <20190914093227.4893-1-fontaine.fabrice@gmail.com>
References: <20190914093227.4893-1-fontaine.fabrice@gmail.com>
Message-ID: <20190914093227.4893-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is not needed as musl defines SCM_TIMESTAMPING_PKTINFO since
version 1.1.19 and
https://git.musl-libc.org/cgit/musl/commit/?id=c35a8bf456ca6ef74e3cc7c4d8f63572bc1e1167

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-ntp-fix-build-with-musl-libc.patch   | 39 -------------------
 1 file changed, 39 deletions(-)
 delete mode 100644 package/chrony/0001-ntp-fix-build-with-musl-libc.patch

diff --git a/package/chrony/0001-ntp-fix-build-with-musl-libc.patch b/package/chrony/0001-ntp-fix-build-with-musl-libc.patch
deleted file mode 100644
index c927b343f7..0000000000
--- a/package/chrony/0001-ntp-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1e64bc4c4379ae3e55be3c518e0e3e22c8c4ae77 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 14 Nov 2017 13:23:57 +0200
-Subject: [PATCH] ntp: fix build with musl libc
-
-The configure script enables HAVE_LINUX_TIMESTAMPING_OPT_PKTINFO based
-on the existence of struct scm_ts_pktinfo and
-SOF_TIMESTAMPING_OPT_PKTINFO that were introduced in Linux kernel v4.13
-in the linux/net_tstamp.h kernel header. But this feature also requires
-SCM_TIMESTAMPING_PKTINFO that is defined in the socket.h header. musl
-libc provides its own version of socket.h, and as of musl version 1.1.16
-this macro is missing. Define this macro in the code as a temporary
-measure until musl is updated to its latest version.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: not upstreamable
----
- ntp_io_linux.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ntp_io_linux.c b/ntp_io_linux.c
-index 00caed06f7ba..2214a6f6f6c5 100644
---- a/ntp_io_linux.c
-+++ b/ntp_io_linux.c
-@@ -574,6 +574,10 @@ extract_udp_data(unsigned char *msg, NTP_Remote_Address *remote_addr, int len)
- 
- /* ================================================== */
- 
-+#ifndef SCM_TIMESTAMPING_PKTINFO
-+#define SCM_TIMESTAMPING_PKTINFO 58
-+#endif
-+
- int
- NIO_Linux_ProcessMessage(NTP_Remote_Address *remote_addr, NTP_Local_Address *local_addr,
-                          NTP_Local_Timestamp *local_ts, struct msghdr *hdr, int length)
--- 
-2.15.0
-
-- 
2.23.0.rc1
