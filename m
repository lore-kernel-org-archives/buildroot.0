Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BC3CA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECAD60830;
	Tue,  6 Oct 2026 16:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7C7tdz4YPnA; Tue,  6 Oct 2026 16:30:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3097060814
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304247;
	b=SKsg6dqwVKOGX+xH2FV6dNaiP34PDl68LlflePxSEM4RzMqOv7MTE99qPN1R262AOD1s
	 X5zuUIdiYX+TZEepSeViDtwjL+xqHYDRdtR4jo0W7kbCk2tB8kJGQhhf6Q/QgHbvLfxGH
	 IwQfl4Q5rTQXzlZaS7BH7FWwxviGGGE1m251YyEp1khQJOchwmIbtBKiNoSJFKP8kHZ4D
	 dyH0bWgKwcTF6PD9hzmBZJ7H6rNwGGY40g3MlNC0Hz+bilogN+EK98jwNQ6RSSJXUlIAE
	 DceAAVMoKQ6MvmTbwS0IKD9+f2Sfpq/H9TviurP7ZYlMtB/PNkEIOfKVTSM5cDzsEBw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SA8qQJZFfzwaedPBnrJ3eDKut/1neK+byCTWo9hX16E=;
	b=HB5GGcLjKXkWVTubDHkNc4CRVKOkg2+kU1tTBGMitAGFGhtwDdENwmZPKV2/oHHpcyiK
	 UrwLDN6ytdbnHFbHZTT4sGJREWgwxaHtb1elEu2zULqsNTp5OXLU6Tjvip18r9Dnppzty
	 ke0PXU7cnxXmvVWVUOpxmKqsK68TZD5jE50P3YZb3Zbjic7lP3sGlM9CbazCJ5fA4J3We
	 LMcyWutmi0HOfjud1rdUb83NMjknvAHyzl0qNBgKvqQ5sZb/Z0ElCPMouVxyM6M7J9Cg1
	 GiClopydgNhWKBM3MrbIL3XYVAtn3yPzFszT3tJmNQpPw4q3eDSsYTarxfzP5ozzLKQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304247;
	bh=SA8qQJZFfzwaedPBnrJ3eDKut/1neK+byCTWo9hX16E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JMPkU7wHf8QkKn7oN1jh1KFBAdIDXJZJ+JLlUmJkbgd22ofy6uwZLlWm3UJvAUron
	 Bn9B+hQmRfqegfvIC46TZWYykQZPJ177k0vjpDvc3ip2w/MkFb+I9cOJUvsZ+AaDnY
	 qHTdIfxf6gxWn+MS68g83ou4BoXEtgRpd5tgteZoR8C6RTdx2lxC6T1gjE7OFHFiEk
	 JcwhFI0VzvBz56GFri4W81ANSgzBZZBW5WKI2j44DVQ76BNrQFGN2XMnEPV0d0CTeo
	 KcuRm0NxXilYofgaUASQHcUBvX5BMFW5lwwkRfg/YhlD1i03zKmysIJncuA1kKAQ6k
	 UQQCeM08qeBHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3097060814;
	Tue,  6 Oct 2026 16:30:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 669E0317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57CB1402BA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35E-7qajK5iD for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9F3C1402B7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304041;
 b=MSHONrffJWIR0mvBM67Nr+tnvn4wwzKwxZc1NIwQkz8TDjjxWe42xwrZ12Lk1Xo8MGYJ
 DSQL889NNgnJj6k0zF1WVOVkwAm5jdkOZ52tCTCkvy2IFkWEzlKEw7pcsHwktk1QyRA9G
 gBTM3HzTSd3k3tFm9CoUKWo6Z8WAGiYxK2gER7Q7Eq54zD6WJzdfM9/ZbtOTxwmuPwsYB
 N4/3/UjJkRnTK6B6s5gDORjcFNA/t9PB6xX4ZcoyTHGZSpdqFyjg4l9t1/eALbiNAyJlq
 CbYxRq1pyS6VDb7fyYJoV1Gw0zinBt6L4eaThG5/63LrMTauHzZcqZrSdJHWmUxNPFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304041;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LOVtSvdxbxDqErzeNZRwmUNNwXsNgqEe0hfETRN/qtA=;
 b=mX49ROSPaTAM2Uqxh5LjtFde4uRRQ5WTXMNFl9Fh3IpiaMLFp96xTQ/WEE5dxMZXXuhI
 sMiRwoMiwyBH6MIVthHz7GhDH6lec5nu1TK8favsq1UlIonVbanpB/kF9cl4dBq5PpJDI
 +9W9LOg2SaBo6xwpow2FB5xziFcIdmXD/oeJZCG8BG1Nl2gbr5Cx+S3a7sZQHLzsI9KzY
 lVnAgCQlryQMISK55dt7Zp67a3elBHxadMKFSYdOWoFCYOGg4vt6q3aKGr2iLIRuFAy1N
 3UgHTYHunvFsHZIYEwBNS1dyekbBGHScDpChd7s0khRdv4YhFQVTSaWXgis7DLkwvdg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3C1402B7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5778C8DA0D; Tue,  6 Oct 2026 16:26:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Oct 2026 16:54:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 960eeaf8e7560adc2e4b1d5cc5f09968db10240d
X-Git-Newrev: c1bee371accaf16ec5917bde493ef47498af4341
X-Patchwork-Hint: ignore
Message-Id: <20261006162605.5778C8DA0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: bump to
 version 50.0.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1bee371accaf16ec5917bde493ef47498af4341
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 02d199ac3b..ae9444e290 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  f4d6d4b4671ebaf2c86f2fa5ec4beac9056f30129fea17338c35c87eb25daf1b  python-cryptography-48.0.0-cargo6.tar.gz
+sha256  3ec3cc6a6ae288ab6ac455e1ef7f124a6858b0482c0db4e161889268f8c1bc20  python-cryptography-50.0.2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index bb4a5084cc..a8cdb6c2c8 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 48.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 50.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/a9/db8f313fdcd85d767d4973515e1db101f9c71f95fced83233de224673757
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9d/af/182eb91b0df3fe75c4d9f26fe70684569566745f6ba7e5c9c73a862c5252
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
