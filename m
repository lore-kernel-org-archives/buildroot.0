Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DADC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 18:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9208961191;
	Mon,  6 Nov 2023 18:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9208961191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6tdmYoTj9XU; Mon,  6 Nov 2023 18:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16C760AC1;
	Mon,  6 Nov 2023 18:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16C760AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F98D1BF2B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 18:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35BB141D9B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 18:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BB141D9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXplzPnYcYq7 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 18:03:11 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B76541D99
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 18:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B76541D99
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so9526742a12.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 10:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699293789; x=1699898589;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Paqrd9I7RkM/X38ai/+zLwj79lrGpUqCj7C6X4ObuRc=;
 b=Bf60ulBh9UeFEoMzfwVpM71n/ifARNgk/XvEGo6Rg2eHYcsAxoKDdfOOjidszwZTdZ
 UqrRiBur22VVIJNCb1ixrk6payAXdGr33wPNfVWq66u1elS4lmHRBAirFIT3eg5Rjnnk
 I6JN3YI5nzErJrxhyP2NAqVGLhLpiPOPF/3NF2AzQRJFaZdxxnSRYuvanktD0IKgWwPv
 cC4jrV2+9vfIW5526NJDRlVzi+AyFJATBh/1ldzyyfmRyeY3iXvByUGLQyS/EDlLTDXi
 UreCCKsvKbQu9UCqXvosAKc66wybTYnwdN6rDaczK/ybcuD6JNGG0oxm4vttnYRngj/H
 Yt9w==
X-Gm-Message-State: AOJu0YzCjH918ShEHGfcsieqVW0OZZcjrLoX/FIpsmxAyFBWHxo1bJtW
 TbFB68PqDuuztt2/EhEpcaUOOU90oQN5S5W+TPNjJWSo
X-Google-Smtp-Source: AGHT+IHFLYfpyDL1dlE7xmnUKAqM141YVP26qUrRlerUwVh3mMrl+BPgCL1idasq2WaitE55z1yiJg==
X-Received: by 2002:a05:6402:d5b:b0:543:42ac:c9f3 with SMTP id
 ec27-20020a0564020d5b00b0054342acc9f3mr223168edb.19.1699293789149; 
 Mon, 06 Nov 2023 10:03:09 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-50-51-252.retail.telecomitalia.it. [82.50.51.252])
 by smtp.gmail.com with ESMTPSA id
 z42-20020a509e2d000000b0054386466f56sm4665853ede.60.2023.11.06.10.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 10:03:08 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 19:03:04 +0100
Message-ID: <20231106180304.1835179-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699293789; x=1699898589;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Paqrd9I7RkM/X38ai/+zLwj79lrGpUqCj7C6X4ObuRc=;
 b=Ar1ryVCQGBKZ8Le9gP0BojKT93oG1/vViDziLjS+u4Tvovl91FsvU6TVglQyTb2PBY
 fgBNiQgc2rZNKMZroiZMjLxK3yb7sDusbhoEAztYBHx0AErJSy3163oLNCbclFG0Q7+X
 cdEmZvByjNOdBFnFsLEmOlygF1EtckZ0koM30=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ar1ryVCQ
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.139
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.139

The changes to README.md are not related to license modifications.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 574cb48a3c28..2d7a8dc7602a 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  085d7f6308ee6b77dfb131fac40704575525adf6da45cdc446c00a0b29e4c21a  uuu_source-uuu_1.5.125.tar.gz
+sha256  16eea2446160976e20d2f20257cecf7490979431f17971af374e81bba8d5fa98  uuu_source-uuu_1.5.139.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  52a715c7443f269ddeba360abd70694879e120213926553a000e9be9373ea731  README.md
+sha256  2d872c6e5aaea15ec1932bfb378fb62e24ee7ec399fe7f998f03d9b728215335  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 5f3271066f81..e96ccc1b4d84 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.125
+UUU_VERSION = 1.5.139
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE README.md
-HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd
+HOST_UUU_DEPENDENCIES = host-bzip2 host-openssl host-zlib host-libusb host-zstd \
+	host-zlib
 
 $(eval $(host-cmake-package))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
