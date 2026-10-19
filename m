Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13382CCF2DE
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6CFA80DA2;
	Mon, 19 Oct 2026 13:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGBWqNwu5N8w; Mon, 19 Oct 2026 13:14:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DFC4C80D45
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792415659;
	b=AlxZwLcTd+Dt0WoBQmcDBxcZviRhlP81KUZhEKc2RkOdz7as7r6rc8AS3KdzS2IaFKOw
	 W961RbqQBMzPA0q3l6ZZdBpL4Cj70nHgeIK9Rmw2aZcIm8lXf6w1Q7kOkJz3iPzwZyl5z
	 jiF45AJXPZnKlZjIiV87dfpL9+ZP1IRKBvitwfynfHGzDm9CgpF4PlerfQ/q0DeLFGm6t
	 F5i6ugyjBg8NRQv2jzUqH1vfIWfNTOjOdjYvrJL8+UHhuCHDBfX7upQWdSlQTbXLuTGTn
	 /sRWdQ4hL4GUx8Q7+MHVzMMhqQZoaI8ZL1Kor4owVFjfs7C/kC/l/xK8pc9ijRV+smw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792415659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0hrQyl4mceR/9FZKBFHtFs13h0NFCOAEZZGSUa5o+48=;
	b=q20J+98p+iWVOrlF4E42092+0TgQbfoUlwZXvNPTeRHPWkUSzw2hZw/j4GcFMShFBy2i
	 pDzepKe04mjBBXW67wSALE8WCWe+RV3fPgsj5dmex4oRDCA4izfSQi03RSHg0jszvfiu7
	 tLaVyB/V7azFhP029VGBPuRodVBU+Aad/sdE9fVMYHO8XYj+knKwV24ET1ugHbdVTZp78
	 36lW9cOYsvCLY3zHIsn41wRcTSlEHC/egHzvfJl/0GKB1/LFfSCvbk+rC4OmcvYRJi51r
	 tnG2JWtEOSMyttUzZN/FTO3N0Tr9Z8whfGtVuT+xVHAzQ6XsVALVV+59HtNgKP4wEKw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792415659;
	bh=0hrQyl4mceR/9FZKBFHtFs13h0NFCOAEZZGSUa5o+48=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KjdweF0NoaMns5xbTCthRaMUNiPY3rFDcztIhHkPvZ38DmqnYYlvHaY/iswpOkmCG
	 HAG82rNR3hMx9qW8a37Ygt4g31bny7YrfFr1+reToqR9AgXUNnygrg9O+5+w3t6Q93
	 zu1PqfFR61Wd7G2ciJZzZxcj+x8NUK7+xLGdVmtblS9iEJ0HA2jlZv+nOtuJ8PB3PH
	 VSIeejQ6fWd1KduYuqebgU1nWyEJ28Gax8ozmVLZZz6O3L7aXbFG/BJfrlpi0Jp0HC
	 0SNI2OxdkIokJekNIICfNV9i4L8kYxlgmpOWAvnSnDsmmJ+01hsBqcJWanTRKxmdFm
	 M9ZMXpSeFfClw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC4C80D45;
	Mon, 19 Oct 2026 13:14:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0764723A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EF38605F4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Fw8_2E8rjhW for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:14:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BE2EA605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792415655;
 b=Ct6d/IVHVRInMFGrCCty6MnUQO4vLSyrVoEc9RPaPuGAU49uZlQeDVhijDw4JKmA0+P4
 4ieURfcMrb//H2SG2yHsfsEvm/IJWyTlMKeSwHgvNU6oukGxmTcl5EwQeX7/Z+EnVzD9R
 gFVYL92YHCXZOClRHWlgOPV1NGzQTP+hZvVPXMyJZVZ2d3x5AWzCJtSsu8bh6Q/mo/jhP
 ApU7VFPqy6k+F3ED5glRQ9yRzTrgg5wgpRpPy4JfdyPJ7ZXrPmaYFLUZyBJu0xJayIqzU
 wqGyHkUxmQT7cvAibqaxEnhdtYrzEY9ydAQFgPunSDxpOEwgPcUbi3IWWa4QYyhoK9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792415655;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v0VYCgwT7py/WO9/7SE6oAONa4WPx/2cWKhP5xS3f5A=;
 b=iC3fDwkzHT6GMZfzcHhqGEq2wTPM4nXnO9LCexiqAzzz906G8OambZj0rLaZmjHYusYx
 /MtVgQdYPamwq+Sy8OY29Me0CIxAWzz8J6+7J8x+x/ugbpsQtDwMAPstz9q609SjRhEkG
 tfFtjG6iTGC6dIzURD6w376ElehrUQ2nxZ5mpfAtzovKiMkW45d9G18eZ/whx7L8uDEvT
 xY0oeU5M2xC7onjUXyEe6pCKYKL0ayyUmPv5w3AYRC/x39P7RDoMbZ/KBulcxPFkqYNgR
 VBDCCNZYYnJPfsy8v3OmOPMsWBpJ/Ua5G360GPWjQKZECfvpZLDYQZMNmONb5O2tmUg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2EA605F3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:14:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B6B598505; Mon, 19 Oct 2026 13:12:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 15:11:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c248f335f93d50117824beeee9f7381b9a5b8cf
X-Git-Newrev: f041d0bcfb76bf89b267d9a68794a86fa482e16e
X-Patchwork-Hint: ignore
Message-Id: <20261019131253.2B6B598505@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f041d0bcfb76bf89b267d9a68794a86fa482e16e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 4fdff326cb..fa420ae3b2 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  58fa258d0e1f93074c9afa792027fc259b85cb974ccc0b932b061d4ada5bd83a  armadillo-15.4.2.tar.xz
+sha256  63ee9351b54994dff7b4e2094a86ace48cfb41354cb65893a9dab7c8a16382c4  armadillo-15.6.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 15704952d3..fdc6cc39d7 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.4.2
+ARMADILLO_VERSION = 15.6.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
