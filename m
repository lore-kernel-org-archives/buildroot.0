Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0778CD4F26
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 08:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA7D81947;
	Tue, 12 May 2026 08:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZAYhYFoAMi3; Tue, 12 May 2026 08:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B529818DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778573303;
	bh=DrqCEXRRoCLzyG+hOG4+13+EJLyLOf6EBuQ26SbHOFc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZU/uVmkuSe5oTOXhhIfPUo9W3lpc9/vKUidtP1tZvE8az0Gfed39st9mbAZdDTffl
	 nlYLIeXtCOBEfRpf0s2+IAJ7/HXQwwNzLxdRrVTUn1gcRHiPXXPeMYZpUr09hXQnRz
	 Gs7e6LysLYE7EPnDecPFAswLUQEdL4DrmIQIzKav7o+LBxjYOLFvIkoka/baobanJH
	 ueBo0M9NjxhXfNzV0uYN2Y/XZtHVShRGUM3+cgpJdLGRChX6Z2zYZnrt2SO06KJMhn
	 L79qfV8QFCMgjnCkPDr5B+nHy6Mw8kxMy51P1OCVGmQ8W062rQ73I7MTl0kREJwKen
	 ld/f0ajEcmQvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B529818DC;
	Tue, 12 May 2026 08:08:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C745C15F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD11640576
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F710Qrd4bcuW for <buildroot@buildroot.org>;
 Tue, 12 May 2026 08:08:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C0F1A40563
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F1A40563
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0F1A40563
 for <buildroot@buildroot.org>; Tue, 12 May 2026 08:08:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so62102585e9.0
 for <buildroot@buildroot.org>; Tue, 12 May 2026 01:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778573298; x=1779178098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QEpo+dg28cMPqpRiD+vkXUe3CZ8yRpZp58exXD3LDc4=;
 b=XlZIr7Bboawf1lN2zCsMoYR1E+4xLu2s1XwDRB+HhTdOSturuv06qjSnJQQA/diBw4
 fUHIMyFioJ6Qr/RNMLdB4sXSuPgcMLSBBKrduobAotofBGcAnXLVGt6ItC8yjbuzc5G6
 t+URk/Y6Kq5HkfHdg9eJcUedv7Nww1dK//AqfHaPH+4z+lPG7vDXplsqO9f3AnB0boOx
 kaPae49w8sY0VamX8PwUqtLi71lgGASIxrF8lCN5C/PCYYhLPxpC8yfnASofHAw9BjWS
 uwKafcy/euh01KxylGESoBz4FFstTzqe+EzAUxTi/QBRN5vWF95kMjIi0QWEmI4y/vsW
 Wtfw==
X-Gm-Message-State: AOJu0Yy65TGG1mT3buEV2YbJuavpRgGV+Szk8g/aXBTkyx88kkj/og9w
 ETmQE8E6Dfj9qtYudr3bpI7XOfAm3F/WN4e3f3Hkq8s8RGY2EZ2AJG26wJRu1hEpTeL5EyBaWm2
 6Fvie8YE=
X-Gm-Gg: Acq92OGSdRaHAHBWmU2dKG9zzJhYrSXz/8t0Q5Pqtw8hZupi87OJd9mKiTajwkgoA2z
 kQMoN+o/PmNwBzKfi2d4uzkLW2ilr83pXdGRlbAko7jUGEy27hWB+FVsFP0Q3aWBszHpb4m7f7A
 cj5HbMQfns5up9Qle2AdTMofNVYE5UE/QgKddUrxZXEDAzUbg0Gkc8CyjfzqbbVeIhLJblbeOCp
 JXGt5AArgTSZ8oHhx1bKM98LRH5eUry8DHyo/IpgoAWv9kAYa70PiPb41IFW+8TfXJRysceIbwK
 SePK+e6yhxGyAV0OPris+Rc7JcOZeTisUfUKaelApI+25hRGYje0PDtVtEwIZhdUGsKbH0Nobsh
 61H+8iSyKXbBPD11d03HdG61v1JhIQKvZ22sFH+dBELZmr7W/puKN2x7Zvc5A7jIiOK1/dVlrVt
 PMDZ8b2BPEcymK+Ie6mqnTo1nkiRY8c+XD4lUk+igBLPRTTKL4Engtq1ZwmWUVHjSfXaVPOaD2E
 moGC0i+t7BK+n/Nmy8Z
X-Received: by 2002:a05:600c:3586:b0:487:21c7:2885 with SMTP id
 5b1f17b1804b1-48e706acf6fmr227976885e9.5.1778573298369; 
 Tue, 12 May 2026 01:08:18 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549130549bsm31633149f8f.18.2026.05.12.01.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 01:08:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Tue, 12 May 2026 10:07:36 +0200
Message-ID: <20260512080736.319856-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778573298; x=1779178098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QEpo+dg28cMPqpRiD+vkXUe3CZ8yRpZp58exXD3LDc4=;
 b=KFFgtpHu9W+7CR7E0522Zg5ZEdMr8cDFkUx2IoHuvuc21y5h01EDXFvtcymUnypJYR
 eQzs5RyjMuVCxoFkpBxynJrpeDZQEQ24gt72VaZVtnyI0nSg7mqS3XT7WTE7VseFK60i
 qz/+aevI+wWabaiKywxKAcLyAIh4sVM++cyoc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KFFgtpHu
Subject: [Buildroot] [PATCH] support/testing : test_file_capabilities : Fix
 build failure
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

In my previous commit on this test I simply forgot to add the "arm/" prefix.
Since Linux 6.5, .dts files have been moved to "arch/arm/boot/dts/" and the
test was not able to find the file anymore, which caused the build to fail.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index ede7b48555..f57a7cee69 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -17,7 +17,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         BR2_PACKAGE_LIBCAP=y
         BR2_PACKAGE_LIBCAP_TOOLS=y
         BR2_TARGET_ROOTFS_SQUASHFS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
