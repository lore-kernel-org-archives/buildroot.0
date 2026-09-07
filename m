Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A81C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 18:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11216605F5;
	Mon,  7 Sep 2026 18:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFn7GpxkA7Jb; Mon,  7 Sep 2026 18:38:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2081D60662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788806316;
	b=hxMx9du480ibLpXrlq9PXyZc1iezibD+GiYx4ig4PsmfnNBVLTfWqH63Rvf64M5Ne7Lb
	 PIgzxRex1q/4iBGlHECGyO52NxyvfacAULtQfg8rIAp0Y9KRWAbszNGax57kH4giTcM43
	 la93oMUJJE6+RHm5RycNVnvhInXJX1ZJk4UbvK+9X++QspBaQLGumJUC6sQGgNvnSfhEL
	 ArsR0nO4f2pCZ0AQkvkwEvN7K4nTJssD+32/rv5dWDzTTPntdJj8qnMvb24Js384xicHr
	 JqKDhytypOv5Z+sldmoYGE7AvMRC9zHKI7kuaytGYStWEdB+dOwQN/AKR7Jbc8+MUUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788806316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lK10HjpwKsGfEdAUPLWa7tWYSNv0EBGuHyy7s0+e/vk=;
	b=LGPa5eSDY7Ava4OiLTDGgVC+w44qZ/3pZfuhAr50HDMnLv1lMgk/D3oqWN1G/o3Vt8HA
	 9Pkusg/C1OdNNt7/0S9JbljNakc85EJOOlS38IMXbUDhBhf8Ln2lLnHUhP31bdUkfpfop
	 VWXeEhxL24REL7oUPeoUVVP58S0RCrMD2HFqY8VylgPuFgFosHFjwGZ1vscoYrK0kxqiL
	 HqdIDguJiKGe+DBzZVo+jFXhcHK+tPNWfxsUBo38jCE5NkdC8sg+tAhtUcYNySyslLruG
	 KafkILuLnTt8E+eUQOmFskYO9Tnk36oxHz834rERXzS0FAWJJWxVVkTKJEfseu2x6/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788806316;
	bh=lK10HjpwKsGfEdAUPLWa7tWYSNv0EBGuHyy7s0+e/vk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vof+zN62R85tBBR/IBeEj/RKA528TcKbuGv5eD5yMTW6Fu1mwUEWEEshuXlUSx4J7
	 eYi5XbxQOFIx7l3mfnhfTWIUBOnJ+ja4i0PDAp3GKSy19Xxhplm96WVaO/2FBVLgKv
	 8IxZak5GeRog8nZV0CyqZfWH7iJx9n/QA48DtPOX/myczCc8jpvwI5a116NSGitBwn
	 es1loKQEV0SyrOIRh1X+W1v/IDj17lYMKzgOf3z7VTHxHybG8TjTPG8WdGV0fFbLR+
	 cmr7l6X4S3U/UKmCJHopHH4UbANfKh6+qmxzsHEc27oddROR1et9GChE50432Vvg+R
	 mZDNeUrw1Q7pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2081D60662;
	Mon,  7 Sep 2026 18:38:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4DDE9CF
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6E664043B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqrQ8TfW2rIT for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 18:38:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4AD964043A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788806313;
 b=tQrenZab2q/8I3VqV/UnqjfqgyxhhNZlNQB1JxWpxBS1XiulebCuSC/hUPZgVGxEyaia
 V7ej2hO+g4LZS0fXuKMxh8LlkHm1I21MFTLrUNI2ZcCaS7C2LKvB4ka4ZuUb1rEaOBrcy
 wVPz5y6eLbHhlsCzWf6c5kuTXcoCJ9gDHsQhj9yczGdCTl5FfMdnwjZavYI8nr7q4yTVc
 coX+3FTZDUMdb2z6ugQ9ZzMhksZXngZBb6WRq0ZVWh+RzJT0w9KCSBuCHqiKdEON/NG9c
 U6+ikWBaObdUWUgG09jfbwQvbOXXaiUp9G36SpxmK5WKvsx4ZaRawAKK/F9xyY/7//Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788806313;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lmTaKLspu+Qd73zf0y5DypDgJOEJCfuIEkKJrvHDhRA=;
 b=cCHWDT5NHaHb0PbHtuoOeAfjVt6J64x+1L4UneZPlelInhgdnCzgkR26zOdCUzD+OkZW
 c/DVNztu2fo+f546iQrgNxbwk74soVxuDH89QjNHWDe8G4a74f3i9Bps9YCCPF1z2/+AG
 ySSUOdC6WpZzKJlQ53Q8E+UiT8YpaPfWiAZI98eIVlEBEbSUbuxW8363RQ+8D+q/IlQE8
 sGiR5l9EWlex/Ye2+OIrM7/zaGKGQZ0ufIAnhMz2b9Z3rLzIYc0CugVO9DKO+JgTG1hHP
 I8lJqFOUEu8KRMC26Qea6s2xfCVfSwNzOxP1mTqKQ+V/k8S4S4mMcQDOCMZVmRzIUog==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AD964043A
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 18:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 243CD95440; Mon,  7 Sep 2026 18:37:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 20:28:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 446c0f85b8cb39c360fe684762132dd26a634dd7
X-Git-Newrev: b69d0b3a9c05d2ad256d9abad14bdbfc656b6d53
X-Patchwork-Hint: ignore
Message-Id: <20260907183731.243CD95440@busybox.osuosl.org>
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b69d0b3a9c05d2ad256d9abad14bdbfc656b6d53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.108 -> 6.12.109
 - 6.18.49 -> 6.18.50
 - 7.2.3 -> 7.2.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.2.3 => 7.2.4}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.108 => 6.12.109} | 0
 package/linux-headers/{6.18.49 => 6.18.50}   | 0
 package/linux-headers/{7.2.3 => 7.2.4}       | 0
 package/linux-headers/Config.in.host         | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/7.2.3 b/linux/7.2.4
similarity index 100%
rename from linux/7.2.3
rename to linux/7.2.4
diff --git a/linux/Config.in b/linux/Config.in
index 2cea1b402a..1a6301a7fe 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index bc2b34b856..a2e1a81725 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e1d1ea200d22d55c9f5d5fae59e69bb3b494515705fc3390cd54231ee4f4baaf  linux-6.12.108.tar.xz
+sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
 sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
 sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f362bced0d..a5559ae547 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  8ba259e8e7b13ec6ef0941c8a39ad90b24bd4a4d6c0010ba6bafb794550ecd03  linux-7.2.3.tar.xz
+sha256  01710ee01737dac492f1bae52becd057e08d20d11589089aa06accff415c28dd  linux-7.2.4.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ae826f33111fea6f1d279dde7299d7463c8dfd204aeb75a8fb5432bc60a28191  linux-6.18.49.tar.xz
+sha256  d2fc041dab4e11d9645e3ba53be058faa52b8ce28a8a97c889bb2cacee170461  linux-6.18.50.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.108 b/package/linux-headers/6.12.109
similarity index 100%
rename from package/linux-headers/6.12.108
rename to package/linux-headers/6.12.109
diff --git a/package/linux-headers/6.18.49 b/package/linux-headers/6.18.50
similarity index 100%
rename from package/linux-headers/6.18.49
rename to package/linux-headers/6.18.50
diff --git a/package/linux-headers/7.2.3 b/package/linux-headers/7.2.4
similarity index 100%
rename from package/linux-headers/7.2.3
rename to package/linux-headers/7.2.4
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2ba298090f..b865602cdd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -480,9 +480,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.3"		if BR2_KERNEL_HEADERS_7_2
+	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.50"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.4"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
