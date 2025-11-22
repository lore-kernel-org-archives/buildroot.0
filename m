Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC2FCFC533
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69EF40836;
	Sat, 22 Nov 2025 12:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PkxfG2gc8nxS; Sat, 22 Nov 2025 12:49:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E0D4084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16E0D4084B;
	Sat, 22 Nov 2025 12:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACBF634E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9CC560BE2
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-hXCgZuQc54 for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:49:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C82AA60593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C82AA60593
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C82AA60593
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:49:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11CCEA4C7413
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:49:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55310)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMn37-000000007Vf-2ECL
 for buildroot@buildroot.org; Sat, 22 Nov 2025 12:49:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 13:49:09 +0100
Message-ID: <20251122124909.2229139-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763815750;
 bh=iFvNq702Mn3PVplZO/x/Z+hgPAAsA1ACCOtr/7Dnzwk=;
 h=From:To:Subject:Date:From;
 b=HkqatQteLUtRtz0Hk7rmg3XN6dAg8wXNVjrioisGIZPBsiBS3jo3lDLLhtxDjRKIF
 v5N16Gw3hmlKE9mTexxSh3/gC63PS+L0yP/tViAmLGv8eQvNLZkhkbIwb9S0XwFG+1
 NONSQGNIy8BMLZ5y/MFfMi8lyqtcQCsVFpG8mgjZ4UY0p029d41N5RKEDlwg5UrjSW
 AgCq/qhIusXoHzVP9C4fYtYU2WLQwR8Qjg/KYqdJbhYBzGzqIgH8a7nIH9Cd67O8J5
 YSKJC7K7ZCuCuWQboTGyIsHaOws04OfgIP/pXsHhNlDygo0xdRf99zwsDnWRiDkDYG
 W4ocE7uZn2LWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=HkqatQte
Subject: [Buildroot] [PATCH 1/1] package/open-plc-utils: bump version
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

Changelog:
https://github.com/qca/open-plc-utils/compare/1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2...46c3506453c15b873fd6ed3e76c9872cea5e143a

Upstream commit
https://github.com/qca/open-plc-utils/commit/cbf52f68b5e2ab0c4071600ab34126120e54f5cd
fixes build errors with newer gcc versions.

Instead of adding this patch to buildroot we bump to HEAD which also
includes other bug fixes and documentation updates.

Fixes:
https://autobuild.buildroot.net/results/c74/c74730bbadc9ba20cdccf448dbc508d0afbabf41/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/open-plc-utils/open-plc-utils.hash | 2 +-
 package/open-plc-utils/open-plc-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open-plc-utils/open-plc-utils.hash b/package/open-plc-utils/open-plc-utils.hash
index 0ab661231a..bcb5253bb9 100644
--- a/package/open-plc-utils/open-plc-utils.hash
+++ b/package/open-plc-utils/open-plc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4b1b55896939f178321ffe1ec2dc6937ea688d577b3671a5f0edb5c3326dfa3d  open-plc-utils-1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2.tar.gz
+sha256  e02ffc2d2abde6f31c183b0717742c243b5746d0dbe9ffaa38f6154f14a1bd4d  open-plc-utils-46c3506453c15b873fd6ed3e76c9872cea5e143a.tar.gz
 sha256  3137c632bbcec5e88b72dc13f4fe06ee184eea364fec8f7494bdfa57672ef921  LICENSE
diff --git a/package/open-plc-utils/open-plc-utils.mk b/package/open-plc-utils/open-plc-utils.mk
index 086552e09b..1c0d213278 100644
--- a/package/open-plc-utils/open-plc-utils.mk
+++ b/package/open-plc-utils/open-plc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN_PLC_UTILS_VERSION = 1ba7d5a042e4e8ff6858b08e113eec5dc4e89cf2
+OPEN_PLC_UTILS_VERSION = 46c3506453c15b873fd6ed3e76c9872cea5e143a
 OPEN_PLC_UTILS_SITE = $(call github,qca,open-plc-utils,$(OPEN_PLC_UTILS_VERSION))
 OPEN_PLC_UTILS_LICENSE = BSD-3-Clause
 OPEN_PLC_UTILS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
