Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1465C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44DCE4101F;
	Thu, 24 Sep 2026 18:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PPSxyysVEzZ; Thu, 24 Sep 2026 18:58:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE29A4107E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276335;
	b=fQTIFS73OhjsfGyxx2Vmc1ZwdhWZb68LXRK54uV5ZYO6j7Nww7UGNZgceTPCDzEkC3H7
	 +exM2nHvlV10mNcfPEBny+Jc7HlPM31krLmpOtf6UkpazuR4QyiA+614Bz8qtOv75m9aE
	 IVgQihm7Q6TXM0rxpANitEIiRRGm+hYQRQn3uzCZyboFpCLOb3uBp5FecikEZhPiZxAj+
	 MogkK9HAjxk4cK1tR2OZtmLFu+FkH1tOe9xGyAejdjZB821tktT9wH460Ci+YSHuvTDVc
	 3n3fbEq2Out6y4C3OKmZzmUAZiH9tSLeboyShawL4+xUMoKJDyGYgeJNCc8uLOaS2xQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=urjP+wF+yLXLqazN5cpwPUAxNXEdG7bvlX8ybbxj/+s=;
	b=g1VNIdL7IsfLReun1zPiToNiwxvS0zPiMHDTpJeKLsr/QtROe0Y3yUNlPvLAoMPocAWL
	 mvx6KteLYyrDZkMoHpxN/AFzF3/G7o04H1WTqa6UKJ9vL43UvdSsGgAKD11sF2xdqD4hX
	 wrPGWBL0l55MHLf4AGAoMfwmtz1PjsIgxfmmawi7t0W6xWmOf7p8Kl9QxqinZuPEuzUnk
	 hF6f7N8AoEoGZ9yLG3Q8/9ZbSJxv6ZXgMjVgh87VsEiKmmB1VEdC0xUJ5dML1cYML4IpR
	 BqUdimFa1Y0Q+71CCHela6CpyZkFL/910jJUIa+5BmqV1oWnvBhKVGCtPknqbz+hUpA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276335;
	bh=urjP+wF+yLXLqazN5cpwPUAxNXEdG7bvlX8ybbxj/+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gy0KOAqCgZOShaXafC81nYW70rLhxS0fXYtmIUxS1PYvpTyBl6ih6tIEtFb/00ooQ
	 3SwkePXAJJgs92Bl5CR5sTFualyg7XMfIC/D/IP0JziABctonXEGJ3ZMeASSP1OW1Z
	 jK/TZ0wJIVdrMGxgwZ/1ASlCu14iWWfV5kHPtM02Q5vHbIeBRciNq1CzXBWDcEI/XP
	 ZBUS60oKBE0PFidWG779Qle/adhHXYbAuZkigi01ldTZP7fX17Y51DjH0GTlHuqs2B
	 UlWRDrqETgZJN59ET5jlKX2fsg13dpmgdRdlgF0/2TnhkV9TxjKTKkyIAb21y5d4Pq
	 xDxxepYQd5rNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE29A4107E;
	Thu, 24 Sep 2026 18:58:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CAD9332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 436EE404CA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6N0KLvFE-xvi for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 71A25404D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=GVYGszgu8I88+bEGAJ1+rxjOc+MUqydBKMVG30QoIhAOi25wN5EnqJchwQZIy7lA/9c9
 4zvE3AXjz2MLJcT7ItAb2M/yavrzuRooRUm6zXTGseTCc1zH5Aq/UIC63+7dc3Hle3pqI
 deLnirb60nHQqKW9/1oiVEaRfGE/+NjedbBlCqCokFnW8/v1TjkAPUuOIyp9eRz5PL5BX
 jmvxTFkSUmiU/gZCsP/6Hv/e9fteixhVFOyQe3ZpQhmmkcI7skULe14jrrpSC8UTdd0bv
 7wtEzmhn6KRflVAORUfbTWxnlYH4Xuccq24Tm7Lx7ifkK0gyeP96Zit5GKa+cFytOBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=21t35ZJ0x1dCg37tJGWlUcSCYxP9qMKTlcWE2l+2Hak=;
 b=c6yQP7mQMuEMH/kMGyQ/u2j2nju+O9wPhEdPWK/lGm3Qa11eiycskK3POAEB1eY+ES/k
 3Mc6gWNntDFv7UyFncbB440jK78lMb3EKmF+HQQ2VHw0XYfas8zdLT8Mps2ZiEhYNqPOc
 QMjpCs4P3AWOPU5eDQa2PHSdq3ZrDpwZEFPWdclcAFJQyFJLU+BZ1NTO7n4S5PmPXrid7
 Byyi0WppwtrBhQsAJquSiqMNc/Adna+kil9tD974oyTfhPv1lA7tEGrT5Oew+88w4IOt0
 PlvLVH6c3qwk1waIOGU5nU6aCUifECfS/cwt+k/SqeU6voiGdOglwE8elLc1I50ZQ2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71A25404D5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1518E98323; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:56:09 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 95cec04c18898798f1b4633b1e53a3a39bf63b99
X-Git-Newrev: e1195dcc2a13e1176a71ae16cda824eadf60c13a
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.1518E98323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wpewebkit:
 propagate gst1-libav architecture dependency
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
Content-Type: multipart/mixed; boundary="===============3094275682577276820=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3094275682577276820==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e1195dcc2a13e1176a71ae16cda824eadf60c13a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA selects BR2_PACKAGE_GST1_LIBAV, which
depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS, but doesn't propagate
this dependency. In practice, there is no issue, as webkitgtk is only
available on a subset of CPU architectures, while
BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS makes ffmpeg available on pretty much
all CPU architectures, except Cortex-M, m68k coldfire, and some
specific cases of OpenRISC, which are not supported by webkitgtk.

But for the sake of having correct dependency propagation, let's fix
this.

The other packages selected by BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA have
dependencies that are already handled at the top-level
BR2_PACKAGE_WPEWEBKIT option.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 251a80dd9d5322d15afb8ffd5766ce879c478331)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 03e9eaf59e..4a747a22c9 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -87,6 +87,7 @@ comment "sandboxing supports needs a toolchain w/ headers >= 3.17"
 
 config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 	bool "multimedia support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # gst1-libav
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS

--===============3094275682577276820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3094275682577276820==--
