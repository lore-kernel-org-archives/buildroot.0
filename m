Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158BFE92733
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5022816FD;
	Mon, 29 Dec 2025 17:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaMK9bE9ysHa; Mon, 29 Dec 2025 17:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7864817AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767027819;
	bh=Fc17VEZAsCNgr4HalmxG3tDonvZO0UDjszyLV/VFJOo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TEl7ddRM5WOeIZnMaLDLEKPBaQhDwEkGpcKDyFOIhyn3K1Z3B6EzprPYVsNTTS0qt
	 6OMod8l7sEO8LCdl+5FjyVA/G0yF9cJkRonVh2dGDByCDF/mlywvGRI1figUreoxKI
	 B9h1JR7we4fEeIXOhwUNfweft7Wck4VL+Xptb2AcZ0s0z6v1emdgQ51Vt+KYbiwxHc
	 Gv0gsSHOcrTYskCGLvAQ4Yj/wl1i+ndkwBa8qzu+2VQf4OureAt/lxFUeHpuid+PrE
	 CZqVPKGz64RKPRRwR3g+Alj6QfBlWYdpftg4J5EYX9CymsUM0a9lrq3OvcKor7Yu0b
	 RUAp6MU7Do2ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7864817AE;
	Mon, 29 Dec 2025 17:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55B0B177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B1C960A68
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXlbQLbV9e5n for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:03:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.101;
 helo=smtpdh16-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4350960A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4350960A58
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4350960A58
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:03:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id aGeavlS5d3pJ0aGeavUOQ9; Mon, 29 Dec 2025 18:03:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 29 Dec 2025 18:03:31 +0100
Message-ID: <20251229170331.1299723-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfM2ZyKjU6Mm101KJpsJ8rO6vzMm0d88Y02R48ihW9xy7pCbnZkrRCci4QH7Vq9RzMdh7Q7STakyoBmF1d/T6V8ubHrtrcjBjrphMcQpyGSB+TjE6Por9
 +EUngD5j2PeH/fWvZRaU+advsY2goe/4o7Ayo4bmMvaJQG8qjuoiyVVKWt3Wb82rBPZKdxz1Anhnoh+QBONJ56dMBK98N8QXla/Fz2dZr3AegDPFTznI9f7Y
 tz9755KClUdLozRvQPrFRHzf27OJayXY48YhJhSZOPpBpwgRNY8bulNzFmgu4ptIaOcPkv3tNCZT1dhjFTvobA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767027812; bh=1bFsqHj6Y+uxCXH+14FivUKoc7fUzKQL/JYJo9PiH+k=;
 h=From:To:Subject:Date:MIME-Version;
 b=FCISc1ERhyzUnA6uvZ8NeqGmUDno6LAvr6bIpvKacsx6EQY67jRB+NofiTBgG8rce
 R7jC1SL7btVpT9tNodeQflBl21nY9z0yqX0h6qrmSfykKeSQEpAmth1CVgBBq9Pe54
 kGf8iH0xj48KCoCSIgO7WBV9BTsp9VrF5VVXnTYnBg0elHbxARuVCOzxQ8FN6d9wyx
 OCDnFTqROxhaDtkBjJACg78Xi/YbQ51yhMy1xUC93ljlpPJ0cyn6SfcIrWeBWt74IK
 UqobsAaL06q16XTlzqmajGYIjRZxI7ZfDf7qFovweCnGwX5jbwZUrs3qqYRWborn0U
 L9dS6X/UhVx2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FCISc1ER
Subject: [Buildroot] [PATCH] package/libnss: fix Makefile ifndef
 FREEBL_NO_DEPEND
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

NSS Makefile build system is pretty weak if used with parallel build. In
this case what happens is that 'ifndef FREEBL_NO_DEPEND' appears in
lib/freebl/manifest.mn and coreconf/Linux.mk. When parallel building
variable FREEBL_NO_DEPEND gets defined if not defined to 1, but in the
2 occurences we end up having on variable set to 1 and 1 still not
defined. This results in:
`
/home/giuliobenetti/br-reproduce/3e046c996825447f48377f7c4361b5db26b84f95/output/host/lib/gcc/arm-buildroot-linux-musleabi/14.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: Linux2.6_arm_arm-buildroot-linux-musleabi-gcc.br_real_glibc_PTH_DBG.OBJ/Linux_SINGLE_SHLIB/lowhash_vector.o: in function `loader_GetOriginalPathname':
lowhash_vector.c:(.text.loader_GetOriginalPathname+0x68): undefined reference to `PR_SetError'
collect2: error: ld returned 1 exit status
`
So let's pass FREEBL_NO_DEPEND=1 when building to define that variable
instead to let NSS Makefile to calculate it.

Fixes:
https://autobuild.buildroot.net/results/ad4/ad40536728303c56d1d0968e38ac36da12cca416//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b6be6dbc8c..db71c0018d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -57,7 +57,8 @@ LIBNSS_BUILD_VARS = \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
 	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
-	NSS_ENABLE_WERROR=0
+	NSS_ENABLE_WERROR=0 \
+	FREEBL_NO_DEPEND=1
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 # Disable Altivec if not supported
@@ -136,7 +137,8 @@ HOST_LIBNSS_BUILD_VARS = \
 	NSS_USE_SYSTEM_SQLITE=1 \
 	SQLITE_INCLUDE_DIR=$(HOST_DIR)/include \
 	ZLIB_INCLUDE_DIR=$(HOST_DIR)/include \
-	NSS_ENABLE_WERROR=0
+	NSS_ENABLE_WERROR=0 \
+	FREEBL_NO_DEPEND=1
 
 HOST_LIBNSS_DEPENDENCIES = host-libnspr host-sqlite host-zlib
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
