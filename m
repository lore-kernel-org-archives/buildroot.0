Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA053CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B220D80C64;
	Wed,  3 Jun 2026 21:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZQEeI35nm9H; Wed,  3 Jun 2026 21:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C01D9809E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780520969;
	bh=4oatkXRVvePpPtYobRZ/6R/gnSO3HZPzTgPaLGuGG+E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WimsBUquKO6qP11YIVPZws9/3XVjfTpgCsCehC/BzO61w7Pu7mxlgBAwEqqRso1Oo
	 qPRMgmgTi0f2hk5g6iTLXOEZadKPL849N1y+HWEaj5Azs/Eo91tfN313zFoIcN6f3F
	 WDD75xiH9eOnkCOfnM0UmVdd1SAHBl+4Cz+saAiXE9Kqdy/2/bwkeq3LjzzSahFFEg
	 q8bMkRfZ9+0nU8CGL1yMspprJe9Q7QhFXgFXrAdfqiQtKy8momH65/vCM5J7jcaB9W
	 aKwzbbxZo00RLGn9paTP/vgbGYP07ogpH3gfRQoiw8nRKo3sCZvtR1lQG2aQOuRCab
	 8S2HKAjzlKHrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C01D9809E7;
	Wed,  3 Jun 2026 21:09:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D272F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361B98084B
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEcRimcCugpc for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED6BF8081E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6BF8081E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED6BF8081E
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:09:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b09e4cccso190705e9.0
 for <buildroot@buildroot.org>; Wed, 03 Jun 2026 14:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780520966; x=1781125766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXhwXkrAYTT7zr4VPsRFL7oNn4sW2V7TxP5RCIh5+V4=;
 b=Y+0oZs/+a9SEBKJHpcEr9tysXsZPhhRRrkoRen6e9nRn28PZVeUYX7N1xRaPwNdAcw
 AaKHjhB+kmPxwCoCUGBRE1ue/uEhqPY6IwnLd5Q184WUn9BSw/563laXEkRzWExb5NnO
 WU5h1NfxvT/HnUNe3KEnRWlGKob+G3IBwbvTpuSIpRaGDudUwaqRwW0JojJiEahVv8f3
 ckfGFADABAHiC155IYXFAIVqdHILYa8Go67MMxtjhG/3y4ti0Cug6CnqfMdqxAsT6sfj
 vC/4hF6lTC4A82lRymI3JflIchD8exQKLeKbvudezm7t+u27oHnNzwZTbCgKruTnOxkw
 rm8A==
X-Gm-Message-State: AOJu0YwjfWSsHWeP8Nqv2IsALvCKaOZMx3xAEZeRR/u+r+wLkc1JFYYg
 de2vYri+s/DVMtg9rkjJOjSCaR4n/lDEJFoxUtKQFJ125A48ixkZ3NEGRzxy6ctkud2ZMsCsyNM
 nJWuq
X-Gm-Gg: Acq92OHYaAJrEoSnqz3WN7lzOgEw5HuJRM/a8kZ+7e6d8qO6wxRRIri3mKM63DpDBR/
 iYW1IPr4m8kIoOJju+8CGmjzkHGBCGHKGo40BlVjR+t+gI51/WO7doKOB15hskb7lPaBfqMVhKL
 xi+sygC/V/93seOt1Auu/0nq76+ecu8rB7U+tTOjcMrSc7cGsTFiGRFUbc+63zTMV2n095p5GEC
 WDIQyvhDnGoFHn6D5eIRgS5wQ4hMb6SxSYNntdOjgo53uVNJomuhQ+kTxBHOEImdzAULaIAAj5q
 xErjgLlBxUzHyemhBy998FkO/YVAmYQnksT823+PIgf6l6zYkZp17A4GyZZszwZMH7x0rDWWlGe
 dV+IYKvK/0kgF6pPK0fwR33B+Ezr9nRpsIYxltn8zhF0pw4grr02pngur/ltebNZcrRyA8514Kf
 PWAYW5p7c/UBMmtJQn1WpIKzjJvf4LpTijtnjlVk4+D2gNyjIeokptM7nTG5ixuUE8j2M7lbpw5
 b7mal3ySzbkFfJnz/EvfhrDqA4esI41hAx8
X-Received: by 2002:a05:600c:871b:b0:490:b9ce:a73c with SMTP id
 5b1f17b1804b1-490b9ceabdfmr61226475e9.31.1780520965947; 
 Wed, 03 Jun 2026 14:09:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm10883385f8f.13.2026.06.03.14.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 14:09:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Wed,  3 Jun 2026 23:09:20 +0200
Message-ID: <20260603210920.3450528-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780520966; x=1781125766; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bXhwXkrAYTT7zr4VPsRFL7oNn4sW2V7TxP5RCIh5+V4=;
 b=s8/iSFbMNc90ypjyBAtEs1OYYDJN4tvf+RvCl+8ILwb4yQEr7ri/H0A6byoKWtAjbD
 gso9rIAEgBrOnIxz9XGRQlsdZ8mSUTi2Qdiit4Dp+VC//3ezytnbBx/7ymr/AyidBrI2
 l43667Zgrt01zxH+mLz4xzMZVkXxrO0ph/UOQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=s8/iSFbM
Subject: [Buildroot] [PATCH] support/testing: TestJailhouse: revert to gcc
 14 based toolchain
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The jailhouse runtime test doesn't build since the last ARM aarch64
toolchain version bump [1]. This new gcc 15 compiler use a new C
standard by default (c23) but since the jailhouse build system
doesn't specify any versions of the C standard, so it doesn't build
with gcc 15.

As reported by John Ernberg on the mailing list [2], jailhouse git
repository has not seen any activity since 2023.

As a short term solution (and eventualy remove the package), revert
to the previous ARM aarch64 toolchain used by this test.

While at it disable jailhouse package for gcc 15 and newer.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14622843463

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://lore.kernel.org/buildroot/20260601204735.888967-8-j@j-ernberg.se/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/jailhouse/Config.in                   |  4 ++++
 .../testing/tests/package/test_jailhouse.py   | 22 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index 445414162f..418f93c849 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_JAILHOUSE
 	bool "jailhouse"
 	depends on BR2_aarch64 || BR2_x86_64
 	depends on BR2_LINUX_KERNEL
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	help
 	  The Jailhouse partitioning Hypervisor based on Linux.
 
@@ -26,3 +27,6 @@ endif
 comment "jailhouse needs a Linux kernel to be built"
 	depends on BR2_aarch64 || BR2_x86_64
 	depends on !BR2_LINUX_KERNEL
+
+comment "jailhouse needs a toolchain w/ gcc <= 14"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_15
diff --git a/support/testing/tests/package/test_jailhouse.py b/support/testing/tests/package/test_jailhouse.py
index 4634fc4de2..378e04a3b4 100644
--- a/support/testing/tests/package/test_jailhouse.py
+++ b/support/testing/tests/package/test_jailhouse.py
@@ -3,6 +3,24 @@ import time
 
 import infra.basetest
 
+ARM_AARCH64_TOOLCHAIN_GCC_14 = \
+    """
+    BR2_aarch64=y
+    BR2_TOOLCHAIN_EXTERNAL=y
+    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+    BR2_TOOLCHAIN_EXTERNAL_URL="https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz"
+    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="aarch64-none-linux-gnu"
+    BR2_TOOLCHAIN_EXTERNAL_GCC_14=y
+    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_20=y
+    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
+    BR2_TOOLCHAIN_EXTERNAL_CXX=y
+    BR2_TOOLCHAIN_EXTERNAL_FORTRAN=y
+    BR2_TOOLCHAIN_EXTERNAL_OPENMP=y
+    """
+
 
 class TestJailhouse(infra.basetest.BRTest):
     # This test uses a specific configuration, mainly for matching the
@@ -15,10 +33,8 @@ class TestJailhouse(infra.basetest.BRTest):
     kernel_ver = "eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce"
     kernel_url = \
         f"$(call github,siemens,linux,{kernel_ver})/linux-{kernel_ver}.tar.gz"
-    config = \
+    config = ARM_AARCH64_TOOLCHAIN_GCC_14 +\
         f"""
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
