Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE5AC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A887E812F7;
	Thu, 24 Sep 2026 18:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaX7wTL-SQZG; Thu, 24 Sep 2026 18:58:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B3290812E3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276288;
	b=DalkLlOKcNoOE9Bi66fS22CR1yS1EFfBv63MVrEbPQslUpBAv/0Vu4jeWLrqrgiauFk0
	 3MGQ8lHzvavKy2w6yzUf+HvK6CM5aWhlrCiluLUSWVtYNPbOdSUyvuEkMZTQGShGEffxx
	 71QlGr7hlERMCJbF1qSaU7vqgWDfKoD9XvOha2mH1b2ERJWeWj0Tn+pf9dmEejcNCMhaV
	 wOxQRICOFS5yqy4plDWLJKmOGZzM6R6uTjS8kLl0a+xI+FAL7XkDM4w0LXNUrcjLYyLZb
	 ehPNgC2FlH1ZVjidshqx74SXSXARtR1YYwNDL+IMJnkYQ7QhL0SbNX0pzGzF3HZwXhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276288;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+4ukZPXpA7FbDGrpxUc9StmrTwMY/gmyahb0o/a4Ia4=;
	b=DqHXGkY7HBWrZ0EZRuYUA9efHeHN9QB4dqJo280TedQPgNVrsj+DatpwyUENov6yHkHm
	 bVCP5qWlF6vwR8w3HuUrjXf6Gui+UGI/cVgnCKYhzDCvPkIZ75/OAab4frvSoevd9+vhH
	 kHQG2ggMah4lHyEN7c214tfzG0F0i5hEsGeNP/a5ozyHEn1lk4GooOlMdMJHKNJZaMbya
	 GLifMCgM8OXC+FKlw6fJ11cyPsWlysYIZ6bKQWQC9eVICAtfKSJcKd4PfvpXYU8Ex/2YT
	 tghLyx+BZUJ2mo2Z+yHKzxdCWLYoeNQj5MpkGcPzFBuPpZhVBGTkztmIzew6KyT4wqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276288;
	bh=+4ukZPXpA7FbDGrpxUc9StmrTwMY/gmyahb0o/a4Ia4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oWAepBapgSNEF4Fc5vBemQbApvQywV0t4lFwsIxlv2lFHBcRUXwsdv+nCqg0EPjiL
	 Cwx0LyiXeOJfrVBBoUNzctktO5MR38/8VT+fGhmoDwM8EvuE8ZyrAUAB0tRuW4s8SH
	 FbeCLtToBz4YQrK5ZG4B0T1f5wxH1CjLHVVG5rSZ/2dpewe2/k0OccQ/C8MgtUPgtL
	 6qeKDVLTSWneyYzukFxDr9swicaeAV3rSYrMq2A1W5ADn5qe5VFOvnEdZuuYyaU3JH
	 mKmmYSAEFYOT5f1WqkY+u4AJJGgI9VQxR2ZqrqhSdTyqVWl0rWSrnWHsfCHCbXph03
	 4PxBO3GHl/hjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3290812E3;
	Thu, 24 Sep 2026 18:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5F37431
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95A3340AD1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGK4wVbh2tEg for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2FFA240AE5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=KX4oY8f89Dt0IuXOBzempDpak3+tWw5X2Exn5UOtayr017JUop4YzTmLTFN1sNiUyJIP
 /dbFnW+U2xnGx3gZ/3gH4akI/r5A4BTwL0W6uscKn7QL7anTaFFe5T3zp4ScyXRiqJKbF
 H32EtoT8RC9AgMQBKQqf4kLwb6zRlx9Gel86cxqT/Is/Lq219JK7nNHyQwdMDxrjJQ4Mi
 SwbgA5NGEJ8oEFt07GzWETD0lGwiZE2Sk+dkKeJpvOSjYVE7cIWZkLN7ekHDfP6qXE264
 BxUfo85kIvbX70Kw8Zeeljlp/qAH1XGovUaxi5UqNPr2045CxKF0FgupZEqJ8uZFucw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xJ523Ag4VH7964hqLWQ7u/lxfq26SokTTh3QG7KlEkI=;
 b=EAf/iU/UnOp7rXtrxm8cCsx5CrnWA6AJjceS4OeDZ6E69siiZknhSVmoLwQpzcoG8zgS
 hWTkjViza3TC+qrMqcqrJ4MKU4OSOLyJQEc88DJvGqSz9J/pdfrc8iRLu4eGjPAxexcqR
 Yx44KBa45TIfeecHRbg+6//VkArk7ZKKBH8U/T4mUk/klW1E/yQKG26ngflzlmSjWMD2R
 mfeER4bbJNKaY1MyxiTFKEN87fYqlsyj4J7wr+mTwT9AY4F1s4LA01vRVshXiAndSHhAF
 Wd9Ktr5x+fuPSmo2VmecNCKlrHboT3DA6howalgjs5L8dteSSSmerhXsowDprnFU5bw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FFA240AE5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7A3F98323; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:33:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4b02e8db6bef99424b95fdf4497e8d8e53c4e2b1
X-Git-Newrev: fd69ec2f626fb34dd3ffe8c62845ad47010eb513
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.C7A3F98323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/sound-theme-borealis: add missing license information
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3734100004725905856=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3734100004725905856==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd69ec2f626fb34dd3ffe8c62845ad47010eb513
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Sebastian Michel <sebastian.michel@oss.othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9a9ed35b567cb90cbaf44a57f0a5e085de910321)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============3734100004725905856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3734100004725905856==--
