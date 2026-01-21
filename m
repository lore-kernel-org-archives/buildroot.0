Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388BEC44508
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED8214598A;
	Wed, 21 Jan 2026 18:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1I6tO8F3D_QW; Wed, 21 Jan 2026 18:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04AA2455DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769018857;
	bh=bfNXs1NwGXS9FTev2ILGJBk5Mvr1+fQFzoWqb3QX7FI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yqr9Bc246Cg+tUAfme6rRlvCegBDDm7jj+T+3s/NhMY0WkMj5ttW2CfuZnxu7lO+n
	 yD84md/GRf956d7hbYm8j13w4nBKTLLyhJpDXiMGlwDMFZdfUfOJGRybqqFJQl7M5v
	 7eXxTr0a1YZsDXbuSR1H4JSi1IqiwZF5I8GGCqK5TV4+bPNkpjUKbKfIn3Pz6zlbjs
	 pcNh6bLAtctGU80miWCTjDb0X6sG66lMEGc8f9f4AQg414NiCcC6eLxXFNR8dj+HUi
	 B+xFa5bEkHn/nGraDUb+/O2T6qYUbLnYXeeD89gzjWJM3GeEZoY8N3imY72bakaffZ
	 B81c1sItkVeMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04AA2455DD;
	Wed, 21 Jan 2026 18:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8DAA160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D41D45AC9
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INsUxamfZOMa for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44AD04598A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44AD04598A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44AD04598A
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:07:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9442CA4C4668
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 19:07:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vicbu-000000006YH-2uBI
 for buildroot@buildroot.org; Wed, 21 Jan 2026 18:07:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:07:18 +0100
Message-ID: <20260121180719.47597-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769018839;
 bh=O7HYiMg4jpxqVSdAq6y41mLIHcl1SO9W8XgxmXD93PE=;
 h=From:To:Subject:Date:From;
 b=IXCOxdCrG/glL3ZGgsVQV4gmfIuOj+WwZzee1G0pogLb+I3FLHVgUy4cvKjAolLTw
 mxrN+/2S3soHfbIvbcj8Yt49W0AjvSY+As09Yh5V1q7lVeEgqDQyz16P5SaYHOr+gB
 feh84xp4v6KMTu9lrSca7hwoHMrxr4EYquGMyHzb1QeSey25kgv3BbeVbwS0NX6UEB
 wjQTkor5b1z1W8shxu0VwSW5afs2HW4fEZ39jonnevZo73XIi+f5GGG4/aw3eDoJTQ
 xN8Z00GemI353H7Qo3ha1rJ1MpvhoDb7G0q0sqKhjw3MHJtI0sxTVGwM1X7B1UfR/5
 3UObRarwJW2tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=IXCOxdCr
Subject: [Buildroot] [PATCH] package/libopusenc: bump version to 0.3
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

https://opus-codec.org/release/dev/2026/01/03/libopusenc-0_3.html

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...opusenc.h-Avoid-__opus_check_-macros.patch | 85 -------------------
 package/libopusenc/libopusenc.hash            |  5 +-
 package/libopusenc/libopusenc.mk              |  2 +-
 3 files changed, 4 insertions(+), 88 deletions(-)
 delete mode 100644 package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch

diff --git a/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch b/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch
deleted file mode 100644
index e8ab31f30a..0000000000
--- a/package/libopusenc/0001-opusenc.h-Avoid-__opus_check_-macros.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From a0010e4602b40efc1413b3069122eb73efb688d3 Mon Sep 17 00:00:00 2001
-From: Mark Harris <mark.hsj@gmail.com>
-Date: Mon, 24 Nov 2025 11:52:29 -0800
-Subject: [PATCH] opusenc.h: Avoid __opus_check_* macros
-
-The __opus_check_* macros are undocumented macros internal to opus, and
-have changed in opus commit 7817df7908318fb3a0af2a01e4da1e25643967d0
-because identifiers beginning with a double underscore are reserved by
-ISO C.  Define our own macros, not using reserved identifiers.
-
-Reported by Bertaz on GitHub and benedikt-grl on gitlab.xiph.org.
-
-Resolves: https://github.com/xiph/libopusenc/pull/36
-Resolves: https://gitlab.xiph.org/xiph/opus-tools/-/issues/2323
-Upstream: https://gitlab.xiph.org/xiph/libopusenc/-/commit/04c6172ffbbd5c7f7f2e170cf843872113f33b05
-[Julien: rebase on v0.2.1]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- include/opusenc.h | 35 ++++++++++++++++++++---------------
- 1 file changed, 20 insertions(+), 15 deletions(-)
-
-diff --git a/include/opusenc.h b/include/opusenc.h
-index 50ba8b5..6a893c7 100644
---- a/include/opusenc.h
-+++ b/include/opusenc.h
-@@ -104,7 +104,6 @@ extern "C" {
- /*@}*/
- /*@}*/
- 
--
- /* These are the "raw" request values -- they should usually not be used. */
- #define OPE_SET_DECISION_DELAY_REQUEST      14000
- #define OPE_GET_DECISION_DELAY_REQUEST      14001
-@@ -121,6 +120,13 @@ extern "C" {
- #define OPE_GET_NB_STREAMS_REQUEST          14013
- #define OPE_GET_NB_COUPLED_STREAMS_REQUEST  14015
- 
-+/* Macros to trigger compilation errors when the wrong types are provided to a CTL. */
-+/* These macros are not part of the API and are only for use within the macros below. */
-+#define ope_check_int(x) (((void)((x) == (opus_int32)0)), (opus_int32)(x))
-+#define ope_check_int_ptr(ptr) ((ptr) + ((ptr) - (opus_int32*)(ptr)))
-+#define ope_check_packet_func(x) ((void)((void (*)(void *, const unsigned char *, opus_int32, opus_uint32))0 == (x)), (x))
-+#define ope_check_void_ptr(x) ((void)((void *)0 == (x)), (x))
-+
- /**\defgroup encoder_ctl Encoding Options*/
- /*@{*/
- 
-@@ -129,21 +135,20 @@ extern "C" {
-    Macros for setting encoder options.*/
- /*@{*/
- 
--#define OPE_SET_DECISION_DELAY(x) OPE_SET_DECISION_DELAY_REQUEST, __opus_check_int(x)
--#define OPE_GET_DECISION_DELAY(x) OPE_GET_DECISION_DELAY_REQUEST, __opus_check_int_ptr(x)
--#define OPE_SET_MUXING_DELAY(x) OPE_SET_MUXING_DELAY_REQUEST, __opus_check_int(x)
--#define OPE_GET_MUXING_DELAY(x) OPE_GET_MUXING_DELAY_REQUEST, __opus_check_int_ptr(x)
--#define OPE_SET_COMMENT_PADDING(x) OPE_SET_COMMENT_PADDING_REQUEST, __opus_check_int(x)
--#define OPE_GET_COMMENT_PADDING(x) OPE_GET_COMMENT_PADDING_REQUEST, __opus_check_int_ptr(x)
--#define OPE_SET_SERIALNO(x) OPE_SET_SERIALNO_REQUEST, __opus_check_int(x)
--#define OPE_GET_SERIALNO(x) OPE_GET_SERIALNO_REQUEST, __opus_check_int_ptr(x)
--/* FIXME: Add type-checking macros to these. */
--#define OPE_SET_PACKET_CALLBACK(x,u) OPE_SET_PACKET_CALLBACK_REQUEST, (x), (u)
-+#define OPE_SET_DECISION_DELAY(x) OPE_SET_DECISION_DELAY_REQUEST, ope_check_int(x)
-+#define OPE_GET_DECISION_DELAY(x) OPE_GET_DECISION_DELAY_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_MUXING_DELAY(x) OPE_SET_MUXING_DELAY_REQUEST, ope_check_int(x)
-+#define OPE_GET_MUXING_DELAY(x) OPE_GET_MUXING_DELAY_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_COMMENT_PADDING(x) OPE_SET_COMMENT_PADDING_REQUEST, ope_check_int(x)
-+#define OPE_GET_COMMENT_PADDING(x) OPE_GET_COMMENT_PADDING_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_SERIALNO(x) OPE_SET_SERIALNO_REQUEST, ope_check_int(x)
-+#define OPE_GET_SERIALNO(x) OPE_GET_SERIALNO_REQUEST, ope_check_int_ptr(x)
-+#define OPE_SET_PACKET_CALLBACK(x,u) OPE_SET_PACKET_CALLBACK_REQUEST, ope_check_packet_func(x), ope_check_void_ptr(u)
- /*#define OPE_GET_PACKET_CALLBACK(x,u) OPE_GET_PACKET_CALLBACK_REQUEST, (x), (u)*/
--#define OPE_SET_HEADER_GAIN(x) OPE_SET_HEADER_GAIN_REQUEST, __opus_check_int(x)
--#define OPE_GET_HEADER_GAIN(x) OPE_GET_HEADER_GAIN_REQUEST, __opus_check_int_ptr(x)
--#define OPE_GET_NB_STREAMS(x) OPE_GET_NB_STREAMS_REQUEST, __opus_check_int_ptr(x)
--#define OPE_GET_NB_COUPLED_STREAMS(x) OPE_GET_NB_COUPLED_STREAMS_REQUEST, __opus_check_int_ptr(x)
-+#define OPE_SET_HEADER_GAIN(x) OPE_SET_HEADER_GAIN_REQUEST, ope_check_int(x)
-+#define OPE_GET_HEADER_GAIN(x) OPE_GET_HEADER_GAIN_REQUEST, ope_check_int_ptr(x)
-+#define OPE_GET_NB_STREAMS(x) OPE_GET_NB_STREAMS_REQUEST, ope_check_int_ptr(x)
-+#define OPE_GET_NB_COUPLED_STREAMS(x) OPE_GET_NB_COUPLED_STREAMS_REQUEST, ope_check_int_ptr(x)
- /*@}*/
- /*@}*/
- 
--- 
-2.52.0
-
diff --git a/package/libopusenc/libopusenc.hash b/package/libopusenc/libopusenc.hash
index bdb4cf8fde..a39436b536 100644
--- a/package/libopusenc/libopusenc.hash
+++ b/package/libopusenc/libopusenc.hash
@@ -1,3 +1,4 @@
-# From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9  libopusenc-0.2.1.tar.gz
+# From https://opus-codec.org/release/dev/2026/01/03/libopusenc-0_3.html
+sha256  f616d3aff9b2034547894ccb8ab56c36cf1a4acb0d922c5d7119f97bbe58642c  libopusenc-0.3.tar.gz
+# Locally computed
 sha256  93b17ab56b8230127fea532be0dcb4e6d71e66ab5e8ce5d6ae8785d7288b164f  COPYING
diff --git a/package/libopusenc/libopusenc.mk b/package/libopusenc/libopusenc.mk
index 3b4dc0e714..8606a49dde 100644
--- a/package/libopusenc/libopusenc.mk
+++ b/package/libopusenc/libopusenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPUSENC_VERSION = 0.2.1
+LIBOPUSENC_VERSION = 0.3
 LIBOPUSENC_SITE = https://downloads.xiph.org/releases/opus
 LIBOPUSENC_LICENSE = BSD-3-Clause
 LIBOPUSENC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
