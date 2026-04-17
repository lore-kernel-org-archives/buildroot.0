Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EDBF43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8D686072B;
	Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpcqIsgFMcuF; Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1A960D71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416395;
	bh=SoQW7NsVCU2sy7ZxqVnE86oDFE4UpnPO44FDuqbWWOo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jLvK3TKP6zj0wxpfdsiAXq3g79ULGMYfpZVocgGh/t3WPJJoDpn8BmM84+JRNG+90
	 63w7Nx/93DBo+6W122A8mgasqDuLGXOV+1SdLVEa7l7gnPNllL7m8fjs71fB1JghZi
	 xPVvpU6GmXWZGeemBpsRRGPUthA/cGr8PqFSpJTtzOxK8nPXWlwASTXOkOd4bi1xbF
	 HZhd0EaCr4wIYG5Kv+zlYpHIzvsALb8Ge2/kczBPEjAyy/GXmrgtfuptwgkfwQVrMD
	 ThOn1JVe6iaPt4nB8K7zzxp1ihBbmVH3cL9pNfmqvNGBxjQghlxh5LrgAATQmZXrPZ
	 X/D8yYH57yD/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1A960D71;
	Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB3D5259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C1E40578
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-aV2diWTTt7 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C59340015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C59340015
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C59340015
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso5885135e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416386; x=1777021186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3TfkcQ2JUYqW8+ouHobz758pYSq5vSmGpV2vx1GZpz4=;
 b=AXX4oauECKU9J21gKl79/dzrX/Jlg8WDC7DzNk10ARqV0gOlwfSSrQOqSaq+i04O92
 jpzknkIb+HuLk64+y0/N5AwWxP8cg3dtYygpvVNmgYZePaAcwRwWJ1QFjSe9VzmZb8Nx
 rMzGwcAW/nY7GRV4zZ1CIE8H0FJa+fb73V9zgRv+52IH10Vnrzd/4mXKuV0N2lLvNfmS
 beoWIFI6EzUGvdalqeXpYVh4sGtHeAb/D6VOY7Vm5ClouR6pq7rKPa4LEg+ste+u0b0a
 CG0WhsDTdQslNShSBcvBAlL1MHsu/hdoab93CfllPNjPqxSQp+NLV2KI9T1hAYM30Ti7
 aKOw==
X-Gm-Message-State: AOJu0YzYyU7YQ3GfabJH1+/a5X9QfvxZpC+SwGBHNf4bSo6unuhH6dOM
 kx4NrG/XXRXoA/eHce4ooe1z+f9yxEiM9SLgiiNpvwsAadFIJjFKZ6WgH+3uOgalA0AFtz9ZRUq
 70R/woXU=
X-Gm-Gg: AeBDieu8/Oe13hS/gThOcV66J9i2hGPELNd0vDsfaT9kq78ykdYBreACF0DSOKnWtRs
 oYCkFs9h+Yr1E6pSnML887SV/vj5rYaTkgUr284kdPPlmQCdyV4ZSItuSU4uTUHGKrX8pilCQmK
 bMy8nN6biz5O8CTHsYEV8hPdQs7U8uE3swk7dPMsAxcc0Cgu7cbqVaitm9abKot793hAx1MNpiK
 JhSmKhrjpByeKCDyVMKG+mDWU+vCJTnCUnuErFcPrkIJbC9BhIy5YH/Ui5S8hx/zOj2iy3+7PZZ
 9EmiigDmeJoMeDZy8A+abPG+OOfDGPm9bE5PRxV4cqVVblOB2xCaMOZPFwvZaipF6KNSOI7swtp
 7LoUT6bAPHbc3oWhLiUEaDUiTGQ6PvOZmiDlSpKJIXW4Uy1ngzIQjhpKtEXMWZLiJp4TM2k95TU
 tSlaHw/DwNgmWgZUy5CQKEs+kvlAYpodSFhtVQeHPC5fLm0X7pdIRl98P2AhCY/WYbd/Ql2fOFZ
 2haLg3QJ7U9W5Nr9cYw4+qBw9dJv+A=
X-Received: by 2002:a05:600d:8451:b0:485:4388:3492 with SMTP id
 5b1f17b1804b1-488fb743c43mr23507095e9.11.1776416386076; 
 Fri, 17 Apr 2026 01:59:46 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:45 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:23 +0200
Message-ID: <20260417085936.200528-9-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416386; x=1777021186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TfkcQ2JUYqW8+ouHobz758pYSq5vSmGpV2vx1GZpz4=;
 b=FbRh0dFfUBEmlb0EM3HSkKzrDpjxpokH5QlB+rHHuHYf462xidWLN80/Wk3xvDEv0B
 aGEv7D5GzKmNnXMlZHnLif5VqVjJfUzSPYpCyxzRFOcYdEaTBpDIDataR3iFdCFyqU5q
 XtinBwbCp7etxpFDjBr/r+3CgrpWKyMmSP0x8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=FbRh0dFf
Subject: [Buildroot] [PATCH v1 08/21] support/testing : test_clang : ump
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
 support/testing/tests/package/test_clang.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index 6df8a71530..bc44a5804a 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -17,7 +17,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{va48_fragment}"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
