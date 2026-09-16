Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFC9C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB8A60EB8;
	Fri, 18 Sep 2026 13:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqQe5m3dMZV3; Fri, 18 Sep 2026 13:07:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 19B8560EB6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736867;
	b=P01jbPONej6j9UZgP7doktmq/6a9UHYKe4fEXQMpoPyyQ/j8meXYpFdmirF0kK9fOYkd
	 f1slGsolgHIcLP7QOUpr0ujtr3VE6c8cmO0/80ApXwq5CkTRX2Lf9CthcrOmLcchMcdrg
	 XKFHjJgrGeL+oQ/UrBZzSt02VOlmTsy4kyelW6bOd9PBUe0umtPt0wQhpw9E+7QP1MvET
	 lKKMZg1HWS5aVkDN62tPvZpPTmHaJCT21crzLxY3x+5cVlr91t6QWvbOx8w4vW0hVnsYG
	 hZMuQi3sYPDmGH219Tsxg7amgjEFawzXdRAkKt4/XA85tKwiLscM7mv7qe21jcCrNFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3LwoWqWyAK+3xbQuyEcH7vA40q5BrQX4/cxlucwZqR4=;
	b=g2YMNrLXqSNWfcRanW7HZ8lmPbvvSKEwatIxBDROyBopgR9WGxXTHI9V+FW5EbD+ghC3
	 YJdn78Lno6G75GoLJV0PWjMQZbVaEDxE88J2laAqh2nJ+OTKwounawp4PArywwSjVQ4T2
	 cl9dfEMuY/pV/lCYLAlagvzq/52G6ZVLUu1VXzMwX7HsZB/nGTeOP57Ge5DpSDIw0Zm2W
	 h1td0zmZIMfr8EuCmirpVmeiq77ME/ehyo8lKu25LOSEZkhxGvIQU3G9p52laBWPMV/bb
	 aiYTuoGHSTaEoUp2P2varwMTCjYzQJYgOWd0AKAd2Rh2m9SrIG1BEk0K5MVhgs9d/AA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736867;
	bh=3LwoWqWyAK+3xbQuyEcH7vA40q5BrQX4/cxlucwZqR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N7Z1bfcBOxp8IDI7SaV+Y8FeOROAmhnDDaKDMsSbMbP1SUFFAnKFGVxKuJyj8OXCY
	 vXy0ASpidtM1Fz2lxG8PwHmeiz/YPQSZPQkUSB74i6+uZT0vxRzzfRpWntzxnj5/9T
	 /IW0JvtVhrahn7tFbfeY9zDuPlngjM7QZrM7cGqe/CQJVdXMD6NSS+WNWHnUaH/45H
	 5uQsK9+0C+NvbQ9+Vp7GheI5YN2gGx269OFZYyyHkiDtMh/I/s7shZjT/BQj1ZGJcx
	 8rXSnYTY4AfpAMjvh8xZzaFfG1BbzGgLvNo69Ypenp/S0ZNIGOJbHpkQGfFsqam+ze
	 ocFHxbdju8LgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19B8560EB6;
	Fri, 18 Sep 2026 13:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A0F1224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CB5260DA8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3ir0vil0Hk0 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5A10660E23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=Hzo5ISgK2CTjYwBXo4c/VhevRxaT7hFl7nISAvW8tGZunTj+eroOXTFt27zzWiapgrDz
 lXIHeyjEThmDpejjyJjrdrGj/UPFRhMz6NDvDR/Qqk2Q3rf/FTtAC72909FUDOckKIRi+
 Ffm3WBQYnFzwbxg/VzPOAUs9BO9qWqwASLY0bHG+dY8P5vsJ6RHdReMLRqcmCyirr4/S8
 PjFhSsNNZVHoNivUxtAKqzVhlNmjzTa4o0yyydMCmjIuXeFs37HvKgC6kH9Y1lOWoitpP
 4UyOgp5YC1crVZuol7Dy4evasNRJVBFaRMNX6ODWmEp99qCYhLTMnhkRSvbMoXx2IyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=l8Jis6KlSstzpBqs3bmqDyKyjSK+imVdkba1raa2jgc=;
 b=e/BTcRmBDbRz/vTQaWJlFLnCeb+VkRL6ZiL/oWOcuqWWdeof5ixdO3BzkNoI0OVAkBJC
 fAC6Y5ngPeP+HNTzz2dpG9I2AcifkrV20nbCqlwxSA6B6Zqm1PPJ7NiLO6MjfrcPRemuv
 2w5v/tjH+djIRj9rFQpJChgHbFgaf+21VynVEt7e2lPcg0SuDmEMiFkXJ1o4uj7qXsdPm
 a70YFoVsRlhyIf9PvvKJh4OqOD77ec6dzRt4kkba0M55dVNZh5+0JbjUAy45E5xm/+SGx
 p3n/arezmFAxA4soI3LCwz6djhAEUDO9264haY0088fsXJ1Yw1ULXo56bpUSIbUo0jw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A10660E23
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 131329718A; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:12:44 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1e25dca1704bbba2e62f17ffe31db6432f09d240
X-Git-Newrev: dea81ee76cb2fe8e1014c997c4b23fba923e4683
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.131329718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/kodi: fix
 definition of BR2_PACKAGE_KODI_ARCH_SUPPORTS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dea81ee76cb2fe8e1014c997c4b23fba923e4683
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The definition of BR2_PACKAGE_KODI_ARCH_SUPPORTS is incorrect, it
goes like this:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

so it means it would be "y" if either
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS *OR*
BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS is true. While clearly what
we need is for both to be true: ffmpeg should be available for the
target architecture, and openjdk should be available for the host
architecture.

One option was to change to:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS && BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

Or:

 	bool
	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

But we preferred:

 	bool
	default y
	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS

Fixes: b6a2f494290d85a26798564992ddd1ac46c1a48d ("package/kodi: depend on host-openjdk-bin instead of selecting BR2_NEEDS_HOST_JAVA")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 00e83bc24ded9d40ed7a128de0ce381394cd0a18)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kodi/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 0b13136d82..d64a6fee7e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	default y if BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
+	default y
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	# m68k not supported upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
