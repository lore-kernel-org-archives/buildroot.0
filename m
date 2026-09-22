Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89397C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAFAE40AAA;
	Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPY-Q6c7elyc; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B4D0440ACD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276203;
	b=a7OQBUqe6/ebK5BjGwvs17Aezsnz6IMdgvqygbpMTWFKlqlwgLSRBnuZSIT7RRxzPK8g
	 S7vK2du6m8HZBaBYUjm4EqDkE3HW0h0j6ZzP0eo18RAWZJfBKVxEY/QGb1r68NGIwz/xM
	 lGbSQdcsiORUQ8xb3n3DxSvebYba7MuWmdN9e0cqhZ/mqXbmBLT3GC56aiIORo0eJJiyX
	 3MLAMqVvBvJ+UQoUHLarParhR+JB3UtwJM61Gk8ZO6Md1mN3yM/xaIrDdfzjEYQ/u5PCT
	 BqswJQE5otGLgfiDoHmvq49GdDLvcdoK9drIv1pgamK0Cem6uD3loHlNRne0Lw/hBOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mgtBeFz/k69SJz4qUFKHVYXu1Db8EBV7XuGLMawMBxs=;
	b=H1f27bEM/ijYMXBpTCRa6eO93cBgfA1u6mumvYoBc2b/zgYqLhy1U7Lv2i9tR6OKPJGy
	 2CNGoA5DZTBr1pt8YAK5Mh49ckdtUo68krjuAQsI2MPVaKagfPKwqJt6gF6Ata9qyKkAo
	 RV4c3E6Qux1geJSj+CRpo3UjrB/ylNBuGXNJQZiZvh6208PXYwAkOS7AyFV/LWWAWehBi
	 R3uHmWRRS9RcQ0WesWCMgonkQlOEpj0nYRXM77Ets+qFcmvpHba39jQq3CeQksYGnjjzG
	 z7JkwNZUf+suyRf7XfOMKhqq0DYjcpXrbcvwk1YxENTHwWQXdGh1NKe/9uGVj2pPIkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276203;
	bh=mgtBeFz/k69SJz4qUFKHVYXu1Db8EBV7XuGLMawMBxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nGSWyoN9DdejNr1f3f6sflO8d1iwwY5UzU1vu5pVYq8cvNS5ySe7+L8/Ps/axQjyd
	 1nfMFDCEc6I4XlUBBvhE9dmVtTke/l7y/tjJT3wVkyF+ETBNGJuiA73BnokQC1QRTg
	 lXcioeb6h6f6/IkqehFyhjJqPvQNwqJESJyKrYLmqK7QNSOlBsJgMp+1VfrXyht0Wn
	 5VJSjSuk38WSMQNNEgsAHnLx3kOKz1wuxZfRKJm4uZYOaLoBWeiquj//315+AuXuLA
	 cJIQLYrQYuxRsw3qKGZ9eOS7qFg6pZQacOpzK7+4TWRGk+0o3QHpIy+y3sXhkhpT1T
	 uoD+wZ61Y4pHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D0440ACD;
	Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3715328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C97A260BBE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-_ZgxjtoFqd for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AB8C760847
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276201;
 b=E6zGJmJRvZ32XtU+RUKkRfo0tj/+EV1zgxHbx3R09464znc3SaH/ZLZg4SUMHub8O8W2
 Y3LNxYUV1RSUXYYfUjJ2TOVOusYCpsyyMVT4P9eMCCwIR7hHFlPXy6hKjVd6v1eYuNigK
 dFHVpV2258ADQXiqApT4RA50GABOF4FoZSKj/+xQAitxzoqzpyyrppJ55o1kBpAMoRSpB
 CJFqnGuIv56xNTCtwk7AdWb4ByqqKRWcfh9Iijil+kvl5NT/8jwjDeyB9zE65GBn4fqsY
 cikiU6rJhICax3X8OrvNNYrAhbO6/3cPFNONg1hPWgqkXzKN/1OQCAoeoercw32dDaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276201;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mOiuVL04790IbjBfTVe9F84XMiSCDRFVZ6pcqEbnv+Q=;
 b=Rb4/Lg6k/4qUWk+o8mQck+CGIGMVv8tRQLq/PNBdJBGKs9JF32em+UXQ7FAPB2AObFov
 CkurGTKg4TXd1ar80Wp8U6oa8OCib2tve62xt4veSDXMexV/K2mAcnh1cM0Q728EMDTG/
 gA6lVNWYB5yYkElciAgSPKpPMydXLs4B9vIKEZMnusp4xS9qNf2rDX9az3JRq0eh9TwLG
 efUelbdEcu0WFBRZtO0T807Qi24TygdUCzR4QtQ2a4cdiHjhhvxTqouwELwCena5xK6W0
 UKAopHeQFmQUtUzLCcqHJ/emzHXK1R8HWpjCOByLdIi9955Hz3eF1rXVYpJ5vIlMRhg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB8C760847
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F13398383; Thu, 24 Sep 2026 18:55:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 16:57:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 923b93426b3154d604a86ddccb79a69ea29790fa
X-Git-Newrev: 7c51110fc2b2156c6bf167d32a1f916e4693e3f4
X-Patchwork-Hint: ignore
Message-Id: <20260924185531.3F13398383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12 series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c51110fc2b2156c6bf167d32a1f916e4693e3f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases:
    - 6.12.110 -> 6.12.111

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 16003363a7..022c150892 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.110" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.111" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0d2ceadb14..1e3fe33b08 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  9e59dc67624188fa12a6601f9598499cd6662a9066be572b59f935e3d7849810  linux-6.12.111.tar.xz
 sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
 sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9b74a8c5bf..2ba7aba530 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -433,7 +433,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
+	default "6.12.111"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
