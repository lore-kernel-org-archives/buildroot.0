Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B6AEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2701661597;
	Fri, 13 Feb 2026 19:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2j_yQJhwDB9; Fri, 13 Feb 2026 19:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 560D261469
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011385;
	bh=rJ7L3KQ/1g5NNtsVWO4MKo6LyIRrd6YnX3m2p2crxLA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HbdbpEl0dkBhlskL0QsKtu7Zk834HtGQtBS/XhRUQxVdo+ak6tNpfASJx2TFcupVN
	 5fknnLlf5mTJ9YJac3Jsx5Gccop5gUhBVhzeu4umIsqhiodnAvS79/5fkZJChF2GBN
	 Z2FfiO5d3sacMmuY6yh6dEXj3zcy4trGl6ath/i7yS7fr6IKyUjmsDbv3PGiLMHTEg
	 HVkD85wAZbxI97taxsYmNNz9D/wObNGeSUYa0YvfENrPmUxDuRuS99YYSv0BvV7F9a
	 qHg+ST9tOTxHwOrCZd3E4w2QyLucVBkeMdqeHdx999EhqwAkm4zu84mr44WmeCMlJ9
	 aZJY3Esen4ckA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 560D261469;
	Fri, 13 Feb 2026 19:36:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 142C6283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B8A8455E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2Nhb5U6Sf6q for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B724484520
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B724484520
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC9D283A88; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:05:35 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: afb87a21422d6c9846c10dfb333c6d343ed247da
X-Git-Newrev: e7cde76895d22e2fbf99425d9b8b237a20344bdb
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.AC9D283A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/spandsp: fix
 build with gcc >= 14.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7cde76895d22e2fbf99425d9b8b237a20344bdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Added upstream patch to fix build error.
The build error does not occur with gcc-13.x.

The first build error of this kind was recorded 2024-08-23:
https://autobuild.buildroot.net/results/492/4927e93e40ec8bcda107f4bc3d8aa83024deb674/

Fixes:
https://autobuild.buildroot.net/results/48a/48af80bdda62ca70d73bc01e0939f548c3736c0d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 130b5a124cd992f9bedd190b3d3b0c6e1033454a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...Changes-to-address-V.17-fixed-point-issue.patch | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch b/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
new file mode 100644
index 0000000000..39aaa5a5d4
--- /dev/null
+++ b/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
@@ -0,0 +1,116 @@
+From 239bf2f6a80bbfb6ef92418ceb5402d1fb256a2b Mon Sep 17 00:00:00 2001
+From: Steve Underwood <steveu@coppice.org>
+Date: Fri, 18 Aug 2023 01:24:21 +0100
+Subject: [PATCH] Changes to address V.17 fixed point issue.
+
+Upstream: https://github.com/freeswitch/spandsp/commit/239bf2f6a80bbfb6ef92418ceb5402d1fb256a2b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/spandsp/private/v17rx.h |  2 +-
+ src/v17rx.c                 | 30 +++++++++++++++++++-----------
+ 2 files changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/src/spandsp/private/v17rx.h b/src/spandsp/private/v17rx.h
+index 8ea7a9fe..8613b5a5 100644
+--- a/src/spandsp/private/v17rx.h
++++ b/src/spandsp/private/v17rx.h
+@@ -97,7 +97,7 @@ struct v17_rx_state_s
+ 
+     /*! \brief A measure of how much mismatch there is between the real constellation,
+         and the decoded symbol positions. */
+-    int32_t training_error;
++    int64_t training_error;
+ 
+     /*! \brief The proportional part of the carrier tracking filter. */
+     int32_t carrier_track_p;
+diff --git a/src/v17rx.c b/src/v17rx.c
+index a823dad2..295d26a9 100644
+--- a/src/v17rx.c
++++ b/src/v17rx.c
+@@ -64,6 +64,10 @@
+ #include "spandsp/dds.h"
+ #include "spandsp/complex_filters.h"
+ 
++#if defined(SPANDSP_USE_FIXED_POINT)
++#define SPANDSP_USE_FIXED_POINTx
++#endif
++
+ #include "spandsp/v29rx.h"
+ #include "spandsp/v17tx.h"
+ #include "spandsp/v17rx.h"
+@@ -389,7 +393,7 @@ static __inline__ void put_bit(v17_rx_state_t *s, int bit)
+ /*- End of function --------------------------------------------------------*/
+ 
+ #if defined(SPANDSP_USE_FIXED_POINTx)
+-static __inline__ uint32_t dist_sq(const complexi16_t *x, const complexi16_t *y)
++static __inline__ uint32_t dist_sq(const complexi32_t *x, const complexi32_t *y)
+ {
+     return (int32_t) (x->re - y->re)*(x->re - y->re) + (int32_t) (x->im - y->im)*(x->im - y->im);
+ }
+@@ -954,11 +958,12 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
+         else if (s->training_count >= V17_TRAINING_SEG_2_LEN)
+         {
+ #if defined(SPANDSP_USE_FIXED_POINTx)
+-            span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %d\n", s->training_error);
++            span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %ld\n", s->training_error);
++            if (s->training_error < (int64_t) FP_SCALE(20.0f)*FP_SCALE(1.414f)*constellation_spacing[s->space_map])
+ #else
+             span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %f\n", s->training_error);
+-#endif
+             if (s->training_error < FP_SCALE(20.0f)*FP_SCALE(1.414f)*constellation_spacing[s->space_map])
++#endif
+             {
+                 s->training_error = FP_SCALE(0.0f);
+                 s->training_count = 0;
+@@ -1055,19 +1060,20 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
+         /*endif*/
+         if (++s->training_count >= V17_TRAINING_SHORT_SEG_2_LEN)
+         {
++            /* TODO: This was increased by a factor of 10 after studying real world failures.
++                     However, it is not clear why this is an improvement, If something gives
++                     a huge training error, surely it shouldn't decode too well? */
+ #if defined(SPANDSP_USE_FIXED_POINTx)
+             span_log(&s->logging, SPAN_LOG_FLOW, "Short training error %d\n", s->training_error);
+             s->carrier_track_i = 100;
+             s->carrier_track_p = 500000;
++            if (s->training_error < (int64_t) (V17_TRAINING_SHORT_SEG_2_LEN - 8)*FP_SCALE(4.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
+ #else
+             span_log(&s->logging, SPAN_LOG_FLOW, "Short training error %f\n", s->training_error);
+             s->carrier_track_i = 100.0f;
+             s->carrier_track_p = 500000.0f;
+-#endif
+-            /* TODO: This was increased by a factor of 10 after studying real world failures.
+-                     However, it is not clear why this is an improvement, If something gives
+-                     a huge training error, surely it shouldn't decode too well? */
+             if (s->training_error < (V17_TRAINING_SHORT_SEG_2_LEN - 8)*FP_SCALE(4.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
++#endif
+             {
+                 s->training_count = 0;
+                 if (s->bits_per_symbol == 2)
+@@ -1136,11 +1142,13 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
+ #endif
+         if (++s->training_count >= V17_TRAINING_SEG_4_LEN)
+         {
+-            if (s->training_error < V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
+-            {
+ #if defined(SPANDSP_USE_FIXED_POINTx)
+-                span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %d)\n", s->bit_rate, s->training_error);
++            if (s->training_error < (int64_t) V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
++            {
++                span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %ld)\n", s->bit_rate, s->training_error);
+ #else
++            if (s->training_error < V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
++            {
+                 span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %f)\n", s->bit_rate, s->training_error);
+ #endif
+                 /* We are up and running */
+@@ -1157,7 +1165,7 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
+             {
+                 /* Training has failed. Park this modem. */
+ #if defined(SPANDSP_USE_FIXED_POINTx)
+-                span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %d)\n", s->training_error);
++                span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %ld)\n", s->training_error);
+ #else
+                 span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %f)\n", s->training_error);
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
