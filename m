Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE33DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 13:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA9040447;
	Mon, 30 Oct 2023 13:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA9040447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmTphLwc7NtZ; Mon, 30 Oct 2023 13:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D168432E2;
	Mon, 30 Oct 2023 13:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D168432E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6D01BF3DA
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8FC6854BD
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8FC6854BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVw93TZuomk2 for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 13:28:58 +0000 (UTC)
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206F5821BA
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 13:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206F5821BA
ARC-Seal: i=1; a=rsa-sha256; t=1698672535; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BvxYpZQeD1kdFDuaxmoFBG+zZXFS8sAU7JrUWROTNXOcR+CY1kf5fNoXJXRCPhyIfYXUJZoJQ5uDWZVZRDKH9cYFd7YGgp1rkwtIPxYsC90M6bWAVDaCo40wlznCLzj5nClfcJ5Z11+jmpQ07UFgy/KS59nsq/ApHLRFJwGIG9o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1698672535;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PHXnSMlPdNnYecJoPBmY1BV4WcCGPVJ1onkYCX4dqYM=; 
 b=WU6TF48GbxJheaD/k8wUMMYMB4kcuxmd/lG+88mxu77kztXL4ftObhZS/r3f09XbiLSjd+znmZqJA4WJ4+QA29Dqrf8LPNkQQZGHJ3FUupjTPSbbvWzS0UB0xcNMOtI19FR7x8ZuEUegcai5h9A48lNCa0ag64KolbIH0VxCLUw=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from newton.shill.gq (193.93.205.86 [193.93.205.86]) by
 mx.zohomail.com with SMTPS id 1698672533302505.9042571028415;
 Mon, 30 Oct 2023 06:28:53 -0700 (PDT)
From: Maciej Grela <enki@fsck.pl>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 14:28:40 +0100
Message-Id: <20231030132841.3052429-1-enki@fsck.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <18b80c0ce62.cb399136547843.6065948676717076989@fsck.pl>
References: <18b80c0ce62.cb399136547843.6065948676717076989@fsck.pl>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1698672535; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=PHXnSMlPdNnYecJoPBmY1BV4WcCGPVJ1onkYCX4dqYM=;
 b=GDxGe2hAEx0U5WWl+hNvnBmFB9fBKqS1XUpATDawizwBDzt0Cy+wp6FE+6MLujwK
 ON+sL/HoFoeLJynuQrZtaUaz4QeKM4Hw7Fen2myFjpPRAPtFIHPyskeKh3p2n4ZnlR1
 c9CMEkB0EMacq0PKUNT2UjSy/uN3+DCuOozzsRho=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=GDxGe2hA
Subject: [Buildroot] [PATCH v3 1/1] package/spirv-tools: fix build issue
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
Cc: Maciej Grela <enki@fsck.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

spirv-tools requires a toolchain w/ shared libs, add flag dependency and comment.

Fixes: http://autobuild.buildroot.net/results/53b3cf124d6c299398e620120465eca396ddcdff
Fixes: http://autobuild.buildroot.net/results/a1f615d2410bffb6fdacc8586761c9def05aafa9
Fixes: http://autobuild.buildroot.net/results/294ade8c9aa3d650fa5ab6cc34701c4176bc197f
Fixes: http://autobuild.buildroot.net/results/40e8f50eb7e82ca42f84fa5f4336cefb51204a28
Fixes: http://autobuild.buildroot.net/results/8df8de1aeaf1317f6ba43f6752502da2eedcdea1
Fixes: http://autobuild.buildroot.net/results/ea2c1f97e82efcd867c79f05ab02f5f099140379
Fixes: http://autobuild.buildroot.net/results/fa4e39d1e78e885d20851201ed8a6fcf9d48d7d6
Fixes: http://autobuild.buildroot.net/results/4ed3f13b3ce178f8fe87de7aee86acb9642e3434
Fixes: http://autobuild.buildroot.net/results/e1b4853a7e8714fd2af8f8677681c9895034b3e8
Signed-off-by: Maciej Grela <enki@fsck.pl>
---
 package/spirv-tools/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index 39fdb80b86..c1d3a4f9bc 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
@@ -9,6 +10,8 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
+comment "spirv-tools needs a toolchain w/ C++, gcc >= 7, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		BR2_STATIC_LIBS
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
