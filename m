Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8AC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18544119C;
	Fri,  4 Jul 2025 16:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFXzwgslXz5o; Fri,  4 Jul 2025 16:56:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40276411AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40276411AC;
	Fri,  4 Jul 2025 16:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C71E12E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89E7E411AC
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BttNdoK9WGdh for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:56:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A87DF4119C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87DF4119C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A87DF4119C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:56:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB0F9A4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:56:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45526)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjiG-000000006KU-2chw
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:56:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:56:36 +0200
Message-Id: <20250704165636.3745028-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648196;
 bh=n/iES96JidO5kuckl1b9D1h0MfO6TaHV/h4PL0+8x7M=;
 h=From:To:Subject:Date:From;
 b=C/oT6raYMRs2TuyKQqFDJQC5kvgRJq9jYdmXJxHedvjYZwRWndmdyYzwkWgGgyb7j
 e8Yp3RPtkkwAToL2/dMjheoPAWmyrRr180zbhT9SVLMPV4L6n8j9Sr+ifdrQxjtS+T
 33SwYS4B1Jt00AcO+8bct3qQy6JA0Fncvlt2UH4RTod67JPLIhaDBncy6lpE6sXE7p
 iE9DjVDou7Nt8bFdo2VKDKtB4hIyOnlNp6KNf44JflPchUTYTxd+7RGzOmqEgVpIxn
 9OBqwfkLFgfSBYTxwlLeiowlVXDq+yx9kG/MwCtyLhVhgYY/bpMhX+gCPGmSFqgnhF
 3QfXqD3CQPPJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=C/oT6raY
Subject: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.24.0
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

Changelog: https://github.com/xmrig/xmrig/blob/v6.24.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 8dc4e3c876..89c8fa1c11 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79bf51c11ad3670b8330ca1432c9cdaf84f82b96f94b636e33d253be2b916d20  xmrig-6.22.3.tar.gz
+sha256  3521c592a18ada781d79c919ea6c1b7e5a8bcfe2ec666789bc55fd88a2aee8d3  xmrig-6.24.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index 97113ffe8b..860af71f75 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.22.3
+XMRIG_VERSION = 6.24.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
