Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D59F43682
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A86A60D71;
	Fri, 17 Apr 2026 09:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CPUeb7e41m5W; Fri, 17 Apr 2026 09:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A10D60DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416402;
	bh=LrAxW8a5EU+JY7Kc3ZuDZGqbNgp6F7mPW8ig8WxgEgw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y9XvqZBWXL6jRqlyaPXl/2x10r//RjdyK4TMaPrqMvHxBwBfrzEGNDDixnyEMNX8B
	 cwIr0ekexBH70VNNEjHI8SuxQCUfDxNTpMvpW87qdOUVOcp+1iQPXPOo0GzL45NACy
	 wAtLVkPzTV+s9bBBxW/kubdOk82ST1/Sd2SaFoz+1LDkoFNll+SjYSdlyxeYZEEsJ/
	 eRe4u2XBCnD5NZJjUJbm9KY+NEoURJQoEc1+LNrAaiIGG/VO7dTm4QENqkxw7AoqTE
	 iUvyEXiQjB4rKIXDaEzQTdAmdqgMqRs+NDf//vpxYEXIeRQ2Eqt7c3nsR97mIfBKHB
	 mqQmxhI7rvTfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A10D60DCB;
	Fri, 17 Apr 2026 09:00:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D97D396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72AD540D09
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBchkT8oUobO for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D4A9A40CDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A9A40CDF
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D4A9A40CDF
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4887ca8e529so3346705e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416388; x=1777021188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vh+Qq3oQLA81VeQFRICcoeVVeEUYqZBVMHMFlzupCaE=;
 b=ARsRljtMpcXmNd2GipT6aWDfbGXjpdDlgFk4VL+JxlfgDFnauAoheOG/5L+a8iaeJ1
 CfnQdoxWVgdLQ5GuD19F14wA1GFkoq4q/AS0zBawUgsI5an2xKfe6HJA2mVUE/hBJDx/
 8MIha9U9ggD3ImywLNtweINtl/1aF20gzvXRzovVrxfKYHehiFzh9ErG9/DOCP67fQIh
 9uF3Jz8k7rTq4+/XBZWUxtM3ilsLRblbVg3CD0CUedVA0yQEmg3ohgiBr6O73QastpOl
 s5DmC0W7dSxGiwdHvUJhXuF2D2lBmoTltoESLMwWQDXuJZ9Op4hyMR4xinhMl23CQNcX
 vvbg==
X-Gm-Message-State: AOJu0Yz/utVRELFKEnI4BYC2vSE+h5DPzvdxgmSiZlphhY4PMOlBYM2I
 trz1PjGUBOUgUQLy+pkw067PFKNe5RFvQaK+gKtdl74qgVp7YRNIlUQ8EgAEHBLfL2zwyKN0c7C
 sjgR3Tog=
X-Gm-Gg: AeBDies/iH2j9JihvT4a0ymMesefOSfw2mZN2ao+AhEx+9ci0XHkh02qz+qjUNky1HC
 tlPWb1IYuTPyyZ1UU7/BOpCcQDMW+5wl3Y3QcNoLaDcZg4L+GxJlYFHtfrsc+WYzugx0TaDXFCs
 xUx6hVkrBHwc+w54IM8gc+dLwhEvQJDYQ4kxyYXNqK4enzXm9wvYNcElt+sdIcT8MM42X3H/+8F
 VmjrTmJBiKEM9W9xnUmo6GPg01y3/vTDXoQt/m99FfVYir58gaQP8wi+OoV6MX2Ugj8aiyMyWre
 nMFNpPtPTBjulwXLPHwudZ22v6uvK1u2TzmHoHb6ImwFmiYXR3ikDjcrJcNSZZ94dRdXHBa7Cow
 wsB3uSSbgAUgJ03BgU04vSrQh3Zyzxo0wmB7qEeyl7wFpTIjHjtr7irJuPdvkSsp+cdUcTLInxC
 kdrndvKNa7wEaMHieKUgnVN92cY/OmZqjm2HB1hd9v8N/A8E2XtVgI0CHrKL/DsQowXUgsZpl2V
 XF0GQF6w/qoXMIx5oNRlLCrIQwxf+E=
X-Received: by 2002:a05:600c:4749:b0:488:c6e9:1e0c with SMTP id
 5b1f17b1804b1-488fb889385mr22681205e9.5.1776416388584; 
 Fri, 17 Apr 2026 01:59:48 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:26 +0200
Message-ID: <20260417085936.200528-12-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416388; x=1777021188; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vh+Qq3oQLA81VeQFRICcoeVVeEUYqZBVMHMFlzupCaE=;
 b=3gFxv1EkdT3ay+jWJuraoiRA9xj7hFSr1AYw16dWWyfGAAvONTD4RW4a9fprACkOAe
 pM4KPMMnvG+OlEIeTQ5lvb1sHmvvLTmlq9+/v698fwkYynUuarEmTuGFeUPo3eodnIAY
 EIh5gGIUQ341GrSl8wvJPgNO1uaSyUaYkFWac=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=3gFxv1Ek
Subject: [Buildroot] [PATCH v1 11/21] support/testing : test_systemd_selinux
 : Bump kernel version to last LTS (6.18)
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
 support/testing/tests/init/test_systemd_selinux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 398cfbaa82..c3ed09d0f1 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -12,7 +12,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_INIT_SYSTEMD=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.148"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
