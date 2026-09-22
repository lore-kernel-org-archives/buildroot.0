Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8865C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 897A260674;
	Tue, 22 Sep 2026 10:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_CQsqSXN6YP; Tue, 22 Sep 2026 10:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79A8D606ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790072392;
	b=hEwQ+qTStOHw9qGP8DP9dRr2lRTI/oubP9yUUTq5rvXyink0CypmvTWwOdmjgetcQCaR
	 AXwNrl78/fx24jd3zty0nwBJgVqWOCFlRuLfPO/bipb2QP5zdQENVBgxKONQVEq5Y73TP
	 ndVPOn6eU5Wu0QU+tnIE+x512xGFVsX//qIzykRWNTcVgdE1ca4DpFonCPo3UBOTCQGqf
	 kF97dINOaDcKpzImfJp6WinmlJka4uBOszPi1r9Nh3EhY7rtglIUc71dYiRGaUOJaMqPg
	 VV6HndKlBzDKBWyGCXfSyU2ekq7xjp65Mu9ZyNQyqQcirs3i74BhK+HRFZlITgkH7gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790072392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zAB2BjjZZYJRBZ+pnFnOflvf3j75XGqtR4Lo/W1g47c=;
	b=CGJ7dkt/q8aZxZvqf9oA5fY/p3KYNo0ApP61180xuIby9MoEDpyA40njIlgpB+sWNgx7
	 sv+2v0tfoblbDLgpT32CZ93VJrySkVd3jJvFLjGTGA7Su7FdWYwpjytDk+K69dCq0inlm
	 OuoZ9plVnJ7IvZePQK005fGUxP4S8N9OMIZhJSNAYrvl0OKtaJaaOBdDKxrQJp1h59xC5
	 eovErkQURTlJhaF3Ip6hgNCXOzNz/W5Yvk1zNqZBBUH5veEnCiTss43Q4HTLPh1YN+FVH
	 4OuP9BDswiIuic1qxUXd3Yy+oZOxcaSKtGYqZXs475TzeYLAO1X2sTm1pP91TtSbx2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790072392;
	bh=zAB2BjjZZYJRBZ+pnFnOflvf3j75XGqtR4Lo/W1g47c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9YU4iE5ATM0Ko6vAOnWylvVQwAawbPWbF6yBTRoi7JSGAWDWRalhJgf3mH/Xrgau
	 EQyv93ehYj+Z99qHNtk4vtINwFLDS4Xp9AruGpEz6P9AS+UvPOGlU1sVV3hV2FxFTw
	 LsGOzrJogGfGW6YZtnG9gLVTGFo81ErRa6sigrJUEEptWYpe3Tc0gGZslLLtiKhhWZ
	 OOyuoEmKjPoiM7/p3Ao1VZAc7bmBrj3fcyisKKFACpF44MezHeoLMyBrqRSrVImF+x
	 LLJE9T9ivA5erRElVERz65I5z6AdISk36zyk8yGJDEJ6ApQVyOx+0xGucZ54kdCS/N
	 ZXpUbt8M6fqWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A8D606ED;
	Tue, 22 Sep 2026 10:19:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 075EEA20
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED3AC400F9
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlED9kAE-ybz for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:19:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A020C40099
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790072390;
 b=LLJJZtgXXcS66Uhv7yVPhEN8uht2dyQSJ0CqIKKOBOoJ9MnbUIc/wxF0SrRHC81COU56
 46XoSevVnhgB/n2xKODkz6uX2/m2KZk8S/up88kBa5Ve9XMe99mzaFKFQd/WHQPs7dVHp
 ObTV2W5ZgO+N3o9cq6UE0/7e4Kz9kXqjRPLevCTe5FcdK0QaJjKyZLU5o7AJqwOUvV1E4
 oiD64A3HtxIH1jnEqsgqFsCibLWcUFPr0hMuDhHarISByTN1Qlb9kVWRIc+ziPaie2i2+
 d9AgwWAvpgJnVnWQyvvo/xUkHliSETESKXg1pP80eMOuoKxqEnbD2r8y0B4wgH02uVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790072390;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zFvhkVOdLf0jkPS+9yUvpsU/OAnpr08yjXKa0fSprXk=;
 b=DRDGuPZIFn6sHA49MX+SeP3AKvTaOXtFFo9F+Nx0aKgMScqOjWCDnE92WoDLsRHpbLvD
 oJXD/1AuY2W/+dMw4jatcRVO0y6ddjLhZfmFfR/n8XCYUiUpFULULJSMLJ+5D+accJirs
 RDpIbfxqJqdJenPKpKRMa/Ng2QbsOa/lbHxlysl/MGYf1RUozQdMU7RU+801mUOVL7Q6u
 ynPQUaoBATnfWzfEBm5yi7TMz4+lH7O/GvVXFxGACMRAR57e40fNMsiLtKmJ5FX+YsPNU
 le7/69c2ePCpO0ElgViDCh8x3ams8R1WSogoWHckCMz8SceSdha17EgSjD6udQNLUOg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A020C40099
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:19:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B08395C29; Tue, 22 Sep 2026 10:18:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 11:04:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81060d467fed41280001ad1c31d002a712b2a134
X-Git-Newrev: 2a0a1c19c1f28267daa19411a261b938feb5d546
X-Patchwork-Hint: ignore
Message-Id: <20260922101841.5B08395C29@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.18.x,
 7.2.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a0a1c19c1f28267daa19411a261b938feb5d546
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.110 -> 6.12.111
 - 6.18.52 -> 6.18.53
 - 7.2.6 -> 7.2.7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{7.2.6 => 7.2.7}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.110 => 6.12.111} | 0
 package/linux-headers/{6.18.52 => 6.18.53}   | 0
 package/linux-headers/{7.2.6 => 7.2.7}       | 0
 package/linux-headers/Config.in.host         | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/7.2.6 b/linux/7.2.7
similarity index 100%
rename from linux/7.2.6
rename to linux/7.2.7
diff --git a/linux/Config.in b/linux/Config.in
index 86b42c93b2..e1f7c141dc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index dea492b9b5..fc203c9097 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
 sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
 sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 9b4e1eafed..7ed646686c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  039aef84f2b0994aeda3f4fcfc3d02ec9d7a9bbb9020ea264c43f446c860f606  linux-7.2.6.tar.xz
+sha256  4ac34c47db2540ffb2713943f8d891ff1702e0ba6934525a493b7d1cad43145a  linux-7.2.7.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
+sha256  4d6fba95c2244b08a7b4144a4d38b9be4fb31abb5e7682ae40bb5cb11374cfe0  linux-6.18.53.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.110 b/package/linux-headers/6.12.111
similarity index 100%
rename from package/linux-headers/6.12.110
rename to package/linux-headers/6.12.111
diff --git a/package/linux-headers/6.18.52 b/package/linux-headers/6.18.53
similarity index 100%
rename from package/linux-headers/6.18.52
rename to package/linux-headers/6.18.53
diff --git a/package/linux-headers/7.2.6 b/package/linux-headers/7.2.7
similarity index 100%
rename from package/linux-headers/7.2.6
rename to package/linux-headers/7.2.7
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f855af4a79..dfad885f1a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -480,9 +480,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.52"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.6"		if BR2_KERNEL_HEADERS_7_2
+	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.53"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.7"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
