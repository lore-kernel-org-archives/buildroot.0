Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A27F43682
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A4A840291;
	Fri, 17 Apr 2026 08:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNIu1LkaS5kp; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7B9404F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416397;
	bh=KDJTN2CZd0qKM5F4XnXBsIyztn2Xv7J6EoFcK0THlYw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S3Ue8bPRE2SHsDa3U540Ys3NxOzKLDDd+SgeBDXCLWvwmVo4pPHRj/flnim+/Slds
	 tmzT+wwkq/f/+6QrIPvX2UMI7lMuKt5HlOqRPfmu7ALu9pC9nwbVZz8OPipSUf1MQA
	 +iWIHfdlxpghJUW033KucY7/3Lslb9aQbPf1weNzyErSKMaaLmmyX0cG1R7gmmNq5U
	 R/YjEEksITYEuFymduUT2j5Rx0wNyPAfqH8v8PZHwb1/Qygw+B+VeknDU8ZJ64QbE6
	 CVJtJfsdNgukgWaBKoriEGfzvUagH9DeYoPgKIi4lGr8yS4/MAghS64nMQh0AKdo4r
	 VqY1zf2btxlDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7B9404F7;
	Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D000396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C13F60D79
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdRJhR9n_NPJ for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B9DD60D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B9DD60D86
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B9DD60D86
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso3764545e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416387; x=1777021187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3KpipIKgO5Fu99J/csDOc+WbAbeUCK6qP7CC2HNsjq4=;
 b=LS7b8Jpq2c24OF/uZCEGMX0S6I+MsfxZwc+PuKG1ynIzMQ4pXG1+Q8arrArTM75/K5
 /gVEQrtdIsH9OGnQ/lLvXx3rb1A9A7IfOCDj7Hj2bdc+0UP0tZVJciT34mUuaW6Zr4R+
 rI/qkMVY85WQsh2dYuNSpIH7H/qVzaLhDfeSkKGfQHKq8ZamzjikZxZfpKDvCo2A6e7G
 Kp6WAmug1ULDP6LQOrtTzGbI5DpPIwXcm+qyUmXmXI4qk0iQE1fz5bpJJdvc79FAZsQz
 jvGrEIhhYlPehOVdkvha/06FrJcocXQZ/Fa/vP5CKUyerwewnOXd75B+VsRmDm1h56kR
 jOxw==
X-Gm-Message-State: AOJu0YwQeGEDgIXO2XEVWPFsP0TdG1M++C1qFN6X65Nyfj5Db/ie3kPV
 KUc2zHl5D5QwwQFGcnc68oCnzG3pxcDOxwC5WqwTf9XdfaHL2XTgndT2spwogSVc5iCxdEkDmXx
 IEr9/y1Y=
X-Gm-Gg: AeBDiesF7HetChKo1sf+eTl5lqtFhBx8nUlBh8PN9ii56wNDRnnZHT3C4fECL3nuYH7
 1sntAgFGixctVJB9GuTXBvzLo1r7q0pBo1/UKATD1GiTl8WnePJNAuZ/Qc358DEYiO0Ckit6Lyw
 GocsNt8q7MVVJ7EEn3VcldDe4IgnoVMj4317Ltv6a3B++xpWdolvLd1GWvBlrxeaOODJM2hr5O8
 g46VWm9mdnBZ8PS2Y8sbxzBbTY+wFgOs0y3bYDCeogNNXbGTfsK1h0ec+zpZYii6KxoETIDpTVc
 PT6h2nsmiWNNJq1VszOx+Wl9DK1pS+mQxiB0gVE83qx230kLEC+nfcuqDA32u2uPADQZs8s50lf
 +ysHKpnyrLLKgRljW/t5q76mCgW1vvSxL+g6g3/U6UjiSjjnmZ6XwOsh6+PATAbAgDNgsGwi5O8
 20A7XQdp/Me1i8fAx9aYeD4IB6G4rcFsK99nImkl1Yxd5jl3gE9YDrg6h5Dep7G0g6kZgUjc4Rj
 5WtWTCJShgcbS5Ak3K5t6ghVBPHhoQ=
X-Received: by 2002:a05:600c:3513:b0:488:a977:8de with SMTP id
 5b1f17b1804b1-488fb77a3a7mr25291865e9.16.1776416386902; 
 Fri, 17 Apr 2026 01:59:46 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:24 +0200
Message-ID: <20260417085936.200528-10-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416387; x=1777021187; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KpipIKgO5Fu99J/csDOc+WbAbeUCK6qP7CC2HNsjq4=;
 b=0Uq5AzZJ0TOUDcQ02bMBm5W8Pr9BLNj1tr6BeTAkVatWfHwP/gxwdrO5UZt58oU3jQ
 MKRpuVYdRZlO/ld61MDguBCHW4j/lrqkGT8hMvGK7XiNa6NOFXL/Pu/m+61E8g7WQTTw
 5nvJ266TbzuyMrtylE3xJVBlxDhpojOPKgpEI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=0Uq5AzZJ
Subject: [Buildroot] [PATCH v1 09/21] support/testing : test_edk2 : Bump
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
 support/testing/tests/boot/test_edk2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 316eb616ee..8489e82860 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -17,7 +17,7 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="support/testing/tests/boot/test_edk2/linux.config"
         BR2_TARGET_EDK2=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
