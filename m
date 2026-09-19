Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36081C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 09:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D347A60683;
	Sat, 19 Sep 2026 09:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wo9xF8rEC35W; Sat, 19 Sep 2026 09:22:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E120C6064B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789809767;
	b=R1P+yYHcU/a3E7H13SCtpYZUfGXmfZysV598nNFuXv0278OzPyZq/Yi0jzQ+QrUgZ690
	 VLsmalV01tG8QNhUqSUAEP5+ShlPm+aFUia42FUVmRG6Hvm+GX+4B8HHa934X4wsudtQc
	 D97f5u+U+dxuYftBIR806qrh8CDCKqKbbmUi/luAIBUAzmLrFW1Z7yDYmj0W0b72HkHeC
	 FKrYbLovQuScEtxS1fx9AyzUKYJjL8yG5yYVl6fWz9mO1nYW8qAITudI1P1JHMAlbEdEx
	 CkKNhfT42K/gVFOepH5sv1ajFWPEhn6PD5GwOk2rkB9/uY33dyXRwjjC89hPIfplRKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789809767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uvFtXwjsr6hCHXxWEPAC5ppDFuaF9UflRg8M7mt9M3g=;
	b=B7yRm6Co+qxSiGfRNOxG+fdByBJlMBWx1Nc5Ovfv3Eaqa0tyV7WkljJ+R1TfyDj6t0pD
	 xQgtrPLUkNPR+lLB3ZEzDFnOhLaWGVj70wGR/kva2IzTk6TKsxhClmxPAJBuMhIfP7FZc
	 p7HHdIc4w7NkdREhft7Wk0tdLvakhYdwe0FY/XxqQXpA3DUt8S8lrkRb5nOr3c/kCqzZl
	 WmxcIU4j7bdJukHv3WfCIZXMq4i4Z80nF1GMGbhUdgyRY3NIQjAW8sYU/Trp71INvPltx
	 TH643h2N9jDeue13eu44d7hpwzvHqS0pQx0c8GlTNUGCRwFtCHPtVjTPj5J7mx73xcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789809767;
	bh=uvFtXwjsr6hCHXxWEPAC5ppDFuaF9UflRg8M7mt9M3g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f05i8lyXLv8TNZ82tVGwcacA9vVG2BUvIKwWRfVO0/lMd5vQXj4/E5YKQOngazYyi
	 qgopMynQoP+ucH0nTbSvFuJD7Zo8K7YqplThniXL6WinLGmGmzNptoTWl8KQblBmy6
	 nIZDIH2QCI+f4HHj78hDjaku35ynsVIV8AkLUjO/8DoDNnextnpkiYGkD9mBdbrkqO
	 9K5xEtqng3FZHYrfyygk6steHucS0rN9+fDJhEem9qgPxHwhd7GB+cYAxRwJzaXfaR
	 /ITI121Oy8euaxkyGdh1uzvpbVrP3st5Oqdj9QCJhfeIosQhnZjRosTes9CoaP9lr4
	 5RIn6GOO2HzLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E120C6064B;
	Sat, 19 Sep 2026 09:22:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C76425B
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DB73810A0
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMqD6e2orqws for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 09:22:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 72FEE81094
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789809764;
 b=tbVhcFbZepUIUzVBWTrUt5OtmyjXiv/yocl6uG10MTER296AiiSoIwrjwvBZbUrFGVZR
 vLprdSezuSQe0731dKwDZ3WlUywWqUF3WeYZQlARLf21vi2B0IC18/152jsXoNeuQG2Xj
 wAkAEmMH/fcMwH4I7ecLiGTI07vnrAkuXN5jwlglrBxf3kOp9NvMcseFHltjfeCFshczB
 JpR/6MHJwfQNgkbBeRX2T5LN82nBaGCf6THfGRxQF5zbPIiaaa6Va7Th55qRhZLYlb1n1
 50On508pt+zWQkcTAyz9vc5+vmUqe6l6UgyKOT1LTU/PMqXSZKQQXZFXwUosst0qPzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789809764;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=icjJnveaewO5J4apdV61RK9ROREL6kdy1xykT387VTM=;
 b=RSlibAiOolJoU9/voX+dmojiZ9YacoXRUwPjqIHLDiYo4WT4Ug1+lQz2LziiaTGjVYnZ
 7Q21qsc/KOYFLL5t6Cy8L7nBDX/C6cYkaDbgZy6y6LyG308zaBpQ8JQM/NvBWbxhLUQPJ
 Z9UfFWtABnio2lzUydr+xPMQTqqHeuiKtbe/xStOSLOWgyOAlcU608gkmW/g0rA574jSe
 Jz4DTmScueH0fvCnusMTdessZqXtXkUJK/Q+hizxms4tQi6jGDvdJ+SaauQSP+eORLbnD
 65ipRECLzFWO5sv4TJlJjvtSs78FnPjZw9lSQFdHAYm0BpQkkzMpTEOPUg5kEDcdGXg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72FEE81094
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:22:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 997B58D30B; Sat, 19 Sep 2026 09:21:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 11:15:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a91b41f08d9b7758b8fdc2cc04a377c7a2d288b
X-Git-Newrev: d6acaf91e5310c7d528377986812e958a112e978
X-Patchwork-Hint: ignore
Message-Id: <20260919092136.997B58D30B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apr-util: bump to version 1.6.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6acaf91e5310c7d528377986812e958a112e978
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/apr-util/apr-util.hash | 4 ++--
 package/apr-util/apr-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr-util/apr-util.hash b/package/apr-util/apr-util.hash
index b8fff95de6..02a425651f 100644
--- a/package/apr-util/apr-util.hash
+++ b/package/apr-util/apr-util.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-util-1.6.4.tar.bz2.sha256
-sha256  3e2ae08f40efa0c3701e54a954cefa08242de22a69f91a8ae44fc1e624ba309b  apr-util-1.6.4.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-util-1.6.5.tar.bz2.sha256
+sha256  96de1dd6f6a0476d2d2e7964926d8c1ddc3bb0e210e1b1812d3ba5a454a392e2  apr-util-1.6.5.tar.bz2
 # Locally calculated
 sha256  ef5609d18601645ad6fe22c6c122094be40e976725c1d0490778abacc836e7a2  LICENSE
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index c11957bc56..3669d2d2bf 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_UTIL_VERSION = 1.6.4
+APR_UTIL_VERSION = 1.6.5
 APR_UTIL_SOURCE = apr-util-$(APR_UTIL_VERSION).tar.bz2
 APR_UTIL_SITE = https://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
