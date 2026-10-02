Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A9CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 21:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F216B60DA9;
	Fri,  2 Oct 2026 21:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05l80DW-yvv7; Fri,  2 Oct 2026 21:39:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A92A360DAA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790977141;
	b=WO6xQ9EnrSveiVEJ+6L4bgP7mwcOO5kiJAX+e8Nb5VsrgYiVWtn6uLncZjjPpfMlcfNz
	 SHT1A3Lgz6wE1hfpsd+xuz+3olfLMdRN6W9jWURv/13TBTWo60ZcAVJDUGdZecMJ/ofey
	 mO9cDbc8AmNq/AzC1Y7Oab9F4n55KHNodsUEHfC399SrLvXLs5gDPioDMwvhXNFQPuc0E
	 5UB5cuZZbslOW2zmL7sUaxB9hwnbBXSQr+swoXzUMCejh9sKaWIbkWk/KrilIlYYwpul7
	 bQMQKNWhHyhGVoLgMHtjZPETM0EO9ElC9H98D0oKs004rsaggJP1wwKxYpkhm6MnG2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i4ft+TOOdPGynPJdgIlSfFlsAgLU1lhLyNRAVnViuks=;
	b=MS7RnnefrWuseUGLEPV2dOpHJN09pvB2cupVnWjFlv9l1HG7E+ZsNZOTJ5KVhbPCjl+2
	 frtLGxwjorOxesdfD/h8TUYalH2hfQJE6UARSzCeJcKvnhi05pkGXYfp//oRb9XVFJi00
	 7/yepbISpVaRNavD+mCuEFG759W7LpVkZJW6CysSz+EJaYctsuJ8WnlAa0AFba6f0U+/T
	 8301ultIspmz07fnqwlCLyJCFr3GrlhuBgo0L80b2dnJoFZUk4eHQhxyzqNg91RjJ7oMd
	 TNx2NK/s8Qfcsaj2Pl2kkRBOjl/NmoQML9kcgUvZTcqh/7i5LWPUM7ET+cvJqxKSo9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790977141;
	bh=i4ft+TOOdPGynPJdgIlSfFlsAgLU1lhLyNRAVnViuks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OhgrF4YXAaaTKOx8q4tdHijWJCrfc9XaLx6wgq8odRdNJka2d2hmg8PQuF5SoVfrc
	 FbG4vauJ3dVcCBieq/Ro3yL7BTa/pAl5fEkYGBCiWc5A0+HGoqXUueNISzNq7FAhJW
	 mWn14qzBBlkXTUbZ74LKcR0QO9dJznG9dZlMbB8nfDhHgHdDo0JtYoZ/XHUmAauMjV
	 kze9RndanpZ2NKtckRcHhWXOSLS4KMDloSXa51mYy546MuIHBCUrB30v6ONeRDTRwS
	 C6+EoXyHZuHTmVlRjKURqHiKjiTmLEN1lUJ8b68XrxLxz5SMktxCm6+XqZIKU7vfGO
	 lt8tdHWZEoFSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A92A360DAA;
	Fri,  2 Oct 2026 21:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D14334E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F348C81412
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_b4fQTe5W9A for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 21:38:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 07D238141E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790977139;
 b=lmSRQlWn5Vwbv3dNhaub3uZwOYdcE9pVPY2laCihRJyoVzyqu1rd9ebF2WCLE/ywtXN3
 uzxRZiZf9xI7iB+SEoPZVTTmZQPWb5DpflUSqIKiDWzX2ChxpDWBXb+Ojg5tRrg/us+jJ
 vC4WcuJCoZsSBfPmqEkj3aR1xhPrr9cQSb8wFCFRPyxyvjbRkuYKOXbUlzox2o0BciF/+
 BfvzhGUVWHl7ZWtcUe8l88XCBHmKx8YVbVw+9lV3NpsETarQNU+T1AdDcScK3UsH4aZl5
 D7yklyGkqhKaVDvNf2UlM19o7c6ANAcR8MuLsrOmXD3UUky7PiYYoGG5nUydftmwxhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790977139;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=es4gXE+i89vJoa7QAC7OlRHuicaBWNFpN+ApMRS6U0I=;
 b=RWZSxYvli7KJgjjHfmpmqqCs4d4uPWsH3gKNuYUbn+sd8HOi39dvmzWzbCM5l6brjvKq
 dhOqJ2m25wNXxDsdv8UjzO0q20nRlX0sHyIjcbrD04zfIjQIoGkexSSBsvsGfQcaYaF+2
 Qvy7aYzvnTiekrvo45c2KqSYIMLLSpW9as4Zaut51e/bdWhC3No/7ZMNWPjBmQ6kmNWSR
 sBIgA0inoaYUpo2pXWRvGJtT2I9FIlDWV6v9VVu408y5q027b1oLBGvlSfRH9T3FvwjUz
 hOCBRjVhSyylVTo1+8ENeaBxJE70JIcnMadvBdfhkzSHj3pVnPeOoCzotJ97ktkrbLA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07D238141E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:38:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E649886C3; Fri,  2 Oct 2026 21:37:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 22:42:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07518e6b6903cd40729b892c3f969f3e584eb015
X-Git-Newrev: dbb77fc03fcd505a02459a3833f0a8d2af4440d0
X-Patchwork-Hint: ignore
Message-Id: <20261002213744.9E649886C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: set modprobe path
 to /sbin/modprobe
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbb77fc03fcd505a02459a3833f0a8d2af4440d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With -Dmodprobe left empty, meson setup searches /sbin and /usr/sbin
on the host, and if it finds modprobe bakes the path into
MODPROBE_PATH, which may be different from the install path on the
target.

Pass -Dmodprobe=/sbin/modprobe: both busybox's and kmod's modprobe
resolve there; a missing modprobe only costs an error log at runtime.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
[Fiona: clarify that only /sbin and /usr/sbin are searched, not $PATH]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/network-manager/network-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index bf4f29c3cc..c96f613831 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -31,6 +31,7 @@ NETWORK_MANAGER_CONF_OPTS = \
 	-Dqt=false \
 	-Diptables=/usr/sbin/iptables \
 	-Dip6tables=/usr/sbin/ip6tables \
+	-Dmodprobe=/sbin/modprobe \
 	-Difupdown=false \
 	-Dnm_cloud_setup=false \
 	-Dsession_tracking_consolekit=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
