Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687E6C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A3540F16;
	Thu, 24 Sep 2026 19:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9z8C4aM2Ct4; Thu, 24 Sep 2026 19:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 336944122D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276401;
	b=OqgVF2C6uZ3exY33PYJTQaxSdcfsKFUzxjaNuECbPnI1oWFZiDJVW6xW6UJQqfXYtXYJ
	 UWciUGRJ9tL0QYqtAu0O41sM5xEMzCMcJkjArNgZ+ic0bxS0k9WSwUrQyGdnMm1UX2hy7
	 gOFoDG96hWDkj/vtvWZthQzKQeq89lTyV65MrpsNBKjp+xV034MJC4lWkl3XIhj0SAOOc
	 x7tZivdRfFUp5m5CNfiZ8zWQ5jA1Ko14ziRrbexITzNSX1tz/dJsg2wJXRzh7KBTEKBzh
	 Vsd7vunnRsd21m6lcgMQhokV5B0w7Ma4yRWx5mMkjCBHWM4aQ9tIuPPoyCJLmu6ocAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=OWYWtz9CeMgkew+FiJpp29cn0D34RgUG1rNxyezJQ0U=;
	b=OzfaVcD9ZH+HDlSdjqlPnbtTxZPj/erPb3JWyvRuUNdkJiwQqnzVG2Xou0vRoq7KOiaC
	 /R8ebmG0CgsDBmVgnuDwrWUAnzPZapeTIbqbsVBCNEQA/piK4XaZ25fw4RjHcu4jn303l
	 U5et/r9d3TKba9+nDqGorEPw0Y7Y7Gcn/F6cZ6YoRCLHhRs9iCNF3FOzizOYgIkPFO6IX
	 4gNj4gafxhRqAzJatVu7a72DV9X2iDH+arTzCbYjdaG9IeD2VRpHt48IqYHkReOZHkOLU
	 HMoEheuQ+9c4oDMKsL2pwY+5aMHHMfIKbbyC1xkDALVlCON9pPkzy3woP/230+siszQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276401;
	bh=OWYWtz9CeMgkew+FiJpp29cn0D34RgUG1rNxyezJQ0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b+kw8SrH3e0GAMvcPkVDiQf2iIs+vLrpbDF9ZW/dQi+kwqO4PKyAToctPZRw8o5iA
	 2L+Sf10JpaEukttIFbbO8axvwlANoW2IoDytfxzzByZfg+Nyr68UuC78VzTi3smaen
	 NqRMUHW/dkjzwdXCci8+EvnyFBFLMJ4BsqJIrZrANMz5u5lmgpin6uDQNGTTTPZLkE
	 Zb3jrCESPhQQahL/as8IK/MPgZYeD9lA7+ImlGYPbGkHM/EIpO3bqPCR0zxqJVE+gB
	 dHo+vtShIYLG+X0JXH5RdBCrX2b06A9m8JDNzlyKs+n2Bidxg4sMiWVCMw5CQp/0ZC
	 gqALYh3XYdxyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 336944122D;
	Thu, 24 Sep 2026 19:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F6C0332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11636404CD
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bx0WjdkgwrG for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4B2B5404B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276214;
 b=Vptq6ZUOPIdHQkkAYOT5yHGdNO/GejCYZGmmPu4bxjc4rXMiISpsJNS4b/2RToxXhMnI
 0CFubwvh9hUIgPdr+VK3P97JDkVjMeoIDSqqe6exhqkYPMFb18+f+5prDpgMbwZbXvhJ3
 M96MXsSjBm0HDqP/5t6RVagm3I2VSMTHXjiPRi7mGOkhC3nCom2Bl4uqEyssJrNB4b2/L
 wUxjLwF567FIVCgazV0Kqn4ea7yDUKa14ZCF5xw2A4Y5RYJjcHM5L7BK0rNMYBulcwWaV
 24+TLhzJtVKPo3MT72NaBMzdoKQexzB/zNL5VXZo05Mq9b17aFmH+jKttKc0bgzOGug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276214;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qKv4d5zH2yhenT2jqyq7fTT7XMpHdjwgdK3lmTgOCOI=;
 b=sA/IJwPzvEG5l3Bjb15o4Ytxs2q5Q/9YEdp1SYrF/pQm7Xech0DjH1QFKwraORgzNNk+
 DDyi5sZEMuGzmt7pT0WHOvAYctClVVquLjxwBIV35CmeQHIzGw2mTgmXXLSiwEEWXxXcC
 /gUKvrfkBaJyt2Ze4axSn1JttfkBohF2uHoMEZtTcXE+o1uLNRspVJ22zfi6zeJg4Fill
 rSWnohjKKlqoTLVS818/lamyiJlGI6FchtCXlree3SQmhShhKl84nE/+U0MlTIWzj9fAF
 2X+0ABC+8WftZImOrHOdMabLPkppIMjGE9dWjroYaE4TDzKBJcuXRl5Eb6+w02Too8Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B2B5404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2F6B9828F; Thu, 24 Sep 2026 18:55:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:36:02 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 53d6021990bbc50da95021ef34b56872f1636ae0
X-Git-Newrev: 7f43f542321b2438ae0b53b2c5874e8578061950
X-Patchwork-Hint: ignore
Message-Id: <20260924185543.E2F6B9828F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libmpeg2: fix
 build with C23 compilers
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
Content-Type: multipart/mixed; boundary="===============8724093994516486004=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8724093994516486004==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f43f542321b2438ae0b53b2c5874e8578061950
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

libmpeg2 contains code using K&R-style empty parameter list
declarations, which no longer builds with C23 compilers.

This causes issues with:

- GCC >= 15.x, which defaults to C23

- GCC 14.x, since the bump of autoconf to 2.73 in commit
  a6e8c07a330a389e9578d8f1110e41becac264d2, as it causes -std=c23 to
  be added in the CFLAGS by the autoconf machinery. This doesn't
  happen with GCC 13.

Fixes:

  http://autobuild.buildroot.net/results/53daf0b4bd8b476252ca219e53a966405ece7e51

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f472d08d87dadb4301db2afbb72088bf573d7c8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libmpeg2/libmpeg2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index ec23dff57b..4d4e17d13d 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -16,6 +16,10 @@ LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
+# Compilers using C23 no longer allows K&R style function
+# declarations, so force to use gnu89 standard.
+LIBMPEG2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 LIBMPEG2_CPE_ID_VENDOR = videolan
 
 ifeq ($(BR2_PACKAGE_SDL),y)

--===============8724093994516486004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8724093994516486004==--
