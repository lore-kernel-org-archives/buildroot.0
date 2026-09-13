Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5DAC88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CAC7809BD;
	Sun, 13 Sep 2026 16:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGi_N1XXIQWu; Sun, 13 Sep 2026 16:05:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A58B7809CA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789315512;
	b=D4zxFBbgUkLxxtbwibOEA3x36I7HKPLzGi02EzwvvuVUFK+syo0Xhfh3FKTB3Wmo0f3w
	 Foh7uxedKYIWq3A1neyntdemVM1Vi1Tj4Z5vNyioA2xJEvCdSE61CWZfexRnBZ4Zhy5OD
	 9F5Uxb/Gh5LTDIdXSH0tjzadN7AnKgn/uTpBMRK1cZYbkkYA9gF5mgwi6Ht+mjSl6ysgZ
	 sIPW0XolXPQGoKwWj6RP2rVtf4s4RcXY8hTSy9MevjPAKWSjm7d179/xntWtyKWy4GuGt
	 KIS8VEZ/oCmMzrsYCBqfe4yQfGedsz+EYi1sIE6bqdECv5t3YRWdoaSoGgGL0zMkMPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789315512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=psi9daWhJYMLUFq54rFB9cMSbam+X8EotgEhKEqXRsw=;
	b=myDooZtT7vhywq6cGn9BifWdw0Znjja0kC+hPx9rdjqkLUbb0JJc7pI6st3BZsX7AJhr
	 Sg7U2u8lmf8zjlaSoft5yAd3JmpptFpswmUkzH0oawIxjqAPj6qTPpxiHEIr1nlAvnWBD
	 ncR2HBQT7ustY2Yl4oekIWyb+7wrITiSORWU7aKc0eJ0E+IfxsCU27VoejyRMZ8vHcoRa
	 pf/uvxOqRyN9KGftH1Y6oG4+eokFYLnqPCmqZ7W6YdtpVIzB1l/Ly6j7JMenfawae/oFF
	 +hQzlWx90idjTW3CTAuvQwEqlv6JDhOcsX4KUntXkneo76/ZqciVR6Mz11bV5a+gHWw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789315512;
	bh=psi9daWhJYMLUFq54rFB9cMSbam+X8EotgEhKEqXRsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P9ot7qP0kK+sr0YfuMvvvWIq4hUcXXnITaqA9zwoTw6HLLUMjLte6D50LJ/Pd76Uj
	 9rFiACXhR8d8mbap/FzkBJ1DcIQFApOnzKCsjZOKsgonOhq1WO5AYJg88bRuoz7O56
	 bX7g3H5cF9JZStfQFx3/1Qx7AqSp1Vswq7o+tKWX3LhMcwZuH17T2XuZu3lZoyy3dB
	 ZaXJFPAgACKnUQ8uMMREzKQ2IbJdjsaReNlciQcrR9Bw6kaH+mEGL0PafHsOVPASYg
	 yNp4zlrCzKTb3+2GKAiLT211901q1UJ/fhbffVO4SIGOWqarIk1oT4zyRXj+XgJAe7
	 bnDzirHcaKGRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58B7809CA;
	Sun, 13 Sep 2026 16:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBEEC259
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDF3440084
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:05:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGeTtOOOHdRD for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:05:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DFAD240022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789315509;
 b=nAvK0IbZw8EOU8Luvz2SqZm7eZSIidLMMLznnrxuw1SV0YbwvCWsQrwDGoTlVSvQVU93
 azHDgAt3BdxNPyDWN065zs273oD9wLBc4PupRFPerdzwXQnCRNlYZkniiY7Iuvdyr3jKC
 8ay9AV27648clV3/RD8WSV54ZR9RUv0WkaX3NLQkAsNnvxlAb6y0VOCc/8cUahgPzqawH
 eBwUUlEZm2mSOsc2LI46fXKqk8SQkwMWOEuTL06PczkW1Lxk3YOz7kRgrxNi2wCh1Mwth
 mHi2u+Og4NxTRphaQO2Ubn+TI/3U/QoDAJP4ZA4Yq0Y4VkdFIDmdbfxxcQTZlxB0KQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789315509;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sxB2LnqZWk0b0ci3WVZie7BuiMlsnTk7h5sMqCU4g2Q=;
 b=nVqRV4VEHHEoz813hgu3pD2D61jc0Bq3H9c8qjCPYBn15BuSZHT9ZspSIw/FOVft+7Zk
 zfrxcyc42cI165tQ0+E7kV8fXKxAj5K2WuUsf0k12JE+y8KgQ76bgSrfLd0sJlkS9B+HU
 NzBZGzxQT2GSskzp+Ce7pNkfyKSgv58d+03ic/KdYE8Kxy3c+VUWCMRvcBfYeY6CLyKx+
 KZdfobO3P3EiMIijOEounal6r8iN9CJl3NKaQhMSXQRz4VCNLwQ2pBVjGyXzk+slGuAQu
 VEalb9dqOM3H2Z+JNSRY7RVTvtJ8vDHrbCIDOrVWMsg1oBtfWI7Iv8pvNwCszit6MYQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFAD240022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E514695C24; Sun, 13 Sep 2026 16:04:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 17:59:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00e83bc24ded9d40ed7a128de0ce381394cd0a18
X-Git-Newrev: 56c76fe2cd436baed9e8c33c0012d68bf8e9d155
X-Patchwork-Hint: ignore
Message-Id: <20260913160404.E514695C24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: bump version to 2.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/56c76fe2cd436baed9e8c33c0012d68bf8e9d155
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/taglib/taglib/blob/v2.3.2/CHANGELOG.md
https://mail.kde.org/pipermail/taglib-devel/2026-September/003127.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/taglib/taglib.hash | 4 ++--
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 6c47694c28..6b563513fc 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/taglib/taglib/releases/tag/v2.3.1
-sha256  a19d90e6fd41d09a0281ec0fe762d51491d7a6ccffc923c4f7868c5e647ca230  taglib-2.3.1.tar.gz
+# From https://github.com/taglib/taglib/releases/tag/v2.3.2
+sha256  3ca2d8afaa7f1cf7f6ed10e511ebc368bfacd6dcaa3dbfa690b89e502e8963dc  taglib-2.3.2.tar.gz
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 0a8f371371..c4503f23de 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.3.1
+TAGLIB_VERSION = 2.3.2
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
