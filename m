Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DCAD78784
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 14:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D07361273;
	Fri, 19 Dec 2025 14:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LX7YPs7MCYLw; Fri, 19 Dec 2025 14:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D22E61259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766154011;
	bh=45sQo0WKjo7B3Y5/KNvV5iQ5lOAex26ckjk53+9Reco=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XWHoXFF0kGfimyl9bzqyohmrvL0CI3/On98j1USB9IMOo+YH38K+l9KUyCtVPIKDg
	 ZGTiaSxCTFd/gcxoceCWtml4e5A9hFAlLO1wQ/t1/jEqohARE3eB98k2nRWFEnqLzT
	 n58JB5OIfR68tmZ7E+f4uJjBvXkFBEHSdX9l9t6bP2ujSJyvIw6cMY84bhLghPGEzQ
	 KlcHv3j8D+hPfTRrmQULjTa3G5HJ+QE59r8MSyHSaQhsiMhEetGFR/aHyJkvLtHQn5
	 uMDSacrtUr0HT5JD6plSjy4WfKxs4q2uK+/akYgbbDqyxhW4QqsJLMMo+qt5Kxnm8w
	 Cj8w4H8OqsI1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D22E61259;
	Fri, 19 Dec 2025 14:20:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F14DD293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 14:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2E5F4091E
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 14:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LU9Nmz0Hp_xg for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 14:20:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AB44840B50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB44840B50
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB44840B50
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 14:20:08 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B1928B005BF;
 Fri, 19 Dec 2025 15:20:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Fri, 19 Dec 2025 15:19:44 +0100
Message-ID: <20251219141944.43869-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766154006;
 bh=MvgVbPnB5bYbu8QaAxMQbTliJ5SX6pkG+CsDROxxMeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=BPiKvb0KpjPLDZNVjn3lylkLgTOqkmtf0UPJPJuoA/n8VY2RgNQEPdjBK8aQINnOb
 YOWhFxCaGOL4G1V0RZZDQP48Az1gAk8QG98j+kLmPp9l46tA0oNOtWgs4bI2vCUQ/n
 lh2Y/R7hOuxrwmIP4wxj8Z73ssmjoZ9BwGp4ZtZ53Z/iNVKFE4Pla9MqxR3DaRlJCD
 50p7jrnCjub+bw0J7wMXS/B/hzTvMWKQF8Og2qI3TtnL5v+VpVp6FN/z+ivYKYZc5i
 HhbmTfWjOHhB+TCzOJUZeG+xylqcejjl2GiBH5McDL3sAZNbXb9FJDTxf5SDE5XJ6k
 /GyGEwqepL5yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BPiKvb0K
Subject: [Buildroot] [PATCH 1/1] package/dmidecode: bump to version 3.7
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.nongnu.org/archive/html/dmidecode-devel/2025-12/msg00039.html

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/dmidecode/dmidecode.hash | 4 ++--
 package/dmidecode/dmidecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dmidecode/dmidecode.hash b/package/dmidecode/dmidecode.hash
index ab1f62be65dd..f145f216ede6 100644
--- a/package/dmidecode/dmidecode.hash
+++ b/package/dmidecode/dmidecode.hash
@@ -1,4 +1,4 @@
 # Locally computed after checking pgp signature from:
-# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.6.tar.xz.sig
-sha256  e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae  dmidecode-3.6.tar.xz
+# https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.7.tar.xz.sig
+sha256  2c3aed12c85a1e6a9410d406d5e417c455466dc1bc7c89278bb32cf7cad91e8a  dmidecode-3.7.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index 550e29d6247f..da19e1e1c981 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DMIDECODE_VERSION = 3.6
+DMIDECODE_VERSION = 3.7
 DMIDECODE_SOURCE = dmidecode-$(DMIDECODE_VERSION).tar.xz
 DMIDECODE_SITE = http://download.savannah.gnu.org/releases/dmidecode
 DMIDECODE_LICENSE = GPL-2.0+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
