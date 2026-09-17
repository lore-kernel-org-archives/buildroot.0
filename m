Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4F1C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9344A60807;
	Thu, 17 Sep 2026 07:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGqcg0O95PZk; Thu, 17 Sep 2026 07:40:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ADA54605D5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789630831;
	b=aRq9UKeszj2v3SYZ3EkgPUo6/8eAAT3cbf4DfhVBnbt/84HcDCyI7de2XOd2rSWZa2Ea
	 efTRpZdidF46DN37I1boa/ermc1uhZ8HDIh32nNcP4e55OjBtX7mC/sEf93BIQomx8HNp
	 H//b2d27cdZK9LeS9wS6mhvtOBagcTSAhmqRxeK8nBgXf3rgeYDZkV6NtCedThE21ueIQ
	 oXHz2K9xAkQySUCmyEwJ9J9bmELimClrIDLQ/Dq3RBK3JSMhpgl/sBP2dZDev9PEWRw+D
	 d0hCPWVNi3gqRg3dIYrI8pE8GubjF2Df1RaY+etpy+qoNJ0TUiqxy7ne6m4GQFR5Izg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789630831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XlP1RCtf2qOlo/296QsBB5SIn4gHgGb+pAKstRcYmEw=;
	b=IklnU9yZrjeH8mpdL5bELXUrLuhaFNPuge7THJo95jgmpZKZ3lzgLfMd9IrDLrGB6H/q
	 fx/Os9pTahLz4dFkt2cRtvQ95osW7oApJ73MkFkBwdBBKSdkQJuGG9pYLXMQVEj7w/a08
	 Iu5NMFLQvGDiOum/W36bkBL0VBMVlDXSvbkzSb99ISLhm0Q+HS42/12GFMt0mnRrSHFgZ
	 m+tM0T+70i2cbFDcPmNxg+keAY1UO+4DYnB7jlJNxgvHHc2Mncrcolf7FTmuhJqXYuw3L
	 f30A+VYimktJOapSwULN86Mcogfdbge9Jal9+rdzQybUbUF/NyLaaiuAYCN7blqhQPg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789630831;
	bh=XlP1RCtf2qOlo/296QsBB5SIn4gHgGb+pAKstRcYmEw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F40LOJfzoCly8TsHJyi8CICcRXE+tttpeyP3TzaryYFf8WkvR9R7GOMYji6AHM44G
	 MXvv3Xq355B1Fk/elUipZolc2TgD7/An0uSSmaGejr3YUS1xmxKdiUQU2wH6Celejd
	 B9+6wmqrIPSGGzOI1ajwduR6tnw2FNsu0Q0kccbDYA3BBFdo3FhP35Tv1HwJS0cvV0
	 zlMBRzOSCodoN7jEeJiHff0xb4gqx1iSQa3H8jFNx31Fz6/VrGJWRH8X9Bhwk5FEpp
	 Nx4n6sTcNV8TkDusGeV+TXEUdC7crDmuHAGpngQHx9EnxvZsyoA/+S2gBVS3R+p8q7
	 IPvsiUlvTKJbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADA54605D5;
	Thu, 17 Sep 2026 07:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBD13422
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB5E400F6
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m5Mvd3PjGLH for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1611A400F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789630829;
 b=kKGSa6lOJvqCsFfF1OoX4unrkPNPkZ1K/2Unvmu0rNYunubNOTpjh2FgdiNMGQrWCYey
 cDk/+R3UR4VmtiGY3TossJmC+0zXodonygSjiEMhPO3atxRp8Kqfj2fD/M2jr1Zaxca4a
 l9HkR3oBHnjsyEM1wowgkZnityIpJ4CBUIzzuK37aP3nvJKHiQklEzq0yi0AQu5FOWQRH
 iS8ckYcuZ/g35ZfL0ylAbh9gauo7hpPUB6AfWwFwsRI3UW0OUh6bLKozALzjF4wdMYBT9
 Riz/XGVdVwIyyFFDcQ62DGfV/Up/2cR4z0bv7Cy9imfWDm9hQ64Bp206e6I7Jv0puHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789630829;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5ko/Yg2/HMlXguQryJaFU6R9ns7f1qhetLZK4XDdYMM=;
 b=HoR/3NcsKewsU2gcVqWZin9aOOS/f2BdCkV6diZwsGQxG0F42xoRK/BwzZARZd2wn1aC
 Fo4sSULqARBjFETrw2zT5vYB/i+HwFA3FqPYtECz4J6zZyqHfgdoZ/IwvCNF8Wn3USi1F
 LJavIqs1FppGAHMItSAyYXdnH0B5dASL95XIu89gm1n67cF2vqfZAsYW4KFBxNaDPGqC0
 PxvwqBAbCU7po4bJTOp09BTLvbWzPHo0K/iFmUFfCPrNDKuPhJujw/yrkNAI/kT9xLKY8
 ZMeKcW7T++ZZbURHMXuBbg6X/jjIebXNMhkr21PmiNDBC8I4Q6MHU6dn60cPW/OXyiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1611A400F3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E37F960DC; Thu, 17 Sep 2026 07:39:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 08:37:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b016989c61340b528a09599694b86000b98efc56
X-Git-Newrev: e38f9b9f969754b15996829abc95868456e3ee8e
X-Patchwork-Hint: ignore
Message-Id: <20260917073922.5E37F960DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/broot: bump to version 1.60.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e38f9b9f969754b15996829abc95868456e3ee8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://github.com/Canop/broot/blob/v1.60.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index d883337d9d..1f45965fd5 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  c7ff621324c799976d52becd7d0c24aad6f991b10421303884065305d4c00a1a  broot-1.60.0-cargo6.tar.gz
+sha256  6daf2a7381fdbce5acc08261c2899304b4a1efa7c33623e456b8c45853cdb7a0  broot-1.60.1-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index c4cdce2e51..1467f55279 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.60.0
+BROOT_VERSION = 1.60.1
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
