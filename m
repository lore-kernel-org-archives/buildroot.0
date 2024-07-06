Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6BFC2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 06:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567618463B;
	Sat,  6 Jul 2024 06:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clqhHZ69UcQR; Sat,  6 Jul 2024 06:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ECB284641
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ECB284641;
	Sat,  6 Jul 2024 06:56:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 530751BF3AA
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 06:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D35884641
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 06:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q8TlGR8c2Zb for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 06:56:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D5A7C8463B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A7C8463B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D5A7C8463B
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 06:56:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a063f.dip0.t-ipconnect.de [91.58.6.63])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 350A4A4C0319
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 08:56:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49982)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sPzLR-000000000ps-2KNk
 for buildroot@buildroot.org; Sat, 06 Jul 2024 06:56:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 08:56:29 +0200
Message-Id: <20240706065629.572862-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720248990;
 bh=3XF60BCFfsN1EVkJAnVOAD9+H5bIBcbnPcLuKV67bo8=;
 h=From:To:Subject:Date:From;
 b=dq2ZMLhItf9G65yIoc30Pk2yvfzIwr04QvDtAT5N19+4v2XuvAb/oY7gY+r5U530J
 vyfoDPYZgr3YDVvGDZPuZRvi9PYVfvVEZoq9knLYMrzmbK+cRgIxoaOc+o1N2WYGQ3
 eAdmVS4+pcfItqcWvzlZk2oj3LDDF27JTEUSGHa+SZkKKbWNXUI278xxbFz1moUxrQ
 DeyBd1fe/WmGiAWWfOECe8U3Z8JjuYyUdLNh/xnLCDO0nOUNfkc5TO9icJwze6LJun
 UG0bDJgxvMkciUpCmG62kmiaoSrXZGdIzt8htsysMEhUNvC7H6sg3rTFi2vJ8qTIwj
 915C3ZBfmV8Qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=dq2ZMLhI
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.3.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/432

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index cd5f8a1c1b..59a82b001d 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  aea358b56186f943c2bbd350c9005b9359133d47e954cfc561385319ae5bb8d7  php-8.3.8.tar.xz
+sha256  bf4d7b8ea60a356064f88485278bd6f941a230ec16f0fc401574ce1445ad6c77  php-8.3.9.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 268b8e0a62..3fdce8186a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.8
+PHP_VERSION = 8.3.9
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
