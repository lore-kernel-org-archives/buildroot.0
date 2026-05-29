Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FD3CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 328ED407C9;
	Fri, 29 May 2026 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc6l5gaDLE1m; Fri, 29 May 2026 17:21:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E94140651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780075268;
	bh=rlbxh9WsJbFAiV8NSTiGVvr1H/Upi4teQMzeqiroqz4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AIqiVJVBT/TPKXMp9R4wr1VDkYzB+El6nhfSHyQxP2itzGNKCeZdigveGvjLIB5US
	 VR9PUaPlPW7KZBO6aQ6GTumOSYejDyj76wMD9OZ9iKXZCg5ON+DGMHE4BpSXtMsU9O
	 2AiZObYG5fv6LkJJ6/LSSPnWQRhwyLmg8AbxYz1TNHZGeh0gmE9bRZE/2b/5MDypG8
	 1NJcx0cfOzODnDgPSPIIG3Por4Ge6NkTdII1T2aA5QcePLo8aQjBOGdYGCyEAlJNMz
	 qaWUADQ9yg66KnUE6OGq3anBJt1mzStUYwNkkOBvJHt/DVWeFY/ILWWHwf8qOijAJN
	 7CuOjn0ckS7ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E94140651;
	Fri, 29 May 2026 17:21:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3C5CD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924EE41F25
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2w5TjOrF-VR for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41EEB41F22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41EEB41F22
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41EEB41F22
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09fc.dip0.t-ipconnect.de [91.58.9.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 466B1A4C2F76
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:21:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37110)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wT0tL-000000000Fx-1yo9
 for buildroot@buildroot.org; Fri, 29 May 2026 17:21:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:21:02 +0200
Message-ID: <20260529172103.1359117-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780075264;
 bh=sbyBEFOn9SqTP6xXlKeDv2nc8SiozqWbC9OGjVGDd/o=;
 h=From:To:Subject:Date:From;
 b=gKJdwVMetpk80U5OZbK81DMdNzI+wekecK9EvRGe2H0cX7edHjCdf1Z1euDLibHZI
 efZfHldvR1YddAFrn/t7OHsXkmwJokQ7baLD0VZR84rjZ11XcM7HpHsKOgw+hVD/A4
 ljelLWzyDxPFej2U2oBMfJw8XZh2nEfRPw3hp5/txDb5q8LetI6yXETX2wJUlXHxwZ
 xBuYPeMcu3+eJQvCt8k4vPXK1+WxVv0MUBrti6wJjca7k44PqkjZkrQVsG/8QujnYo
 byQpKagCv3lMksCbgkDOBmBuWV57CZDTy9wnrtu68njEVFyKqYagoOsUp8FiD7wLMt
 SDFfE0ps4k2kA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gKJdwVMe
Subject: [Buildroot] [PATCH 1/2] package/libdrm: link with libatomic if
 needed
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

Fixes:
https://autobuild.buildroot.net/results/ea0/ea085cdea8458768c5f0ddb16f618a572406e65a/

The oldest build error dates back to May 2024
https://autobuild.buildroot.net/results/8ff/8ff4e16bb79294c5e289989855b5875851342909/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/74926d1dfa331217066129ca169b3416027dd058

 package/libdrm/libdrm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 240c09b8b1..cafff8781e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -19,6 +19,8 @@ LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
 	-Dman-pages=disabled
 
+LIBDRM_LDFLAGS = $(TARGET_LDFLAGS)
+
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
@@ -26,6 +28,11 @@ LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
 endif
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBDRM_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPTS += -Dintel=enabled
 LIBDRM_DEPENDENCIES += libpciaccess
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
