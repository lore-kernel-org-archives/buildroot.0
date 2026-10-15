Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84441CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36B1E408CD;
	Thu, 15 Oct 2026 20:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kk2jwdqY2sqk; Thu, 15 Oct 2026 20:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 28B0F408F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792096403;
	b=mbw3h6UmPn92LYFwTUiZg/bEr4Xw8bL35VzeuVbj8353fjwy3QEya27uFGNYyQYmX+SS
	 Lj/SfkM9mWuLaDP9f0z5mHKpodZM/bt9eXz9c5M51sfV0z4kkWrqyMQ/mz75KP4+pZNKf
	 TcMnT1VdLrbdzFbK3hXGVp8H6NHM6DmsktH9JZRNsUXfem0gHspYhgiKkCHYztMq5w7fh
	 EhRkIWV+c3HEWmZJ501iKuAuQXOUlm4vK/JtSSoDo4/jlGL/rWJwofdRmGhyHULVX3rEk
	 iZmt7p3lPYFmKLb5femfnl571h5gRCp+1HrINS/2aZMLGoLICGz/XSuCAzaw0z7zQsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792096403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yU16GRSTInx5VZWEC56hPaYNr+WCROiQayGDxIQhVq0=;
	b=BPMvmC7I5z4viIWYNVXv//3AoH7XjrJnRM4me6aEPtn2RaJqkzqU2sZrjxZwKvVi5Cqt
	 A1yhcoOg4RSEYFRKHTvRjVBzNd9uA5bC1YOCuZctpUX8KIjElEIxH6GupqKUaMx8DJH0l
	 5GaMHEVD9DHFL6uvH8RiDFbU5U8blk3xjax0/8UyP0aiccrNhlrq+FEdY5a0tr2EGYshT
	 I0ZbovVCAPi8g0ZpVOiGCUioAeLwyNuHro2sPSzsHYa6w6jo3GI9uomt/pgCAQbE3IV0e
	 n15CwiMqoeBv99ZzW3ccUuEjKP1GOogDb5g4q499fIutngpgW1l/t+Owg/3zvTB6NtA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792096403;
	bh=yU16GRSTInx5VZWEC56hPaYNr+WCROiQayGDxIQhVq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rUltNJ6GlXGU9raUBlC6t3uN8PeLaLYcAZdGuIZZKeYFrkGXXfWtJPrlvnOqNhQTE
	 QmzlpuK1sopcJspmjI/xgG1+mrlwQp4qbsq6+0P57Z8b1q96IuR2Y4IJOxHVhzmChG
	 j4wnjJ7quzEcU6OO7N/yxj5H4B7HQQ2vw4oh0I85cvDK0uDD7XpevpJJtJ8bx9Tfe2
	 2GU2CCIcWDJzDT/tBRKKP3GTN7F1gp0CBszqJtgkBMueiJRlYxeZJFPIS3zFjqbL8a
	 mMyy4W8tXKpADj8+a4nQhr7BRYA99bBnS4+vea3/ziYePVqicqDiA1cCmkfVDcCHNX
	 fANMmetAIg86Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B0F408F0;
	Thu, 15 Oct 2026 20:33:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 580D7920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49ADF408F2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJHPUwRllPvK for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ADA66408CD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792096399;
 b=m94XN1YDg2SJRu4ni5B39oMIAc1WK0oHotqvd7paikCni1pEWhJmrhiKyN2Wx9Cv9Rhq
 v7sq6o8pYw9rQ4+DnBWphl7iODEhvgMKJTHRmXqjmTx4XFc7B/OegEyZOzQhcs2E/+Vww
 7J9BDlLivBlZ2zJ60Tje0ElTEYNL9UnW//5z8yAZO8m6nf63cLBGszIu/cMq7MqNG2nvT
 lrWNXlSaWvhztXnaIyjUjO/pBKj5IjSv3UEltSIUOEsqERuvJg23NqP/jmncWXily+em/
 aC9eJzWYxseHlq6nMbkml1X0KGsKP/UgVnBntdBCYIifsrTW8SR09DnQXLM/7UCe5Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792096399;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=39cCZ0aJb+Ht9RQEId24mfA/im7+KLosBrHCW5Lpmh0=;
 b=aHs5hhMi3GWpuGxdh0K9wFZZ91LF2X5zLyhsSwc56LhSk21KGoXT/FQ8miNX3fnKMUcJ
 E7Tz4Ovt63Bv8YQUe1WwhzxynZ5srobJ76YEhn+qvhRqVJfrsiXlHS8CzLPh5vYwUR+8m
 mUyh8G8WbixQfwbhFcR0Ijic154qRr8sLskBV7Woh9SPoRAAW4pwpzymHFQCy8+onQmze
 GgM1m+z04GYvuKkt06Ark5lk/LC3QIW1qFFjBs+zb1PIjyKrfssNFUn87x7cdPLlB5pAL
 3iBLHFx4N0WbBjwaNUWuaDwoQGFnQuftgNAeCLNqphZxZlJ5lIsSPDkwwGtUS1Nr98A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADA66408CD
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:33:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1F4495DA7; Thu, 15 Oct 2026 20:31:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:32:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48e8a1f041190e38fb00750ecda0b52357153ad3
X-Git-Newrev: dbdf7d35cd0a504afa0b8e26353f64be7a5236c2
X-Patchwork-Hint: ignore
Message-Id: <20261015203158.E1F4495DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.2.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbdf7d35cd0a504afa0b8e26353f64be7a5236c2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.2.10 -> 7.2.11
 - 6.18.56 -> 6.18.57
 - 6.12.112 -> 6.12.113
 - 6.6.158 -> 6.6.159
 - 6.1.189 -> 6.1.190
 - 5.15.222 -> 5.15.223
 - 5.10.271 -> 5.10.272

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{5.10.271 => 5.10.272}                 |  0
 linux/{5.15.222 => 5.15.223}                 |  0
 linux/{6.1.189 => 6.1.190}                   |  0
 linux/{6.12.112 => 6.12.113}                 |  0
 linux/{6.18.56 => 6.18.57}                   |  0
 linux/{6.6.158 => 6.6.159}                   |  0
 linux/{7.2.10 => 7.2.11}                     |  0
 linux/Config.in                              | 14 +++++++-------
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.271 => 5.10.272} |  0
 package/linux-headers/{5.15.222 => 5.15.223} |  0
 package/linux-headers/{6.1.189 => 6.1.190}   |  0
 package/linux-headers/{6.12.112 => 6.12.113} |  0
 package/linux-headers/{6.18.56 => 6.18.57}   |  0
 package/linux-headers/{6.6.158 => 6.6.159}   |  0
 package/linux-headers/{7.2.10 => 7.2.11}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 18 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/linux/5.10.271 b/linux/5.10.272
similarity index 100%
rename from linux/5.10.271
rename to linux/5.10.272
diff --git a/linux/5.15.222 b/linux/5.15.223
similarity index 100%
rename from linux/5.15.222
rename to linux/5.15.223
diff --git a/linux/6.1.189 b/linux/6.1.190
similarity index 100%
rename from linux/6.1.189
rename to linux/6.1.190
diff --git a/linux/6.12.112 b/linux/6.12.113
similarity index 100%
rename from linux/6.12.112
rename to linux/6.12.113
diff --git a/linux/6.18.56 b/linux/6.18.57
similarity index 100%
rename from linux/6.18.56
rename to linux/6.18.57
diff --git a/linux/6.6.158 b/linux/6.6.159
similarity index 100%
rename from linux/6.6.158
rename to linux/6.6.159
diff --git a/linux/7.2.10 b/linux/7.2.11
similarity index 100%
rename from linux/7.2.10
rename to linux/7.2.11
diff --git a/linux/Config.in b/linux/Config.in
index a942d7c56b..c84c4d41e6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -182,13 +182,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.10" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "6.18.56" if BR2_LINUX_KERNEL_LATEST_6_18
-	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
-	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
-	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
-	default "5.15.222" if BR2_LINUX_KERNEL_LATEST_5_15
-	default "5.10.271" if BR2_LINUX_KERNEL_LATEST_5_10
+	default "7.2.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.57" if BR2_LINUX_KERNEL_LATEST_6_18
+	default "6.12.113" if BR2_LINUX_KERNEL_LATEST_6_12
+	default "6.6.159" if BR2_LINUX_KERNEL_LATEST_6_6
+	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
+	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
+	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index bd821b0800..d288e880e7 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
-sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
-sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
+sha256  e09b6727e5c521253f0d41694900b9c38fb7604db7d35238a8197aa9f7de2428  linux-6.12.113.tar.xz
+sha256  7206727244da5d85f4a03758d29e1c0673f2f01877793f494c0f3638c46b8fa5  linux-6.6.159.tar.xz
+sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
-sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
+sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
+sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 3554a93713..96b0dcce55 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
+sha256  fd0fc479f983a8c05313f13e9c36330fe6651cf725396748c40d5cd93fa1e6a4  linux-7.2.11.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
+sha256  5bd9acdc82ec5efc3790ae840e5aaa40dfde7efff261cf6dde902dc570acf98c  linux-6.18.57.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.271 b/package/linux-headers/5.10.272
similarity index 100%
rename from package/linux-headers/5.10.271
rename to package/linux-headers/5.10.272
diff --git a/package/linux-headers/5.15.222 b/package/linux-headers/5.15.223
similarity index 100%
rename from package/linux-headers/5.15.222
rename to package/linux-headers/5.15.223
diff --git a/package/linux-headers/6.1.189 b/package/linux-headers/6.1.190
similarity index 100%
rename from package/linux-headers/6.1.189
rename to package/linux-headers/6.1.190
diff --git a/package/linux-headers/6.12.112 b/package/linux-headers/6.12.113
similarity index 100%
rename from package/linux-headers/6.12.112
rename to package/linux-headers/6.12.113
diff --git a/package/linux-headers/6.18.56 b/package/linux-headers/6.18.57
similarity index 100%
rename from package/linux-headers/6.18.56
rename to package/linux-headers/6.18.57
diff --git a/package/linux-headers/6.6.158 b/package/linux-headers/6.6.159
similarity index 100%
rename from package/linux-headers/6.6.158
rename to package/linux-headers/6.6.159
diff --git a/package/linux-headers/7.2.10 b/package/linux-headers/7.2.11
similarity index 100%
rename from package/linux-headers/7.2.10
rename to package/linux-headers/7.2.11
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f21f543f7f..bdf0bb58b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -474,13 +474,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.56"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.10"		if BR2_KERNEL_HEADERS_7_2
+	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.159"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.113"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.57"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.11"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
