Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB29F43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2529A60DB7;
	Fri, 17 Apr 2026 08:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwYL3DxDhEop; Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AD4360DB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416398;
	bh=F6/rBeBK9WFmK5oNQjp38evTnw9s7kB5A+iwk7hOFoM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ht73NwdhLL82sFOjxJgEeSHwI977iFmGqbrtrBkTlHjXisLK7MhyTImO6+pua6q76
	 2DREjQ5qPepaxuUmB4Q6pHrXl3YYB6pFzBhJxxlT4IR8Fqx7loOj+PlY/5j4nGcPbO
	 3kgPTmemvBKdd/HvGZIlgixCn3veCACWIH0+5M0aiQwApMDwYLgxrrg5RiJe1UQ8HJ
	 aWhkyF0FTtWM15PAPXagND33MsRxxemL5Lya9KF8vaZ8pJPz/xuJgFsDszv20k3SoZ
	 pXk+y6My27A9uu6oeQ3Ot1x2wPhSGfDG34d9aYmQhWxBLhQjrji+FvOJXLT1r4Lr46
	 n5kKsudljabcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AD4360DB8;
	Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09D4E396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F047240578
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEH1H9Gx09jq for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E22F740015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E22F740015
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E22F740015
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488ba840146so4611695e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416388; x=1777021188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0T6ZBuZIe39uBVWWmywNla7xZQL4ltuHQywouaYHDmE=;
 b=VC+BbyZe9fMswichUs2D6ZrPxL39VDREC0AJ/IFx/BhZd5HREk8veGe66fwYt6IS98
 07xeUMCjqv9FjTBB6b+QVue3HSrGTLSgP5ER8qn1PXDbGzLmG/cxWtKXjIuq9+h/nFUY
 BxI9K5uqtCUp9djjQnW589ZVHP0++r85fyVZMIluUq3Uw0B3iIWGLj+NVoQ4weuZWul/
 L6NkXI2G0vXp03wSRIDc949pRrYgwwsqkF49S0fZUhJIkGsB7AmEc3MEy4wPF6+UWfaP
 PiopMK2kafDw97Kb1opDAylnob93C3a0NxAEt/noyIKSnP6tRLPh5z8HLOdhbq9cIxcW
 oriQ==
X-Gm-Message-State: AOJu0YwU7B676kRyU0FOBl6Wl5abxygMBOZkeFOKLU5VD65zl9CeUksM
 29j1G43q9IgSDYRa3im8fkRtTClbQMvjbQc/AoBHGHZCD2gwSxBKhAItsmMSa/Eh8zCAPxzv9JV
 3kMRhO+0=
X-Gm-Gg: AeBDieuZgg9Htb2TIUKmPefLGnESG8Nxy2eD0X/kSgGXUKphFUjy96Y3+6dsoGRsb87
 41OUi8jkG3d+uu4bFjK812Xf2auKvnqcCGtXiaeeLiR2pLbXPy8HkyW52UQZnvnaCuM7gIjbVTE
 9pDSouKye7+Txyz0gMYs+IHeVz84Hq02+beAx381ke6aTTuRjfgghJ/X8IA9wVlb2U2GTEsIeo+
 wzja8xSsQzmZG4MWgkFum8Hi5/PPtlZp7P4BQa50gdaa+936RWAceNXpVRAdjQ70Qo6/WGGXGne
 F39MEQ1NMLfYZtHsHvYyj1A/7NdWz9vFE1qtU2mFjooZxRAHwH4o0vXnAjq9U8qQ7KDlp+oiO5R
 81JIUS+HUHH/cRbeWMAoVyZVytlNjRxq0G7kMxXpSr8loMi1xYssCho2bfMkAEXBub4mfJMztSu
 krFAEjXzMyVQ9XK2XYa+ZcuvzP7fxxUFUXAyQXTAejLpHqXg+N+gzkT5cS/yhnMisJ3nUaaTNHf
 JhBtGUNaPX8pXiBL/o2puuah98ovTTwwzh10wQrBQ==
X-Received: by 2002:a05:600c:c085:b0:488:c530:48a0 with SMTP id
 5b1f17b1804b1-488fb784843mr18989445e9.24.1776416387732; 
 Fri, 17 Apr 2026 01:59:47 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:25 +0200
Message-ID: <20260417085936.200528-11-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416388; x=1777021188; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0T6ZBuZIe39uBVWWmywNla7xZQL4ltuHQywouaYHDmE=;
 b=YD3ArfDIDtPSr3y8vDzHcNVykQnmWrjXx7zJYhly1BaBZC8rmSDEFfpiPbboVqtcI0
 Eox+BybV2FL6tExDt0KFX7KF8L8uzjxQWvWeGxH9LJ3UJKW2bOQBQj49FYlImogfNJJw
 rrlWbcT1vlxdjSY0UnSlNCpKPdlzXpwJ8wtMc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YD3ArfDI
Subject: [Buildroot] [PATCH v1 10/21] support/testing : test_oci : Bump
 kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/fs/test_oci.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_oci.py b/support/testing/tests/fs/test_oci.py
index 0ecf58f626..38ed168b62 100644
--- a/support/testing/tests/fs/test_oci.py
+++ b/support/testing/tests/fs/test_oci.py
@@ -10,7 +10,7 @@ class TestOci(infra.basetest.BRTest):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.61"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
