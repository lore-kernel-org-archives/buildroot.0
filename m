Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1B2C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 593C0410DC;
	Thu, 24 Sep 2026 18:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGYAYlgWXQUh; Thu, 24 Sep 2026 18:59:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 757A0410D6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276343;
	b=DiKHAqoCQqc1LoDl3ADFg2lO6Z89ivD0cQ61WH5mxBCosvfjf8Nt1AEJ1QpI84ALAaYL
	 RYqM6tM/R8NECQPLclwzzCsMyW5Z8rpYrVTZYWnvKQtSF3tNvkKKIv0cRVFiH4UTKlk3F
	 2l/ADyaBPPSVR6MJRa99Lj8jRN1fB8dYuvFBLH+CWj/akxyiO1XoT4gUDN8L/wzSLvj+F
	 XMluizZtoHoO8LUR8l13Q/feGhcFvjegVr7+RZQ1Ubx89qoKPoFDn+oIFbGC6tmYQT8MM
	 HfGaGGK7B6uDhJZquK5jsE/yHT62hqcKUzWVDctXJBjazWGGf8lKIkPt4tE742ZwURw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276343;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=EI0PhRS+aTTLopzthQZo2SJEV7ek681Zs8NO2KiC6gE=;
	b=qSIPQUTzZ5430U3GJjOCi7wkcaZQ3uXxhm4Vt0Iqoj0xXtVBbDRHJQ4diXY5aX68jYRH
	 uSO9GXxVxY6hXzB02A12HQuzt6GNN2fKDdmU9ZU6U/kbUFRjqh3HX4WijdVS919OB0sXQ
	 88Oa3wOfqdAwXe4dLUV8+ucnFmYDb2Naoai3mMXYaHArHlguqvN5IeUgP8x+1x3lYJdtp
	 HWU4IVQabNvN+eknoU4mq4wonkkTJWZINFmNfA3tzujWQC4baVE3xwwliaTfOKBtiutLd
	 OLtFFbiUGwuEelVaqIg6zrqOIvpw3xyWk14wac1MyPkLFs2/bCmc6cZceOJZbybp7Nw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276343;
	bh=EI0PhRS+aTTLopzthQZo2SJEV7ek681Zs8NO2KiC6gE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ruCwq5knK9cqm2B7Jru32nFmzU4ZzCAj+RbHANKdrKTgYMytCXaZExTqCyq/lUQ2y
	 HjBZN2thfABjoIv54+9o3FbveIakje4Zmh26wFr2fPIID+tZfWIsHJ8ed+YHegJ5+Y
	 vac9XgK7J5YwW7Zf7sOC2HRUmIoWO6pSWAm8cRPvENy4MXHRrEsE6WeSmLg4HtVwBl
	 1zTAQYyKTo2TUPlvSwhC7J3+qg5vvzS6McsErUbh7Lw+vp32bN0Jo7PV6WVXkZe9Xr
	 /cLap4cZ7OneBpJUyH5op/NWNCXZgCeph3Hc3oQ2v/J/p9Y2C6RnVtt3Ft1PhiVGlx
	 qPKDDStJ+eq3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757A0410D6;
	Thu, 24 Sep 2026 18:59:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA933332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC3F3404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHisTcmP3OhY for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E36FC404C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=Tov8JLC9bLPPWTecRIZol6wviFmOXJnl1gZr7tl4WtWU2qNirCyYf+gbvgV32E0+jrAb
 WKVlDB5508A6ystZU2qQGab/bTHVxhxh4oIcrbjDS5xSVwfNMsZ9v5cCzBahm8ehD1FUJ
 /vehlluI4gl/WYdDimtTli0sD0KcnWQw2g0hafM2rNdMKDB344SSecoK6ji/VoA2/6aoN
 s5/2lQFe2UuwFL+I3sGpiSP6BcCwy086/cCP3xRnIVoMw6Vu0SI7xktiIuNZvhqWib+42
 V4BXXYjdd8bTde+AzH3rEqnP/duTFBnqx86vvC78SZfOvlZV5SDmeOAJYwjtmNH+oSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GFpbbNbTsgcjneXX+v2jPxjOB7azqeHpg/CNT/X88Kc=;
 b=SiscRrQzcGujCk4zJrMxGs80eJZXk3cH7ayz6v2gIrVaMSMmdCnvWfUtCrlj6ysMIh9u
 6grfEBOfyLYmKiPhLua3ZXB1h0awATUoL0y/wyF4RxG5b7IpZfCtNcSDIV8+wWdKE8gvi
 98XbQjyzJP1yRg7XYrjGeVRpWxe9LHej5HIMom0UzUcvN9vkunwI9fAoQlGnhkKyJECK0
 yrhcA3OI/YIpJI5R72dnXK9BrKMcE+ttMm56CoYzu/f9fRqcF3xGPnmdnV9iQ5BiXhLia
 X/DYkFafgiSAne7ot1rK4/NQyJ/lYN3uBWKIqI0ziBe2+pnvQSHCod74hKoTW43VAmA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E36FC404C6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83E658E85A; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:08:06 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c15befa90d1dc0b410daef340c8874d02706db16
X-Git-Newrev: 2e5b9f12fa07a186bab79973cc3a1467b966150f
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.83E658E85A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/bind: fix
 Config.in comment
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
Content-Type: multipart/mixed; boundary="===============6167126056948063032=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6167126056948063032==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2e5b9f12fa07a186bab79973cc3a1467b966150f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The comment should be shown when !BR2_INSTALL_LIBSTDCPP is true, also
treat BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS as arch dependency.

Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security  bump version to 9.20.24")
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96ac57460fedab7fc0ed23355ed3ecaf395423a3)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index ab8ddcd0a2..4eb024b260 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -51,6 +51,6 @@ endif
 comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

--===============6167126056948063032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6167126056948063032==--
