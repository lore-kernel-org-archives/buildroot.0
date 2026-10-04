Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2F7CA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 19:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E6460614;
	Sun,  4 Oct 2026 19:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2wSr_RsJfzW; Sun,  4 Oct 2026 19:31:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA8ED60702
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791142262;
	b=o5qiVDjrnTK7fD/YbtK7M1BGy/WUWEgw8/GPfUDW/3niBtQM4d5i6C5h+3bmRNFuXGB4
	 vglXYq/KeF4iwhN90xliOS0fEEQb8CAW+ualPbOdiYdDFhNt+1IVPDwFTcf57OQHx3rQ5
	 zXVlI8JJu6ivOfR3BNdurpnt61XKSGXeXXGLeoYdW2eSmrHxcwDEcv9C4uYL+bzglpdmn
	 gEALDolnu2cXfXlXGSiq/nyKGLXmUjWlsqkm49drZo9aq9UdgjxEk8tDDWTayDhIKqTSj
	 yNxVI40a58NR0EdNPTvBdnJ9o97cXQQzZndhquv9O2xEFqxp7H8mfgeC8fBVrSG9RAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791142262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rQDP33HBY585EC1gkZos4uOlPTKi7GE8W33NDJPtFWA=;
	b=N+dDzxiN/sziOimz3Ffr0IzvSaia77WnNAgzgC4SvVHn8XQ5vzICUjJmo5iMZGDJQcto
	 R1z2PIA/1/LA5TNPZe0IKDxpKTts2rxhN5fGAC0rAXmJnipnaQ7w0Hqh2Tn9XkAiONfT7
	 mbSln5q3zJ2n29xoAU8bhc6QNUYABl/7qsMUrmiEVsjV+zxcjRQxxvcNoek90OBO7x3ny
	 5F+3MzF5Wmi6okGa4CHM2ZbMqrqYydVzOezRkO1JDH64Sf+SkdjzLI1ykgYv3uVwCYhbz
	 cGlIJb+DG32ZDoMmdU2T99AHNupnAqo8QUMOxDx6oLwUVnvOCc/4zJ+u/sV6BSVeqcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791142262;
	bh=rQDP33HBY585EC1gkZos4uOlPTKi7GE8W33NDJPtFWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MNh1yCho7V8N70SqEe9KthC8KfSqAonUtBa4h9zjsupyBUsUW7cfMhx2EyQK9K8+7
	 Ton3lw2KpEwecTf5O1bwjW572jEqV7CRGdy30uJs0wOwRppiocmLiw0HIyIlscV5s/
	 d8lO8ll6ITQ4ifoX12DxuYp8CqsfatAd+mPXyPocj/jwe+BBNQA25BWhrMfSs+qYkE
	 mugIPuwAL/IC7M5mE+tuqF374Cq+anYnhGJXsTlHCOlI4iCPiFdNKxVNGzWuWq6HM3
	 pzW2Br9ykWOdBcImJcFi8myjkqLzkN94vPvcNoPitzlir1wW1jBCC3cy2dtZhkyTCX
	 147KmLXhodZ9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8ED60702;
	Sun,  4 Oct 2026 19:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A74FF323
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CEDF80D9D
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLf_Q1p2uJy9 for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 19:30:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B0DF280D15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791142259;
 b=lsMmWe35cBy6oOssQLgIMB+KL7jbJ2jy4iktcexWeWz2WtWAOKE3WINIUKW8dgEzr7Jc
 zEsJm3tztHyVzuUVZorcXNcje/g5FqzErRvL7Gj0LckKf9ediGwrfPK48tH2vY2fkyn6v
 TQmHGVqabcE4nH/JbliE4Nrc5MzaaSvqJ6hleMVaVVt/FJGJNYAtQXwfVZ3D/hAGc98Bf
 iALkZ01iA9L7AgAozpa9wwQ1jYw/dhmlrIlNsERp+gCpR0oHGaH/t48NqeU5xzIxWC2y3
 YaauOmcNO4Pxkj3Vm+T49PTQJneWAswLiTxCjftH7xxSNzBxi2RGg86CbwHB23ROiBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791142259;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KkL9sLq4RglrHUZIDcokRKyEenZk2ZwY4wEV7Gzuj48=;
 b=nbIpGtjEAXlBsxf81hXsC87yojBL+Re6qBVCG6KUixrX2UxhNbQv+Dp2P8LCCufc6Qow
 8x6jTHq30hE9rRzF2+X6SGquYY7Ox+iO1pODVp0GkJwChYbt+TR59TJ9Mv1Pjs4GsXPJh
 HfTzdgq6P9OrV6zLtw/6eyyaoDgHbuN2N8Q3ptHaX9I6qesuO54cMl7OmRtLa4prWa+ub
 LsXmQXBGA+TDpKxpiNbrWI2cydUhmy4ouBGhP7srdcSLV+tNK4rhq9cAR2v1H0ptgMYWI
 sTxPZ6W0EBT8k4k73TE2MK1GtQDkP/nCagriy3PeaeE0PEZUQJTm+5jG0Erad6FB+YA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0DF280D15
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 19:30:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 503E28D32A; Sun,  4 Oct 2026 19:29:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 21:09:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7d47860f3233659aa2b8491fe8f35a5cd212184
X-Git-Newrev: 8692b78942ce4c1c513f68f3ed0b91c93ca0645e
X-Patchwork-Hint: ignore
Message-Id: <20261004192944.503E28D32A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.14.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8692b78942ce4c1c513f68f3ed0b91c93ca0645e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ccache.dev/releasenotes.html#_ccache_4_14.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 10256c1741..3b97f1ec9a 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ccache/ccache/releases/tag/v4.14
-sha256  b093ac5d38204cb4d9f29b0bbd570675aa5a592a78e6675b2c506dbe045234e7  ccache-4.14.tar.xz
+# From https://github.com/ccache/ccache/releases/tag/v4.14.1
+sha256  29f10de481ac2c41c91bfabead63d803bd2fe823e09752aade5b0b8704cc4f30  ccache-4.14.1.tar.xz
 # sha256 computed locally
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
 sha256  072c40891d4ec8e1bcc93420031ebbbeb90b8f2c49fcd7c872d1bb05564c345c  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 0d88545bf8..6ab9a4271a 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.14
+CCACHE_VERSION = 4.14.1
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
