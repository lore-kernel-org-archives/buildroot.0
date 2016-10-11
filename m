From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 12:17:27 +0200
Subject: [Buildroot] [git commit] busybox: bump to version 1.25.1
Message-ID: <20161011101739.0F75F7FEA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ed51b3982a10850d89b303ab72cda5542a3b7e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/0003-gzip.patch                      | 18 ------------------
 ...top-move-free-prev_hist-out-of-signal-path.patch} |  0
 package/busybox/0004-ip.patch                        | 18 ------------------
 package/busybox/0005-ntpd.patch                      | 20 --------------------
 package/busybox/busybox.hash                         |  6 +++---
 package/busybox/busybox.mk                           |  2 +-
 6 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/package/busybox/0003-gzip.patch b/package/busybox/0003-gzip.patch
deleted file mode 100644
index f9b321f..0000000
--- a/package/busybox/0003-gzip.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-From upstream: https://busybox.net/downloads/fixes-1.25.0/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.25.0/archival/gzip.c
-+++ busybox-1.25.0-gzip/archival/gzip.c
-@@ -2220,10 +2220,7 @@ int gzip_main(int argc UNUSED_PARAM, cha
- 	opt >>= ENABLE_GUNZIP ? 7 : 5; /* drop cfv[dt]qn bits */
- 	if (opt == 0)
- 		opt = 1 << 6; /* default: 6 */
--	/* Map 1..3 to 4 */
--	if (opt & 0x7)
--		opt |= 1 << 4;
--	opt = ffs(opt >> 3);
-+	opt = ffs(opt >> 4); /* Maps -1..-4 to [0], -5 to [1] ... -9 to [5] */
- 	max_chain_length = 1 << gzip_level_config[opt].chain_shift;
- 	good_match	 = gzip_level_config[opt].good;
- 	max_lazy_match	 = gzip_level_config[opt].lazy2 * 2;
diff --git a/package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch b/package/busybox/0003-top-move-free-prev_hist-out-of-signal-path.patch
similarity index 100%
rename from package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch
rename to package/busybox/0003-top-move-free-prev_hist-out-of-signal-path.patch
diff --git a/package/busybox/0004-ip.patch b/package/busybox/0004-ip.patch
deleted file mode 100644
index d392adc..0000000
--- a/package/busybox/0004-ip.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-From upstream: https://busybox.net/downloads/fixes-1.25.0/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.25.0/networking/libiproute/iproute.c
-+++ busybox-1.25.0-ip/networking/libiproute/iproute.c
-@@ -362,10 +362,9 @@ IF_FEATURE_IP_RULE(ARG_table,)
- 		req.r.rtm_scope = RT_SCOPE_NOWHERE;
- 
- 	if (cmd != RTM_DELROUTE) {
-+		req.r.rtm_scope = RT_SCOPE_UNIVERSE;
- 		if (RTPROT_BOOT != 0)
- 			req.r.rtm_protocol = RTPROT_BOOT;
--		if (RT_SCOPE_UNIVERSE != 0)
--			req.r.rtm_scope = RT_SCOPE_UNIVERSE;
- 		if (RTN_UNICAST != 0)
- 			req.r.rtm_type = RTN_UNICAST;
- 	}
diff --git a/package/busybox/0005-ntpd.patch b/package/busybox/0005-ntpd.patch
deleted file mode 100644
index f652ec6..0000000
--- a/package/busybox/0005-ntpd.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From upstream: https://busybox.net/downloads/fixes-1.25.0/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- busybox-1.25.0/networking/ntpd.c
-+++ busybox-1.25.0-ntpd/networking/ntpd.c
-@@ -2051,6 +2051,13 @@ recv_and_process_client_pkt(void /*int f
- 		goto bail;
- 	}
- 
-+	/* Respond only to client and symmetric active packets */
-+	if ((msg.m_status & MODE_MASK) != MODE_CLIENT
-+	 && (msg.m_status & MODE_MASK) != MODE_SYM_ACT
-+	) {
-+		goto bail;
-+	}
-+
- 	query_status = msg.m_status;
- 	query_xmttime = msg.m_xmttime;
- 
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index e9e0691..8306de9 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.25.0.tar.bz2.sign
-md5	b05af9645076f75429a8683f8afcbdb3	busybox-1.25.0.tar.bz2
-sha1	c6c759bf4c4f24b37f52e136e2b15d921a8d44cb	busybox-1.25.0.tar.bz2
+# From http://busybox.net/downloads/busybox-1.25.1.tar.bz2.sign
+md5	4f4c5de50b479b11ff636d7d8eb902a2	busybox-1.25.1.tar.bz2
+sha1	8b227b3efdb4c4aa94750f80cc63429aec6daa0b	busybox-1.25.1.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 895f4ca..fc23a90 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.25.0
+BUSYBOX_VERSION = 1.25.1
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
