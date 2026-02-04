Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE680EA7941
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA8D8129B;
	Wed,  4 Feb 2026 19:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOWRMb5X0Txs; Wed,  4 Feb 2026 19:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1AD9812EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233513;
	bh=Lrfmc5lYSMe6LSD5mNGeb3tHopd0hVK3MBg7WLXWP18=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nH4Td8kUN41IsoVAZctiPxvTFWOpDXwbnQkZ5jyGwbmtJtop6Z9a2dz1PfuWfK2EN
	 IrgqTPKmky3YOwcLcCx2QidTypp+wberh1NC+Gg/Pd0jJu4TAVtlonS+mVsosM7PMH
	 Rj2WsuXJItjO+iOPDUG/MoTFvP/52x9g5Ngi0QyGhgOx6uBBCtcyHiy4tJuOxQ67mj
	 5/V+UyEvntLpZVBmshH+L4pdMLiQ9uEbn1OqiZNZGx/WujV55g97sNEOpLAHD24FkA
	 W5gZ5MEEz/2xlAXMS3egEHapqphRF4aYCmm7w/0KOLKxcKB1xf/Rf9isSJ9WbS+aCI
	 wwW4pH1pK3mig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1AD9812EB;
	Wed,  4 Feb 2026 19:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB28317A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC47404EC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKasa9kHjZH2 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2ABE340781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ABE340781
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ABE340781
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:31:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3DE4AA4C57AE
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 20:31:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57496)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnibK-000000002EG-3dnP
 for buildroot@buildroot.org; Wed, 04 Feb 2026 19:31:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 20:31:46 +0100
Message-ID: <20260204193146.1519393-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770233507;
 bh=8wCUEx18xhCkn2fDs0lTr8XLitlOxF+oJqY+N4FZ4yg=;
 h=From:To:Subject:Date:From;
 b=JNqvcVoKjagg9wd6zED+GQflZ3dg7Ci+OY5O2nIPWfJG564Gc/qVwOqfGwXj7Ehos
 pnzzyeggDMa8SMeYF3dof4fbd0f1U47j/QQ4R31XrORkSTxkVUDlz+gA72uCsT74qx
 7iGNHyTKwsOyAbUwinZ0oKZxoSkHvz4L4qUyMTcNPEGWELzVoPWSjiPyMsGxrf5H1I
 XWNc1q0XcR/GawYhdWYEKDAkWjyKAqISpxydtOznPazC9Sl/TOmftjhc9Lv0Ad0EIk
 O3Fd20l4IiRtiqcYuU9I21fOShgEFYVKigCQQwBlP62LPBukGeBAOIfcYsjsN/qSPF
 u1k/5dJRmMlrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=JNqvcVoK
Subject: [Buildroot] [PATCH v2 1/1] package/spandsp: bump version
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

Added patches to fix build of host utils and added dependency to
host-tiff. Otherwise build errors will occur when the host does not
provide tiffio.h.
These changes are necessary due to changes introduced by this version
bump which includes upstream commit
https://github.com/freeswitch/spandsp/commit/a60119408c465ad0eb24b0fb83da1b476cb5b169
added in 2023. No LTS backport needed in buildroot.

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
v2: fixed build error when host does not provide tiffio.h (Thomas)

 ...es-to-address-V.17-fixed-point-issue.patch | 116 ------------------
 ...to-provide-custom-CPPFLAGS_FOR_BUILD.patch |  36 ++++++
 ...e-CPPFLAGS_FOR_BUILD-for-build-tools.patch |  87 +++++++++++++
 package/spandsp/spandsp.hash                  |   2 +-
 package/spandsp/spandsp.mk                    |   6 +-
 5 files changed, 127 insertions(+), 120 deletions(-)
 delete mode 100644 package/spandsp/0002-Changes-to-address-V.17-fixed-point-issue.patch
 create mode 100644 package/spandsp/0002-Permit-to-provide-custom-CPPFLAGS_FOR_BUILD.patch
 create mode 100644 package/spandsp/0003-Propagate-CPPFLAGS_FOR_BUILD-for-build-tools.patch

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
diff --git a/package/spandsp/0002-Permit-to-provide-custom-CPPFLAGS_FOR_BUILD.patch b/package/spandsp/0002-Permit-to-provide-custom-CPPFLAGS_FOR_BUILD.patch
new file mode 100644
index 0000000000..ad0bf67a9d
--- /dev/null
+++ b/package/spandsp/0002-Permit-to-provide-custom-CPPFLAGS_FOR_BUILD.patch
@@ -0,0 +1,36 @@
+From 0617f8d89ad5102f569c1d2b0483179fdfb1a83a Mon Sep 17 00:00:00 2001
+From: Christian Marangi <ansuelsmth@gmail.com>
+Date: Thu, 20 Nov 2025 16:39:06 +0100
+Subject: [PATCH] Permit to provide custom CPPFLAGS_FOR_BUILD
+
+In the context of cross compilation the CPPFLAGS for the target might be
+different than the one for build tools.
+
+Permit to provide custom CPPFLAGS_FOR_BUILD value to handle this
+scenario.
+
+Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
+
+Upstream: https://github.com/freeswitch/spandsp/pull/112
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa87245..450b8fa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,7 +61,7 @@ then
+     # are not the same, we set reasonable default values for the tools.
+ 
+     CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
+-    CPPFLAGS_FOR_BUILD="\$(CPPFLAGS)"
++    CPPFLAGS_FOR_BUILD=${CPPFLAGS_FOR_BUILD-"\$(CPPFLAGS)"}
+     CC=${CC-${host_alias}-gcc}
+     CFLAGS=${CFLAGS-"-g -O2"}
+     CXX=${CXX-${host_alias}-c++}
+-- 
+2.47.3
+
diff --git a/package/spandsp/0003-Propagate-CPPFLAGS_FOR_BUILD-for-build-tools.patch b/package/spandsp/0003-Propagate-CPPFLAGS_FOR_BUILD-for-build-tools.patch
new file mode 100644
index 0000000000..81d37fe758
--- /dev/null
+++ b/package/spandsp/0003-Propagate-CPPFLAGS_FOR_BUILD-for-build-tools.patch
@@ -0,0 +1,87 @@
+From 350d67a8d470d645c3c8811b8e17fe6f5b7ad93b Mon Sep 17 00:00:00 2001
+From: Christian Marangi <ansuelsmth@gmail.com>
+Date: Thu, 20 Nov 2025 16:40:44 +0100
+Subject: [PATCH] Propagate CPPFLAGS_FOR_BUILD for build tools
+
+On building build tools, only CC_FOR_BUILD is used with
+CPPFLAGS_FOR_BUILD never actually passed. This was probably an oversight
+when CPPFLAGS_FOR_BUILD was introduced.
+
+This is especially needed on cross compilation where the header are
+placed on a standard location.
+
+To address this case, and make building build tool more robust, actually
+pass the CPPFLAGS_FOR_BUILD for each tool.
+
+Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
+
+Upstream: https://github.com/freeswitch/spandsp/pull/112
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile.am | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f5c7cc9..52634b8 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -395,43 +395,43 @@ noinst_HEADERS = cielab_luts.h \
+                  v34_tables.h
+ 
+ make_at_dictionary$(EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
+-	$(CC_FOR_BUILD) -o make_at_dictionary$(EXEEXT) $(top_srcdir)/src/make_at_dictionary.c -DHAVE_CONFIG_H -I$(top_builddir)/src
++	$(CC_FOR_BUILD) -o make_at_dictionary$(EXEEXT) $(top_srcdir)/src/make_at_dictionary.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src
+ 
+ make_cielab_luts$(EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
+-	$(CC_FOR_BUILD) -o make_cielab_luts$(EXEEXT) $(top_srcdir)/src/make_cielab_luts.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_cielab_luts$(EXEEXT) $(top_srcdir)/src/make_cielab_luts.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_math_fixed_tables$(EXEEXT): $(top_srcdir)/src/make_math_fixed_tables.c
+-	$(CC_FOR_BUILD) -o make_math_fixed_tables$(EXEEXT) $(top_srcdir)/src/make_math_fixed_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_math_fixed_tables$(EXEEXT) $(top_srcdir)/src/make_math_fixed_tables.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_modem_filter$(EXEEXT): $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c
+-	$(CC_FOR_BUILD) -o make_modem_filter$(EXEEXT) $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_modem_filter$(EXEEXT) $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_modem_godard_descriptor$(EXEEXT): $(top_srcdir)/src/make_modem_godard_descriptor.c $(top_srcdir)/src/filter_tools.c
+-	$(CC_FOR_BUILD) -o make_modem_godard_descriptor$(EXEEXT) $(top_srcdir)/src/make_modem_godard_descriptor.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_modem_godard_descriptor$(EXEEXT) $(top_srcdir)/src/make_modem_godard_descriptor.c $(top_srcdir)/src/filter_tools.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_t43_gray_code_tables$(EXEEXT): $(top_srcdir)/src/make_t43_gray_code_tables.c
+-	$(CC_FOR_BUILD) -o make_t43_gray_code_tables$(EXEEXT) $(top_srcdir)/src/make_t43_gray_code_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_t43_gray_code_tables$(EXEEXT) $(top_srcdir)/src/make_t43_gray_code_tables.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_v17_v32_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v17_v32_constellation_map$(EXEEXT) $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_v17_v32_constellation_map$(EXEEXT) $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_v17_v32_convolutional_encoder$(EXEEXT): $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v17_v32_convolutional_encoder$(EXEEXT) $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_v17_v32_convolutional_encoder$(EXEEXT) $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_v29_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v29_constellation_map$(EXEEXT) $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_v29_constellation_map$(EXEEXT) $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_v34_convolutional_coders$(EXEEXT): $(top_srcdir)/src/make_v34_convolutional_coders.c
+-	$(CC_FOR_BUILD) -o make_v34_convolutional_coders$(EXEEXT) $(top_srcdir)/src/make_v34_convolutional_coders.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_v34_convolutional_coders$(EXEEXT) $(top_srcdir)/src/make_v34_convolutional_coders.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_v34_probe_signals$(EXEEXT): $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
+-	$(CC_FOR_BUILD) -o make_v34_probe_signals$(EXEEXT) $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
++	$(CC_FOR_BUILD) -o make_v34_probe_signals$(EXEEXT) $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+ 
+ make_v34_shell_map$(EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
+ 	$(CC_FOR_BUILD) -o make_v34_shell_map$(EXEEXT) $(top_srcdir)/src/make_v34_shell_map.c -DHAVE_CONFIG_H -I$(top_builddir)/src
+ 
+ make_v34_tx_pre_emphasis_filters$(EXEEXT): $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
+-	$(CC_FOR_BUILD) -o make_v34_tx_pre_emphasis_filters$(EXEEXT) $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c -DHAVE_CONFIG_H -I$(top_builddir)/src -I$(top_builddir)/tools -lm
++	$(CC_FOR_BUILD) -o make_v34_tx_pre_emphasis_filters$(EXEEXT) $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c $(CPPFLAGS_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src -I$(top_builddir)/tools -lm
+ 
+ # We need to run make_at_dictionary, so it generates the
+ # at_interpreter_dictionary.h file
+-- 
+2.47.3
+
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
index 4735212f31..002c4a8778 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-SPANDSP_VERSION = 3.0.0-6ec23e5a7e
-SPANDSP_SITE = https://files.freeswitch.org/downloads/libs
+SPANDSP_VERSION = 797760168945c96e91af55bde9d4edaea2e654f9
+SPANDSP_SITE = $(call github,freeswitch,spandsp,$(SPANDSP_VERSION))
 SPANDSP_LICENSE = LGPL-2.1 (library), GPL-2.0 (test suite)
 SPANDSP_LICENSE_FILES = COPYING
 # We're patching configure.ac
 SPANDSP_AUTORECONF = YES
 
-SPANDSP_DEPENDENCIES = tiff host-pkgconf
+SPANDSP_DEPENDENCIES = tiff host-tiff host-pkgconf
 SPANDSP_INSTALL_STAGING = YES
 SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
