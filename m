Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A650FCD98DA
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79837419B4;
	Mon, 15 Jun 2026 20:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkUEhnk6OM4b; Mon, 15 Jun 2026 20:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51393419AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555200;
	bh=heF5MJs1w4m8fmyrgft8KiKckVu3bBQVjt+Ogy3sop4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVYkwUDMjF0ntweyoEkgS1F3S1kLfeWlsohtk9b8Xb12ozEILkdwShKiJ+SuE0KUV
	 vYlK5j+Qd+EkfZ8lVITddcJ71xXoOPzFjCmZ0+yG7kWXRoJuC92LY9I1cnnStzqUr9
	 G1mljSOMYA3PgfGjJGA2zQKqTA73gKwhI0maJXviTCEECAlUBcr8ZgrC+FpETPVKC7
	 75q1PhS3mwGZU4zSWWEKkEOf76xvfe7CSNffUqNF8TtBo7awB2CTTeMeJ422ZBGrmf
	 ZH/rrb/3dVZg7bnWMzcaeOHTd5bvci3rOYyFSJAvaZGhh6Ztu8zTOkgFtJ9ktYj20B
	 IDQsZUWKz2t6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51393419AF;
	Mon, 15 Jun 2026 20:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CB5D2B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E83284505
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNzvZNojpg1U for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4409F84502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4409F84502
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4409F84502
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01c8.dip0.t-ipconnect.de [91.58.1.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03821A4C323E;
 Mon, 15 Jun 2026 22:26:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZDsd-0000000017U-3hQS;
 Mon, 15 Jun 2026 20:25:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jun 2026 22:25:59 +0200
Message-ID: <20260615202559.1465158-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615202559.1465158-1-bernd@kuhls.net>
References: <20260615202559.1465158-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781555162;
 bh=OLaiIRYsGhGrCp3ZgzY816n+wIw5kLx/65rXytvfVyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iDFtVmdC0vNzUXyOKq875y1tK0tBKDrIyMwrr99kAVgziAtxgEz3CVkOP5ThtoNIv
 vv6iltsiRvMnfPbOcsvqyyaoQPoa5194JxCP/0TTv5idSUpd3jkp/H+0/Vyl+I9fCe
 mGapKF/g0gcxM3fW5zEniUKOOLmOiv6+L8PGFPEK6jQh7c8BYRekY6cuTF/zikA4Fx
 06fPY71tG/osVGN4fCpEJVLEDO/KQF2XD5rcjmUWHmoyY7P1bqNH2rAFkY3r6eezg3
 7NDqadnpGE6zMNPt0Q3cLwUe7rS+9nFdoroqVTjhVAytoN34c9XJgMHsoKI48W+xtH
 j4JZnZApoV7Ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iDFtVmdC
Subject: [Buildroot] [PATCH 5/5] linux: bump latest version to 7.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an overview of changes in 7.1, see:
https://kernelnewbies.org/Linux_7.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668

 linux/{7.0.12 => 7.1} | 0
 linux/Config.in       | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename linux/{7.0.12 => 7.1} (100%)

diff --git a/linux/7.0.12 b/linux/7.1
similarity index 100%
rename from linux/7.0.12
rename to linux/7.1
diff --git a/linux/Config.in b/linux/Config.in
index 51b0a3fcc5..b328d87de1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,8 +30,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.0)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_0 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.1)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
