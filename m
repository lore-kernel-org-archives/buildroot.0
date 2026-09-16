Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C88C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5347F60D84;
	Fri, 18 Sep 2026 13:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCeT2AbfO9rZ; Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4D9AE60D65
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736749;
	b=oCQxvZXK7qgZucDAGCPlJTYkAj1FllHeSyliHroPX43DHgKFh7u9f70Hm7srstjidnHK
	 CI50kxVEphvBdG2K5P5kQpGLRtFEYxAaUYN7LDZFeWsWTZnqMlyrt1teHG7y0lZk44WE3
	 Bg5PjSVul5Q2H3GhXA1fdRerpqz3rO0x/p7p9kWi25Tt/4IBgm+RidJMrFBYzunFYoQea
	 QlEmChkE/6M+ZUXiWk3+87F2pZEPL+PVevaL00A8WOEVcVu+xB9P/2MNDqgwK+Hnn+Znw
	 unW5zYZVbwSgglgebUJln2diTYCKZlIK02Q32/K4lJbNGo3MGTcHzzHVWBVe/3GgnXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QvtRviY/gcLat23/dsnlCamVpJukUBcZ+6cGzDXOXxM=;
	b=UrIGParhI+BCFb0P7LpozS12CoozLjHaCSB/mFdB2co7VF91/8jBUCxd6Flo8mtHP7U/
	 Rm0M3Z/H248xePWYDXEQWuorJtHG4z4vu/R9GfMcH7kGogQzP5qOXqjHlGtsvAM/xi/U9
	 dMS0JGIw/Qs9zEV85xz71I9vrz06dv6MwoMd7pEVUlu0M+cGJofjFn3sC8ggMeuJEN/Ls
	 TPIQPlZ3ozdxY3Uo0MXcnhU+1zyJIqk5K7hkPhgFyXcDOmdpNfMph210aQCaPpO/P7CrO
	 rqQGMdNHhkAr5eqDhb2F7jCm+R9Lpuk+ZY5dxHPwZmuu3R+C8T/4KtGpCPSOQ9IefHA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736749;
	bh=QvtRviY/gcLat23/dsnlCamVpJukUBcZ+6cGzDXOXxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TXE+eCpCDtzu1+EOeC/8ZV8LRZk1Pg6PUXMmYwSewmDgInZ+BpEEEb1WO5U7/3hwc
	 Jt0QnHT2sYJbG5OEOqOrwHKsUy/wZ9lU8T8/h572UpVtf7dqnFAUhsVyTkQUCIHKm9
	 gtTd3w2YqGTZN8IWCuxD/9lSViK1SEzWR5U6gGpjGIzaHmqRklKEQH4Du7yo6W9qng
	 dMZNqsfQs+U4puLSxUTdcAbu7xsk8saGimUy/NDKEiD7xkrJ7dNTpIBc0HUI8b6/xS
	 Z2eU8VRRlutX9cEiI7ReBYtCouRd9tRSRWpR3CYgvFQ+vAHHs4rKP+/Fo02qKrsvRR
	 wOUp8m3rfWe3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D9AE60D65;
	Fri, 18 Sep 2026 13:05:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42E3743A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 347BC812A8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPGRcHeNUSdc for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1F1EC8124D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=gWgf8johpoX+v9eceff/wIljr0/ku1EA9iaNRDFR1eY48tnaRRg61p6bhADNaKrwmZKW
 goW/TPuKtnhAd7V1UnvL6cI/FAyLH7fjzXrjEXHcgbHfybyDR7In7nCg0Wz9jC7Nw2Mtt
 Vobx5880I//uH1cPYgUYuIgmrlh02XCA75qCsz8P08RUDohcb3yK0qiMh9CH/KCB1X2ty
 kv9/ilc0LGRiPMIwNklZB66QPOBxGUfCYswFUQHE+C6j9UC1O/LyB7Urq6wC/c+YiC7Af
 9+AiWn20vAC01aiu3vG4KXWsDaUunyf6hjrQMf73UM72546KsY8fFt4CfPUXbzOn2WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eIzyPlmCp1GdrydAKORma6QrVpm6jalfd2gphjeUyEo=;
 b=NOSSC7bcLlQgTMyZARM5v979/495VJVjTjrTR2z/8iZccmRBnPAnSoJTDizMQ7Ry1Mwb
 jOSQ06dZLx1om9kQb6t35g02gPHRCCJHnk61hI0puG35UEXFni6prAUXKa0xWbQ7LB1w0
 UfuZyBUE6TPiHHmcUnsuY45obCeKVp8BBtx5OXE1og/IWe96gV7BmcujqxhC8MEaLT+Bx
 A8yC2caDVDaqfTAL5BOxK1dy1IqrikD1eqZn3Q1O2kNoNx7wGXCqw9ZUaWBBuiXV9WifI
 5Eu2WcYqdqTeyKb4mSfCLdOqdPUxixb7Ohiz+qAE2cIlCbB87c4+5HQjF+UO6a/63IA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1EC8124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C798E9718A; Fri, 18 Sep 2026 13:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 10:05:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9b7dbd68496e3ed7357ba51f2e709dee1194f22a
X-Git-Newrev: 6ca95aa8371adf66af77bf6bb9d8943b0137e97c
X-Patchwork-Hint: ignore
Message-Id: <20260918130439.C798E9718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12} series
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ca95aa8371adf66af77bf6bb9d8943b0137e97c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases:
    - 5.10.269 -> 5.10.270
    - 5.15.220 -> 5.15.221
    - 6.1.187 -> 6.1.188
    - 6.6.156 -> 6.6.157
    - 6.12.109 -> 6.12.110

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1e306e9827..16003363a7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.109" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.110" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 3b0817f2a7..0d2ceadb14 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
-sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
-sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
+sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
+sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
-sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
+sha256  c07882e1e528efe206567a26de30b192db8dc4369974d4ef4ce708691fa1148c  linux-5.15.221.tar.xz
+sha256  de73d528b04be91f6eb86660aa67a4d53b96bbf20bb5a326e78f802d744debe7  linux-5.10.270.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3f46be7e01..9b74a8c5bf 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
