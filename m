Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E30CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A12540A59;
	Sat, 10 Oct 2026 09:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PStVKoObG9jc; Sat, 10 Oct 2026 09:27:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6582240A55
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624477;
	b=ssBcTsmx1iB3wRZxPQ6IPSuG6nqk3/Ii5wDGg/JrD3KQDh0z8DpaycPU1hYQ3PgP6Izp
	 R8hBpNvF1T9uOhxILgVT2amc0I0kPjFEd1IAnKXbg8UBN1Lf6S4sQdVtN7+GgBJAzhStX
	 bsrISGnT3aRBqlJs9gM4QFbmHlO3ZSnvxqAFHbhD/n3CevtMeK9E60JWyqwJaD26jvI+V
	 9XO9gVtMLfEVPMf4wR+jLDMiY9GYepsKkUt/jIRbl7SLEl2Iu/H7qquP1bX4bg9gI4tsC
	 8aROsxupDVop4gl+ec4ew7Y2Z48sJdfkbQ8cijoULLDtox7VQG5LCYhjhY6VY/0Oikw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624477;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=oJ74lay6Fze60j2xq69WdIIPR8Jxzkbe9FeluoocLk4=;
	b=LHlvMRW7z4kaqi/rOIqqtWRnb+ouw+fh3tC0c5nqs3u8W44MTXEd1U4w5uVL2gmzjYhp
	 d9QK9/v0j0BPLg/PRRnzEIW5j2G/M+IIEo+zYJc4BWE94ljiruOUr7vA6tgacy/ll0PfR
	 Bpm20+I2U/6DQwT99SvYGQFkHhp8aqxvWyDfOPBJEz+3t6mXbMDFfyL1Kv4Ta88LTeda8
	 WDjk+dAMtJxOdDxqljrcNNQIE9NO4NIPWpcn4lQ0l5oiW3dHbTIAOf7QoxfLtKYBKdzEa
	 B4PeR947aVieKxHf55vEkT9WhsBY91F4bL5gQuEBH/j2C0+yMrCLdITgumKj9YbIvOQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624477;
	bh=oJ74lay6Fze60j2xq69WdIIPR8Jxzkbe9FeluoocLk4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L78TdCeVghh1udeFyaeoCu38/B2dPVaowgKnrCO6rjltQ8NS/9HfMOwzIBVQtGuFh
	 R4K+BM9uKDkGLe9+RmZTje756U/jB2isT49Fqg08h7QJWz4WLYJGlJLcCbOCfhdqbU
	 Ru6YDYzjWQGhgf9CIeR2r6crRyIlmTFt+DZ/zENaG/syxjssX/eivCnRys853z/e9r
	 t/MHxYZVhgZ7VaPjnpV+3dQR2pJZEEddQEVV/EnpPM4uOr5SELu4nmKskkVMJqC2ua
	 Qo2xUV5vtvLZOiVVPhSyaEXTkVvEyGjoTlxifpCZI/1dqQrNokkNkqkiSkzZ9et9AV
	 B+vWMZKQQET/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6582240A55;
	Sat, 10 Oct 2026 09:27:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF9975
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D8D481126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw4m2117nxEb for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2363581149
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=EVihipK32xTuIdKyb5azW8m+2bWu9c/t8Dbg94ROlWl1IRQFipG0ot0pFhRMc46rejGX
 Q3hQT7P5LksMpK9/YKtHr2lGzNhOD7fJe/WOutk/qA0Px6FQOGyWSsIx3/oBkm7Lh0EX9
 LQWXwhVYQW/fXGe/PqKScVKg0T/lA+eGUqPmtAYY3558r3/td3LFH33Sl044vNOLt+GTb
 rwANCBIDUSATYGVM71++ay57VrByt3RstBistY5/NqHLAuG/Dv4N/WsJjs7q831jH770G
 PjkKMzGxEpU3Tu/kHeek6xYjhIBN4VG1UJDeZciOW3Kmjfq3hFF5bu5HKOTT1ifUw2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OANsica+Wr/FNCVLQmnWGFDuSfrnjiEZ0PXHM1D2Uqk=;
 b=G9gDverVsGopzjJfDDYnKOtEp96+QDlVYOpuGX2W+8Qh/2RVNGR0FHXEacLwzoltNCeo
 aRPDtARZFZXwHpyed8lIrScv0e/GeStjJ6m+L6OporVPFtv3xBOPo56Xcb1uJ0zxcI5rI
 thsk53RaEdml3W4AGmTqk34yJLml/2JFOF5DrMKPTtnc4q+3dLNOySy//M5pv/rzQj1CJ
 VUTMwbuklDLyj+85io/x2shvXTUswE70WvUzLsO/n5YhskDavkYcyO7MVuUeR0MlKqH1o
 TId00nBwK+Dh70WLpnTZ6Ta+KUcmRlh+RT1pXwMXrQaDbgMjfcsMgEgd7KDhkMwlaaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2363581149
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C74C8F1BD; Sat, 10 Oct 2026 09:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:08:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bc6c924679d28d9f017222015fa5bcef87e74ee3
X-Git-Newrev: c2d96727116dec1b776a6f7633548406a549642e
X-Patchwork-Hint: ignore
Message-Id: <20261010092604.0C74C8F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/haproxy: allow
 Lua 5.4
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
Content-Type: multipart/mixed; boundary="===============5781903396005961279=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5781903396005961279==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2d96727116dec1b776a6f7633548406a549642e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

see commit "MEDIUM: lua: Add support for the Lua 5.4"
https://github.com/haproxy/haproxy/commit/08ed98fd7963968de49593304fdd9234812845a4

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d36891dcee1a806c32ed926376aa8ed90855064)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/haproxy/haproxy.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 5f29eec955..9dffe0f625 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -40,7 +40,7 @@ HAPROXY_MAKE_OPTS += USE_THREAD=1
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 HAPROXY_DEPENDENCIES += lua
 HAPROXY_MAKE_OPTS += \
 	LUA_LIB_NAME=lua \

--===============5781903396005961279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5781903396005961279==--
