Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3622AECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFC498149B;
	Mon, 29 Aug 2022 15:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFC498149B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFGhjCVHdpGf; Mon, 29 Aug 2022 15:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBC4781A99;
	Mon, 29 Aug 2022 15:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC4781A99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1D8E1BF9A4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C77960F6F
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C77960F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBdMyzSqqxfs for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 15:19:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1AD660F5C
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1AD660F5C
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 15:19:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id kk26so16344777ejc.11
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 08:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=oSsHUCB9/XbPo23VKNVTGwQdAohefdmYYEoctjI2OiTkkSAx0ISXGo6rWlSLEIiB3Y
 fijeEa8uUqTqPDlnX3oe+DSKYVUzCCKRmQWfVE8N3fC5sWWB2KmN1G2vaFxUeNk2JHbW
 WnrQqtwtnd0R/HfTa2erz0osBiPGjQ0YuLaGn1SXSCD/opc3NhtK99JPxNYUVtIZaaww
 o8yUMnea+k2Xy0hM6tgwQC5XQqDSAzlxsXYkzHTB9/Yxhyu/BPxeyGrnpLAERF5pSukw
 5xJtP1ISKbbwJXfWhFlzV/uq340BiXfAXldExRwrjVXSxIPmhCjKxv2hlKKBMBH3Qydt
 DUhg==
X-Gm-Message-State: ACgBeo2M98eDmEd05wvLMgFWP+2RK+wYwI4IKAxwLhnKlZHhYFqDP5KX
 vrn9t9hNDDZi4DuxuIDol34oOIMG1+0=
X-Google-Smtp-Source: AA6agR5x0hq9YPuaQBQqZ4uxJQ01pd92SOfWNjBjQKz/qytUr1LN11HXtIoPJESK7q6PeJ0/n2Lr7Q==
X-Received: by 2002:a17:907:a40f:b0:730:c4ce:631c with SMTP id
 sg15-20020a170907a40f00b00730c4ce631cmr13397982ejc.362.1661786390857; 
 Mon, 29 Aug 2022 08:19:50 -0700 (PDT)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 14-20020a170906300e00b0073ae9ba9ba8sm4592666ejz.3.2022.08.29.08.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 08:19:50 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 17:19:15 +0200
Message-Id: <20220829151917.26915-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829151917.26915-1-nolange79@gmail.com>
References: <20220829151917.26915-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=QfpItyRLuK9CcQnDpnK/itMWcCAHB3W7SkhznPGbCQB3Nrn4gNKsykSTabAfipxlwp
 WEykaTnYEq4pZkgn5auly5bk31hfOhwtUsOJRX4LcA7yDlE7PipD7NMBZ+Dr3rvk+hgu
 anUPV63fXM+p120Rhk8sMSlZDcuACkakz8RGf80iZ0l6uhHJJMu3pzrx4UNPs18HAfL8
 TJUb1eoxVii1kMXpIJ75kY+Skp9rQf7dLbkPBMjIRHQqBPMQadjnAjCWnXJyqN8ftT8K
 FpzePTPxL7a2flxx5vqfrQsMHeTVSr0vVeNIixVMj4lGpVUxiOjjwzfnpXb16MKv3CpB
 yDmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QfpItyRL
Subject: [Buildroot] [PATCH v6 2/2] system: Warn if systemd is used with
 kernel < 4.15
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
Cc: james.hilliard1@gmail.com, Norbert Lange <nolange79@gmail.com>,
 yann.morin.1998@free.f
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To quote the README:

> Kernel versions below 4.15 have significant gaps in functionality and
> are not recommended for use with this version of systemd. Taint flag
> 'old-kernel' will be set. Systemd will most likely still function, but
> upstream support and testing are limited.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 system/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 24a0e941e3..7c4e1c1140 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -141,6 +141,15 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and targe
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
+comment "systemd highly recommends headers >= 4.15"
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
