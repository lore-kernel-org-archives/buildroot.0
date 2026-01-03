Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907EFFC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 09:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6288F60857;
	Sat,  3 Jan 2026 09:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZdxCyrK0SOJ; Sat,  3 Jan 2026 09:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DFD608AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767433538;
	bh=FItAd8wZQea3K1DewDy/xhjBR4GNJfV/nvOhOBM5fxQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAg8MtfzlbGfN3GdmkZQ9odH5NtIc+7jWPX+VJdLuvxI1DTJSZStAZx772kZnRg21
	 YL2OA/NeER/hXrZQbC6NqQZS80lhnyhmK0iAwP8pYy0paBXr9Aexau/Km6Xs6TWOtC
	 P+YMDt/Bm2z0u5Fxq0tZrsrtUIN5KgvC8IpWPkphfIhz2h/I/JLNX2HWiiRb111ONX
	 FsjOFYzE0RuJqi1kQZ1a5/W3K3QDfCfF8FWC57k8EK2Tu7o4vTIueUfu4aI9Jqnr0j
	 q62KJ/3IxdIGnIoVAPDqU55hf+hi/x7eaZHQrNOzhHhxLg1UpLIMtvAvI6T50VvpAn
	 6V16yfx9E3QFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DFD608AA;
	Sat,  3 Jan 2026 09:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FCB6351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9140940235
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmLCcDgqdt4A for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 09:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 85A9E4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A9E4004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85A9E4004E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 09:45:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 554BDA4C130A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 10:45:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbyCE-0000000077H-1dKK
 for buildroot@buildroot.org; Sat, 03 Jan 2026 09:45:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 10:45:07 +0100
Message-ID: <20260103094508.1212757-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260103094508.1212757-1-bernd@kuhls.net>
References: <20260103094508.1212757-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767433528;
 bh=C85unZIQcSDbgK6E+p2PMz7uPnn2BCPCC77bTHvMSuo=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FxS1deIqOYaT3JUl5Z2Gl6KbpuKSuQ9gUp0mG3+hl0LhBqZhw4PbD1D38bXfKdoc2
 jOYumguOPIV89wJXMfXlLtNG0epRHXFzajFIMUAUxvXztSwpUD8jbWZHIh2IhxzEbM
 Q2OPkzcS3BMrYU+QrVXXIp3WOhxHBzIDjvV5AKCnyFeXjh5LM1V7Iu0lXMNZ7Dn4WM
 t0ZOMQKAkx5kCNqAbkOn3DQIJfJcd09TDNqRt1I1r2xNWD2NLnE6Y0W4M76Ztbbv9P
 YKQNblMixDGm7IGlXGvhKNk8W26BRDd/SIHUFXdMwq14isAeE0i6wf5Lrtfy0g3PGZ
 Kef+iu/5XDynQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FxS1deIq
Subject: [Buildroot] [PATCH 2/3] package/freeswitch: Fix compilation against
 >=2023/06/02 spandsp
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

Needed to fix build with upcoming bump of spandsp.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...compilation-against-2023-06-02-spand.patch | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch

diff --git a/package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch b/package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch
new file mode 100644
index 0000000000..57211410ed
--- /dev/null
+++ b/package/freeswitch/0004-mod_spandsp-Fix-compilation-against-2023-06-02-spand.patch
@@ -0,0 +1,150 @@
+From 76458fafc5a9cd0eebe94455ed39f41eac986c67 Mon Sep 17 00:00:00 2001
+From: Patrice Fournier <patrice.fournier@t38fax.com>
+Date: Tue, 4 Feb 2025 15:54:26 -0500
+Subject: [PATCH] [mod_spandsp] Fix compilation against >=2023/06/02 spandsp
+
+* [mod_spandsp] Fix compilation against >=2023/06/02 spandsp
+
+spandsp, beginning with commit d9681c37 and coinciding with the
+SPANDSP_RELEASE_DATE of 20230620, introduced the following changes to
+its V.18 protocol API, which FreeSWITCH is not able to compile against:
+- Certain V.18 constants were renamed.
+- The v18_init function now requires passing a third function, handling
+the V.18 modem's status changes.
+
+This patch allows FreeSWITCH to build against current versions of
+spandsp by:
+- Using the new V.18 constant names.
+- Implementing a simple status reporter callback function and passing it
+as the third function to v18_init.
+
+Additionally, it retains backward compatibility with prior versions of
+spandp through #if conditions checking the value of
+SPANDSP_RELEASE_DATE.
+
+Signed-off-by: Patrice Fournier <patrice.fournier@t38fax.com>
+
+* [mod_spandsp] Pass session to handle_v18_status.
+
+---------
+
+Signed-off-by: Patrice Fournier <patrice.fournier@t38fax.com>
+Co-authored-by: Morgan Scarafiotti <morgan.scarafiotti@t38fax.com>
+Co-authored-by: Andrey Volk <andywolk@gmail.com>
+
+Upstream: https://github.com/signalwire/freeswitch/commit/76458fafc5a9cd0eebe94455ed39f41eac986c67
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../applications/mod_spandsp/mod_spandsp.c    |  1 -
+ .../applications/mod_spandsp/mod_spandsp.h    |  6 ++++
+ .../mod_spandsp/mod_spandsp_dsp.c             | 32 ++++++++++++++++---
+ 3 files changed, 34 insertions(+), 5 deletions(-)
+
+diff --git a/src/mod/applications/mod_spandsp/mod_spandsp.c b/src/mod/applications/mod_spandsp/mod_spandsp.c
+index 3f69b9746a..50d03f93a3 100644
+--- a/src/mod/applications/mod_spandsp/mod_spandsp.c
++++ b/src/mod/applications/mod_spandsp/mod_spandsp.c
+@@ -37,7 +37,6 @@
+ 
+ 
+ #include "mod_spandsp.h"
+-#include <spandsp/version.h>
+ #include "mod_spandsp_modem.h"
+ 
+ /* **************************************************************************
+diff --git a/src/mod/applications/mod_spandsp/mod_spandsp.h b/src/mod/applications/mod_spandsp/mod_spandsp.h
+index 01f79e254d..6a936eee18 100644
+--- a/src/mod/applications/mod_spandsp/mod_spandsp.h
++++ b/src/mod/applications/mod_spandsp/mod_spandsp.h
+@@ -58,6 +58,12 @@ typedef int zap_socket_t;
+ #define SPANDSP_EVENT_TXFAXNEGOCIATERESULT "spandsp::txfaxnegociateresult"
+ #define SPANDSP_EVENT_RXFAXNEGOCIATERESULT "spandsp::rxfaxnegociateresult"
+ 
++#include <spandsp/version.h>
++
++#if SPANDSP_RELEASE_DATE < 20230620
++#define V18_MODE_WEITBRECHT_5BIT_4545 V18_MODE_5BIT_4545
++#define V18_MODE_WEITBRECHT_5BIT_50   V18_MODE_5BIT_50
++#endif
+ 
+ 
+ /* The global stuff */
+diff --git a/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c b/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c
+index 836808a48d..51ac2a0e63 100644
+--- a/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c
++++ b/src/mod/applications/mod_spandsp/mod_spandsp_dsp.c
+@@ -152,17 +152,27 @@ static void put_text_msg(void *user_data, const uint8_t *msg, int len)
+ 
+ }
+ 
++#if SPANDSP_RELEASE_DATE >= 20230620
++static void handle_v18_status(void *user_data, int status)
++{
++	switch_core_session_t *session = (switch_core_session_t *) user_data;
++	switch_channel_t *channel = switch_core_session_get_channel(session);
++
++	switch_log_printf(SWITCH_CHANNEL_SESSION_LOG(session), SWITCH_LOG_INFO, "%s detected V.18 modem: %s\n", switch_channel_get_name(channel), v18_status_to_str(status));
++}
++#endif
++
+ static int get_v18_mode(switch_core_session_t *session)
+ {
+ 	switch_channel_t *channel = switch_core_session_get_channel(session);
+ 	const char *var;
+-	int r = V18_MODE_5BIT_4545;
++	int r = V18_MODE_WEITBRECHT_5BIT_4545;
+ 
+ 	if ((var = switch_channel_get_variable(channel, "v18_mode"))) {
+ 		if (!strcasecmp(var, "5BIT_45") || !strcasecmp(var, "baudot")) {
+-			r = V18_MODE_5BIT_4545;
++			r = V18_MODE_WEITBRECHT_5BIT_4545;
+ 		} else if (!strcasecmp(var, "5BIT_50")) {
+-			r = V18_MODE_5BIT_50;
++			r = V18_MODE_WEITBRECHT_5BIT_50;
+ 		} else if (!strcasecmp(var, "DTMF")) {
+ 			r = V18_MODE_DTMF;
+ 		} else if (!strcasecmp(var, "EDT")) {
+@@ -213,8 +223,11 @@ switch_status_t spandsp_tdd_send_session(switch_core_session_t *session, const c
+ 		return SWITCH_STATUS_FALSE;
+ 	}
+ 
++#if SPANDSP_RELEASE_DATE >= 20230620
++	tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL, handle_v18_status, session);
++#else
+ 	tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL);
+-
++#endif
+ 
+ 	v18_put(tdd_state, text, -1);
+ 
+@@ -260,7 +273,13 @@ switch_status_t spandsp_tdd_encode_session(switch_core_session_t *session, const
+ 	}
+ 
+ 	pvt->session = session;
++
++#if SPANDSP_RELEASE_DATE >= 20230620
++	pvt->tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL, handle_v18_status, session);
++#else
+ 	pvt->tdd_state = v18_init(NULL, TRUE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, NULL);
++#endif
++
+ 	pvt->head_lead = TDD_LEAD;
+ 
+ 	v18_put(pvt->tdd_state, text, -1);
+@@ -338,7 +357,12 @@ switch_status_t spandsp_tdd_decode_session(switch_core_session_t *session)
+ 	}
+ 
+ 	pvt->session = session;
++
++#if SPANDSP_RELEASE_DATE >= 20230620
++	pvt->tdd_state = v18_init(NULL, FALSE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, pvt, handle_v18_status, session);
++#else
+ 	pvt->tdd_state = v18_init(NULL, FALSE, get_v18_mode(session), V18_AUTOMODING_GLOBAL, put_text_msg, pvt);
++#endif
+ 
+ 	if ((status = switch_core_media_bug_add(session, "spandsp_tdd_decode", NULL,
+ 						tdd_decode_callback, pvt, 0, SMBF_READ_REPLACE | SMBF_NO_PAUSE, &bug)) != SWITCH_STATUS_SUCCESS) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
