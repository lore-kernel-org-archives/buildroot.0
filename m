Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904ABC79FB9
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 14:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291CC80FAB;
	Thu, 10 Sep 2026 14:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coe6C0gXL_it; Thu, 10 Sep 2026 14:01:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 41FF781046
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789048875;
	b=dkxjgGWckVRQQ1G9DuZFUD9yknBNp24+vDJblzqvHvLQREUO+7k0CtuO9YKpR0Wta0cC
	 CqXjr6xAFSp1SlqMPwMfHJZjIb9+D4iNCblQqQcpI4RwwxhzttNz8L2A60PXtq++6O7zd
	 qor2lR7QxkTvJPihFFDyAsmklxIABm0E6Phq78cN/jwhOWLjSRWl5OBS30E+OyAmwj/29
	 w/8A0icn0hI/I3xJLefcE5w5Ka8yFeoMbqsYIXapDE0go83PTrUh6o/mpqllPZQwa3vkg
	 nSlQg9jZR++QF8wjWSAMQfcwSj+YYVLUc0Iscs/cxJFI/tDfmwBHGJWrrdYfUZV/BMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789048875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X9T+iQmoAfQYO2ZASBxEV1aQrRLdo/H2rCFiRa8uWAI=;
	b=p65Hkek5BaFZcvZ3GZmb7drbF/YuIYr9igcwcmt2jVDe51hYEypjGtvXGAVTBSgdmlZ7
	 dfqQULBNDnvdeTi7yFuzd+pUWpAfP3NbEv1mQMv5GvMEILSdE7AOv8usg24N1azVI2Tbq
	 zfuVMyY0i7x2wsXs5/cgQMsgAfplkGLur//5t5PqD20Jhg9hB7OmawcnT40X6lKbnjwT8
	 UG/4wjxpKkoBD1Mq277GRShqY7l/M7EMkOxoE52SEtZaCTzQDVqTzweN7cNMtEekHQ1th
	 BP+Tt++aLqXiJNOrFbFKskgrvxJt1Ayd/vnzVwtq8sdyPotF+FSHfoqrCIAdIIpxw7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789048875;
	bh=X9T+iQmoAfQYO2ZASBxEV1aQrRLdo/H2rCFiRa8uWAI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XXebFnkp1Ct+8fRJHWG593n9Gcoa9qymA8LdAHbh0c6Xt9kv71p4BTtRUZwW1yugM
	 9Vh+Bq9Bw1xsVIeXj+Lcm5YMfMnmFWUroh7Px9t0knTRcAd1U48KHDJdsotRNh4M6h
	 zSogboI3fuupI6EB0/TK2FtJ6NfKvfxCRaKnK60dx9x89baRuog5YD9c56rJeAFCgF
	 5ZSmffnXtfgKmIPA4uCD9WX5EyzZR+ZxqULVLhY5JTcOQgg4OSlv+JaVfjEdyxV4sR
	 9YBetoICRWscl++BN1PUz+MNIp7Vdr0gfsDcZ/0hXTWiSNx3K5TxQW2lbNYZj10qPk
	 8iYfeti0Wg3Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FF781046;
	Thu, 10 Sep 2026 14:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5763229B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 14:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1D960874
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 14:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lhn0DrAyXp1H for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 14:01:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3A629605F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789048872;
 b=LwFRHK/ozUsNE9I4Iv+ZNNHl67H9RnXq9n2E6a0r0XnB5H/m7sFgnyRqRwd0Jv/diVQM
 exjniGZbvQLJQWlsbcsz1skUmmbj3uvESSq/WSvz6cEjma0CEFfznKYBS4D81ORsmxjS8
 igaCzRRugn931W/n+cThVc0RXm8iiUMvpdRRmTz2iveqTJhgy7Y96enCxqoG25pZT8g0N
 5fevshssuk/v02p+eM2sQjw/nHTaqeJNzq+jHkppDz7BQDnGmMzqudk6XtfB0m60tmTXL
 v/39lMNp6KEdF/2UDAi9DbS8xmpSvZQQPDdeT9YrVEoZqtN1g7/MCcYAzU1P4JKRdFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789048872;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1B9GDwB7U+aGkK0rKOKS5ru2RACt8x5kXiLeytqJM5E=;
 b=befalhrj0WhoP2m++JCtsFi6jl0XWExSXMUrX0q16cI6QvfEnyjKKR0OfJPGbp6YobbE
 U2Y85HwMjdCqpJu2FJj3TWVaeET+cdaayZe6JNFbX6hlZk/z6PTftwF/PLXRQ9l4oz+bi
 k5J0s496JtG7+J8WP4BIIAJxbCrgsGvHQS3TSe9OUJwXNOQ09TLWpyMgLNkLhwRm33sE7
 CvbyaQ04ti7hwDo/RHxcfHPMKZDyd8huYElGcnNjpOGvhhbzYQ6PnA4dsbSb2VHDr8ipS
 mHPyUN7EdmAqUVFguv01eri+6zx4bCsrfGbmNLyVQxk1gLZxQAvPKwNGzdPRvMDOqlw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A629605F5
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 14:01:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4CCE9554D; Thu, 10 Sep 2026 14:00:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 19:17:37 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d5180309b1b66ef3b8eaccca70ad69be8e0729a1
X-Git-Newrev: dabf3d5bf611f6c5f8eec918b0899195c48d41db
X-Patchwork-Hint: ignore
Message-Id: <20260910140008.C4CCE9554D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] {linux,
 linux-headers}: bump 6.{12, 18} series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dabf3d5bf611f6c5f8eec918b0899195c48d41db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Update the latest kernel releases:
    - 6.12.108 -> 6.12.109
    - 6.18.49 -> 6.18.50

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 2 +-
 linux/from-6.17/linux.hash                   | 2 +-
 package/linux-headers/{6.12.108 => 6.12.109} | 0
 package/linux-headers/{6.18.49 => 6.18.50}   | 0
 package/linux-headers/Config.in.host         | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)

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
index 3c5e96ef4c..038c27e823 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  614d95fafdcb5cce2b6620e7edc6afbb606bffd4655405586815d84687841ad7  linux-7.1.13.tar.xz
 
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
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 433fb363ee..acce5c3afa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,8 +476,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.108"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.49"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.50"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.13"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
