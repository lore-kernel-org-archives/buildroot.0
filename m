Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DDBF43684
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9E9660D5E;
	Fri, 17 Apr 2026 09:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9naHkobK2Bj; Fri, 17 Apr 2026 09:00:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED3C60E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416409;
	bh=zb0Sez702sorpIJ92ffoP9Kq3Ay8nkloEqh4SGVR0C8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TI0XrWkm0Wr8vslnbXcrEWYRSp6fXN7ZODoi8L1Ac5qtJbsFfV4VCUGuZOY53gQLj
	 Ibfre+uz9pWlcVc5AMNBk/qoHl/1NXZA6xNelpGV39FnwosKc5lLoU/kpaCZ/5NeI/
	 8uE/lMpra+WyGXAYgeodq2+cbg2ONcZAmLrZfKQ3XL6jiARwS458QdDALDoUUhWJxl
	 73bitd6cFe6oYx8ToGR3mMXQ6zqvDiDJm98mbDvwYu4ApXamTlgaELd1eiGEi+XRBT
	 SbhTZp7DYCBYRnjLjzWL6zrbT9xXujv/NrWtFpsfvyRiqrAjp/RlXWsL02/i/v/Kn1
	 i2k24XuzzE2qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED3C60E00;
	Fri, 17 Apr 2026 09:00:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72DCC396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57DEA605D7
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_92n0KUz0uc for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3107860A6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3107860A6B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3107860A6B
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso7608015e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416394; x=1777021194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7NBYpfFSUcKfvkAPKtLLdGLcAK6yIs9BBG/h7HSsg7M=;
 b=FIhCEIQKMaSSKZO4ox755H0275Wcy0AmH1z7A3LmLibsxkIpTvy5epZvJk72aBtpDR
 iwHiwDqpDxSA3JqZ7CNTIwmVzlAHfF/Fn2PSBPMD5BWpsuIF0Lt10u5LKpcw2Va8rKvC
 MotQq0T/QIF0mNc5cN35o7a/zs0uR96X34MU7UH7G8M7zCHee1/29sq8E7Msr5mGdwTq
 CoxLAO0lF94Bi30IVBbF/2aqqwWdE/ReAB3iLV7+F7X5ega+BVVA/VFvo19QUX+fLYUq
 nmkzmOeD9IUYeqFIZ5e4XgMWto0GqhDdliinSbHgV86km8X3FHH0Q85VwNPYOFhy2cpy
 ypIA==
X-Gm-Message-State: AOJu0YyjSGXRcmZS0G5oABuTGnXExDIydhBrUzmjPFiSrXFYLngIPPPR
 VESD5jOxl8NFeMievOvhByABzsgW4DFcQZg0SYUcPZxJhJCXkmxmpbStu42oMExhG7nhWVhCkNg
 OcXXvrU8=
X-Gm-Gg: AeBDieuYqk+YkYMx4lKnMKkCPOyNHD5hWEpE+F+8aOYrJb3Utr2vCHpzFoj96XHTinz
 PaLMtXosEViGZvdIIfENXjS/tktZl5oFNwdquYRF1/8CPkrn7mgUHg0MQk3dtVourrwRJ8CTv6S
 hTdQrBBybZsw8hUKoKEMfyLx/MQ+y/fGhQEnajYHU4wmhA6gMOwE4+x+q3odSTm+bdKdDNkZDAV
 UTgEOWY8rbqgziXHdiseC+JVNGgFg+HmpMTjSNdmXr+6rjygIKYnzBHXCzFOjQaV/d10U8bKW4H
 wHMMdrg8oY29qxSCeCjtwOoWa/6/18dmqit+cv9DPmKO+rvHiCZ4Mdn+h1v0ZKLbQhPem7UBitz
 YdaEXrenqAZ5GMKQCnW1Yr+FbovvWs0mb74XeXzKcN20pGFHS1AhWoZ+H+xP6P0xZz/yVe97BsD
 uPXUtJNZMGYYnUP4jyRunrhG8sU+YV0GONn2YpqX1Ku8mepWn27JY3ASntAMOe5Gnx4EHXHDx9n
 Z9jmMdPXN9CJmKI67ywai7W9jVR9tI=
X-Received: by 2002:a05:600c:1e28:b0:483:7903:c3b1 with SMTP id
 5b1f17b1804b1-488fb77fbf3mr25738025e9.20.1776416393921; 
 Fri, 17 Apr 2026 01:59:53 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:33 +0200
Message-ID: <20260417085936.200528-19-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416394; x=1777021194; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NBYpfFSUcKfvkAPKtLLdGLcAK6yIs9BBG/h7HSsg7M=;
 b=eiClZhClA7nICmIm8kI8y2Zy8TN2J5B5gpnOosoczgJ6i+93yPSMhjzPWAIXxVzSY9
 UCZ22MgBQnIWhYn+q84g5QSRxvc+mtu0T5YGIhKvTIgFgrnhF0vMso2UUh7i05G+CYr5
 wk85OLbAtSpoVcncUN+N8CHeC9jBHsMBc3lvc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=eiClZhCl
Subject: [Buildroot] [PATCH v1 18/21] support/testing : test_fluidsynth :
 Bump kernel version to last LTS (6.18)
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
 support/testing/tests/package/test_fluidsynth.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_fluidsynth.py b/support/testing/tests/package/test_fluidsynth.py
index 20d4da0c50..909c878b75 100644
--- a/support/testing/tests/package/test_fluidsynth.py
+++ b/support/testing/tests/package/test_fluidsynth.py
@@ -15,7 +15,7 @@ class TestFluidsynth(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
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
