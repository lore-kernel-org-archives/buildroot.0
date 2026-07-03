Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF48C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05AD440C12;
	Fri,  3 Jul 2026 19:04:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVTWQAfKcLNw; Fri,  3 Jul 2026 19:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D59F40C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783105463;
	bh=xYHXOD3PM4dZkVl3CnjjY1jlfv1JDDfTUIkjOxEBcy8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LUY+/U2U/YDs7PcZ29rpdyoS88C5w8d6++EVdltM0r5X5dBv+sQ6sbA6a2eMZzWyl
	 kUk5LFFubcQKXPkXQK15bCP98JxnejFY5PR+zG5sDNgJcFrPSsLE49rsd7/2BTPGNB
	 0G/4eSXDmJXtDH4rMpE+fIrA8TdBUdwfN4uL6gxywgTqX+o3r9xx8dWCk66W57NyQ+
	 XSeqYqoxBp7zNL62DWk4vsF4ChpS7Q1VhcI3BvihLRxHD0LNXKemUvoJrzLjMVRnyP
	 oMSzch3MP5GclGrQ3Ii/LFE0AB+sw2vqozXG2nRx9u4ARNTpqhtYRKYMY5zmsOTg1J
	 AnKc8XgcEEXgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D59F40C1D;
	Fri,  3 Jul 2026 19:04:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB5F14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACAF24005D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:04:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKmR8kvIBJEW for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:04:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9200A40056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9200A40056
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9200A40056
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:04:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1DA73A4C025C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:04:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50728)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjBR-000000004Hq-3Gc6
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:04:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:04:17 +0200
Message-ID: <20260703190417.3687939-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783105458;
 bh=3uwxI2uxU/T+k+ybdvO1obCWKDZEts0pabXOg5oxHyY=;
 h=From:To:Subject:Date:From;
 b=ltsv78vIVUI3dRo9gmLCN6eq354CVy0R3t4cnR4uTLeJAdqOO+qUxwVq/B8CFf/kY
 rWvlEd8qUIH0bWFtXuW8VWCeS+w/vEf19hRvPheGxk0rRAATWUODVkFhGRtocYQhV1
 Q77mwZtSUpQtdFSkPkMqwYgh1NgRdnzThiCrdBDDK9V1azbpfg2SzSPMY1qfFD2Z1F
 L7bslWtP5RUWDBVPMmahPSyUlYWgJ05iuZrFgmjOLk/wHBiPVy4tb+Pqt8yxacXz+g
 bvC/8Mt+I5FGbSQ4loAOfF53pEp1WLk9v+axOwZcNKW2F+4f5Fla13MpMiK1bESqsv
 4F0/NHOPyikiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ltsv78vI
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.5.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.php.net/ChangeLog-8.php#8.5.8
https://news-web.php.net/php.announce/498
https://github.com/php/php-src/blob/php-8.5.8/NEWS

Fixes CVE-2026-14355.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b91bfc334dc4ce271a79423f905bf27ea0026e2e

 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 2a89d03ecd..3c18506359 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  01ba2ed1c2658dacf91bebc8be6a4885f69b811c7993831fc48e26107ab29985  php-8.5.7.tar.xz
+sha256  58910198d19e873048fe87cdfe16bc790025417ede3d1651bfa1c4b533d573f2  php-8.5.8.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 0bfb12a8eb..56d66e40d7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.7
+PHP_VERSION = 8.5.8
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
