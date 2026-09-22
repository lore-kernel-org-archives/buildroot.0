Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFFEC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 17:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A99407F8;
	Tue, 22 Sep 2026 17:04:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RejRBdyLgDi1; Tue, 22 Sep 2026 17:04:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1BDDC407DA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790096670;
	b=dVMyt+oZwKA06UfQWd4lSL2Bj9nwkqkYQGIwDXcDG75WShjN0l39TYg48UWKTuHT6xwZ
	 v00J62TGCFmBBkGuDwN52yf/dTZ5yaZK5lCWBO12acxSozsAHJ76Sw6boryb7PKqX+cX+
	 mUi2+/D0b6eaOdIp1zNnqxkIcYNpm4jgBk++rAIo9RZdY1oB2NVpe2mttyuN1xn2iL/0v
	 C0UFzvcUfOJRfmcAtS64W0K5mKCT35jf1TKYJFB99PiDSt4AOdwm4vojtCDx32QKC0OJT
	 YR8PP8aGIbDvX4zAUGm/e+yVjuhzxKsrwI+0iFVgAI9dSA5nAhmmMv5K+edUs2dbb8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790096670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AEE3h2QwZ4n7BihhDkanA9jYQi6i+Oh9DOkhMP6svjc=;
	b=f+X8GNeSwwLHXhgQ4NgAUJuml9p4t5hkmcqpzhHNNmePgJGYMokQ/ti+7zCuybhY9oMJ
	 /drconoWgAhTyrkpJBJKrDE+JR3Fmt0MI8MdMvE1scf9ww1szJITg6kUWdnhICvwB07Qr
	 0P2bGIes5OS0gGceP9BX0bsHsXyGCZ9I2HZp8dxwD+4jNtORbXISPBFrViIzHTzmlAwsS
	 9ev7mTdbW6FLsyfB6t8cNXAN12BD6h47Kv2Za3hRoajbsLQZfGFmWqMW5PCtrgUn1OI8D
	 T3KIpm4l1wkcrfr4FV0wOGfyOcj2Q1c6xc7c67D5OqvzKkgmZ4lJyKmoS8ZwklqLd5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790096670;
	bh=AEE3h2QwZ4n7BihhDkanA9jYQi6i+Oh9DOkhMP6svjc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dZJ+RmTW1J1vfsQ7nwepFTkMjin8l/aU0ZHfup6t64wj7e5jEUSW1kjXc8DNks7qw
	 b2ACeoqWpKOI4D4QIrov1njjEPB1mLpn/CJvD8VgZ9JGbfVoRkN6d9XsPrdzTZ/Zms
	 qkaOghOIYlsKrR8DlrdVt+T2OipwUg2UpgfPTbgYgXIgnhjVPbSxAPkG+fcydlr4hh
	 9FTKAw/Jx/lfZJrKIAUEBXD+IdaYHgypGk8RMMduEeRw6xUXKuyD+sYhvyhLcrvmK9
	 ST/XkF92a4nZAOgfiwr3XNdx3qS7Deb6nmL+BsxJTTUN/HPlv14rGmxMXpS+jDEKwa
	 8S5Nh1u+N4QuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDDC407DA;
	Tue, 22 Sep 2026 17:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AE5352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BC57606E0
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnXO5Sn4IRm6 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 17:04:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E201B606C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790096667;
 b=LypZhWWmEJLmzkPD9BFp1nLLJo4vxWzAKMoib8q/8PnQAJDI6l9gFeM45hjJmWJnswUk
 YH/WQNYWXPSoW80pqnTg316xipL6ErqhLmviGhov5z5aXIBtqKdlDfQ7YvdnwmyKmp9sl
 LnmxEb9k5KPxNCIpzlV3JQvqpWaIDSFaBusY7lKEYJDUwePnuS8bD1HNWKbcJ99iMoCAl
 L9cES7fgZ4GHW4tKUAnbtFDsC/X/8mT2tJFhU0uR7bx++zBoRNgXRO3Vb764d3C8pVBU5
 v/KlcEMnhBmvmQ0W512eB3lkeedowHjt1lN5v6QEKc31g+XziH5PT2BZjJAKg/ku+Rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790096667;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dq1YYF+txeCKcda91OSeNY3mLYS/L7GGN1ewvOYd9Jg=;
 b=TzEX/0RVRPr1spsp84sTXOj9NeR3yY7k0qZbr2VL4V9xEE1W8JhNHHhaIz9Afb9tf9BF
 IEv1cSlJDYQ7HCqUmqknvXPefHQbD7xP4ZOs+BPU66iunzQW1jwGJfjQatxOC/E/1O9Uw
 GbMZGaXrDVri24qaNWWJluXRPArEW201PUtCWRJ/W7nV03gST0CdsUjp+lc9z/dQG9vWA
 puLSKOMYeuF3VuDi5/mS9tilkTO/0htcVcAvFcKv20BkvXOoEbuFwHhSNZg9cqUUav/Dq
 FW/fsy9L2LkIGDbRk+jI3bhTS6axLNdA2aaPVyfJGiqcBBuNqfKVpKh11wNUVqUZHHg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E201B606C1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:04:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BBB89769B; Tue, 22 Sep 2026 17:03:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 19:02:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7eede98528473729916483aa5f7e3955433fa893
X-Git-Newrev: 5ce1dc60fb6209d7ed3e82be6a5d79d3635b45ea
X-Patchwork-Hint: ignore
Message-Id: <20260922170318.6BBB89769B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: bump version to 1.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ce1dc60fb6209d7ed3e82be6a5d79d3635b45ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libde265/releases/tag/v1.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 6f6d33840d..3195e46bc4 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.1.2
-sha256  eaacd1943ab0c452c19f6136a36ca227e6b761b39a81eaca8454d48c147e1f67  libde265-1.1.2.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.3
+sha256  554228bd17788c99a7e63b37ab5634722190e6e2bf60c1dcb01cef328e133905  libde265-1.1.3.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index eabdd45939..698f8be8da 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.1.2
+LIBDE265_VERSION = 1.1.3
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
