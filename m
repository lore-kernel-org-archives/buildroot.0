Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391F9D3177E
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 658654088D;
	Tue,  5 Nov 2024 18:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ykvXp902VLvb; Tue,  5 Nov 2024 18:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D19F4088C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D19F4088C;
	Tue,  5 Nov 2024 18:23:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FEF13B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF8680BF4
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV5lBMH1SzaS for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:23:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C488D80B6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C488D80B6B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C488D80B6B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:23:23 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6864CB00563;
 Tue,  5 Nov 2024 19:23:18 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
	Julien Olivain <ju.o@free.fr>
Date: Tue,  5 Nov 2024 19:23:08 +0100
Message-ID: <20241105182308.1216274-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730831000;
 bh=K3cvuwXQR8m8BSJevxwNP4k0Sves4XAXEW7s6bjziSg=;
 h=From:To:Cc:Subject:Date:From;
 b=P+bVI9+hAGwqDenmRImdjfKYB1DF4XdxVQM4whG5HYU/fYQh21I4TUI/tb/wnIjQT
 OZASyanmsFGMSV2p00HARP40UyPNVNsp4m1Z/ZUe6S9GgugKdHKQlh+dHrhV7VH+8T
 V52TR0avWEsVP15siVngQwleqxUDnLtipbA8035wpNeIrUVUby9bNJsX5Cn9Hy6zP5
 T4UgdmXIlE7t7SaAVfHnZT4cF3qGIyAgpUsw6zSxSaMmkqHKD6Cq8rfBf3wcEuv993
 20FBTmci0U/kcA60dpfrbOhuW3fRgjsF8tIKja26dAdTD1u8j7Z8n0VCyOEM7gmA1e
 77ZIyUBiWnvwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P+bVI9+h
Subject: [Buildroot] [PATCH 1/1] package/libspdm: fix build due to missing
 macro definition
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

Commit 967ba5386 "package/libspdm: bump version to 3.5.0" [1]
incorrectly removed the "0" to the LIBSPDM_ENABLE_CAPABILITY_MEL_CAP
macro definition.

This results to libspdm build failure with errors like:

    In file included from /build/libspdm-3.5.0/include/internal/libspdm_common_lib.h:20,
                     from /build/libspdm-3.5.0/library/spdm_common_lib/libspdm_com_context_data.c:7:
    /build/libspdm-3.5.0/include/hal/library/responder/measlib.h:154:38: error: #if with no expression
      154 | #if LIBSPDM_ENABLE_CAPABILITY_MEL_CAP
          |                                      ^

This commit fixes the issue by adding back this missing "0".

Fixes:
https://autobuild.buildroot.org/results/88cb77a2e6b46028f9fb7f0325348a1b1b8fd931

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/967ba5386d4e15102db88a9faae1845b3e69dc6f

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1528523473
---
 package/libspdm/libspdm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index 081bffb9c1..03ac9a70f8 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -20,7 +20,7 @@ LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
 LIBSPDM_CFLAGS = \
 	$(TARGET_CFLAGS) \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
-	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP= \
+	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=0
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
