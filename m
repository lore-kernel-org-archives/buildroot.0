Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D746E8B367
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E238D60901;
	Tue,  3 Feb 2026 21:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3C7iRNBnyZ0u; Tue,  3 Feb 2026 21:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E8160905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154970;
	bh=wikvZJckaEYoaOKd+Om+AZlbP3/vxGmOpHbzk4AodOU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IIAUUi91MDDUOL1yoqpTR2Ng8/sJxVwl8/uwePOWCvu7B6OvAFmoaNDxEj6prWiSm
	 qf+FX7AF9AUPr2odV0cyC5gTzt8HTTM4D/XONezbNYZYInhJrzkW2m1PdvrUZA3Hx8
	 L5kwe35e7LZyEB4DQwbn3WfsYXDHj9zowGg95J4HoSKsnaXvPQUgW7CxmHSsdOkHaH
	 CL/jGAAD4RKkLhYdRq4T2sckazHfsSoqHy6+9fjdc6HpSLYppikR3/aIdPlZYDcq9R
	 CS5IHqSSWx52+0xpA06WeMWo04Sk8LDjryD6UDqUEdtpp/xHTWwk6vifBee0b/zs9m
	 q4ek5aDgOPf5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E8160905;
	Tue,  3 Feb 2026 21:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB6A9F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DEC240C1C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uutXWyPh8ZW8 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A093640C1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A093640C1B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:42:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 868098674F; Tue,  3 Feb 2026 21:42:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:40:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83815826469ac94b76b5aee8c61af95989f91f46
X-Git-Newrev: 130b5a124cd992f9bedd190b3d3b0c6e1033454a
X-Patchwork-Hint: ignore
Message-Id: <20260203214247.868098674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spandsp: fix build with gcc >= 14.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=130b5a124cd992f9bedd190b3d3b0c6e1033454a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch to fix build error.
The build error does not occur with gcc-13.x.

The first build error of this kind was recorded 2024-08-23:
https://autobuild.buildroot.net/results/492/4927e93e40ec8bcda107f4bc3d8aa83024deb674/

Fixes:
https://autobuild.buildroot.net/results/48a/48af80bdda62ca70d73bc01e0939f548c3736c0d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
