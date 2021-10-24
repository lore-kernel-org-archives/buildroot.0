Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D43C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 22:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E85260FE8
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 22:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E85260FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BED660841;
	Sun, 24 Oct 2021 22:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V7ookRfHho0v; Sun, 24 Oct 2021 22:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805F660832;
	Sun, 24 Oct 2021 22:03:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE8C01BF315
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 22:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8CA4027E
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 22:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2DRBdNQH85Eh for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 22:03:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94D09401DF
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 22:03:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g141so8745956wmg.4
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 15:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4/VDq1PTq8pYZE4A9fNyhf7dSzeqiFnRuYm50IRZ8A=;
 b=AacxN6smV9FIOjcmDN4MIsbCPtnBZmF0RobYiV66FBSGVKJ74kdeO0TK2PBEtsxZzm
 uc+gBP63XvUkaGADqgkEqUW357DAlM1tMsIqtzr/zgoJryJPLS5cj26hSuJR0/JcstEH
 HHtPqMR/MhtzBzTniHnlTRvH680v117rWfgGnP/5jfu5rZjigprpZ58bsHoc1YdHXKKy
 TeiNtzypuAu0q4bNcmW8DMqMW2C7tfC0+vpbnbHdMm4UO/vP7uL6w5dkwUAHhP/nki9P
 y6xYfi5wWudlT3U/i+6VtdADk1rWiA81WI4wt1aDyarI6IhhXARY+9wDAytqfpnqVOGh
 GThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4/VDq1PTq8pYZE4A9fNyhf7dSzeqiFnRuYm50IRZ8A=;
 b=Le9YFC+qfUG8yeVqVSwwk6abaW28ydhi/KLI0AZRy5VMDn2ZzUL70sRuEF7mBKjz4o
 VcEauGSVQHpDyma2H4a5lYmxW+I9hlia5Qy5A84WUmvhPeNj/REHKTpsyYL1h1O+QL4m
 ZtCNufe75fWuFSgFdBZnGUffcVmZO1PVxriQdaV0Itr0VXqOrICeTg+NAmPaOGUh7ImY
 7zRSwYsGps/oCJ8fV6K7TpHeaABQao0ailwDUQ4q61BWz2E0Q9R/r7npIGpUOxHeWXCt
 TR6HiLRp2LqQ4Ygf07iUu6DmcL1mPtlqqG2MHLvFpScLqv9E5tZZLvlehx4QKigszySZ
 ud5g==
X-Gm-Message-State: AOAM532VsgnXPU/BuXwd/S3sovF7/Co73jqXvaKc+QfF0jIrAIEr52VG
 xmS2iddrSQoJVmn53HYDM/zNPn4IF4o=
X-Google-Smtp-Source: ABdhPJzL+3iElcO96i08iEmIWt/SNBoMTwTMuAUGHto55Jtub8XpRzvBCoVTTjU9+AWPSNHPaKpoKQ==
X-Received: by 2002:a05:600c:3649:: with SMTP id
 y9mr5950595wmq.170.1635112992517; 
 Sun, 24 Oct 2021 15:03:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id n7sm14650792wrp.17.2021.10.24.15.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 15:03:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 00:01:45 +0200
Message-Id: <20211024220145.3558550-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/strongswan: add botan optional
 dependency
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

botan is an optional dependency since version 5.7.0 and
https://github.com/strongswan/strongswan/commit/af26cc4d8542fb6aaea9bfc5aaae1b139faee94a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/Config.in     | 17 +++++++++++++++++
 package/strongswan/strongswan.mk |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 23334470fd..430625a102 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -31,6 +31,23 @@ choice
 	prompt "Cryptographic backend"
 	default BR2_PACKAGE_STRONGSWAN_GMP
 
+config BR2_PACKAGE_STRONGSWAN_BOTAN
+	bool "botan"
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	select BR2_PACKAGE_BOTAN
+
+comment "botan backend needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+
+comment "botan backend needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 850bb7326e..2891e5aa5e 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -18,6 +18,7 @@ STRONGSWAN_CONF_OPTS += \
 	--enable-pkcs11=yes \
 	--enable-kernel-netlink=yes \
 	--enable-socket-default=yes \
+	--enable-botan=$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),yes,no) \
 	--enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no) \
 	--enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no) \
 	--enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no) \
@@ -66,6 +67,7 @@ STRONGSWAN_CONF_ENV += LIBS='-latomic'
 endif
 
 STRONGSWAN_DEPENDENCIES += \
+	$(if $(BR2_PACKAGE_STRONGSWAN_BOTAN),botan) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),libgcrypt) \
 	$(if $(BR2_PACKAGE_STRONGSWAN_GMP),gmp) \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
