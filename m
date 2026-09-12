Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5547CC88E45
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 07:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E1760643;
	Sat, 12 Sep 2026 07:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdqKXvisCO6D; Sat, 12 Sep 2026 07:40:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 234046064A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789198836;
	b=lILuAwCVHx4MtKAe2187dC4zcVbWIjR+cavyAiZFZHFrmPvdSEIBra5SHuwiulTbOhiK
	 bYIn2sWEnM0J769bYb6ehTuOOfGNAjQEfVJ54eRDw4/O4Gau7xK5IQPUryGBp+xaz9CN/
	 wVcAERSr5qf6Xu8wETgjviPLPyVw7YxVcv0+K71FVnKzzlfRp7kYSJDMsJ1vSoTaTKnwn
	 vDC2ww8b1Rys0SIYkXnV4j0is8yF3A4yROMz351HXaSMOtm71yj8jOqlXzJR0bbogN5/B
	 +YbdNf9HjPHOIp8fRLiJ140PD8F0js7OMWQimM5GDv98q4ufptMn9MNCq6dHLzNkKSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789198836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=APXY8X1Q1AflYL0xFIg8xLzoFTAb1kaQWPthAr7cLBM=;
	b=kr8hH9RkuVj53s+zwH+WZjdkOE9PEiQdKuLQ5rwRk7t+OCII8e685HirvuGlNYqHnOzg
	 odtsP1uPo2AprTgkSMOmtgfm3MxlvZKLnUvqz8HczKOigMRH9e9jlo5pz/hMcM04w9+th
	 E551xoj/AwW2yMnj6gHNdks5okIuc4+cmtxPByHUv7GGfWJeoPk7nAkU/Y1slJTbOqIKJ
	 zKN3fBgeJQP4jbiW7bpnFkJYg8XsCo4vIx6WBiiO+1zT7h2tYdKwSfG96warHIQtFH3eq
	 RKytnN5E5hWZ+CW8ohMYYy3uo5ru3E0CYHCc+cqURWXIvdtsz+QEKWnqxwnqa+mzdqg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789198836;
	bh=APXY8X1Q1AflYL0xFIg8xLzoFTAb1kaQWPthAr7cLBM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AHh8pFt/r2NUDsKi2NyTaf8y482faUzWuHc531IcimWXsJuoNHceLEvbZBAwvyd1a
	 QhB/G5qQQSIgAF7ZI6dHSt8RgNyjDEVse2Fgn3N2KhaX4NcImwKeVXxHWb/T61LF8K
	 Vaurn2EyOd+y98t5cl4GYYsWc8fjDtvZaccaWrxZDCELq3Y52pKocSa+shn5Z5aAF7
	 wXlYeIJk68kBlisZhskMpib5DgJXI3dwDWAFfV703ARYaBcUEoD+bqEent8n/3KRxX
	 36C1P3oHsD0aiIa3rTLuMxVXjcaRn79ZDtyb/YBL7eISwoXHAw546Vp8Uh15Okxt4c
	 J2ENSyPiEHI5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 234046064A;
	Sat, 12 Sep 2026 07:40:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 394722E3
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC8560601
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llRTJ71LSQP4 for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 434BD60614
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789198830;
 b=UiT+UQqKHEBxneT+9d36uZUziLpnh3jCVa4pgMvPPOIpTw7cCNDJmSFEkWGVmv62aetY
 15hRlpk3fbVFA36h0Jg/pJ1Dc3wC3YD3GpgBCAP93/TFRwYl2IL2rrZnIhlu+zbWvPKBd
 9kVBQiHDWX70LH993A3Bk+MCtZe0XPnT5H14ZSl3iPE6oOuMn7VJmxPQ2XKlH1h8P8D2s
 2LrXPBMGk6D52OHxknbl+4LIamo/b8EVEY8sQRM74hT6kFqsfVrKecUXGCHPxmZn0VY6j
 h4QpGku5A9JkfR+69uFyf3QkPVVAmaw5NOQlfTeVaIbGagAsA4WikgAvEzIDMjfdhIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789198830;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AcdK+PjAROQHJGqBjdfgs/EhYaTm9QE63Tcv5Bv3Tmw=;
 b=NCJUTio5cFVyo82g5yDbOsho/3WaoX9NmdM6Evgcrl5CJjzQbYcA9px7bMkxoeILmwg5
 ZXMzWcOJJCwHkvcX9PppAQxWA7TNgbAr5QZaPyM1HC/wTRrecDNvJ6fxGG3VjQTqjqAIE
 fhEaZiOl1rDqX4aLdiF/BNPYn7nur6qA2Jn64TmvksaVE5Lg3ERgcHMpQu2CtO/KLDqGc
 wz8LLcMPatmH7pWLC7LkB+X+paTO1y2iQFEu2QHsz8yGfVO+58GP5d4XiXo+agn/AytUQ
 XoeOWjHpHQp3tDQ/mPJ9P1SiDc9v0N3p+uHHr7gH52Dz5x5iVivCTng+PR0LWdaGloQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 434BD60614
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 07:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9F4D8D27E; Sat, 12 Sep 2026 07:39:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 09:38:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8af3e34fd4a085ea7c25291e50d81fa1a69d9eaf
X-Git-Newrev: 9a1c11c9971b454b3b38c4eb111ac5e42a15cf1c
X-Patchwork-Hint: ignore
Message-Id: <20260912073925.E9F4D8D27E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a1c11c9971b454b3b38c4eb111ac5e42a15cf1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.4 -> 7.2.5
 - 6.18.50 -> 6.18.51

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/{7.2.4 => 7.2.5}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.50 => 6.18.51} | 0
 package/linux-headers/{7.2.4 => 7.2.5}     | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/7.2.4 b/linux/7.2.5
similarity index 100%
rename from linux/7.2.4
rename to linux/7.2.5
diff --git a/linux/Config.in b/linux/Config.in
index 1a6301a7fe..c4a580d1b9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index a5559ae547..6f0de8b94a 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  01710ee01737dac492f1bae52becd057e08d20d11589089aa06accff415c28dd  linux-7.2.4.tar.xz
+sha256  55ddf0df8325d9dad96fcff7bd93977d22e3f50af06527572af59b77c7632b78  linux-7.2.5.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d2fc041dab4e11d9645e3ba53be058faa52b8ce28a8a97c889bb2cacee170461  linux-6.18.50.tar.xz
+sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.50 b/package/linux-headers/6.18.51
similarity index 100%
rename from package/linux-headers/6.18.50
rename to package/linux-headers/6.18.51
diff --git a/package/linux-headers/7.2.4 b/package/linux-headers/7.2.5
similarity index 100%
rename from package/linux-headers/7.2.4
rename to package/linux-headers/7.2.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b865602cdd..613ada58f3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -481,8 +481,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.50"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.4"		if BR2_KERNEL_HEADERS_7_2
+	default "6.18.51"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.5"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
