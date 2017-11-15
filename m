From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 23:11:16 +0100
Subject: [Buildroot] [git commit] chrony: fix build with musl
Message-ID: <20171115220405.4898E81418@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6f7e4de525a045de46d7d26420d291dd6301554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The SCM_TIMESTAMPING_PKTINFO macro is missing from the socket.h header
that musl libc provides as of version 1.1.16 that we currently use in
Buildroot. Patch the code to add this macro locally until we update
musl.

Fixes:
http://autobuild.buildroot.net/results/aab/aab3210d6d0c60fb07415d9bbdb09f2d4091446c/
http://autobuild.buildroot.net/results/fc8/fc8440db025f51c176240ca127bc68a367add21c/

Cc: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../chrony/0001-ntp-fix-build-with-musl-libc.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/chrony/0001-ntp-fix-build-with-musl-libc.patch b/package/chrony/0001-ntp-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..c927b34
--- /dev/null
+++ b/package/chrony/0001-ntp-fix-build-with-musl-libc.patch
@@ -0,0 +1,39 @@
+From 1e64bc4c4379ae3e55be3c518e0e3e22c8c4ae77 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 14 Nov 2017 13:23:57 +0200
+Subject: [PATCH] ntp: fix build with musl libc
+
+The configure script enables HAVE_LINUX_TIMESTAMPING_OPT_PKTINFO based
+on the existence of struct scm_ts_pktinfo and
+SOF_TIMESTAMPING_OPT_PKTINFO that were introduced in Linux kernel v4.13
+in the linux/net_tstamp.h kernel header. But this feature also requires
+SCM_TIMESTAMPING_PKTINFO that is defined in the socket.h header. musl
+libc provides its own version of socket.h, and as of musl version 1.1.16
+this macro is missing. Define this macro in the code as a temporary
+measure until musl is updated to its latest version.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not upstreamable
+---
+ ntp_io_linux.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ntp_io_linux.c b/ntp_io_linux.c
+index 00caed06f7ba..2214a6f6f6c5 100644
+--- a/ntp_io_linux.c
++++ b/ntp_io_linux.c
+@@ -574,6 +574,10 @@ extract_udp_data(unsigned char *msg, NTP_Remote_Address *remote_addr, int len)
+ 
+ /* ================================================== */
+ 
++#ifndef SCM_TIMESTAMPING_PKTINFO
++#define SCM_TIMESTAMPING_PKTINFO 58
++#endif
++
+ int
+ NIO_Linux_ProcessMessage(NTP_Remote_Address *remote_addr, NTP_Local_Address *local_addr,
+                          NTP_Local_Timestamp *local_ts, struct msghdr *hdr, int length)
+-- 
+2.15.0
+
