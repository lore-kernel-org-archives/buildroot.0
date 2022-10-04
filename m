Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737F0C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 15:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE38640BEC;
	Tue,  4 Oct 2022 15:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE38640BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shpIgQpBLx1K; Tue,  4 Oct 2022 15:31:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB84540BD2;
	Tue,  4 Oct 2022 15:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB84540BD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C57711BF82D
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 15:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAD90827A9
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 15:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD90827A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBMUaaqIAdm3 for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 15:31:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24712817C3
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24712817C3
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 15:31:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id sd10so29718049ejc.2
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 08:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=yY0574qrf93Sd68j0F5oU75iEdycYYNqXoAmlhIgw+U=;
 b=ZD9tggv/jQ0UxurA8zmAPj8WCzWEm0TEDkRg8tBrpBTpZdDmgIK0cmTm9PLBoSDsVC
 qALqcHupm/pgkkkEzfEt8pWN+JsDCPGDOGc6q7dE1F77a4cb7Ra31Ed2GyrONB4WdDeA
 49NSSUXZlKqpw55RTpFOwG5W4uDK7Gqmssn/4wcQnaSqqXq7hWnt9mTmfbEdP/iq2K3C
 iA7vW2KqWjO/dx+ab2tC0TVpxeK5DrP/EfPWgT/6i93zNoVNFS8Q3epC/zVesIq+nErk
 HBN4X4ivBLfRaXdqlk9rPWbIwYhwqL8tFa99Erkp90jW9EhjQMiy/mH9ra0uQ1yubyVV
 j6pg==
X-Gm-Message-State: ACrzQf3M9OUx/jwiIjcBHUDiMkggOhWNSHmukaX7vHqs0z/MpRmMERL5
 DRKVqp1f7YRv+d6aGIsYFbsjjr1VFvPM6w==
X-Google-Smtp-Source: AMsMyM5UoEjqsi6/Tz768y8QW5llaKB0dpktwiXfJLzDVVtLy6KES0HO7mpu0O9b+ceWcciWXTncLQ==
X-Received: by 2002:a17:907:744:b0:741:36b9:d2cc with SMTP id
 xc4-20020a170907074400b0074136b9d2ccmr19125882ejb.613.1664897461910; 
 Tue, 04 Oct 2022 08:31:01 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b0077077b59085sm7237486ejt.184.2022.10.04.08.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 08:31:01 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 17:30:56 +0200
Message-Id: <20221004153056.486957-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=yY0574qrf93Sd68j0F5oU75iEdycYYNqXoAmlhIgw+U=;
 b=oCgCtzQvckSFhtY/El1UuxFx7oD5fJVO/l6u4iein1wmh42yjhbhk4gttokhwdvMPt
 doRHAqPt/HFiEUHAZz2v4vtBsW9fOxWxQnCIkobb4x88jl2vcC41MCmu2Dhu6mROKcPP
 FQHC4GGeSTZj89kgUHS6kfIWD+tek/jKV9+T4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oCgCtzQv
Subject: [Buildroot] [PATCH] linux: update cip/cip-rt kernels to version
 5.10.145-cip17
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in  | 8 ++++----
 linux/linux.hash | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index de9bf0ad7a..30e117a6af 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.115-cip7)"
+	bool "Latest CIP SLTS version (5.10.145-cip17)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.109-cip5-rt4)"
+	bool "Latest CIP RT SLTS version (5.10.145-cip17-rt7)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.17.15" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index a1b7984489..0bfe9652b1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,8 +8,8 @@ sha256  2283c1af5373c43e79adca6987174d932989a8b2551405e83e2e39ebe31e06d2  linux-
 sha256  70f4df21901a654632ebbb533884ccaf117a29b14e6f2b672f0c36613c3e897d  linux-4.14.292.tar.xz
 sha256  eadd13aa70f37cdf50eef45c5964bd7146d353b61a1fd026d4fa0b2a68a3ea47  linux-4.19.257.tar.xz
 # Locally computed
-sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
-sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
+sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
+sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
