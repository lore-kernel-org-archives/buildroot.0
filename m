Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEE0CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 18:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 921B9812CD;
	Sun, 12 Oct 2025 18:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wepqSQ1I_4sn; Sun, 12 Oct 2025 18:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9EB812E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9EB812E8;
	Sun, 12 Oct 2025 18:22:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D47C12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B9260901
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Q08xtz5PszO for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 18:22:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 532E360725
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 532E360725
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 532E360725
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 18:22:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 952D6A4C670E;
 Sun, 12 Oct 2025 20:20:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45202)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v80g5-000000000yp-3H0G;
 Sun, 12 Oct 2025 18:20:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:20:05 +0200
Message-ID: <20251012182016.2711834-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012182016.2711834-1-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760293218;
 bh=XRjdx78A363rFRJoKRWrVlbz8L8u6tpOxOJN81cRjYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nIE7854emZk7dEIqGzvFu7nRVim2m2AUj1DVP4xtXAhH+uNkJHG80xHje7TBg9l3v
 dKgfj8dwv5EH3iPdCxHPl/SW8OYWPjW4FoH2IChsKFy4o08jmKJceKk49ISQF+M4kM
 ySbynmij8QDptbN2t09uBWRTn3WSQ3Xf8WTzqGRc4IBM1TnuFCNrbFDAf6EefoT6fD
 kzp7bPPoEOQ7TkK0YDYz//5Kcg1LYbM0+2gZgE73az3hz6dzOSiRDEdyVkTXwA3S4s
 HcADEazGWe2C6XgMMyXM2HF9MfQs3RamhxgCvCnYSArEaw/0tpytTsj54ggumyOMbF
 n4W1NmNwraYTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=nIE7854e
Subject: [Buildroot] [PATCH 10/21] package/python-bsdiff4: bump version to
 1.2.6
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
Cc: Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/ilanschnell/bsdiff4/blob/1.2.6/CHANGELOG.txt

Updated license hash due to copyright year bump:
https://github.com/ilanschnell/bsdiff4/commit/9eefc06cefa3aad2b2c71ddbe8ef92571cd36be1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bsdiff4/python-bsdiff4.hash | 6 +++---
 package/python-bsdiff4/python-bsdiff4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bsdiff4/python-bsdiff4.hash b/package/python-bsdiff4/python-bsdiff4.hash
index 4b09dd132b..2ea2e83be6 100644
--- a/package/python-bsdiff4/python-bsdiff4.hash
+++ b/package/python-bsdiff4/python-bsdiff4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bsdiff4/json
-md5  6fae66687d99305e2bf15887c9f80cf9  bsdiff4-1.2.5.tar.gz
-sha256  cdd83f820ecb8f1ef67a4e5f0b152c61d327caf7abf35aa9a763413915b21368  bsdiff4-1.2.5.tar.gz
+md5  7150cf7e21905b47f169a27355dfb529  bsdiff4-1.2.6.tar.gz
+sha256  2ab57d01a78b39e29e5accc9cfead4130982ded9dccbc4261bd0e9c51d6b751d  bsdiff4-1.2.6.tar.gz
 # Locally computed sha256 checksums
-sha256  c6c921c90383f1c43beb53c49a652d28309a410a7c394c729fd8870271451cf0  LICENSE
+sha256  44a0326b645fc642428a3978568d3a5c1061b503ce7fb7ef18fbc20be5476e2b  LICENSE
diff --git a/package/python-bsdiff4/python-bsdiff4.mk b/package/python-bsdiff4/python-bsdiff4.mk
index 2b48bdb646..1b10b63913 100644
--- a/package/python-bsdiff4/python-bsdiff4.mk
+++ b/package/python-bsdiff4/python-bsdiff4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BSDIFF4_VERSION = 1.2.5
+PYTHON_BSDIFF4_VERSION = 1.2.6
 PYTHON_BSDIFF4_SOURCE = bsdiff4-$(PYTHON_BSDIFF4_VERSION).tar.gz
-PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/43/49/262497fc308aa998d7431130cb8526b16aa43f2cca500d0182fb68689d99
+PYTHON_BSDIFF4_SITE = https://files.pythonhosted.org/packages/53/b9/4559ede9a4c8c4451688303544da84654643fdc7f28790aca85be80b4b7c
 PYTHON_BSDIFF4_LICENSE = BSD-2-Clause, BSD-Protection (core.c)
 PYTHON_BSDIFF4_LICENSE_FILES = LICENSE
 PYTHON_BSDIFF4_CPE_ID_VENDOR = pypi
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
