Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFAAC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1732A812F6;
	Fri, 18 Sep 2026 21:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2e4ONgz1xF8; Fri, 18 Sep 2026 21:17:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2CCBE812BF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789766262;
	b=Yb0YSh1ZRRDxpPFRsTqvXWO8rKI8XXBqSuaNkituyHr2TuDsTWsG8sOCmmm221OaudHu
	 PoQt+SAXJnI41lo7Wq+gYVWdAX0CubL/f0uaIkezxa2l9a3lEK2ZWEi3YyvloCOpki2Qu
	 ocZKAW1nYeiI2t4hE4yTSwR1kj/Yr+ZP3HtIBeV7thhCRxFAbmbYuYBzc+RpdBNWiNYzf
	 zltxwwXn2tdum5XuzcBk0Vr0m30+veRnf8tSVolRcOao9KGl6UKpQnGk0IYwwCt36Y262
	 +7X5wqH+GGfsrnNnrkBfjU4m4Bd/CGJaDqCD/ibjQjs1c2xzFT+VgesBsLAPWHZi/IQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789766262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L42gn0BYxSiMBmxCRTNaRj3rhpHzKfPEkH7McoOpJ9I=;
	b=PJBjPXp+6FsWIM+KTFl33WOTJDc1MMxcCNCIHHImq/DKqO5m64Td7VmCo3bjeUg0E1R7
	 slILj1vN097PHMcA9T50AbKx2Cb7MgWie4vXTUU1g58fJEEeOvc+rs+o7ETYDV8WEdjhz
	 Jbjsiu/IPXqqLjRafQJVvyfFogeLMGLRmwSxfyMNgulGt5ImLY2DJplK4W/yAeTfcjhjQ
	 EdQpTcqZHkO6uekKTu6GDlreatvPpFnWT3VrBJcbG6K6SxXZ5uEDAZheUrvZL5tAYdmgt
	 gUrMn3HlNGaBeVKaoIs9eSRsJ9RuCq9A8sl0zq+8tXa0zlUrh1BHss21rdo9ZhrG1TQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789766262;
	bh=L42gn0BYxSiMBmxCRTNaRj3rhpHzKfPEkH7McoOpJ9I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HXhq4FZ0kf7eystuhboBev4W3Xj/5hWbLWo+O+TzN4nUeTr32Lvd0HkNhqZxo2WHq
	 Ngu2XrRxaNMCGy1PoYXXlX4kAC5miNYPHYFTXc1GyUhn/XALY0bNizFL4DWZXrzDBj
	 kWIpM+OyZchRJBI67VtLD87pOVLp8cPeutTvNWpNgdSUzjqkhD3UE0VgJcvpBX81Mg
	 SPbpny5kUXV+nf1qZpBrK+jwa0sqlyb2VP0AQZy+wXSieB/d9NLPnMyTNEm8zo6Ans
	 TGfnf3f6xQVUxy4t5l33uLh3lvc4AeoDjLV39Lyt8ZDDNkVHXKqVXYfiDHzWQ2WCj+
	 hdXlrveX2dFRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCBE812BF;
	Fri, 18 Sep 2026 21:17:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1CFC224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87945811CD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foOCKKCTo5Hf for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:17:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CF8928114F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789766259;
 b=nHOf8fpw+n3EoOtfWWMFN+8AwVhSefEKAPgjoiUlh6ZOrxjqi2GTIdFWyGWiRLCRm07d
 d4kR1DYsH9KyCXwjSDCajnsJnFauDjEEPMjRAi57RaCUR/VF4NePjyvYR40KVrFKt5wHQ
 4nxXPkzXY6WeECTJHuXx4JYTbI/PaQ6BkHE0J0HWfVcjCOJYqsX1RMdmiFx3HPGqZP32+
 wQpBgNsHIisjbVvDqgSZzg/umU1GoC3MjWF4+9GaC+3H0ggBGX41lKTPv4ewz0MHLVigF
 XWiySEpGmwLiGFPki4u1CcY8rtbHGP/iASPMgvb+ss2pK7GiyEVqW/QjsWxr5RHT6Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789766259;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mW75GOwif7EUFKh+rF5Wbmzhj/7NzJGdZp9mvzWjSqE=;
 b=ESbZ9TtQzn8MsSeFc16JcJ1GHWbe3oPaDv4vCYqqSREdUOBQO9N5S084Ticrql18Izku
 6k+znw/GWWdv8t70LAzUdAju4rgYLVnz/F049yG8kxQY4Zr7ROPTdWh9wVE7rjaGVRTwT
 iZgGDYgsLF7HTwAQvpR4reI3cm5GZmaTeJ64AoG2o4muUmcbuhi7QQz7QmROz8TDU1PGD
 vFt6daef5YBzGoOPg1jXmsVBBHwTg7KLHLMi1JVxPoPX8lTeziMJ23iNmRm126lLnm/8v
 e7kcrGcqtW5efyLt7GTs7Yu+M2HAWdUdubuRvfMvbhMc25Uo0FgIsWVHN2cyfFzOCcg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF8928114F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:17:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E35C976A6; Fri, 18 Sep 2026 21:16:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 22:48:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc5e3c8d9cf41778909619cb2cff14a5f1348405
X-Git-Newrev: 9a9ed35b567cb90cbaf44a57f0a5e085de910321
X-Patchwork-Hint: ignore
Message-Id: <20260918211632.4E35C976A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sound-theme-borealis: add missing
 license information
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a9ed35b567cb90cbaf44a57f0a5e085de910321
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sound-theme-borealis/sound-theme-borealis.hash | 1 +
 package/sound-theme-borealis/sound-theme-borealis.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/sound-theme-borealis/sound-theme-borealis.hash b/package/sound-theme-borealis/sound-theme-borealis.hash
index 575cf31c8c..336c039892 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.hash
+++ b/package/sound-theme-borealis/sound-theme-borealis.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  dd80a9c6317de29d42786ba7d95b114b64d06ec6c0c17dd18df853a5c668e727  Borealis_sound_theme_ogg-0.9a.tar.bz2
+sha256  b21ac6d124efc0a25c1f9eae9cab321fc1a41979468eb9293c1a9218a5493e9f  README
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
index 9242837bec..f37b54f5f8 100644
--- a/package/sound-theme-borealis/sound-theme-borealis.mk
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -8,6 +8,8 @@ SOUND_THEME_BOREALIS_VERSION = 0.9a
 SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
 SOUND_THEME_BOREALIS_SOURCE = \
 	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
+SOUND_THEME_BOREALIS_LICENSE = Artistic License (non-GPL/LGPL commercial use prohibited)
+SOUND_THEME_BOREALIS_LICENSE_FILES = README
 
 define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
 	for f in $(@D)/*.ogg ; do \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
