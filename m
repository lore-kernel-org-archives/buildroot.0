Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705D3ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 09:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD21081991;
	Sun, 23 Oct 2022 09:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD21081991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8k3SiYQ1Jzc; Sun, 23 Oct 2022 09:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E578195C;
	Sun, 23 Oct 2022 09:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E578195C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59FC31BF3CB
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 09:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3510C8195C
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 09:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3510C8195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EX2OVNhP05EU for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 09:10:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F1F818DC
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19F1F818DC
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 09:10:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bv10so11211246wrb.4
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 02:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XCu0AfMEXvKrxS/uf11zsNRRA9A4ztXwEHIXjxOyW64=;
 b=jGYYAS+feB4PweZqG8Cfj4Yv1BQPR2qWdzcKtIU2AN28knhgyR0ynDj+CGXOBUpUm6
 HD1khzTau3FZNIbLxsIL/fJTFTNs6KzPXSJRQLTMsbX3FCJiSLgv7ALbSxy54rsGPLx4
 vPkQXS9QnqLKZqZu2qXWtNh1sHmkj/r6VNMo+/QMj60GKpvpbVmmO/TkM2QywdCuvWnG
 zOwFBXBldHMVnpgSbEi6v7tYxFP2ywM9pIT8Jt4GSIyF9TjXV1CjNUmb23A6qfF70FgX
 QDhA0Hx+BrC3Q5V8EQmWzdJe6G1e5fGr4lnv06kDCZ/cUT1jmsmTeKN/tC/CAvwR5j2c
 Ye1w==
X-Gm-Message-State: ACrzQf0Xxw5H3ATq6PR6TSPUjlUTTPpl2WNMad0b+R3Ku3Hwcoc0rUjf
 gmHd5c00MX6kfbejtTI6N0C4Zac9UBI=
X-Google-Smtp-Source: AMsMyM7DbzCkWAF0ygZx7ONCMruAd90zvI+kJwH3Fxm2jO64R54Ctq+bdl2c5eetambcOPJD6N7PuQ==
X-Received: by 2002:a05:6000:18a5:b0:230:a3b:bc16 with SMTP id
 b5-20020a05600018a500b002300a3bbc16mr17734702wri.627.1666516216780; 
 Sun, 23 Oct 2022 02:10:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t9-20020adff049000000b002366824c230sm1707406wro.107.2022.10.23.02.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 02:10:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 11:10:08 +0200
Message-Id: <20221023091009.18544-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XCu0AfMEXvKrxS/uf11zsNRRA9A4ztXwEHIXjxOyW64=;
 b=f5YRYhhkwSdasgQxRdNv3gp4725KDcXzPGPyde99sPCq2sd6FZldKTdPGNPWx0YZub
 AI8i29wP9goDHSrTBCCD51udwSSi2yQQh+T1o0tK1RfXCsCLiONoEMCKsd20AEyVsGoV
 fafFEkxckI5a/uBhty4Yd6ezpLQ9SbfKKxVzDmoCFuhmS26VtRIKE3b/LVOY+PrdTB79
 zR3W0h6z4PS9T3793gxTDQiHcNLXAd+Rzo51SvGy67rbnrevTylDtEXbtyocP2/5YRnO
 +fzJ/ao5B3aMqSxUR21pt+Dr2pc4guQ8qQawYisVVyc3ka9sIp9wyzBvwdwCVLRFoOwX
 f7kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f5YRYhhk
Subject: [Buildroot] [PATCH 1/2] package/lz4: fix LZ4_CPE_ID_VENDOR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:yann_collet:lz4, which was added by commit
63332c33aa0771532807fd2684d4eee4eb952435, was never a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ayann_collet%3Alz4

cpe:2.3:a:lz4_project:lz4 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alz4_project%3Alz4

While at it, also drop the note added by commit
45db4bb08e3e550db483d8745fe8aaede2fa7e98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lz4/lz4.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index 9b9b6198c3..541a03473a 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -9,13 +9,7 @@ LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
-LZ4_CPE_ID_VENDOR = yann_collet
-
-# CVE-2014-4715 is misclassified (by our CVE tracker) as affecting version
-# 1.9.2, while in fact this issue has been fixed since lz4-r130:
-# https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08
-# See https://github.com/lz4/lz4/issues/818
-LZ4_IGNORE_CVES += CVE-2014-4715
+LZ4_CPE_ID_VENDOR = lz4_project
 
 # 0001-Fix-potential-memory-corruption-with-negative-memmov.patch
 LZ4_IGNORE_CVES += CVE-2021-3520
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
