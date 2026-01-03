Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED2CFC6167
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 09:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DB5740690;
	Sat,  3 Jan 2026 09:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuSdqCVaa0gm; Sat,  3 Jan 2026 09:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EBE0406A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767433526;
	bh=35MPglByKy6wA7C1fqgjWIlm2xQx6L4LKL3ueGP7v70=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lLBzX9Aq0mXo9w/0RmPjkkiqiYr0QGihNOr8Wiyc0vopSq5qGjtmIjKFctPMty8AZ
	 y7D5spbkbIn6crTDt0XLjgp6Mxt2mJveLpGsvnJrBHPMFxq9CjhGQzOTFLJQVrXr8g
	 R4kMHyVdumzXLYTnnJC2POXMEDbpAckEkc3DdCJ9gQ9hIEk9Kbb/j6hJfsyDH9Ld4/
	 IAtDgJZ7dkmtg5cfhsdxnBgB8pGFfXnukfDUot/bmqNHeltdWsj0pcDsE6jWJ1SzJS
	 yJioUnsZL38MRc2qdTIIcG5S69i+nOSTW6SMlLHbswE13hqbWZqY8lFk9JI/YWCswQ
	 r+MPs/dtEFWZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EBE0406A9;
	Sat,  3 Jan 2026 09:45:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4437F440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34BF04004E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jj5F0Rbd7K25 for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 09:45:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 548C040235
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548C040235
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 548C040235
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4BADA4C130A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 10:45:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbyC4-0000000077H-39u4
 for buildroot@buildroot.org; Sat, 03 Jan 2026 09:45:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 10:45:06 +0100
Message-ID: <20260103094508.1212757-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767433518;
 bh=eiI+p7x+sdKCnG4Ih5xZZlT05eNLFS0BK+eq6JuiES8=;
 h=From:To:Subject:Date:From;
 b=SSM37Ug2cOzi3zitzjzZr+S1O6WzFYZ8P2NeF97bvsVkG+JOUfZ3HBxVeacoB2gZJ
 mjAFxbWKrAUPPHEzmlH31sWDZdSUzSnUkd7m4BZJk/Ic31HG4zB1KRTTB9zMibdAp5
 kRk30Wi/brRVZbSKMkn/r+jQjDNvoLO5NaO6Dqrbbe3yzRD0cP3uZ9EZ6DPPTyDGBc
 TBDz5W3+s9gQVCaNswtp5Y7+Rekce20EL28Ag7/KxeVWvfjnPZBnhADuZ8CKxmZMpL
 8S2llkKn+6d0X960RR+30y4gkOeC2p3clWEnAzsC5QUw4H8EYopZdM1lUfM7fwzCqh
 jevewPnoX5Nag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SSM37Ug2
Subject: [Buildroot] [PATCH 1/3] package/spandsp: fix build with gcc-14.x
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

Added upstream patch to fix build error.
The build error does not occur with gcc-13.x.

The first build error of this kind was recorded 2024-08-23:
https://autobuild.buildroot.net/results/492/4927e93e40ec8bcda107f4bc3d8aa83024deb674/

Fixes:
https://autobuild.buildroot.net/results/48a/48af80bdda62ca70d73bc01e0939f548c3736c0d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...es-to-address-V.17-fixed-point-issue.patch | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
