Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3FCC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 07:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1260141A49;
	Mon,  1 Aug 2022 07:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1260141A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s335UBd3Oppp; Mon,  1 Aug 2022 07:41:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEBFB41A3A;
	Mon,  1 Aug 2022 07:41:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEBFB41A3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05BD21BF3CE
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 07:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E222340220
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 07:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E222340220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLekXogVIaJP for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 07:41:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2902C4011C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2902C4011C
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 07:41:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z16so12953343wrh.12
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 00:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=4w8s2in4dtzGTFhJTl9PKNq5ZGnh8Kz4aLArxRphFwkpLZwGyGltgsi90dbpWyWrxE
 VIuPX+oSiRrhU1EoRB9ExQz8UelIC7KLVQJrSU+ovwuMr8nRkH+bie+y+NSuiY4nx+CV
 heF9Jz8Cq4gEw/J4WH1+PmLzR3xdNAOWkMd82uSDTT6ThO5HmajCx1fPfIXqUAVKCpYp
 x/4YxaJzkXh6clTZcVSzvSgDpvwCi+KvZ/oU7IFC96+a2OSxdTyP1S5aWv2mAjSnBHDc
 N0c1tsrNMWuTusI7KRYst5u/MIfp+UstJBXIRyZW+SA1OfFxUKLTKMjuR0gdV2tepkE1
 /oHg==
X-Gm-Message-State: ACgBeo1PZiE7BJuRa25dTTW1FqQq2oAQUIpOSotzyrkNFbet9kAqM9w/
 U2zaXXKaNhxJ9qdaIx7KVNvCvAcUfVE=
X-Google-Smtp-Source: AA6agR5XeQGZZxeeLoDS3FQbaEPuoz+Qa80HExa4OKMHp6CIeyQR2x/q35B4Xt8z7i1QUH8zj/8i5g==
X-Received: by 2002:a05:6000:1a87:b0:21d:b5b9:7666 with SMTP id
 f7-20020a0560001a8700b0021db5b97666mr9470402wry.1.1659339681201; 
 Mon, 01 Aug 2022 00:41:21 -0700 (PDT)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 bg26-20020a05600c3c9a00b003a3279b9037sm19041606wmb.16.2022.08.01.00.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 00:41:20 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Aug 2022 09:41:03 +0200
Message-Id: <20220801074103.43325-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220801074103.43325-1-nolange79@gmail.com>
References: <20220801074103.43325-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=RFJFWUarHxleOYCsdC2jM+xdJgDelw0EAqNWpgRu5BrjGPzmqL7pGE5zlM2jVa/LFa
 yNdpAgjtAVmloxtFFg0e3glUe0p9ZJF3NasocmQpI3gScUOxgEbsgWbWoSTDDKgW5V63
 kDQIRHKnBwf8ipEQV9uCuRLFJ0S1Lg2vNnoCTDRISSl33l5ZEiL4pVWAo4rY1cNcWkol
 oh8WMXfNBhWy2ntmBSEykpyLzh225v2KMzLnG4BllkmRTjpGgdCtQVsYwIvTAbA4Aove
 Ghe/UxM+R+FT41wiu6+0yqdZbjUb2RMcGhZzS8hzPNsygVRxQZfKCDEeVetxzvuSGIjB
 7JEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RFJFWUar
Subject: [Buildroot] [PATCH v5 2/2] system: Warn if systemd is used with
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
Cc: Norbert Lange <nolange79@gmail.com>
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
