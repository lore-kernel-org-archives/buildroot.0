Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24280C79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10A1408E9;
	Thu, 10 Sep 2026 19:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoVBicT2PM53; Thu, 10 Sep 2026 19:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 06E194082A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069791;
	b=mexQ29tSqXbGU9vojUHKJnB/bb99Q9aLNnZHmV3G9JEjYHxkkqHVX/6k191/CeXlkLQW
	 HSZpU3L0G8d6LSi69zOnNiTEQSU5S8B/A0SBCOzmVfGyS6ZMoLqPqP1dVq4fnYzYpgohF
	 Fd6kZ9EswqfBV100BcTCSOl6Bk8pdCbto4FFpfh4eRTSeRK25C065bQiYSZPhu6tRUU0R
	 jvjdljK6neCSBSMlAW4j2BZust3dZz1Bi/UN1bqJwwMnHqwhHJ3fxHCmUbkbWfTlysYWc
	 igQ+GXk6IoAPX9QA530djff9OatI2HKpjRe1ahf1ds5CBuWOT0IxPTtleHKFFDabuxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069791;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=swgKpo91NjX+0I/2306N3zYCoLjEvwTZBbK3kZfgWMM=;
	b=fmxGwmLVx+QBFQm2Wp+ckIXe1T+LmhN2IBbREj+MSCJk9lBo3bDuaMkgg6Kv1I3KabTl
	 glLQOKaJjN30kRGLgjbRp0ZZDVVv9B/74/Dh8x3GQKzBOb6f5iFIXHoaxxiVag6tUmmf9
	 BT9/4YgRKd1AllUMII6lh5BGaJ7LA4IUFdmysOqhmfavngFjnbn/PYZmtVNGZ27ia9KzL
	 XDzsE15AbFTWsOKJBSqogFUiIgrQub+jylxP8mR0hvpeZDHkylfogvoU31CrJl796Kb/0
	 WgsDN26qUKuN03UQwwJjtZCzkq8ztW0GcrdcF4ColUPnuoKLfSgy1Y/DJG+9bMDWSLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069791;
	bh=swgKpo91NjX+0I/2306N3zYCoLjEvwTZBbK3kZfgWMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QebqsFRKzDxh6V/dz1aJP1nqPdrln3P5QyyL8wJoKWLTUV4Nt58j02ZljHfySjote
	 Llije6BnG2FuoDdJEMQc/Z4CDitRjj9ZttGhRLOf2yw3XaVIxTGylOHnLBEoHcU4u5
	 9VtU0Iwfguv4R+Vj+dKfqRIOmWYzcP480pga1t5Gu6iaYI5R3srGQTyAkJFsfjCboo
	 GmHyF1NuHhm/42uui9KCzP3IK8W0rvCCKkdvRhTjDxP8TaX1MKZi+wMYEEJ+s6Nh+C
	 JzCvV1YtrnQjCCrfOIWI4z1Xy8bhv46eg0pha76NSE9V+emyP5cbJ55QSfcFWq0D0H
	 YpxrrQWBH0OWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06E194082A;
	Thu, 10 Sep 2026 19:49:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B1C769
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BD2781148
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIpFAaKYShnm for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:49:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC27C81142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069788;
 b=rNsSfp1tkccRE1BF3V5rpY85h8viwdQ3sEIQ3ZJc6FHPYgoryx3uCCXgFZvg74cpEuvk
 hY6naYPRYUmUEzwhpxDB/05aP+9XQFbAF4M0StU28c5XQ+nnTKlwVChH6IT/8O0J/T0Gf
 NM6Q1WCfewMg4Y+grgXSWN559bQCbypjN2O0KaWxCtBq3xKH6zZGmcZxU8hNPrlMxqKvt
 NACgb1v/D+CLa36d59+jQ8gW80SRqyoFle/ne1piZeux8TvsjVCmdjvmTwLnsrvgdZ4bp
 +UTLZCIJ5NEhTXNEcKgKbsFp0Xeku6uZbQfzP83FjzFufG6xoBkVO7pZvD5jjKjV6Gg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069788;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wLDmAa8u0qlRbOI10B+QNntGT9YSTHvG7NSjQPKKxFs=;
 b=amkLj7mGryf9CeMglA/+ym3f3BoIQt1DYOQx5ZA6eOL/hxY1K0ideCpiK8GBL4w2bLEx
 fuE4EoSjjT/wiPIOczpgTTjwq46jFiMSV2Q0S7U5YcTERsZD76oiv1t78PMJl3izmsSIG
 Dt9OUfdsc4KavighPVL/Qsxh1GnY3B5iHFcemBGDQVP8zVYVU0VPs/ebFjZy1sHJnRqe4
 URhENItYVQQOZAgK+hLvjUz3YvpnMRL2VffpHs8vXFesQyx4Sts8W+4U9YRFVYOJyumGE
 jrrngHza3ASuo+KskQNspy2xcZK+D3AQ3UzRtXQ6XXyOQoOTgaluwE/Tx6Ct8Wob4kw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC27C81142
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:49:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 395E695547; Thu, 10 Sep 2026 19:48:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:48:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2083b53b320faeecf18381e1a281cf5118da5987
X-Git-Newrev: 2603561b12b8c7d8f4737147182d6c487eba077c
X-Patchwork-Hint: ignore
Message-Id: <20260910194845.395E695547@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-propcache: skip dependency
 check
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2603561b12b8c7d8f4737147182d6c487eba077c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The python-propcache package specifies an unnecessarily strict cython
version, disable the check so that we can update cython.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-propcache/python-propcache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index 88d1f2cfba..d1f659498e 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -10,6 +10,7 @@ PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf6
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
+PYTHON_PROPCACHE_BUILD_OPTS = --skip-dependency-check
 PYTHON_PROPCACHE_DEPENDENCIES = \
 	host-python-cython \
 	host-python-expandvars
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
