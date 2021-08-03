Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D99C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:21:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CA2060F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CA2060F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2E742557;
	Wed,  4 Aug 2021 01:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unwyGvweu1nt; Wed,  4 Aug 2021 01:21:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A32EE42555;
	Wed,  4 Aug 2021 01:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8B11BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 988F440599
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4z7mXzdQ5oBM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D543F40592
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:53:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c9so6525601wri.8
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DikfubKZfOKtd/YXbXode+h7pyl3jNbGXaCYgaUgXXM=;
 b=qEOPCvof8VOZNa9fVsvCNueG7OnJSCuKVEPYMhbLOQTR6SHajGEouLvQnFLPasjL/0
 TgzLHADet3HcnoLoFlsJxauAjGMw9T4sc7GWz2nBTCF0IQdOGwqo89j2yR0+1cUcEfe3
 1gQTmPKLuYElUVx93//XY3mFepaqlN8s+gWMDESeUyZuoYJ1b/2fACiG47dVwbn7hBEr
 Rkqlnr/WU5uIjChVnNjwXC/GCN8GY0kTO7I4FhR8ii/hvfXDCnVEbmFQxIRvQ5GNRArc
 JgmKHXvjz7gDd5sBHdUFsouchtdr+2viYvO9KrQM1k0PGiKW3/X7Uz7THHFXkFb9s/2F
 h8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DikfubKZfOKtd/YXbXode+h7pyl3jNbGXaCYgaUgXXM=;
 b=ATcBVpBUhwW2XxM5t/+VF7d/Pxw06ugUHnum1SkrqsA2o3DXnU4SPKVVH++7KTheGl
 SyAuNnKlwZ7aeKg2djXJ9tSmWeIQWlaULPdlQNVzKLrBKHh2lovAP48nmq7nIN8/cHES
 LL9vKsfkiq0ROTXSAOodwkrteE2/hR9ppq3XY9JsELDSMcCuDM+4FDHUwzqvpCf8llrg
 B1Gi4VdmJn3UvncmXM4iBrHRYWP0opPmanmXFOteT4/PFbvupa2WT1MjOdxKT/ebbkkY
 JxaDfYUUZ1N4n0zImJBA1+FvC6Uwc/SYFby0EhPtUz88onVVVTWzEUUq+X7CwEs5PRSn
 p34A==
X-Gm-Message-State: AOAM532YUL4HnbVCL/luSJpVoJNr007Yuc2h+YNdy73ofsh4Pnhw/O2q
 l9juMhyAi38KhGpsjR0vzeJzPRCKn5fbvg==
X-Google-Smtp-Source: ABdhPJwJpHyGvaRYPoaVEJFL3xrMFbKAH7omtx2u0gmUpH0EzHbl9FtihT9C6Pd3MOHUjb7M7+aqTw==
X-Received: by 2002:a5d:4d0d:: with SMTP id z13mr24566692wrt.34.1628027585881; 
 Tue, 03 Aug 2021 14:53:05 -0700 (PDT)
Received: from kali.home (pop.92-184-97-75.mobile.abo.orange.fr.
 [92.184.97.75])
 by smtp.gmail.com with ESMTPSA id z12sm206038wml.18.2021.08.03.14.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:53:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Aug 2021 23:52:55 +0200
Message-Id: <20210803215255.365894-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for pcsc-lite is added by the services/pcscd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 3091da41a4..94f38b3d85 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -11,6 +11,7 @@ PCSC_LITE_INSTALL_STAGING = YES
 PCSC_LITE_DEPENDENCIES = host-pkgconf
 PCSC_LITE_LICENSE = BSD-2-Clause (auth), BSD-3-Clause, GPL-3.0+ (demo, spy, tests), ISC (simclist)
 PCSC_LITE_LICENSE_FILES = COPYING GPL-3.0.txt
+PCSC_LITE_SELINUX_MODULES = pcscd
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
