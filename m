Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7F9FC619A
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F1D40542;
	Sat,  3 Jan 2026 22:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4o1Y3BVF4SJm; Sat,  3 Jan 2026 22:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82D24054B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480223;
	bh=8sJ1EO5VPKs2HD7d2BMOSg58z5IsIXRlwj25gW0q0KI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o7p115XaTlTBzm4NJJdkAMoOQLp9YJR8lrodLpb/5u7eaBVs28cfn0HScKKsO91Bq
	 DA1HKFadi9EckI+umw5+D9jqDmoxuHsjvrBk76rl1t3RwBuZ6uA1pIZYHcEK7H5Okw
	 p0Pq+oGW0uk9C8OtZAiCEEy7a4sbWQhoA6cjJuqx4mxDPVjBORX8tGEG8Dt6eJ+ORl
	 OoASQm/orr0zkr6wQ7DFTD8bEu6k2bTdxwK/FpVH76/U6d4PaWRLzryIWMZsjTbgys
	 53t7XyvbvPqPp3WcB3JVSsYP8+Zmv/XC7ZFj+9e0HUea0QXVYeR3MuIc1stAtfGe4F
	 /7yhhtZBFL0KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D82D24054B;
	Sat,  3 Jan 2026 22:43:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3440525B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26475606EA
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vz01hCA8mbmk for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 113A860693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 113A860693
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 113A860693
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A6436C1C95A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B1546072B;
 Sat,  3 Jan 2026 22:43:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD05A113B0441; Sat,  3 Jan 2026 23:43:36 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Sat,  3 Jan 2026 23:43:14 +0100
Message-ID: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480217; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=plMa3nIQSy4ph3XoHrm68WDKLnuLKyCwMi7q5rXCpmE=;
 b=JRdWfBxzZKavJJEhXXxLXr/IZ7l3VmJnX/ZnpBBKZwXPOWbSwuWW/uzaZks63UlDKshzdP
 NEce/OOCOiPYnNiHwDs2m39Lm4H3SvNempYldYh6iOGOEVN9oewtxZwOjZjysAvGsWZ1JV
 WBVh3GPIOApY5VzBV+IoSBOfgeIdG3wg6p7zP2lN3AWGqAO7uMFaKSmiJHd/mEJ8vnjac6
 vb5QCi1Xq/48+T231FGxN+RSj6kCfyg6fxf5skV0fDWSr/J0DnSxWuTbO/5idYbkMTN5fN
 QD6GqRg62q9P/cJyrFQ0KLGNkSdE7TL1/CITQD8PZeFy3EMhuxuWjbMg0CUERA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JRdWfBxz
Subject: [Buildroot] [PATCH 01/11] package/mender-update-modules: fix kernel
 header dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman:
raise kernel header requirement to v4.14") raised the kernel headers
dependency of podman from 3.17 to 4.14, but forgot to propagate this
change to the mender-update-modules podman option, causing the
following kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PODMAN
  Depends on [n]: BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]
  Selected by [y]:
  - BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN [=y] && BR2_PACKAGE_MENDER_UPDATE_MODULES [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_WCHAR [=y]

Fix this by properly propagating the dependency.

Fixes: f933a165e2ee2ee775c7fa0824d2bfcfa9545f88 ("package/podman: raise kernel header requirement to v4.14")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-update-modules/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index e71309c3d6..1158bb42b2 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -132,7 +132,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # podman
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS  # podman
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17  # podman
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
 	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
 	depends on BR2_USE_WCHAR  # podman
 	select BR2_PACKAGE_JQ # runtime
@@ -150,13 +150,13 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
 
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
 
-comment "podman support needs a toolchain w/ headers >= 3.17, threads, wchar"
+comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 \
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_USE_WCHAR
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
