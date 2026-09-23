Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25888C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E117340BFD;
	Thu, 24 Sep 2026 18:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uxo3APHuSkYM; Thu, 24 Sep 2026 18:58:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE07A40B8C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276295;
	b=kRXW9Lit3aalg206YQYp6EMdfZpugwrpnmMwgZKYsu86Xw4fjNH8XdrTN/xXVeKamDo4
	 Xo6V+gVJMGd7jG+tDeUvUSVdP403ByAbuxybb6hv/2NM3rd/ol4HBYbdSSt1Pa2Y3gnKj
	 /D8LwF7B/F/IVZT9oKyJU+q9unQzznQiZHTx4SYc0rxHT0y16bFVM4cCBqeP0PxDpgXx1
	 PzWPM35YNek6i12NNPXowfjXSk9dGmt9L93yTDY+o/mX6WPudz0lU/ZUfjPGdzTlmtnuS
	 aZgTPVJNAAQeZf/XfKwAfmiWZ9zBEnCOCYYKceAtHQeHMA033To7Ku7CB7v/vlwpnGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276295;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ngpuoftgpn4wwudjx6kBnYxKGBYGLt15z/93yOWyfXc=;
	b=XYP26MEq+56w2cYcUfEAFW+R/M+L+hDYSnLQO49zFm4CqGyApwIKb5n4XzHxyZHDswAC
	 jDqob/Ulhz8FEXDEyeAHDEuNaCtVspUrAPVJ+L1w9vvpyqbWVN7rpjhiZocO4TCEDGQZy
	 9/k+yuU41ubtWICPl4Gp2fuABqnaIYH+nzxekNPGsSAV1vVJ5wVnjZg07QXb9Z8S3HRXS
	 enkbbWy2LW99HgrLVPIPpeW0Vuxxj4e+FzqhuWSng00TcVYCR2JeQD4dFDPVorrWDId2I
	 mMIK2rXt0xpwAT7bo/DLY5gH54f94GQh1rZwQZu1O31PC4JMhx6PDfHSqUF4i5MSEAQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276295;
	bh=ngpuoftgpn4wwudjx6kBnYxKGBYGLt15z/93yOWyfXc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qwl3tlYZ6oY1jP9fnp0RTngY/P0FpzM730oIfuUlh4xBhzeqY+k050p+ZOZlRUanm
	 fxq3Gkh4Exkv4eJzmHoF6eicQSf5K9rb3y3qZW1hr3LNQMLNvBumhLxj/uuXRbtipk
	 hAU7PzWVd7oo+zT0Nx/UfcKmAvSTHAXlnjdE8rFEIwmz3Tjs+39xEmx043aXWduHz2
	 GIvzL2rl9u3mb293UB+KjkPo5VNIhgJwHCUjvfSg2khFGdRF7UN1uesRaqYNmDLfGg
	 pGGxbyqguni3zMWoGd9LnPACid9VVyw2IkupxQnNXEVTKwDa1yp5/g6NiTc4e/3vTv
	 TMiWed/F11/RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE07A40B8C;
	Thu, 24 Sep 2026 18:58:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 764FC328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BBE940AC6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2exXLj19ZlPa for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7CDD440AE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276205;
 b=fxElwfthxieGlzACG+wf9VvV5bRSlh6JLN/MEVO84dr+v/aikp8OJ+T+/bzUm0Ok9Zbr
 i3wAK0zufHSnn3BGdkr8ytLK6FbzNogT7LvLd6M18u9xQT4a/U1wt4cWTVJYDU/96177C
 1haDe837sIidrRnNdKDuatOCDi7GHN9vyZauUYy/dUcezEwqkFRr3sbXhZ17zAXEfB+xv
 A+3PyYDjEyTZYnKSBUCt0Jl07IXMGEeQOAFmRx5tljsdYClaGMCV+b7rvLCUhvBigt77L
 sQGaA2k2J4nEqlnbU4PdB2eT3rawWI/AtmvHMdQfhwZukwB74nNfF6aQP1w7zoboj+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276205;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=a5Xti6vp96/DZG3riamWatKLzmtTUFHHbExWekgkpHs=;
 b=lSvEPCsjI6B7AmS2RGBCRo6hPD26jQCN46RDT1cL0xUpw129cPZ3BbadFJuJecNk1mFd
 WC1DhIW9YXXWVIV0Q9slZqT7t3Jhv/EHjnx/E2DbroZSc1VP0TZiJtT8eYDuHZJCSmyze
 5EGQmMSuNFaj/Eee04dIo/Y/SHfOf7ryJsLbZWyp4x2M6Kb+IUcJn2A18T5ydWsPgt8cw
 3SRDZF6ov1UBQEVhJ9faSm+6iMyecCSBcIckREeYCytCgS5YSuFnIADgwPirR0cxsJeGu
 ZMLe85vrMBlDO56ePvV4/YKt+d5HS/ZQYsgKTvtO21xVukxQI7EwZlA3/TCAcibJczQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CDD440AE4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FED1976B0; Thu, 24 Sep 2026 18:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:36:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c69b8f3aabef79ed73c30eaa19e4fd00cca279a7
X-Git-Newrev: e1435d6b632b600d297773e5aabcc2ccd40ce902
X-Patchwork-Hint: ignore
Message-Id: <20260924185535.1FED1976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/boost: remove
 dependencies on Boost.DateTime
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
Content-Type: multipart/mixed; boundary="===============4199361707114921996=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4199361707114921996==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e1435d6b632b600d297773e5aabcc2ccd40ce902
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Boost.DateTime is header-only since 1.77.0
The Boost Release Notes[0] didn't mention it but it was introduced in
the documentation of DateTime in this commit: [1]

This was bumped in buildroot in d39d8f7cee9b4634e6f490020204f63fae419e8e

So analog to the "header-only" move of Boost.System we have now to
gradually phase out the dependencies on this library. Ideally before
the stub is removed as it now happened for Boost.System in 1.89.0.

[0] https://www.boost.org/releases/1.77.0/
[1] https://github.com/boostorg/date_time/commit/33dc6136f193a100c753c819694d6d11e9ab4123

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a235a33cfea320907e330023c1c6ec1645a4374a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a9ab4836b5..7b78345798 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -95,6 +95,9 @@ config BR2_PACKAGE_BOOST_DATE_TIME
 	  A set of date-time libraries based on generic programming
 	  concepts.
 
+	  This library is header only since boost 1.77.0. Building a
+	  stub library is still supported for backward compatibility.
+
 config BR2_PACKAGE_BOOST_EXCEPTION
 	bool "boost-exception"
 	help
@@ -200,7 +203,6 @@ config BR2_PACKAGE_BOOST_LOG
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_THREAD
@@ -359,7 +361,6 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_m68k_cf
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help

--===============4199361707114921996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4199361707114921996==--
