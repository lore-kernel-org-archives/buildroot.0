Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDAEC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0692661633;
	Fri,  4 Jul 2025 16:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfHby2m-9aI5; Fri,  4 Jul 2025 16:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493C261630
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493C261630;
	Fri,  4 Jul 2025 16:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1E4F7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8CAE61632
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-19Z2jPjL8N for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB15A60BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB15A60BCB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB15A60BCB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:56:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10437A4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:56:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50434)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjhx-000000006H3-056C
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:56:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:56:16 +0200
Message-Id: <20250704165616.3740341-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648177;
 bh=nEWLlQqN/MN1e1QmiDmNb4noDZ+h6kX8V4EdubkpQOI=;
 h=From:To:Subject:Date:From;
 b=FX7fuB6jNjeKECz3bhYwc8lbzNtSzOUtpw1Bbh5d4f+Fp0drtcCPpd92Hnb0y1wtv
 qI5xdxW5Kx6JGloxxGGKdcwj5mxL4MUr5eqvKWakAkCfwiLHGmTwpVCA9jXXrykMjL
 AVJKLymDNhuMnJCkGjDlOH/ZHdH/EV04/Bj2/wxGLpBJCdODjyvmgOxUefX4hQ/JyZ
 ZHaMvdBKr+fhKs5z0b/3uGN3p7/K0zmGP625KdSvH1g0m9qNxLjb3K9KrrfLqBA7Zh
 ol0NtZEkz1VAMpGeQ4SajpyxapsamC6XZU5ysmgcBzsnbJYKmAu+ZVqv23fkv7M/zF
 8yr6d3hZwXm9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=FX7fuB6j
Subject: [Buildroot] [PATCH 1/1] package/pciutils: bump version to 3.14.0
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
https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pciutils/pciutils.hash | 2 +-
 package/pciutils/pciutils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pciutils/pciutils.hash b/package/pciutils/pciutils.hash
index f6a3f9eef6..9401d046cb 100644
--- a/package/pciutils/pciutils.hash
+++ b/package/pciutils/pciutils.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/software/utils/pciutils/sha256sums.asc
-sha256  77f11f78298502634d1af50308f15a5788629f6cf45cba376f5009aea4cb4926  pciutils-3.13.0.tar.xz
+sha256  e7713409882813991d2269d125e40dad1f54a019a52b78b3962941c1d4a6f86f  pciutils-3.14.0.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index ea3c21db6a..bd205b1430 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCIUTILS_VERSION = 3.13.0
+PCIUTILS_VERSION = 3.14.0
 PCIUTILS_SITE = $(BR2_KERNEL_MIRROR)/software/utils/pciutils
 PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
