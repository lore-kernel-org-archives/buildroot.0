Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A725CC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 22:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5316D81FBC;
	Wed, 15 Feb 2023 22:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5316D81FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjP_vAbJ1xYH; Wed, 15 Feb 2023 22:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7747B81F9F;
	Wed, 15 Feb 2023 22:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7747B81F9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFFF1BF476
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02DF0417AA
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DF0417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYbKtVgll5Vh for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 22:49:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEC74417A5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEC74417A5
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:49:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id r18so228357wmq.5
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 14:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHaU2FVBVhMVVt8H0lXHEVKMS+2pUQ5Ix2zLC8FPj/Q=;
 b=x/ZpYvNaPUmCqHv7w7TnLrW/jWgZv1wqZEtrBthAEr2OOM/+PT6Rcse5pY2lAJ5hyV
 8a4mPR8cR3R5ZgBAIvsWjoSuSj+lSPAnuLJs4N4NgaEarJEA0AgSdyqaqNl8qWJwnURN
 hsjhIHI5im5zeKtj1qUrIbWtWoelYgEDIiC9f/4Tp8PxVXQY8PtmFoC2iXjEd6uBzy3o
 uniSs2xNWBJOgnuVCwDIcV2WRtt+Vl72ZTdyCKSru9msCf0dbhCEZYIPkfQCyYh1nXyb
 hJvkc/4e0KLR2CrdnNuNQuyG4+dAHPrxuGsyLCeM0M5qNmTNayqCAbh64dj1r6zQfoam
 rZtQ==
X-Gm-Message-State: AO0yUKW/F66sCZSl+utEeStZmZbmI6N6wVBAtStCOSHs1c2Qgs5vGiyz
 1AwZCSW8GkvTC07ijAdHzulcHIj/yR8=
X-Google-Smtp-Source: AK7set9f4nbL3Zi1ZNfM7O4M6oQHzagAZByIOoGrJn8vto9ZjAPTJtFQyNNo/3pLPgvXXCsaOKntcQ==
X-Received: by 2002:a05:600c:502c:b0:3d1:caf1:3f56 with SMTP id
 n44-20020a05600c502c00b003d1caf13f56mr113182wmr.9.1676501375595; 
 Wed, 15 Feb 2023 14:49:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h21-20020a05600c351500b003dec22de1b1sm3436717wmq.10.2023.02.15.14.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 14:49:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:49:21 +0100
Message-Id: <20230215224921.20138-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CHaU2FVBVhMVVt8H0lXHEVKMS+2pUQ5Ix2zLC8FPj/Q=;
 b=RpdpexdWKU2741vAoqBUIaLg+jhqccibbM+Of0APdm8mkyx3hQihawoPOikW6pEiSl
 nvOChvVxoeZ2Suj3ZIJlwISRbjHcPhpg1URZyi/CmRxgRB2741EC8NloPGs6iKK6AJaW
 W9fNqrZKfR0zHCE1KqxDtU7l54K+jx80PU3mWzgmOqP4bfwGW1erGH0S1S8w1Lhlwy/j
 JSE64HDMC+sKYOCMAaysUZso29SJvlfUaUQf9Q0E94BPkcDiH1xjDgukh0Ut+99QEa1k
 ytDRO9FUhyo1+/LToAtI6xIUxJ09i7iIc5jXRrVofiZld9FeqAcK9kATr8scOZwlWWg2
 SdSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RpdpexdW
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: libseccomp is
 mandatory
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

libseccomp is mandatory since bump to version 23.0.0 in commit
485b47e025541a58358d8852c600b8e7644b4ec6:
https://github.com/moby/moby/pull/42501

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15321

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/docker-engine/Config.in        | 10 ++++++++--
 package/docker-engine/docker-engine.mk |  7 +------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index b5a356eab9..570b2ff681 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -5,9 +5,12 @@ config BR2_PACKAGE_DOCKER_ENGINE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
 	depends on BR2_USE_MMU # containerd
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
 	select BR2_PACKAGE_CGROUPFS_MOUNT if !BR2_PACKAGE_SYSTEMD # runtime dependency
 	select BR2_PACKAGE_CONTAINERD # runtime dependency
 	select BR2_PACKAGE_IPTABLES # runtime dependency
+	select BR2_PACKAGE_LIBSECCOMP
 	help
 	  Docker is a platform to build, ship,
 	  and run applications as lightweight containers.
@@ -48,8 +51,11 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS
 
 endif
 
-comment "docker-engine needs a glibc or musl toolchain w/ threads"
+comment "docker-engine needs a glibc or musl toolchain w/ threads, headers >= 3.17"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	depends on BR2_USE_MMU
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 14c6d8d9d6..28ae8365a8 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -10,7 +10,7 @@ DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
-DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
+DOCKER_ENGINE_DEPENDENCIES = host-pkgconf libseccomp
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
 DOCKER_ENGINE_CPE_ID_VENDOR = mobyproject
@@ -31,11 +31,6 @@ DOCKER_ENGINE_DEPENDENCIES += libapparmor
 DOCKER_ENGINE_TAGS += apparmor
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_ENGINE_TAGS += seccomp
-DOCKER_ENGINE_DEPENDENCIES += libseccomp
-endif
-
 ifeq ($(BR2_INIT_SYSTEMD),y)
 DOCKER_ENGINE_DEPENDENCIES += systemd
 DOCKER_ENGINE_TAGS += systemd journald
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
