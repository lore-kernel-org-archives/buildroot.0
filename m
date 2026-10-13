Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B54CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF2364052B;
	Tue, 13 Oct 2026 11:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxchInCjvsl6; Tue, 13 Oct 2026 11:57:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D98D240536
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892672;
	b=PbuOmMVT3cBmuGBtI/nHT1PytSZD4nEGNf80r7102brppc+LdvJBRsLtwH9fuuTL3zvN
	 zKOrorKyq6GQc/E7Nct275dTTr4kZszScwXJKu0PGNQeBR7C0odULwiIv1b9WMXYtJWGH
	 N/SC4gNqSKj2jUsCGUD4DIg9SkW4bBbiyHqYjoLaKTKxhhKaWTO8LqBM616wh7Pvpac22
	 V1fwzuTDf6WLPmrHkp1XIE7OYg5tcZ0zOfT4tQpxIU8R2f/12g44QFrSjcDfBxNaVGKEy
	 cvF1yJYW9ZIwsLUCzzD/jc8i51eahyGsndVKSg8PubMFQf5nhSqHECeNxV5LaTXr5+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892672;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JXYiRBJfzMx38iD1GVqdwuGKeQY5/xCehCJVRh7gnOM=;
	b=ayrbczVyzmp4ETKUgCd4WEVC6s6eLX/7XhPcwqZcjvlzfAh///lN/dplPD2o9gvtT80R
	 0XU/21Did2D6KRAkRNM8+2WMSJabbB7FdsnoBEP+4mh9O/i3gqbJ2rRlzTd+MwiSchS2q
	 MGov8eVlGsNTYvmZN7lMIXzGM63YZQr3koHspiGW9cEIOuSKBCJY2MausSAJM6uAU9pF9
	 so81DJlU4s9xHnMf/2/EsiZ6hkRv4Ut0xHbncOI7b2vnsGHIrHfmzOVArhRZWU9xhwKsZ
	 QXLY8el953GhYoA8KVWBfVvUge3Ld1gsD4bLurWeFJD3FY+YbfHXP+kqVF1l9jLX+2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892672;
	bh=JXYiRBJfzMx38iD1GVqdwuGKeQY5/xCehCJVRh7gnOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tue/CMXTwTBcotEwvTRNgU02CFCGVHKJzq6JGJVTbWr7wkBu7NPaY75azrHsW1VqQ
	 ePEfhV66All0FVlJ50tJO0nqOqZV4ifh1/UJicDDipmgXNPMAeL0Arfldq1uM6wp5u
	 qpjl9+NQrL5fYHTVzm8LE27xQroUsGm+2D0Ry1tKqLWXu4w/AFytSDDM6ZqUHlp6X7
	 7o5qDX0tGET95DeSVrmf4uFcb9xhpfM4Nk0hhHdBxCq2HUs64TXqdzHZKb1K9//pER
	 Sgi8F/dE/+09fdxaQ1GQukzntx9j1Gcb3jEyPiGvQhSvzU7uYHU+L8j5DhLfm8ft1w
	 H19yCndU7YAGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98D240536;
	Tue, 13 Oct 2026 11:57:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FAEC1399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C509605CC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5ea6LZcsAjc for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C2D0605D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=XjTT5jaR/mV9SHHXUk+yR8+J4bQ2xCL3NBgvlvX2gg1v0y9Az9gT4uFjBqchytq3cmvK
 BFqHeUw4zoscc1wfY0kg77g87s8S967gmixXJ5qgQJbkaK6sRd+vhs9Bf2Gwz1QDZS2Y7
 TB3L/+YBoVHW/kGPQHUv/F3joDIu7zmGwE8wTnl68Q0BQ1YhQ5tfJSi0p9cwHdG6BP83c
 bjl8pqbF4z8DPkRgp016QlVpJpsB6o7NcIOK2o48QQ0JnG0+LDXNRYStgVcC+wCcIcRVo
 Pfv4K8euc+O7ilO97Hos6BFmX1smtMTI3KSyfybmgUX/25k15a0VjKjqTODMOrlFc2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=f1xrn0knImYqbl6fWKvhA3GKl1B2g4ePnpwAndtX1HU=;
 b=jw17YebcFxTREW/GxKT57rvPv5z9RMdwDT6YIko2B5+g7RAElxPUSTGPZhwsQKYagFdg
 cqOeRAqveM1FYymaf7IM/sAL9X8ZUS7kV0mOJ/9zye1mdX1Sm5a6avasOv8g4jvV3UjRT
 cH0Kmrg95lQbD9vhXPNmQ59DN1ri2WVj4AyGj9xv8LMrivmw8bzIg28aDLI3lr7AO8Be8
 t/4YU5eDI4M4rwGOy78a/cc9KfZJTDxpqPXXkITwcrpkWyqpxf3g6PVPJlwpxr8wwwPs2
 Tc4Hwm66OHWTl7ygntI0G6tJMUtUG5Qxm30FlyPzumEPI8WFfkU8Y8hEO/Z8u3XLQ5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C2D0605D6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AE4A956A3; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48f8b4530fc5f72c464ef7e90abbdd4f6ffbe0bd
X-Git-Newrev: f1d0f5b398370396c8eb818389e105dd40d03fc9
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.0AE4A956A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-lwp-protocol-https: bump to
 version 6.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1d0f5b398370396c8eb818389e105dd40d03fc9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/LWP-Protocol-https-6.17/diff/OALDERS/LWP-Protocol-https-6.14#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash | 6 +++---
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index 658eb62343..7bcbe32fb2 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  65401e3e34be653c9e3b31f798ed5454  LWP-Protocol-https-6.14.tar.gz
-sha256  59cdeabf26950d4f1bef70f096b0d77c5b1c5a7b5ad1b66d71b681ba279cbb2a  LWP-Protocol-https-6.14.tar.gz
+md5  ec336ad8e2cd3dabf8db3d31f40beb80  LWP-Protocol-https-6.17.tar.gz
+sha256  361c7c1eee8cf66812958f975f26ef2e2272a0c6221d2043477cb9c22b8d1c23  LWP-Protocol-https-6.17.tar.gz
 
 # computed by scancpan
-sha256  e4def55436b2bd99fe2cdbf546a72ad5958327e28831db9b5adb497c6bd580ba  LICENSE
+sha256  ae31d234f4c72051ff9c8eb439a85f2cc11ddfbf776b748864ab7f7727e1c4d0  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 1b4482e166..c67fa40e00 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.14
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.17
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
