Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185BFC4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3067612E5;
	Thu, 11 Apr 2024 17:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7eF8MUnjbI5; Thu, 11 Apr 2024 17:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB588612F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB588612F6;
	Thu, 11 Apr 2024 17:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7B9B1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1D7C612F6
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dH_QrUwj84nv for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 17:33:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E557D612E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E557D612E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E557D612E5
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 17:33:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be10.dip0.t-ipconnect.de [84.161.190.16])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E34BA4C317D
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 19:33:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36710)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1ruyJ4-000000000l2-2Db5
 for buildroot@buildroot.org; Thu, 11 Apr 2024 17:33:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 19:33:50 +0200
Message-Id: <20240411173350.2498278-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712856831;
 bh=WQ1z1Ao9xDeb3S0eRB2CJYWmmF6ij2s3HMSIec2TqX0=;
 h=From:To:Subject:Date:From;
 b=n1qnF9XJP7S1/MNZ9FlF04FqicdNR8ENUu4htL4SX/rVGenUxMFwo5bg3BZiflKQE
 /wlf2b7EeWJ95z2L28p9wQToN8JPp135lryh7WiZe0NJrkNcOr3Vsw6PJnh+Zgo7gN
 UqhQSfSHILWc2DN8P66xJEo/62zYQ+zkMmY9nxsNpaZgayDqmXDf5UMqr8M6MAdW2i
 JyDHumQlxw8qffxVDHsrg5ssu+2+IgpcH8Vyp48B93gU4xY5p+BekuR+6teIiU+/5Q
 9bS17RIIQVvo5WNOlbnzzhMwIOxe13FtiICzchaNm8uSFD6FQ4CLwLegVJhi9CKxIE
 halwE1APjUIeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=n1qnF9XJ
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.3.6
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

Fixes CVE-2024-1874, CVE-2024-2756, CVE-2024-2757 & CVE-2024-3096.

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
Release notes: https://news-web.php.net/php.announce/424

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 96f16ff2a7..4378d7ed07 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  39a337036a546e5c28aea76cf424ac172db5156bd8a8fd85252e389409a5ba63  php-8.3.4.tar.xz
+sha256  53c8386b2123af97626d3438b3e4058e0c5914cb74b048a6676c57ac647f5eae  php-8.3.6.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 99dbec9de7..5b26ec90e2 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.4
+PHP_VERSION = 8.3.6
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
