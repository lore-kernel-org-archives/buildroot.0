Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA24FC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABC4F808BA;
	Mon, 16 Jun 2025 19:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLx8Nbsq3ChI; Mon, 16 Jun 2025 19:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E293C808C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E293C808C2;
	Mon, 16 Jun 2025 19:15:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 191C816B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F39F040A11
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJVwhNWnM5P6 for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 39C7D40AC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39C7D40AC2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 39C7D40AC2
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:15:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AB3CA4C0E99;
 Mon, 16 Jun 2025 21:15:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59920)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRFIl-0000000057B-3alM;
 Mon, 16 Jun 2025 19:15:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 16 Jun 2025 21:15:28 +0200
Message-Id: <20250616191528.3479725-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750101328;
 bh=puMmSP1QbCdpTE/Hr0FtPgyRO5evfXEM3UMQo7crw1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=v6jooD/QFe/ZS04TVPKAXzKJN77WH3Zxv6brzu7ijG29JnAyikoC2twviDBqrb/SU
 pwYdTK0xqhMYnvcOPlrBZeiB41eifV+iQxc3/OjaKB0a7uAl5FhF25eXu23iz9gOFk
 8zORTpU/LikV1TSFVHFSZnpzv+MLWgkN9ML0wDoht+OnBKQczi9rEGwj5PXIwLkCfP
 rdrvM0gLHVWz2RJtZAkaoThe8xDkutaohtjyZjQqY4fVzwGh1QsrsvN29WVh10HliF
 D/XMt2twUmDt/iZXCV4FAEjb5A9q+uF9RlAlB8MaFUw5bG+qP528Amtw3t/THyNoI0
 pu05giWFoRUdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=v6jooD/Q
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to 25.2.10
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

Release notes:
https://github.com/google/flatbuffers/releases/tag/v25.2.10
https://github.com/google/flatbuffers/releases/tag/v25.1.24
https://github.com/google/flatbuffers/releases/tag/v25.1.21

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flatbuffers/flatbuffers.hash | 2 +-
 package/flatbuffers/flatbuffers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index be605f50ad..e7174e326e 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7e2ef35f1af9e2aa0c6a7d0a09298c2cb86caf3d4f58c0658b306256e5bcab10  flatbuffers-24.12.23.tar.gz
+sha256  b9c2df49707c57a48fc0923d52b8c73beb72d675f9d44b2211e4569be40a7421  flatbuffers-25.2.10.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index f526d57ab4..d49d01161d 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 24.12.23
+FLATBUFFERS_VERSION = 25.2.10
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
