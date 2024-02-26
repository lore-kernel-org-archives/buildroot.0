Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A989C5478C
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0381360761;
	Mon, 26 Feb 2024 20:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ly8lQYqdId-Y; Mon, 26 Feb 2024 20:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9CFE60B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9CFE60B36;
	Mon, 26 Feb 2024 20:55:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 375A71BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3131E40120
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1EKZgrlxNJH for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE772400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE772400C4
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE772400C4
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:53 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6e4881bccc9so1218261a34.2
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980892; x=1709585692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f7kmJWiJwU0x5Fv6vje7MarWc/4g2A3tAkO11G01XKE=;
 b=PAmp2en3X5p6VBOAo5TT2URt8Nf09tFnbg3umT2t4+F5BdE+Lc10zv+EY8qtRaIt1W
 IHR2mmaI4PqF8VQ8JXv0lXbbJe+krlX7WgOtMjXHLPPZ+J00NO5ufc88q9Eh2/Usd0Gc
 y/vawWwi+wMoInxZyqY++IlsaRZeRPoJDaKLCw6DtK7DLHUMYXhXMKSgQ/mCHpW7jNQ7
 LHHpGiZ6YHQ4iA7RhStjQZNWZUh4eL5klFLDE1cJ5W6JQfF/FtX3UJwNbVmb5qzBK8d9
 dlSiR2NSTgnllnvQlu8wrecblw+6eJMsFIfeehEJX7Jeqr9wHkHPFP5/1ElQtUHuNUo0
 +ORw==
X-Gm-Message-State: AOJu0YxtYtx0pG0bFYKhaADVLU6g1LKR8TxK1cjkqKXV9uzvkpG7wcuB
 YqZ9RqMWctCz8iuWk8HI/NgqOUwIzY7XLJ/5sGxoswrq+R5LFwCNTfqqsUY+/4Pe4fvNHl+apvg
 0
X-Google-Smtp-Source: AGHT+IEQlM+ExUuO1r8qaG6CbSiy2BL6PaKmCl3SV/CsOjPNxF89VNVI41IvUBcMfvN2sFQslHT6wA==
X-Received: by 2002:a05:6871:5d1:b0:21e:528f:54e9 with SMTP id
 v17-20020a05687105d100b0021e528f54e9mr7826018oan.18.1708980892589; 
 Mon, 26 Feb 2024 12:54:52 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:51 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:40 -0700
Message-ID: <20240226205446.842600-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980892; x=1709585692;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f7kmJWiJwU0x5Fv6vje7MarWc/4g2A3tAkO11G01XKE=;
 b=CWd7o1uttpgtbw5YAR3d1B1Cg/NJNfUND3NCK97UjW0HY7hEcf/UFCIocUI4MW4joj
 zYqlsTQ3bKTC8+yXhCz50QrErL23eivDMMG4KYA7pjCXIfIeltmxP+qAOSV0uNYZP7Yh
 HZGyr1/KC/16MHrThCmBPMAOuTrynAgAAhsnU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CWd7o1ut
Subject: [Buildroot] [PATCH 4/9] package/policycoreutils: bump version to 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

setsebool/Makefile now unconditionally links against libsepol.
As such, it is now a new dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/policycoreutils/Config.in            | 1 +
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 3201c8fede..46a367129a 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_POLICYCOREUTILS
 	depends on !BR2_STATIC_LIBS # libsemanage
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
 	select BR2_PACKAGE_LIBSEMANAGE
+	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Policycoreutils is a collection of policy utilities
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index e29d192b13..ea45116912 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  78453e1529fbbf800e88860094d555e781ce1fba11a7ef77b5aabb43e1173276  policycoreutils-3.5.tar.gz
+sha256  a76ac431ea40a35a83164ce9007909c1c6c12fd1056627f622144e4a705c0a2c  policycoreutils-3.6.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 61d91066d4..773cd4626b 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.5
+POLICYCOREUTILS_VERSION = 3.6
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
-POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libsepol libcap-ng $(TARGET_NLS_DEPENDENCIES)
 POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
