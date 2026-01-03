Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AB4FC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 09:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3C4605F5;
	Sat,  3 Jan 2026 09:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tTt-2YZX6fI; Sat,  3 Jan 2026 09:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99F0E6067C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767433549;
	bh=V3t9ZBs+EgH5PUgSBghyAeSo54TE/0lqQYrwhhlmoGo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OArIvZUqF35o7l1Usbe6PYF8SGwANBDKDaWfEwKV+hhB5tTX/lJIe/NVMgjy9pgGj
	 51WMHk6zVWAhuPNPiBXFd7Us+jMK3uRH/WCWm/LLe+vjhqqEtOkN00WTtmrWEPV4fR
	 1ne/UKR6uhhWbRMCFbBAVoMiA9KidADSXN5TcL4NwGdz1ok4KRiKOw67RkpMPkXAUL
	 BpumvAjQdt8gfz63IVI/P8+1sTAF1jc+a/pzdKgbMq/ucPCvjqzesoPg4CrNumOTj+
	 XcwHWAb/KT+sXo/lUsRTA4Np3TUKKFMMzAxOUVUHiXI5kWNvKSaN1+VG2Ecd09LhQG
	 3IAzLdg/QF8wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99F0E6067C;
	Sat,  3 Jan 2026 09:45:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A879440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31BEC401B8
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N2ZGKcNwq9p for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 09:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27A90401B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A90401B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27A90401B4
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 200ACA4C130A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 10:45:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbyCO-0000000077H-0QkM
 for buildroot@buildroot.org; Sat, 03 Jan 2026 09:45:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 10:45:08 +0100
Message-ID: <20260103094508.1212757-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103094508.1212757-1-bernd@kuhls.net>
References: <20260103094508.1212757-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767433538;
 bh=NqUz+zvbL7XF/aIpfoftg7kU56A/LAd7AxOUVpFGrJ4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=h2AzIm1OpY5CmW8hmaiv0XG+8CBiQaX2V4IKgiT4CmZPxTV68t1BS98W3ZpZJ1wLU
 jF88y0gZ9xn0tzoHnl8ak9crddbhtzy8+jDvUah0KNwNgB1UlOMCxqi/a80EQB2sK4
 4GI3C+jlkiqdNRgjIR/4KxVQivECgod/Qi7kW/mSNYn/GYAz5ljzNBQNGpSVof9Ozs
 GY3EmiNE5A77fOwPmI2bvNfLd8Geq1W9kAzQdcugB6rO4YkeMuzh8gEgeq0jGSlU+t
 y3DfNnNxFIoc410lNRyOi3KEd13AFNYuL5LyeQtUkHa1qfdzYbUY72X3/OBk0NOT1Q
 ckUDALOlnLcCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=h2AzIm1O
Subject: [Buildroot] [PATCH 3/3] package/spandsp: bump version
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

Removed patch which is included in this release.

Switched to github helper to download the current git tree instead of
using outdated tarball snapshots.

The currently used tarball contains the git tree as of 2020-08-14:
https://github.com/freeswitch/spandsp/commit/6ec23e5a7e411a22d59e5678d12c4d2942c4a4b6

The newest tarball provided by upstream
https://files.freeswitch.org/downloads/libs/spandsp-3.0.0-0d2e6ac65e.tar.gz
contains the git tree as of 2023-06-16:
https://github.com/freeswitch/spandsp/tree/0d2e6ac65e0e8f53d652665a743015a88bf048d4

and lacks the fix for gcc-14.x added to buildroot in patch 0002.

Build-tested using this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_INIT_NONE=y
BR2_PACKAGE_BLUEZ_ALSA=y
BR2_PACKAGE_FREESWITCH=y
BR2_PACKAGE_WIRESHARK=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...es-to-address-V.17-fixed-point-issue.patch | 116 ------------------
 package/spandsp/spandsp.hash                  |   2 +-
 package/spandsp/spandsp.mk                    |   4 +-
 3 files changed, 3 insertions(+), 119 deletions(-)
 delete mode 100644 package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch

diff --git a/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch b/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
deleted file mode 100644
index 39aaa5a5d4..0000000000
--- a/package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 239bf2f6a80bbfb6ef92418ceb5402d1fb256a2b Mon Sep 17 00:00:00 2001
-From: Steve Underwood <steveu@coppice.org>
-Date: Fri, 18 Aug 2023 01:24:21 +0100
-Subject: [PATCH] Changes to address V.17 fixed point issue.
-
-Upstream: https://github.com/freeswitch/spandsp/commit/239bf2f6a80bbfb6ef92418ceb5402d1fb256a2b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/spandsp/private/v17rx.h |  2 +-
- src/v17rx.c                 | 30 +++++++++++++++++++-----------
- 2 files changed, 20 insertions(+), 12 deletions(-)
-
-diff --git a/src/spandsp/private/v17rx.h b/src/spandsp/private/v17rx.h
-index 8ea7a9fe..8613b5a5 100644
---- a/src/spandsp/private/v17rx.h
-+++ b/src/spandsp/private/v17rx.h
-@@ -97,7 +97,7 @@ struct v17_rx_state_s
- 
-     /*! \brief A measure of how much mismatch there is between the real constellation,
-         and the decoded symbol positions. */
--    int32_t training_error;
-+    int64_t training_error;
- 
-     /*! \brief The proportional part of the carrier tracking filter. */
-     int32_t carrier_track_p;
-diff --git a/src/v17rx.c b/src/v17rx.c
-index a823dad2..295d26a9 100644
---- a/src/v17rx.c
-+++ b/src/v17rx.c
-@@ -64,6 +64,10 @@
- #include "spandsp/dds.h"
- #include "spandsp/complex_filters.h"
- 
-+#if defined(SPANDSP_USE_FIXED_POINT)
-+#define SPANDSP_USE_FIXED_POINTx
-+#endif
-+
- #include "spandsp/v29rx.h"
- #include "spandsp/v17tx.h"
- #include "spandsp/v17rx.h"
-@@ -389,7 +393,7 @@ static __inline__ void put_bit(v17_rx_state_t *s, int bit)
- /*- End of function --------------------------------------------------------*/
- 
- #if defined(SPANDSP_USE_FIXED_POINTx)
--static __inline__ uint32_t dist_sq(const complexi16_t *x, const complexi16_t *y)
-+static __inline__ uint32_t dist_sq(const complexi32_t *x, const complexi32_t *y)
- {
-     return (int32_t) (x->re - y->re)*(x->re - y->re) + (int32_t) (x->im - y->im)*(x->im - y->im);
- }
-@@ -954,11 +958,12 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
-         else if (s->training_count >= V17_TRAINING_SEG_2_LEN)
-         {
- #if defined(SPANDSP_USE_FIXED_POINTx)
--            span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %d\n", s->training_error);
-+            span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %ld\n", s->training_error);
-+            if (s->training_error < (int64_t) FP_SCALE(20.0f)*FP_SCALE(1.414f)*constellation_spacing[s->space_map])
- #else
-             span_log(&s->logging, SPAN_LOG_FLOW, "Long training error %f\n", s->training_error);
--#endif
-             if (s->training_error < FP_SCALE(20.0f)*FP_SCALE(1.414f)*constellation_spacing[s->space_map])
-+#endif
-             {
-                 s->training_error = FP_SCALE(0.0f);
-                 s->training_count = 0;
-@@ -1055,19 +1060,20 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
-         /*endif*/
-         if (++s->training_count >= V17_TRAINING_SHORT_SEG_2_LEN)
-         {
-+            /* TODO: This was increased by a factor of 10 after studying real world failures.
-+                     However, it is not clear why this is an improvement, If something gives
-+                     a huge training error, surely it shouldn't decode too well? */
- #if defined(SPANDSP_USE_FIXED_POINTx)
-             span_log(&s->logging, SPAN_LOG_FLOW, "Short training error %d\n", s->training_error);
-             s->carrier_track_i = 100;
-             s->carrier_track_p = 500000;
-+            if (s->training_error < (int64_t) (V17_TRAINING_SHORT_SEG_2_LEN - 8)*FP_SCALE(4.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
- #else
-             span_log(&s->logging, SPAN_LOG_FLOW, "Short training error %f\n", s->training_error);
-             s->carrier_track_i = 100.0f;
-             s->carrier_track_p = 500000.0f;
--#endif
--            /* TODO: This was increased by a factor of 10 after studying real world failures.
--                     However, it is not clear why this is an improvement, If something gives
--                     a huge training error, surely it shouldn't decode too well? */
-             if (s->training_error < (V17_TRAINING_SHORT_SEG_2_LEN - 8)*FP_SCALE(4.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
-+#endif
-             {
-                 s->training_count = 0;
-                 if (s->bits_per_symbol == 2)
-@@ -1136,11 +1142,13 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
- #endif
-         if (++s->training_count >= V17_TRAINING_SEG_4_LEN)
-         {
--            if (s->training_error < V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
--            {
- #if defined(SPANDSP_USE_FIXED_POINTx)
--                span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %d)\n", s->bit_rate, s->training_error);
-+            if (s->training_error < (int64_t) V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
-+            {
-+                span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %ld)\n", s->bit_rate, s->training_error);
- #else
-+            if (s->training_error < V17_TRAINING_SEG_4_LEN*FP_SCALE(1.0f)*FP_SCALE(1.0f)*constellation_spacing[s->space_map])
-+            {
-                 span_log(&s->logging, SPAN_LOG_FLOW, "Training succeeded at %dbps (constellation mismatch %f)\n", s->bit_rate, s->training_error);
- #endif
-                 /* We are up and running */
-@@ -1157,7 +1165,7 @@ static void process_half_baud(v17_rx_state_t *s, const complexf_t *sample)
-             {
-                 /* Training has failed. Park this modem. */
- #if defined(SPANDSP_USE_FIXED_POINTx)
--                span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %d)\n", s->training_error);
-+                span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %ld)\n", s->training_error);
- #else
-                 span_log(&s->logging, SPAN_LOG_FLOW, "Training failed (constellation mismatch %f)\n", s->training_error);
- #endif
diff --git a/package/spandsp/spandsp.hash b/package/spandsp/spandsp.hash
index d38b069198..3fa19144e8 100644
--- a/package/spandsp/spandsp.hash
+++ b/package/spandsp/spandsp.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  a11beed46b488a4cac3b0c42042ad28448bcee4c0027a82d5449180bbb178836  spandsp-3.0.0-6ec23e5a7e.tar.gz
+sha256  667e3af3f59c9d40140cb4c3a86f7af0ea80aa7e637417f079d6d6881f91d404  spandsp-797760168945c96e91af55bde9d4edaea2e654f9.tar.gz
 sha256  366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  COPYING
diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index 4735212f31..0db329e24f 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SPANDSP_VERSION = 3.0.0-6ec23e5a7e
-SPANDSP_SITE = https://files.freeswitch.org/downloads/libs
+SPANDSP_VERSION = 797760168945c96e91af55bde9d4edaea2e654f9
+SPANDSP_SITE = $(call github,freeswitch,spandsp,$(SPANDSP_VERSION))
 SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
 SPANDSP_LICENSE_FILES = COPYING
 # We're patching configure.ac
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
