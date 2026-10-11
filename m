Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD64CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 22:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E078F6067C;
	Sun, 11 Oct 2026 22:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DevlBYDHzNdo; Sun, 11 Oct 2026 22:01:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CE4D60612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791756113;
	b=gbza1sNLAN2S5HktUXkgyIrI+nCotKvz2HsEIVUDCkJxWu+BT9v2NIBMOV4HxYUykaSy
	 EpDaNpIe4kJNbfPhli/gN+OcJxsd9prpaGV0o5KhJ40x2jwW/0g5EzghcWsXAk7H+etJ2
	 5x1ofM9aGkf2LHMgnO1bTEys6ya5y7x1WwTlB71AeuLPoUEyDCdrAntQjOxgzZPsb7bYO
	 XSJFULN2aLOt9ZajmuohfanFaSTENxERaibVu/fulcl1WcM6KuEAkpZ3SZ4h5Pu3HQpo+
	 Oqpxb89gOYcyfFAu5wj5Oik6vXJgOCSdE+C4oi3EwAtD1rmJ1an0K2gPQ278cwdLF1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791756113;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K78ZyWIr7r34drHePX/Hn3lHpENz7Te4llkRELYVblI=;
	b=bNPTU4AK+ZSC1qi0Zi5vB6Ws67ynU3/bjFH6F34cvmFMmp9mYXnXrDxaCNfMojisxXyt
	 1IzfrxKAtUu+5faSa3s57xUUhib9JCCDJHLF3ttqpIvVPhjuWykR0HnzCHSGMAvMXgspT
	 CGLqvOl3SkoPUtAbR+O9U/21L9eL5mTZmJJxlk/BpbyzepH/cU0FHp87VS2jjZyLAuyu4
	 TECNTz9FVC2FTMpo3DZs37BX5ReYEKS2Wn5LDAfc2fLnyxgdNyBI0i16RVC7BLHuzxgQo
	 PNuja9+NSu/ey4g9IIqdeMMzWKlhERDDMybqTOBgQsCTvGz0DKbGe+NLulHzGZl0wKQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791756113;
	bh=K78ZyWIr7r34drHePX/Hn3lHpENz7Te4llkRELYVblI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hVvKlplt713YKjiAqbFAaVepikXsqnMdXRg9as2uIxD+jLgU3tOALtAYLv85c3m0N
	 MvES0RBv/cQqDUGGKpTJyj9aqFPGNZORFVRdV9VR12oRXMGJdOk9afx3aATWNaUYKc
	 OldsQFnkIxJwK1k6+9K1gxexwhjkj89UMDRtTCeuiiRFGNL/bSy6OEDkUw/v81P4p2
	 5ePrJ5jpCzAZzEf+QxPxE9aLSjm+kJiCMya2vTrxc1nIovXOklAbSGw8uTNwGZnGrs
	 hZRiwWyDfeINmLOLEX/G7qX0x0ICN5fewixGyxNKQlShuxha9WxZo+hxo6HQWSoI4P
	 xnuKRinzkXm/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CE4D60612;
	Sun, 11 Oct 2026 22:01:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B3275
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 138E1605ED
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWr-MowAzTBh for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 22:01:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B7E20605FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791756109;
 b=eub/pwkJ7r5s/T/sqWIDn7SPK2Tx+KYELs0YbvVqzj/VWybFfd3jjZGxOjhl118YvFtV
 Wki/AfDw2tOym+e8swhK+Np4W8D3VvVJ7Zkc+u3zkSNqjiIa4zsXcPSVGDxjbjx2v2sMX
 IBh+yzNz3hq9r4q6H95IyYayHFLRSf9eQK1Dd8uQIR9LcTYOqMtPf2vbvIJWakielL9QP
 xrzxdRjVZXuosoKn+wLNVm29+VL1B1HXV9P0ntoBZLKMZ8Vb/HVtOG+gbaZV1R/Ro3uyN
 y6hU70ESYProiBSF3CuGXfXPHUHmhq+xX2DzbwA2vjkWgm4UE900fgtrL/9h3eWK1AA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791756109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tnOLwS9tCCYVkV0qTEI8i2sv35XGO4jwfwIBP+doo8o=;
 b=oEUXS2LyAx2QItNBwKvIhyHxueLrxdlS9mvtvFXMucnyozgBMtJKxjXTBwBiajo9MJ1c
 wNOuTy38dMQrBVStJ2xSuzkg8VUmNQ5TGD67ukAvZjgTFNMGqD046wLDNRnFByoJC4UFv
 5CpJIll/+37P8qA+hE0Au/1UKw0zSrb3EYuoCr/jLg93+Z6kzA0a5FiOQQudGGdW7xZUk
 8QTxX/9bIRt25HQjrDDu4ovOmc6Y38zfxTmS4SRmjVRA6Nlz+m9AuzqPJhKraDDjaBq6D
 4Z/3S4Dau2wiSamFC674nPTLMnQKzIRvOLPCY5KnzyCeK+J+c1/H3oOHFNj5T+q2XoQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7E20605FF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5C2D952BF; Sun, 11 Oct 2026 22:00:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 23:49:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1468b63006b2577842035fa69573dc9438239c78
X-Git-Newrev: a2142664e94e87a2aa90c70ebe14a932b4e357bc
X-Patchwork-Hint: ignore
Message-Id: <20261011220030.D5C2D952BF@busybox.osuosl.org>
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2142664e94e87a2aa90c70ebe14a932b4e357bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.9 -> 7.2.10
 - 6.18.55 -> 6.18.56

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{6.18.55 => 6.18.56}                 | 0
 linux/{7.2.9 => 7.2.10}                    | 0
 linux/Config.in                            | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.55 => 6.18.56} | 0
 package/linux-headers/{7.2.9 => 7.2.10}    | 0
 package/linux-headers/Config.in.host       | 4 ++--
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/6.18.55 b/linux/6.18.56
similarity index 100%
rename from linux/6.18.55
rename to linux/6.18.56
diff --git a/linux/7.2.9 b/linux/7.2.10
similarity index 100%
rename from linux/7.2.9
rename to linux/7.2.10
diff --git a/linux/Config.in b/linux/Config.in
index ec705b0bb0..a942d7c56b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,8 +182,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.55" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "7.2.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.56" if BR2_LINUX_KERNEL_LATEST_6_18
 	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
 	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
 	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index d2556506e2..3554a93713 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba  linux-7.2.9.tar.xz
+sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.55 b/package/linux-headers/6.18.56
similarity index 100%
rename from package/linux-headers/6.18.55
rename to package/linux-headers/6.18.56
diff --git a/package/linux-headers/7.2.9 b/package/linux-headers/7.2.10
similarity index 100%
rename from package/linux-headers/7.2.9
rename to package/linux-headers/7.2.10
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3cf2cdd4f4..f21f543f7f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -479,8 +479,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.9"		if BR2_KERNEL_HEADERS_7_2
+	default "6.18.56"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.10"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
