Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F59DECD993
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 18:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47D55411ED;
	Thu,  5 Feb 2026 18:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wPqNI-7x7Xh; Thu,  5 Feb 2026 18:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BEA24115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770316380;
	bh=tS+pVdE2u04Lqqy18yC8XyuRaObXSuJAwjQCXgV3v3w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p3KDjAW0+3wXh5Q0EMfj5viGV7N1STNqWLmYE43yHaIPFK2Lt2v5kqU7d5KSH6UQX
	 5KRR/JtHzoD3iFbkbPMxEaf4BEp8BvGy3tpDmysnB6A6CO5YpR9qnqCWlq0NMkC7zi
	 YCTjiVtKDY+E/ecCxA4FqGUeYc2iz28hpQVTMcBm6TlyqxIwnydNa2MNCFwdO+sC25
	 LkVyPbOi8Y4zKnxBFsfIARhdXDssSEMILH6Aqu1yex2sJp8zXgk+hJfCPuo0v2+TT/
	 V7rd5ihU0ZRpvnBUnf/L5P2q9fxAXi3Z5fpQvU4i2mL6Ay4w56QjgitCAO8zMitPT2
	 m5DB3x8AEBiiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEA24115D;
	Thu,  5 Feb 2026 18:33:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DFF470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E61841FF
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LE2UVqqJyX55 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 18:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FEB084208
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FEB084208
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FEB084208
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 18:32:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10B9AA4C56B7;
 Thu,  5 Feb 2026 19:32:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60414)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo49p-000000000hX-1Upq;
 Thu, 05 Feb 2026 18:32:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Feb 2026 19:32:48 +0100
Message-ID: <20260205183249.1723521-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770316370;
 bh=vRMhPl9BzIWl9KYGdrqdthvGcoJ3fBSfqeRBOZrN9io=;
 h=From:To:Cc:Subject:Date:From;
 b=rjwvtpWGfCT2p22108nDcUPLPryBrvLbtl7Qpqk0LWdTGIb9rBsXl7vY7SzTNiuwS
 w7tShT8sRWNRQp8KI0llqXRcoWJ/XrEkfDzWcjGJ7rNlplB+TmVMbsT4KuOULFXx1V
 WIDfVimbNN8vr6uKOF03ik2zrwT1tVtwit+4Uol4TiFUOYj2tOiSUSYVBFfHgU5t/8
 YZAOwbJRi5iEj1ppPEkRqB7/tY2bH13DExbBGu58izQLu4ghPfwFSA+sITj/O6Dwuq
 C81xVFw/ngswTOjC+Ix1erHFY5cp2+tXMCwRlNyM7ExBDZw1ck5wKpmARVvBHkPhVm
 fhKZGh6blGoiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rjwvtpWG
Subject: [Buildroot] [PATCH v2 1/1] package/dahdi-linux: bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While trying to fix build errors with version 3.3.0 and newer kernels
some of the upstream patches could not be applied neither to the version
currently provided by buildroot nor 3.4.0 without backporting.

This is especially a problem with https://github.com/asterisk/dahdi-linux/pull/77
which contains fixes for drivers/dahdi/opvxa1200/ which was added after
version 3.3.0 was tagged.

The bump to 3.4.0, which includes the new opvxa1200 driver, is also
problematic because the hash files
http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases/dahdi-linux-3.4.0.sha256
https://github.com/asterisk/dahdi-linux/releases/download/v3.4.0/dahdi-linux-3.4.0.tar.gz.sha256
contain a hash

35e6bd0c98dc86af9faaaf42054fa6905811ab36764c5e2671d63c846bc7f923  dahdi-linux-3.4.0.tar.gz

which is wrong:

$ wget http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases/dahdi-linux-3.4.0.tar.gz
$ sha256sum dahdi-linux-3.4.0.tar.gz
fccd6f147b58cbc8f9afb2235bd2eb2140b99d06eec572cf9860ef8d4bf370d1  dahdi-linux-3.4.0.tar.gz

$ wget https://github.com/asterisk/dahdi-linux/releases/download/v3.4.0/dahdi-linux-3.4.0.tar.gz
$ sha256sum dahdi-linux-3.4.0.tar.gz
b1344d61b86f68ae3fb774b76657216c6bf3cca89e04bfc6c93dbefccc88c654  dahdi-linux-3.4.0.tar.gz

Both source tarballs were changed after the hash file was produced...

To get a valid source code for version 3.4.0 we would need to download
it via the github helper anyway so instead we download the current
master branch so all newly needed upstream patches apply cleanly and we
can remove our current patch set.

For details about the current state of the dahdi-linux github repo see
https://github.com/asterisk/dahdi-linux/pull/77#issuecomment-3150876132

Changelog:
- removed all current patches because they are included in the master
  branch
- added new patches to fix various build errors related to newer kernel
  versions
- Fixed typo in hash file
- updated kernel config fixups because CRC_CCITT was transformed into
  an unselectable blind option in kernel 6.15:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/lib/Kconfig?id=7939da264bcc91ced4d01014241a581e79d414d9
  Instead we select ppp_async & deps as reasonable alternative:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ppp/Kconfig?h=v6.18.8#n188

Fixes:
https://autobuild.buildroot.net/results/47f/47fe1bfe3b052c7c085536569b895e62ab4ce5e8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fix build with kernel >= 6.15 (Thomas)

 .../0001-fix-build-with-32-bits-kernel.patch  | 145 -----------
 ...ers-for-del_timer-and-del_timer_sync.patch |  36 +++
 ...ilation-issue-for-6-8-y-6-9-y-kernel.patch | 230 ------------------
 ...pper-for-renamed-from_timer-function.patch |  33 +++
 ...se-ccflags-y-instead-of-EXTRA_CFLAGS.patch | 222 +++++++++++++++++
 ...const-struct-device_device-if-needed.patch |  82 -------
 package/dahdi-linux/dahdi-linux.hash          |   6 +-
 package/dahdi-linux/dahdi-linux.mk            |   9 +-
 8 files changed, 299 insertions(+), 464 deletions(-)
 delete mode 100644 package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch
 create mode 100644 package/dahdi-linux/0001-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sync.patch
 delete mode 100644 package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch
 create mode 100644 package/dahdi-linux/0002-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
 create mode 100644 package/dahdi-linux/0003-oct612x-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
 delete mode 100644 package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch

diff --git a/package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch b/package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch
deleted file mode 100644
index df09149679..0000000000
--- a/package/dahdi-linux/0001-fix-build-with-32-bits-kernel.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From aa74fa2fb5acf54bd46ad4c1b10e0a23a2cb3d25 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 4 Nov 2021 18:45:11 +0100
-Subject: [PATCH] fix build with 32-bits kernel
-
-Use div_s64 or div_s64_rem to fix the following build failure on 32-bits
-kernels:
-
-ERROR: modpost: "__divdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp_usb.ko] undefined!
-ERROR: modpost: "__udivdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp_usb.ko] undefined!
-ERROR: modpost: "__moddi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp.ko] undefined!
-ERROR: modpost: "__divdi3" [/home/fabrice/buildroot/output/build/dahdi-linux-5c840cf43838e0690873e73409491c392333b3b8/drivers/dahdi/xpp/xpp.ko] undefined!
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/asterisk/dahdi-linux/pull/32
----
- drivers/dahdi/xpp/xbus-core.c    |  9 ++++++---
- drivers/dahdi/xpp/xbus-pcm.c     |  4 ++--
- drivers/dahdi/xpp/xbus-sysfs.c   |  2 +-
- drivers/dahdi/xpp/xframe_queue.c | 15 ++++++++++-----
- drivers/dahdi/xpp/xpp_usb.c      |  2 +-
- 5 files changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/drivers/dahdi/xpp/xbus-core.c b/drivers/dahdi/xpp/xbus-core.c
-index fc4ce7b..b1d1fd7 100644
---- a/drivers/dahdi/xpp/xbus-core.c
-+++ b/drivers/dahdi/xpp/xbus-core.c
-@@ -1754,11 +1754,14 @@ out:
- 
- static void xbus_fill_proc_queue(struct seq_file *sfile, struct xframe_queue *q)
- {
-+	s64 msec = 0;
-+	s32 rem = 0;
-+
-+	msec = div_s64_rem(q->worst_lag_usec, 1000, &rem);
- 	seq_printf(sfile,
--		"%-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%lld ms\n",
-+		"%-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%d ms\n",
- 		q->name, q->steady_state_count, q->count, q->max_count,
--		q->worst_count, q->overflows, q->worst_lag_usec / 1000,
--		q->worst_lag_usec % 1000);
-+		q->worst_count, q->overflows, msec, rem);
- 	xframe_queue_clearstats(q);
- }
- 
-diff --git a/drivers/dahdi/xpp/xbus-pcm.c b/drivers/dahdi/xpp/xbus-pcm.c
-index 8bb2fe7..e690ce7 100644
---- a/drivers/dahdi/xpp/xbus-pcm.c
-+++ b/drivers/dahdi/xpp/xbus-pcm.c
-@@ -129,7 +129,7 @@ static int xpp_ticker_step(struct xpp_ticker *ticker, const ktime_t t)
- 		usec = ktime_us_delta(ticker->last_sample,
- 					ticker->first_sample);
- 		ticker->first_sample = ticker->last_sample;
--		ticker->tick_period = usec / ticker->cycle;
-+		ticker->tick_period = div_s64(usec, ticker->cycle);
- 		cycled = 1;
- 	}
- 	ticker->count++;
-@@ -497,7 +497,7 @@ static void send_drift(xbus_t *xbus, int drift)
- 	XBUS_DBG(SYNC, xbus,
- 		 "%sDRIFT adjust %s (%d) (last update %lld seconds ago)\n",
- 		 (disable_pll_sync) ? "Fake " : "", msg, drift,
--		 msec_delta / MSEC_PER_SEC);
-+		 div_s64(msec_delta, MSEC_PER_SEC));
- 	if (!disable_pll_sync)
- 		CALL_PROTO(GLOBAL, SYNC_SOURCE, xbus, NULL, SYNC_MODE_PLL,
- 			   drift);
-diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
-index d8c11dc..35180d9 100644
---- a/drivers/dahdi/xpp/xbus-sysfs.c
-+++ b/drivers/dahdi/xpp/xbus-sysfs.c
-@@ -249,7 +249,7 @@ static DEVICE_ATTR_READER(driftinfo_show, dev, buf)
- 	/*
- 	 * Calculate lost ticks time
- 	 */
--	seconds = ktime_ms_delta(now, di->last_lost_tick) / 1000;
-+	seconds = div_s64(ktime_ms_delta(now, di->last_lost_tick), 1000);
- 	minutes = seconds / 60;
- 	seconds = seconds % 60;
- 	hours = minutes / 60;
-diff --git a/drivers/dahdi/xpp/xframe_queue.c b/drivers/dahdi/xpp/xframe_queue.c
-index e986083..8e5e508 100644
---- a/drivers/dahdi/xpp/xframe_queue.c
-+++ b/drivers/dahdi/xpp/xframe_queue.c
-@@ -35,15 +35,18 @@ static void __xframe_dump_queue(struct xframe_queue *q)
- 	int i = 0;
- 	char prefix[30];
- 	ktime_t now = ktime_get();
-+	s64 msec = 0;
-+	s32 rem = 0;
- 
- 	printk(KERN_DEBUG "%s: dump queue '%s' (first packet in each frame)\n",
- 	       THIS_MODULE->name, q->name);
- 	list_for_each_entry_reverse(xframe, &q->head, frame_list) {
- 		xpacket_t *pack = (xpacket_t *)&xframe->packets[0];
- 		s64 usec = ktime_us_delta(now, xframe->kt_queued);
-+		msec = div_s64_rem(usec, 1000, &rem);
- 
--		snprintf(prefix, ARRAY_SIZE(prefix), "  %3d> %5lld.%03lld msec",
--			 i++, usec / 1000, usec % 1000);
-+		snprintf(prefix, ARRAY_SIZE(prefix), "  %3d> %5lld.%03d msec",
-+			 i++, msec, rem);
- 		dump_packet(prefix, pack, 1);
- 	}
- }
-@@ -52,6 +55,8 @@ static bool __xframe_enqueue(struct xframe_queue *q, xframe_t *xframe)
- {
- 	int ret = 1;
- 	static int overflow_cnt;
-+	s64 msec = 0;
-+	s32 rem = 0;
- 
- 	if (unlikely(q->disabled)) {
- 		ret = 0;
-@@ -60,11 +65,11 @@ static bool __xframe_enqueue(struct xframe_queue *q, xframe_t *xframe)
- 	if (q->count >= q->max_count) {
- 		q->overflows++;
- 		if ((overflow_cnt++ % 1000) < 5) {
--			NOTICE("Overflow of %-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%lld ms\n",
-+			msec = div_s64_rem(q->worst_lag_usec, 1000, &rem);
-+			NOTICE("Overflow of %-15s: counts %3d, %3d, %3d worst %3d, overflows %3d worst_lag %02lld.%d ms\n",
- 			     q->name, q->steady_state_count, q->count,
- 			     q->max_count, q->worst_count, q->overflows,
--			     q->worst_lag_usec / 1000,
--			     q->worst_lag_usec % 1000);
-+			     msec, rem);
- 			__xframe_dump_queue(q);
- 		}
- 		ret = 0;
-diff --git a/drivers/dahdi/xpp/xpp_usb.c b/drivers/dahdi/xpp/xpp_usb.c
-index 1a591b1..3741457 100644
---- a/drivers/dahdi/xpp/xpp_usb.c
-+++ b/drivers/dahdi/xpp/xpp_usb.c
-@@ -882,7 +882,7 @@ static void xpp_send_callback(struct urb *urb)
- 		usec = 0; /* System clock jumped */
- 	if (usec > xusb->max_tx_delay)
- 		xusb->max_tx_delay = usec;
--	i = usec / USEC_BUCKET;
-+	i = div_s64(usec, USEC_BUCKET);
- 	if (i >= NUM_BUCKETS)
- 		i = NUM_BUCKETS - 1;
- 	xusb->usb_tx_delay[i]++;
--- 
-2.33.0
-
diff --git a/package/dahdi-linux/0001-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sync.patch b/package/dahdi-linux/0001-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sync.patch
new file mode 100644
index 0000000000..a4ae0ba969
--- /dev/null
+++ b/package/dahdi-linux/0001-kernel.h-Add-wrappers-for-del_timer-and-del_timer_sync.patch
@@ -0,0 +1,36 @@
+From 520cf14256503b4fb5449d72e3c179065d17871a Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Tue, 8 Jul 2025 18:35:56 -0400
+Subject: [PATCH] kernel.h: Add wrappers for del_timer and del_timer_sync.
+
+del_timer[_sync] was renamed to timer_delete[_sync] in kernel
+commit bb663f0f3c396c6d05f6c5eeeea96ced20ff112e, and the
+compatibility wrappers were removed completely in kernel commit
+8fa7292fee5c5240402371ea89ab285ec856c916. Add the wrappers
+back on newer kernels to allow compilation.
+
+Resolves: #91
+
+Upstream: https://github.com/asterisk/dahdi-linux/pull/92
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/dahdi/kernel.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
+index fdd2f885..e23ea256 100644
+--- a/include/dahdi/kernel.h
++++ b/include/dahdi/kernel.h
+@@ -66,6 +66,11 @@
+ #endif /* RHEL_RELEASE_CODE */
+ #endif
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,15,0)
++#define del_timer timer_delete
++#define del_timer_sync timer_delete_sync
++#endif
++
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 18, 0)
+ #include <linux/pci.h>
+ #include <linux/dma-mapping.h>
diff --git a/package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch b/package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch
deleted file mode 100644
index 776d74218e..0000000000
--- a/package/dahdi-linux/0002-Fix-compilation-issue-for-6-8-y-6-9-y-kernel.patch
+++ /dev/null
@@ -1,230 +0,0 @@
-From 497f11466688d9e76a7b68ffdd2c3859279f5fce Mon Sep 17 00:00:00 2001
-From: Pushkar Singh <psingh@sangoma.com>
-Date: Thu, 4 Apr 2024 01:15:01 +0530
-Subject: [PATCH] Fix compilation issue for 6.8.y/6.9.y kernel
-
-Upstream: https://github.com/asterisk/dahdi-linux/commit/497f11466688d9e76a7b68ffdd2c3859279f5fce
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- drivers/dahdi/dahdi-base.c          | 40 ++++++++++++++---------------
- drivers/dahdi/dahdi_dynamic.c       |  4 +--
- drivers/dahdi/dahdi_dynamic_eth.c   |  4 +--
- drivers/dahdi/dahdi_dynamic_ethmf.c |  2 +-
- drivers/dahdi/dahdi_transcode.c     |  2 +-
- drivers/dahdi/xpp/card_global.c     |  2 +-
- 6 files changed, 27 insertions(+), 27 deletions(-)
-
-diff --git a/drivers/dahdi/dahdi-base.c b/drivers/dahdi/dahdi-base.c
-index b96f72b1..87177a69 100644
---- a/drivers/dahdi/dahdi-base.c
-+++ b/drivers/dahdi/dahdi-base.c
-@@ -4359,7 +4359,7 @@ static int dahdi_ioctl_getparams(struct file *file, unsigned long data)
- 	param.pulsebreaktime = chan->pulsebreaktime;
- 	param.pulseaftertime = chan->pulseaftertime;
- 	param.spanno = (chan->span) ? chan->span->spanno : 0;
--	strlcpy(param.name, chan->name, sizeof(param.name));
-+	strscpy(param.name, chan->name, sizeof(param.name));
- 	param.chanpos = chan->chanpos;
- 	param.sigcap = chan->sigcap;
- 	/* Return current law */
-@@ -4447,8 +4447,8 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
- 
- 	spaninfo.spanno = s->spanno; /* put the span # in here */
- 	spaninfo.totalspans = span_count();
--	strlcpy(spaninfo.desc, s->desc, sizeof(spaninfo.desc));
--	strlcpy(spaninfo.name, s->name, sizeof(spaninfo.name));
-+	strscpy(spaninfo.desc, s->desc, sizeof(spaninfo.desc));
-+	strscpy(spaninfo.name, s->name, sizeof(spaninfo.name));
- 	spaninfo.alarms = s->alarms;		/* get alarm status */
- 	spaninfo.rxlevel = s->rxlevel;	/* get rx level */
- 	spaninfo.txlevel = s->txlevel;	/* get tx level */
-@@ -4475,18 +4475,18 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
- 	spaninfo.lineconfig = s->lineconfig;
- 	spaninfo.irq = 0;
- 	spaninfo.linecompat = s->linecompat;
--	strlcpy(spaninfo.lboname, dahdi_lboname(s->lbo),
-+	strscpy(spaninfo.lboname, dahdi_lboname(s->lbo),
- 			  sizeof(spaninfo.lboname));
- 	if (s->parent->manufacturer) {
--		strlcpy(spaninfo.manufacturer, s->parent->manufacturer,
-+		strscpy(spaninfo.manufacturer, s->parent->manufacturer,
- 			sizeof(spaninfo.manufacturer));
- 	}
- 	if (s->parent->devicetype) {
--		strlcpy(spaninfo.devicetype, s->parent->devicetype,
-+		strscpy(spaninfo.devicetype, s->parent->devicetype,
- 			sizeof(spaninfo.devicetype));
- 	}
- 	if (s->parent->location) {
--		strlcpy(spaninfo.location, s->parent->location,
-+		strscpy(spaninfo.location, s->parent->location,
- 			sizeof(spaninfo.location));
- 	}
- 	if (s->spantype) {
-@@ -4505,11 +4505,11 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
- 		const char *st = dahdi_spantype2str(s->spantype);
- 		switch (s->spantype) {
- 		case SPANTYPE_DIGITAL_BRI_NT:
--			strlcpy(spaninfo.spantype, "NT",
-+			strscpy(spaninfo.spantype, "NT",
- 					sizeof(spaninfo.spantype));
- 			break;
- 		case SPANTYPE_DIGITAL_BRI_TE:
--			strlcpy(spaninfo.spantype, "TE",
-+			strscpy(spaninfo.spantype, "TE",
- 					sizeof(spaninfo.spantype));
- 			break;
- 		default:
-@@ -4519,7 +4519,7 @@ static int dahdi_ioctl_spanstat(struct file *file, unsigned long data)
- 			 * so no backward compatibility for this
- 			 * broken interface.
- 			 */
--			strlcpy(spaninfo.spantype, st,
-+			strscpy(spaninfo.spantype, st,
- 					sizeof(spaninfo.spantype));
- 			break;
- 		}
-@@ -4568,10 +4568,10 @@ static int dahdi_ioctl_spanstat_v1(struct file *file, unsigned long data)
- 	spaninfo_v1.spanno = s->spanno; /* put the span # in here */
- 	spaninfo_v1.totalspans = 0;
- 	spaninfo_v1.totalspans = span_count();
--	strlcpy(spaninfo_v1.desc,
-+	strscpy(spaninfo_v1.desc,
- 			  s->desc,
- 			  sizeof(spaninfo_v1.desc));
--	strlcpy(spaninfo_v1.name,
-+	strscpy(spaninfo_v1.name,
- 			  s->name,
- 			  sizeof(spaninfo_v1.name));
- 	spaninfo_v1.alarms = s->alarms;
-@@ -4593,25 +4593,25 @@ static int dahdi_ioctl_spanstat_v1(struct file *file, unsigned long data)
- 	spaninfo_v1.lineconfig = s->lineconfig;
- 	spaninfo_v1.irq = 0;
- 	spaninfo_v1.linecompat = s->linecompat;
--	strlcpy(spaninfo_v1.lboname,
-+	strscpy(spaninfo_v1.lboname,
- 			  dahdi_lboname(s->lbo),
- 			  sizeof(spaninfo_v1.lboname));
- 
- 	if (s->parent->manufacturer) {
--		strlcpy(spaninfo_v1.manufacturer, s->parent->manufacturer,
-+		strscpy(spaninfo_v1.manufacturer, s->parent->manufacturer,
- 			sizeof(spaninfo_v1.manufacturer));
- 	}
- 
- 	if (s->parent->devicetype) {
--		strlcpy(spaninfo_v1.devicetype, s->parent->devicetype,
-+		strscpy(spaninfo_v1.devicetype, s->parent->devicetype,
- 			sizeof(spaninfo_v1.devicetype));
- 	}
- 
--	strlcpy(spaninfo_v1.location, s->parent->location,
-+	strscpy(spaninfo_v1.location, s->parent->location,
- 		sizeof(spaninfo_v1.location));
- 
- 	if (s->spantype) {
--		strlcpy(spaninfo_v1.spantype,
-+		strscpy(spaninfo_v1.spantype,
- 				  dahdi_spantype2str(s->spantype),
- 				  sizeof(spaninfo_v1.spantype));
- 	}
-@@ -5285,7 +5285,7 @@ static int dahdi_ioctl_attach_echocan(unsigned long data)
- 			 * always use it instead of any configured software
- 			 * echocan. This matches the behavior in dahdi 2.4.1.2
- 			 * and earlier releases. */
--			strlcpy(ae.echocan, hwec_def_name, sizeof(ae.echocan));
-+			strscpy(ae.echocan, hwec_def_name, sizeof(ae.echocan));
- 
- 		} else if (strcasecmp(ae.echocan, hwec_def_name) != 0) {
- 			chan_dbg(GENERAL, chan,
-@@ -5384,7 +5384,7 @@ static int dahdi_ioctl_get_version(unsigned long data)
- 	bool have_hwec = dahdi_any_hwec_available();
- 
- 	memset(&vi, 0, sizeof(vi));
--	strlcpy(vi.version, dahdi_version, sizeof(vi.version));
-+	strscpy(vi.version, dahdi_version, sizeof(vi.version));
- 	spin_lock(&ecfactory_list_lock);
- 	list_for_each_entry(cur, &ecfactory_list, list) {
- 		const char * const ec_name = cur->ec->get_name(NULL);
-@@ -5640,7 +5640,7 @@ static int ioctl_dahdi_dial(struct dahdi_chan *chan, unsigned long data)
- 			rv = -EBUSY;
- 			break;
- 		}
--		strlcpy(chan->txdialbuf + strlen(chan->txdialbuf), tdo->dialstr,
-+		strscpy(chan->txdialbuf + strlen(chan->txdialbuf), tdo->dialstr,
- 			DAHDI_MAX_DTMF_BUF - strlen(chan->txdialbuf));
- 		if (!chan->dialing) {
- 			chan->dialing = 1;
-diff --git a/drivers/dahdi/dahdi_dynamic.c b/drivers/dahdi/dahdi_dynamic.c
-index b1df408d..be58aff8 100644
---- a/drivers/dahdi/dahdi_dynamic.c
-+++ b/drivers/dahdi/dahdi_dynamic.c
-@@ -622,8 +622,8 @@ static int _create_dynamic(struct dahdi_dynamic_span *dds)
- 	}
- 	
- 	/* Setup parameters properly assuming we're going to be okay. */
--	strlcpy(d->dname, dds->driver, sizeof(d->dname));
--	strlcpy(d->addr, dds->addr, sizeof(d->addr));
-+	strscpy(d->dname, dds->driver, sizeof(d->dname));
-+	strscpy(d->addr, dds->addr, sizeof(d->addr));
- 	d->timing = dds->timing;
- 	snprintf(d->span.name, sizeof(d->span.name), "DYN/%s/%s",
- 		 dds->driver, dds->addr);
-diff --git a/drivers/dahdi/dahdi_dynamic_eth.c b/drivers/dahdi/dahdi_dynamic_eth.c
-index 0209489b..c7a293dd 100644
---- a/drivers/dahdi/dahdi_dynamic_eth.c
-+++ b/drivers/dahdi/dahdi_dynamic_eth.c
-@@ -292,12 +292,12 @@ static int ztdeth_create(struct dahdi_dynamic *dyn, const char *addr)
- 		memset(z, 0, sizeof(struct ztdeth));
- 
- 		/* Address should be <dev>/<macaddr>[/subaddr] */
--		strlcpy(tmp, addr, sizeof(tmp));
-+		strscpy(tmp, addr, sizeof(tmp));
- 		tmp2 = strchr(tmp, '/');
- 		if (tmp2) {
- 			*tmp2 = '\0';
- 			tmp2++;
--			strlcpy(z->ethdev, tmp, sizeof(z->ethdev));
-+			strscpy(z->ethdev, tmp, sizeof(z->ethdev));
- 		} else {
- 			printk(KERN_NOTICE "Invalid TDMoE address (no device) '%s'\n", addr);
- 			kfree(z);
-diff --git a/drivers/dahdi/dahdi_dynamic_ethmf.c b/drivers/dahdi/dahdi_dynamic_ethmf.c
-index 73290d8d..f7c067fb 100644
---- a/drivers/dahdi/dahdi_dynamic_ethmf.c
-+++ b/drivers/dahdi/dahdi_dynamic_ethmf.c
-@@ -573,7 +573,7 @@ static int ztdethmf_create(struct dahdi_dynamic *dyn, const char *addr)
- 	z->rcvbuf = kmalloc(bufsize, GFP_KERNEL);
- 
- 	/* Address should be <dev>/<macaddr>/subaddr */
--	strlcpy(src, addr, sizeof(src));
-+	strscpy(src, addr, sizeof(src));
- 	/* replace all / with space; otherwise kernel sscanf does not work */
- 	src_ptr = src;
- 	while (*src_ptr) {
-diff --git a/drivers/dahdi/dahdi_transcode.c b/drivers/dahdi/dahdi_transcode.c
-index 6021aac2..7645e2f1 100644
---- a/drivers/dahdi/dahdi_transcode.c
-+++ b/drivers/dahdi/dahdi_transcode.c
-@@ -329,7 +329,7 @@ static long dahdi_tc_getinfo(unsigned long data)
- 		return -ENOSYS;
- 	}
- 
--	strlcpy(info.name, tc->name, sizeof(info.name));
-+	strscpy(info.name, tc->name, sizeof(info.name));
- 	info.numchannels = tc->numchannels;
- 	info.srcfmts = tc->srcfmts;
- 	info.dstfmts = tc->dstfmts;
-diff --git a/drivers/dahdi/xpp/card_global.c b/drivers/dahdi/xpp/card_global.c
-index 9e679bbc..064edbb3 100644
---- a/drivers/dahdi/xpp/card_global.c
-+++ b/drivers/dahdi/xpp/card_global.c
-@@ -342,7 +342,7 @@ int parse_chip_command(xpd_t *xpd, char *cmdline)
- 		XBUS_DBG(GENERAL, xbus, "Dropped packet. Disconnected.\n");
- 		return -EBUSY;
- 	}
--	strlcpy(buf, cmdline, MAX_PROC_WRITE);	/* Save a copy */
-+	strscpy(buf, cmdline, MAX_PROC_WRITE);	/* Save a copy */
- 	if (buf[0] == '#' || buf[0] == ';')
- 		XPD_DBG(REGS, xpd, "Note: '%s'\n", buf);
- 	if ((p = strchr(buf, '#')) != NULL)	/* Truncate comments */
diff --git a/package/dahdi-linux/0002-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch b/package/dahdi-linux/0002-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
new file mode 100644
index 0000000000..ae78722f63
--- /dev/null
+++ b/package/dahdi-linux/0002-kernel.h-Add-wrapper-for-renamed-from_timer-function.patch
@@ -0,0 +1,33 @@
+From 9baf903501a797465b47da3a4731411e1b5a1021 Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Sat, 12 Jul 2025 17:52:40 -0400
+Subject: [PATCH] kernel.h: Add wrapper for renamed from_timer function.
+
+from_timer was renamed to timer_container_of in kernel commit
+41cb08555c4164996d67c78b3bf1c658075b75f1 as part of updates to
+the timer APIs. Add a compatibility wrapper for kernels >= 6.16.0.
+
+Resolves: #95
+
+Upstream: https://github.com/asterisk/dahdi-linux/pull/96
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ include/dahdi/kernel.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/dahdi/kernel.h b/include/dahdi/kernel.h
+index fdd2f885..6201d9c9 100644
+--- a/include/dahdi/kernel.h
++++ b/include/dahdi/kernel.h
+@@ -58,6 +58,10 @@
+ 
+ #include <linux/poll.h>
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0)
++#define from_timer timer_container_of
++#endif
++
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0)
+ #define netif_napi_add netif_napi_add_weight
+ #elif defined(RHEL_RELEASE_VERSION) && defined(RHEL_RELEASE_CODE)
diff --git a/package/dahdi-linux/0003-oct612x-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch b/package/dahdi-linux/0003-oct612x-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
new file mode 100644
index 0000000000..2a40051e92
--- /dev/null
+++ b/package/dahdi-linux/0003-oct612x-Use-ccflags-y-instead-of-EXTRA_CFLAGS.patch
@@ -0,0 +1,222 @@
+From ec88adb782aed38c3445c20d20213c51dae7e092 Mon Sep 17 00:00:00 2001
+From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
+Date: Fri, 21 Feb 2025 21:42:19 -0500
+Subject: [PATCH] Kbuild: Use ccflags-y instead of EXTRA_CFLAGS.
+
+ccflags-y was added to the kernel back in 2007, in commit
+f77bf01425b11947eeb3b5b54. Recent kernel commit
+dbd83ea09699390892e5efecddd74ae43a00f071 has now completely
+removed the deprecated EXTRA_CFLAGS.
+
+Comments in Kbuild and the Makefile for the oct612x library were
+added back when it was created in 2013 in commit f65299e8b2e6ffb0b07089759f8c4ff33a695c09
+to use the newer ccflags-y based on the kernel version,
+but the change was never made to conditionally move away
+from the EXTRA_CFLAGS.
+
+Now that the older way no longer exists, always use ccflags-y.
+
+Resolves: #76
+
+Upstream: https://github.com/asterisk/dahdi-linux/pull/77
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ drivers/dahdi/Kbuild            | 4 ++--
+ drivers/dahdi/oct612x/Kbuild    | 5 +----
+ drivers/dahdi/oct612x/Makefile  | 5 +----
+ drivers/dahdi/opvxa1200/Kbuild  | 6 +++---
+ drivers/dahdi/voicebus/Kbuild   | 4 ++--
+ drivers/dahdi/wcb4xxp/Kbuild    | 2 +-
+ drivers/dahdi/wct4xxp/Kbuild    | 6 +++---
+ drivers/dahdi/wctc4xxp/Kbuild   | 4 ++--
+ drivers/dahdi/wctdm24xxp/Kbuild | 2 +-
+ drivers/dahdi/wcte12xp/Kbuild   | 2 +-
+ drivers/dahdi/xpp/Kbuild        | 4 ++--
+ 11 files changed, 19 insertions(+), 25 deletions(-)
+
+diff --git a/drivers/dahdi/Kbuild b/drivers/dahdi/Kbuild
+index d9d26da8a..07161b7bb 100644
+--- a/drivers/dahdi/Kbuild
++++ b/drivers/dahdi/Kbuild
+@@ -83,13 +83,13 @@ CFLAGS_MODULE += -I$(DAHDI_INCLUDE) -I$(src) -Wno-format-truncation
+ BAD_KERNELS_VERS := 22 34 34.0.1 34.0.2
+ BAD_KERNELS := $(foreach ver,$(BAD_KERNELS_VERS),2.6.9-$(ver).EL 2.6.9-$(ver).ELsmp)
+ ifneq (,$(filter $(KVERS),$(BAD_KERNELS)))
+-EXTRA_CFLAGS+=-Drw_lock_t=rwlock_t
++ccflags-y+=-Drw_lock_t=rwlock_t
+ endif
+ 
+ # A number of Fedora 10 (9 also?) kernels backported hrtimer to 2.6.27
+ # as part of an ALSA backport. TODO: Any better way to detect that?
+ ifeq (1,$(shell fgrep -q ' hrtimer_set_expires' include/linux/hrtimer.h 2>/dev/null && echo 1))
+-EXTRA_CFLAGS+=-DHAVE_HRTIMER_ACCESSORS=1
++ccflags-y+=-DHAVE_HRTIMER_ACCESSORS=1
+ endif
+ 
+ ifeq (1,$(shell fgrep -q 'wait_for_completion_timeout' include/linux/completion.h 2>/dev/null && echo 1))
+diff --git a/drivers/dahdi/oct612x/Kbuild b/drivers/dahdi/oct612x/Kbuild
+index ac53fe7d0..5015f7eb9 100644
+--- a/drivers/dahdi/oct612x/Kbuild
++++ b/drivers/dahdi/oct612x/Kbuild
+@@ -24,9 +24,6 @@ octapi_files = octdeviceapi/oct6100api/oct6100_api/oct6100_adpcm_chan.o \
+ 		apilib/llman/octapi_llman.o \
+ 		oct612x-user.o
+ 
+-# TODO: ccflags was added in 2.6.24 in commit f77bf01425b11947eeb3b5b54. This
+-# should be changed to a conditional compilation based on the Kernel Version.
+-# ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+-EXTRA_CFLAGS = -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
++ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_OCT612X) := oct612x.o
+ oct612x-objs := $(octapi_files)
+diff --git a/drivers/dahdi/oct612x/Makefile b/drivers/dahdi/oct612x/Makefile
+index 5d291435a..d01997b8b 100644
+--- a/drivers/dahdi/oct612x/Makefile
++++ b/drivers/dahdi/oct612x/Makefile
+@@ -23,8 +23,5 @@ octapi_files = octdeviceapi/oct6100api/oct6100_api/oct6100_adpcm_chan.o \
+ 		apilib/largmath/octapi_largmath.o \
+ 		apilib/llman/octapi_llman.o
+ 
+-# TODO: ccflags was added in 2.6.24 in commit f77bf01425b11947eeb3b5b54. This
+-# should be changed to a conditional compilation based on the Kernel Version.
+-# ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+-EXTRA_CFLAGS = -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
++ccflags-y := -I$(src)/.. -Wno-undef -I$(src)/include -I$(src)/octdeviceapi -I$(src)/octdeviceapi/oct6100api
+ lib-y := $(octapi_files)
+diff --git a/drivers/dahdi/opvxa1200/Kbuild b/drivers/dahdi/opvxa1200/Kbuild
+index 8f90819df..7afe5ca98 100644
+--- a/drivers/dahdi/opvxa1200/Kbuild
++++ b/drivers/dahdi/opvxa1200/Kbuild
+@@ -1,6 +1,6 @@
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_OPVXA1200) += opvxa1200.o
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ opvxa1200-objs := base.o
+ 
+@@ -10,10 +10,10 @@ ifneq ($(DAHDI_KERNEL_H_PATH),)
+         DAHDI_SPAN_MODULE:=$(shell if grep -C 5 "struct dahdi_span {" $(DAHDI_KERNEL_H_PATH) | grep -q "struct module \*owner"; then echo "yes"; else echo "no"; fi)
+         DAHDI_SPAN_OPS:=$(shell if grep -q "struct dahdi_span_ops {" $(DAHDI_KERNEL_H_PATH); then echo "yes"; else echo "no"; fi)
+         ifeq ($(DAHDI_SPAN_MODULE),yes)
+-                EXTRA_CFLAGS+=-DDAHDI_SPAN_MODULE
++                ccflags-y+=-DDAHDI_SPAN_MODULE
+         else
+                 ifeq ($(DAHDI_SPAN_OPS),yes)
+-                        EXTRA_CFLAGS+=-DDAHDI_SPAN_OPS
++                        ccflags-y+=-DDAHDI_SPAN_OPS
+                 endif
+         endif
+ endif
+diff --git a/drivers/dahdi/voicebus/Kbuild b/drivers/dahdi/voicebus/Kbuild
+index 3bf96409d..45026d914 100644
+--- a/drivers/dahdi/voicebus/Kbuild
++++ b/drivers/dahdi/voicebus/Kbuild
+@@ -8,10 +8,10 @@ ifneq ($(HOTPLUG_FIRMWARE),yes)
+ dahdi_voicebus-objs += $(FIRM_DIR)/dahdi-fw-vpmoct032.o
+ $(warning WARNING: You are compiling firmware into voicebus.ko which is not available under the terms of the GPL. It may be a violation of the GPL to distribute the resulting image since it combines both GPL and non-GPL work. You should consult a lawyer of your own before distributing such an image.)
+ else
+-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
++  ccflags-y+=-DHOTPLUG_FIRMWARE
+ endif
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ $(obj)/$(FIRM_DIR)/dahdi-fw-vpmoct032.o: $(obj)/voicebus.o
+ 	$(MAKE) -C $(obj)/$(FIRM_DIR) dahdi-fw-vpmoct032.o
+diff --git a/drivers/dahdi/wcb4xxp/Kbuild b/drivers/dahdi/wcb4xxp/Kbuild
+index 80606bf3d..59ffc8d74 100644
+--- a/drivers/dahdi/wcb4xxp/Kbuild
++++ b/drivers/dahdi/wcb4xxp/Kbuild
+@@ -1,6 +1,6 @@
+ obj-m += wcb4xxp.o
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ wcb4xxp-objs := base.o
+ 
+diff --git a/drivers/dahdi/wct4xxp/Kbuild b/drivers/dahdi/wct4xxp/Kbuild
+index cf01ccf88..eeeb2f651 100644
+--- a/drivers/dahdi/wct4xxp/Kbuild
++++ b/drivers/dahdi/wct4xxp/Kbuild
+@@ -2,16 +2,16 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCT4XXP) += wct4xxp.o
+ 
+ FIRM_DIR	:= ../firmware
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -I$(src)/../oct612x/ $(shell $(src)/../oct612x/octasic-helper cflags $(src)/../oct612x) -Wno-undef
++ccflags-y += -I$(src)/.. -I$(src)/../oct612x/ $(shell $(src)/../oct612x/octasic-helper cflags $(src)/../oct612x) -Wno-undef
+ 
+ # The OCT612X source files are from a vendor drop and we do not want to edit
+ # them to make this warning go away. Therefore, turn off the
+ # unused-but-set-variable warning for this driver.
+ 
+-EXTRA_CFLAGS += $(call cc-option, -Wno-unused-but-set-variable)
++ccflags-y += $(call cc-option, -Wno-unused-but-set-variable)
+ 
+ ifeq ($(HOTPLUG_FIRMWARE),yes)
+-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
++  ccflags-y+=-DHOTPLUG_FIRMWARE
+ endif
+ 
+ wct4xxp-objs := base.o vpm450m.o
+diff --git a/drivers/dahdi/wctc4xxp/Kbuild b/drivers/dahdi/wctc4xxp/Kbuild
+index 9f9749844..2f1bfbf23 100644
+--- a/drivers/dahdi/wctc4xxp/Kbuild
++++ b/drivers/dahdi/wctc4xxp/Kbuild
+@@ -2,10 +2,10 @@ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTC4XXP) += wctc4xxp.o
+ 
+ FIRM_DIR	:= ../firmware
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ ifeq ($(HOTPLUG_FIRMWARE),yes)
+-  EXTRA_CFLAGS+=-DHOTPLUG_FIRMWARE
++  ccflags-y+=-DHOTPLUG_FIRMWARE
+ endif
+ 
+ wctc4xxp-objs := base.o
+diff --git a/drivers/dahdi/wctdm24xxp/Kbuild b/drivers/dahdi/wctdm24xxp/Kbuild
+index 22cc71a62..c9d96b729 100644
+--- a/drivers/dahdi/wctdm24xxp/Kbuild
++++ b/drivers/dahdi/wctdm24xxp/Kbuild
+@@ -1,5 +1,5 @@
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTDM24XXP) += wctdm24xxp.o
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ wctdm24xxp-objs := base.o xhfc.o
+diff --git a/drivers/dahdi/wcte12xp/Kbuild b/drivers/dahdi/wcte12xp/Kbuild
+index 77efd7df6..ace7c4dbf 100644
+--- a/drivers/dahdi/wcte12xp/Kbuild
++++ b/drivers/dahdi/wcte12xp/Kbuild
+@@ -1,5 +1,5 @@
+ obj-$(DAHDI_BUILD_ALL)$(CONFIG_DAHDI_WCTE12XP) += wcte12xp.o
+ 
+-EXTRA_CFLAGS += -I$(src)/.. -Wno-undef
++ccflags-y += -I$(src)/.. -Wno-undef
+ 
+ wcte12xp-objs := base.o
+diff --git a/drivers/dahdi/xpp/Kbuild b/drivers/dahdi/xpp/Kbuild
+index e46a9d729..02d314904 100644
+--- a/drivers/dahdi/xpp/Kbuild
++++ b/drivers/dahdi/xpp/Kbuild
+@@ -1,4 +1,4 @@
+-EXTRA_CFLAGS	=	$(XPP_LOCAL_CFLAGS)	\
++ccflags-y	=	$(XPP_LOCAL_CFLAGS)	\
+ 			-DDEBUG			\
+ 			-DPOLL_DIGITAL_INPUTS	\
+ 			-DDEBUG_PCMTX		\
+@@ -32,7 +32,7 @@ xpd_echo-objs		+= card_echo.o
+ xpp_mmap-objs		+= mmapbus.o mmapdrv.o
+ 
+ ifeq	(y,$(PARPORT_DEBUG))
+-EXTRA_CFLAGS	+= -DDEBUG_SYNC_PARPORT
++ccflags-y	+= -DDEBUG_SYNC_PARPORT
+ obj-m		+= parport_debug.o
+ endif
+ 
diff --git a/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch b/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
deleted file mode 100644
index becb82a6d2..0000000000
--- a/package/dahdi-linux/0003-xpp-sysfs-Use-const-struct-device_device-if-needed.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From ce9de5d1bf9d21c088b01ce9da6f7ff02b0d863d Mon Sep 17 00:00:00 2001
-From: InterLinked1 <24227567+InterLinked1@users.noreply.github.com>
-Date: Mon, 23 Sep 2024 08:04:54 -0400
-Subject: [PATCH] xpp, sysfs: Use const struct device_device if needed.
-
-Kernel commit d69d804845985c29ab5be5a4b3b1f4787893daf8
-changed struct device_driver to be const, so make the
-arguments const on kernels 6.11 and newer.
-
-Resolves: #63
-
-Upstream: https://github.com/asterisk/dahdi-linux/pull/64
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- drivers/dahdi/dahdi-sysfs-chan.c | 4 ++++
- drivers/dahdi/dahdi-sysfs.c      | 4 ++++
- drivers/dahdi/xpp/xbus-sysfs.c   | 8 ++++++++
- 3 files changed, 16 insertions(+)
-
-diff --git a/drivers/dahdi/dahdi-sysfs-chan.c b/drivers/dahdi/dahdi-sysfs-chan.c
-index 09d7317..35b7bd4 100644
---- a/drivers/dahdi/dahdi-sysfs-chan.c
-+++ b/drivers/dahdi/dahdi-sysfs-chan.c
-@@ -220,7 +220,11 @@ static void chan_release(struct device *dev)
- 	chan_dbg(DEVICES, chan, "SYSFS\n");
- }
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
-+static int chan_match(struct device *dev, const struct device_driver *driver)
-+#else
- static int chan_match(struct device *dev, struct device_driver *driver)
-+#endif /* LINUX_VERSION_CODE */
- {
- 	struct dahdi_chan *chan;
- 
-diff --git a/drivers/dahdi/dahdi-sysfs.c b/drivers/dahdi/dahdi-sysfs.c
-index 7477ebc..246514c 100644
---- a/drivers/dahdi/dahdi-sysfs.c
-+++ b/drivers/dahdi/dahdi-sysfs.c
-@@ -42,7 +42,11 @@ module_param(tools_rootdir, charp, 0444);
- MODULE_PARM_DESC(tools_rootdir,
- 		"root directory of all tools paths (default /)");
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
-+static int span_match(struct device *dev, const struct device_driver *driver)
-+#else
- static int span_match(struct device *dev, struct device_driver *driver)
-+#endif /* LINUX_VERSION_CODE */
- {
- 	return 1;
- }
-diff --git a/drivers/dahdi/xpp/xbus-sysfs.c b/drivers/dahdi/xpp/xbus-sysfs.c
-index 177048b..f78a15e 100644
---- a/drivers/dahdi/xpp/xbus-sysfs.c
-+++ b/drivers/dahdi/xpp/xbus-sysfs.c
-@@ -397,7 +397,11 @@ static struct attribute *xbus_dev_attrs[] = {
- ATTRIBUTE_GROUPS(xbus_dev);
- #endif
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
-+static int astribank_match(struct device *dev, const struct device_driver *driver)
-+#else
- static int astribank_match(struct device *dev, struct device_driver *driver)
-+#endif /* LINUX_VERSION_CODE */
- {
- 	DBG(DEVICES, "SYSFS MATCH: dev->bus_id = %s, driver->name = %s\n",
- 	    dev_name(dev), driver->name);
-@@ -771,7 +775,11 @@ static DEVICE_ATTR_READER(refcount_xpd_show, dev, buf)
- 	return len;
- }
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 11, 0)
-+static int xpd_match(struct device *dev, const struct device_driver *driver)
-+#else
- static int xpd_match(struct device *dev, struct device_driver *driver)
-+#endif /* LINUX_VERSION_CODE */
- {
- 	struct xpd_driver *xpd_driver;
- 	xpd_t *xpd;
--- 
-2.39.5
-
diff --git a/package/dahdi-linux/dahdi-linux.hash b/package/dahdi-linux/dahdi-linux.hash
index e250850630..a571a64e54 100644
--- a/package/dahdi-linux/dahdi-linux.hash
+++ b/package/dahdi-linux/dahdi-linux.hash
@@ -1,7 +1,7 @@
-# From http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases/dahdi-linux-3.3.0.sha256
-sha256  f9528a82b5e88c1d92d737efd65bd571bef2cd1b1b44d43b857a76e38e01a7c0  dahdi-linux-3.3.0.tar.gz
+# Locally compputed
+sha256  8490a19369fc606feb723b44c8acca4a58f4f244b89234ba97ea988ffd217e17  dahdi-linux-648016d6b3a06f7ec75c17ef94ffa17be59eebcf.tar.gz
 
-# Firmware files have no upstream hash, so sha56 locally computed
+# Firmware files have no upstream hash, so sha256 locally computed
 sha256  3ff26cf80555fd7470b43a87c51d03c1db2a75abcd4561d79f69b6c48298e4a1  dahdi-fwload-vpmadt032-1.25.0.tar.gz
 sha256  d5b6ab6851e431afcfec2ecc39d95fa88fe3939ffdb2e3d4f28a43cabf30e95b  dahdi-fw-a4a-a0017.tar.gz
 sha256  e039af8bec36407b74e1dd9ebdd49ba077469eda79d4e6093721ed2836d4536f  dahdi-fw-a4b-d001e.tar.gz
diff --git a/package/dahdi-linux/dahdi-linux.mk b/package/dahdi-linux/dahdi-linux.mk
index c688d3877c..66651af392 100644
--- a/package/dahdi-linux/dahdi-linux.mk
+++ b/package/dahdi-linux/dahdi-linux.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-DAHDI_LINUX_VERSION = 3.3.0
-DAHDI_LINUX_SITE = \
-	http://downloads.asterisk.org/pub/telephony/dahdi-linux/releases
+DAHDI_LINUX_VERSION = 648016d6b3a06f7ec75c17ef94ffa17be59eebcf
+DAHDI_LINUX_SITE = $(call github,asterisk,dahdi-linux,$(DAHDI_LINUX_VERSION))
 
 # We need to download all those firmware blobs ourselves, otherwise
 # dahdi-linux will try to download them at install time.
@@ -62,7 +61,9 @@ endef
 DAHDI_LINUX_POST_EXTRACT_HOOKS += DAHDI_LINUX_EXTRACT_FW
 
 define DAHDI_LINUX_LINUX_CONFIG_FIXUPS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_CCITT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PPP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PPP_ASYNC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TTY)
 endef
 
 # Need to pass the same options as for building the modules, because
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
