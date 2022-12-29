Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C9EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 10:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A00A81980;
	Thu, 29 Dec 2022 10:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A00A81980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ir4K2HPCHaFg; Thu, 29 Dec 2022 10:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7BA981970;
	Thu, 29 Dec 2022 10:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BA981970
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F1E3A1BF47F
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD47260D62
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 10:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD47260D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hevECMQxu5Uy for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 10:58:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A900A60D61
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A900A60D61
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 10:58:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so7443138wmk.4
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 02:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5TpuTqFl/ChVsClk1Ak0VQY7QDeZ3DJZOACpjf1zNR0=;
 b=hTPPoAPfKqvWgT+Bi23LkJd/H9xWrJdjmR4ECzoC24I7m017E4QG/7FGPUduqp5F+S
 1kAx/nI/B7L5C9K1Ow1duWsjzc8e/nJvhK/U7b1/nZlAOT8OLS87hAAjPkUalpGo1WLc
 kGM1xCJe0q5LzSv02qcjuM7YvxXkWzgxxFSJrygyyxqhUcRlxHupad7yaxWtbWi+j9ZH
 v/VBi+Xv4L8dkMA4+u61xrUDFka2RAuC5sv6vEZ+flA2itXcilTET5tL0766PRuRMHrt
 hqtu6h2lQDTnomhASz5jO2j5AkR90lXajhul5cpCTg2I+pU+azfg3lAmiVJx/0vFA2q1
 wYeA==
X-Gm-Message-State: AFqh2ko2RGOYmURCDZCudfUCGQUkjd/qMN4wOxPa2KBVCt4levTZxwTk
 rg2QjoFwAoHTnKaz5QeS6dYIaA4hBkw=
X-Google-Smtp-Source: AMrXdXsSV8YPnfFVCc7jGCMfXMWZtJuo9VWpzNDHbt1RKbSRb0KPb33otvlFDvqlTzyi4pth12jjwg==
X-Received: by 2002:a7b:c408:0:b0:3d5:64bf:ccc2 with SMTP id
 k8-20020a7bc408000000b003d564bfccc2mr19391050wmi.32.1672311500443; 
 Thu, 29 Dec 2022 02:58:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003d9780466b0sm17706889wmq.31.2022.12.29.02.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 02:58:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 11:58:18 +0100
Message-Id: <20221229105818.175049-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5TpuTqFl/ChVsClk1Ak0VQY7QDeZ3DJZOACpjf1zNR0=;
 b=Qj83ZZW9qvNj0fYQjxyjNjeXMjp0sMe/xPELkxdIBLze91pZGxqPk7CbT/AYu7I7Jz
 houUC3wXJqVp1VDdM3C+oLFhakizZTGsWtBihciwVp6yfXLTDxqpbxugGSkREewJv1X9
 AEMvLiM8snZpZuaRVIjmgafUa3Kn+e9rhyBVbq2qqBkmYTy8y5s9bYCizHP3UqoKJ3/a
 BPYrkokVg1aA/UbNnLd5z9YyCWy7vIwZSCOAEgQnb6K1AihXs85G9sIznN6OiRBC/BCK
 dPsXJOYu49GGS+4E5CdhgL17yDYjdgf5Bh1o2inN/Ulct7ZV89VRvQWHUmLYSleoGPTc
 u+Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qj83ZZW9
Subject: [Buildroot] [PATCH 1/1] package/wireshark: bump to version 4.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- pcre2 is mandatory since version 3.7.0 and
  https://github.com/wireshark/wireshark/commit/b9f2e4b7fa091719b93f6256ac34be8e32bd8e94
- Set HAVE_C99_VSNPRINTF to avoid a build failure due to
  check_c_source_runs
- DISABLE_WERROR was renamed to ENABLE_WERROR

4.x serie is the new stable release

https://www.wireshark.org/news/20221207.html
https://www.wireshark.org/docs/relnotes/wireshark-4.0.2.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/Config.in      | 1 +
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 6 ++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index cd92beb1d1..8b05599ecb 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_SPEEXDSP
 	help
 	  Network traffic sniffer and protocol decoder.
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 56363e717f..ae06ab09b7 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.4.16.txt
-sha1  b0e64d5fdd6701106d94bdc8f59dd40a34c7c807  wireshark-3.4.16.tar.xz
-sha256  6acb3155b89b65bcdbcdac7a9e6a59013a6e21d8ae6a8249a9af4fe9ce3d91ba  wireshark-3.4.16.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.2.txt
+sha1  0127180ff18515b086fe5603f767f53ddaa64c1a  wireshark-4.0.2.tar.xz
+sha256  f35915699f2f9b28ddb211202d40ec8984e5834d3c911483144a4984ba44411d  wireshark-4.0.2.tar.xz
 
 # Locally calculated
 sha256  7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d9314fb211..ee3d6b1905 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.4.16
+WIRESHARK_VERSION = 4.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -18,13 +18,15 @@ WIRESHARK_DEPENDENCIES = \
 	libgcrypt \
 	libglib2 \
 	libpcap \
+	pcre2 \
 	speexdsp
 
 WIRESHARK_CONF_OPTS = \
-	-DDISABLE_WERROR=ON \
 	-DENABLE_ILBC=OFF \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF \
+	-DENABLE_WERROR=OFF \
+	-DHAVE_C99_VSNPRINTF=ON \
 	-DLEMON_C_COMPILER=$(HOSTCC_NOCCACHE)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
