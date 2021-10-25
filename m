Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46498C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D401160F92
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D401160F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9236740146;
	Mon, 25 Oct 2021 09:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfetCLLgV5SY; Mon, 25 Oct 2021 09:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BA440132;
	Mon, 25 Oct 2021 09:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD391BF38A
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 195206083B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkPc55NbTwv7 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:23:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79B3E60737
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:23:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n1so13673177edd.0
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NXTplUkmjwGBQ4zKrC4ztfgEDv3VeSP6EOEPsuG+DMM=;
 b=fTElW+w/SpAmaUhEtXiHIMh1qJhB4IZRi+znKD76QwQxIpBLYwzBrepVwlFQ1ZL/5s
 dUsk/LnfJ+45hszoRpL2nHk2AnUTiB8qG1iVJFJlfBUcB9tperckCnIO/aZgznqMEbx0
 usBZ2PX3x8rKUA8jWoxL3S8rE6IQxLQ84CmKMTIkTdNM6YvvYyGAWrnKvzd+GVeJaLYB
 LpZPE/i2nogwy1R6VFTKrVkSLSf0MXzuErowt4eL36fe22JPppGO5/MuqYRG4nnATQew
 vEnEwRBHhZQezd//PUC1xWPDlaBH0an6aQC06eN8GCZgDtqaNjougQUYys+ZcWQEn+VG
 Wqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NXTplUkmjwGBQ4zKrC4ztfgEDv3VeSP6EOEPsuG+DMM=;
 b=wQAJiRDDxkgEM/6UmUAZXgNvgSLjt+FmTUW5cqMm6aMIgrtdkpko6cnwzwv7foTypd
 8lzIMK3vTLFFudxuWwLj8Fzx30fgI/sEq6JPvxO4dg2Ohshv1Y/FBuMrre9w+q0I9+/I
 wWKuPsougRHWFgExDuo9TavBYAtnp6Q4uhI3qsrLLxLjy5uQ0j3cm13ODpqH8O1J0HrN
 kT16TtWPQbY+sHcDyN4rHOU6esODaljQyCm1XCJNGubQwlACaYSSgsrIKXZzvYRsFQH7
 CmwQQmvvsKPtf9Q+aZmEH2RBnpdrPPK6EkLk0CSPcBEXB8sKmVTC3houGeljZT4Ksy7n
 tPlA==
X-Gm-Message-State: AOAM5308A6JhAsTIRcYv9bQIA77eW6as1zx0UxKbUbWQ+1vcPw9CWvyI
 Oyv7xwyTf8iTVbSyXVzLlVDei952Up1UAWbKVkO4Sn8=
X-Google-Smtp-Source: ABdhPJwe3gXe/sn2Zyxpv7i8rkDIpcnYIxtDYb0HK+nCn6XJsOHCE1RE9Lo8gFygytW3emo95utgXA==
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr24938212edd.48.1635153817267; 
 Mon, 25 Oct 2021 02:23:37 -0700 (PDT)
Received: from a64box.vcn09230954.oraclevcn.com ([193.123.60.7])
 by smtp.gmail.com with ESMTPSA id e13sm7061320eje.95.2021.10.25.02.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 02:23:36 -0700 (PDT)
From: Urja Rannikko <urjaman@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 12:23:31 +0300
Message-Id: <20211025092331.1990927-1-urjaman@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] syslinux: define OBJCOPY and AS
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
Cc: Urja Rannikko <urjaman@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes build on an ARM64 host (and i assume also
other non-x86).

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
---
 boot/syslinux/syslinux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 0643f85a99..2df415fcfd 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -60,6 +60,8 @@ define SYSLINUX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		CC="$(TARGET_CC)" \
 		LD="$(TARGET_LD)" \
+		OBJCOPY="$(TARGET_OBJCOPY)" \
+		AS="$(TARGET_AS)" \
 		NASM="$(HOST_DIR)/bin/nasm" \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
