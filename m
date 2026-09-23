Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6E6C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B1D812C6;
	Thu, 24 Sep 2026 18:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPlc_CUk--bh; Thu, 24 Sep 2026 18:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8AACE81291
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276274;
	b=iGHAaZv40mw7Cf6QVcliHHsjgmfeaHJyxTpCiifmCZy809TavzyiTuSPo7Mhswka+uSt
	 kB4FQzg9ARSC0uBlPBZy57B1CofOKF7L7qpjlxBCXaQxfTsjMpX4CChQs3rxzjHAbn/h8
	 crEijscTrewcN9IyRoaNmpP6aP7Vvi35CHnjnEeG51KGKCRGLXEl70xWdv9fcinF5AcA9
	 1t7exPLmHq8HGwzBZMr2MrWCPQKxsKyoq4De1egOSBEbZjn6uPfQwpi9OMpwzrNyVyAux
	 Qw0ZK9RD6/RzWkVCx7EaShT/7gMCMAqhvhgSZfwrm8XvgnsrYXmEs9HIwfPKDmyN5qQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276274;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=WG9SrrZByqTXPjP/yEcp6IzCMYBTttQy9SgakfB2XAI=;
	b=WRCfAHkR7X+eoXOBxJAE5SFwy4yiHNm0ohtqaqBhE6pqdm42uFlBhUeqL0ddsLx92GpA
	 xTE2m/TMC1m8PBGWNfVYjqq2DbWrtgiKCPFovoTjdgyOq2Mz4T+aB4xhVYSO5s8zLv9re
	 PC/M5Iu6vwH5wVyO/OW/eTleinQ9uEBVzX0tKValAf2Mcgp5//U4cf9alkX80/Y6OUQH5
	 6/e6jZ+J7E27Qj/cbKRpaSQxQa5msEOtvn/EfdVr1QFIqVvVJoyiYtDisGI8Hj7n3v/cK
	 KUCHKh8COTL3RMPFsNCdgdSnFpvi6GkO5Qs/hjyX/pPO5I+4K2nhx76bHQ7KBjIaFcg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276274;
	bh=WG9SrrZByqTXPjP/yEcp6IzCMYBTttQy9SgakfB2XAI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aTRA6n75J/jjNAjRdDYyR2oFKc+BajN5jw80mf47T9h6hZ65vxQR5l3TEXtniIL/l
	 hyVWo2P8Gpw6ADPpqjBRdIMXDSVp+fSKw2wRBPU+lc5D2aIXgaz+0vJLU6ej/mf6mR
	 CCJEhdOPp9jHtdjABbhixlmoc0fV/rXb0Ef5RbGTjuM3J/kzQPwVQXBL9NR16z3yt4
	 YpUtXsnLFQl90vcUBBRTV8tiBQ23A/tH3uJcywZGwfEpiI4I4o8NrT0KmYflzY4fzb
	 67Fn6/jH9S7wp4dBTKFpHyZ7bWvXx6WdP3Zh5ZSjoEBQuFij0M/BIBWEvYwOy86+ET
	 D7idgq9VvvKSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AACE81291;
	Thu, 24 Sep 2026 18:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57CCB3B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54E4740AC3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyEHqKxm5WpH for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A787240AD4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=Jg4np5J+0F93HIHwA3WKv5CMkSHum46p/A2mBUecWwjs961oKjYF2MgNtggK5M5m6HSK
 YW3B9OwL2gltPVsGevSTtCGTCZUbnw0bfhi9s2EVfwEmN4eBOipS3QJWK1lXRSxhwbUSN
 5aFGjMMrpUcgqojsYSQZ3JAD4y/XDmPn8ijzvA6szkn/cQbS5cum7MAiXIHqh2f2nD4cj
 nWy44PmUSDEvyq73k4vSFvhK498YEWn6BOdaon6zc2PyzFaOr1cRRG7v8maR1LvTaQESP
 CV7C33kxhOfrgrVEfyprBUg/Q7W6nnWQuHcie4UZ2NwcqrfFlJW9xfHhW/YmmhLfcaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xyDeV3z8yfaw4ktgMZ4RLb/+Je+LHRpusoEIle3bsmA=;
 b=KrKXNi4x1iN9/E/4XTODG/aJRwt5tz7e3yLK4Q5+rwlrFWLD2MEIPWvz1XZBpfJ9LPK9
 hPYhdCa42+bGVcf0nVx/VqsrQq1+QSz8VFTjwEeyejN4GPmroLzbsGCtXAO7yKUxoMhyQ
 ZJ5efGtHkEyGwyqY/WP1zog0WVc/moPP65k0OTAWlRK635cbdKBLcAFRRM8MY2s+mPH9/
 ByCyOaUqwT7oyFJJ61ocLfxKDAOxjKMB5bxyYdYoRkqEjPbRXwgRziIKY/89FZiFj5384
 +84v3nj/TO+EyJTm/CWfa1vlrliY66jT4MBI5ras1xxc8THYwjSCHLwuBAAMHTtjQUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A787240AD4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BA829835A; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:23:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5cd2a457cae0ec936ac74fef251318c313d920d6
X-Git-Newrev: 98e7cb067b4de0fa318bbd1117b8495575ae251a
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.4BA829835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ghostscript:
 security bump to version 10.08.0
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
Content-Type: multipart/mixed; boundary="===============3006428740849306059=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3006428740849306059==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98e7cb067b4de0fa318bbd1117b8495575ae251a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://ghostscript.readthedocs.io/en/gs10.08.0/News.html
"This release addresses a number of potential security issues."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 458441ad76c0a1624b113dfaadbda2c16eccd5bf)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 94017262df..00cb1378d5 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
-sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10080/SHA512SUMS
+sha512  8006e2a32d03759a905b9548bdd83d4563173041006750e17e428b9eea24ad519aa4452ceecd7c073d3c420a68bf1b07ccc9e0533b1a05935f6b39ea8d9ce875  ghostscript-10.08.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 08e2667981..288efe2674 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.07.1
+GHOSTSCRIPT_VERSION = 10.08.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0

--===============3006428740849306059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3006428740849306059==--
