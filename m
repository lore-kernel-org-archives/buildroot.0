Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4725ECCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11BA8415A0;
	Tue, 14 Oct 2025 18:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vClsHTzEuFsB; Tue, 14 Oct 2025 18:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD9C411CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FD9C411CE;
	Tue, 14 Oct 2025 18:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C80BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B87AC612DC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oJwxjxlqYb6 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEEF8612D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEEF8612D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEEF8612D9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:58:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE47FA4C6C37;
 Tue, 14 Oct 2025 20:58:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48252)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8kE8-0000000057p-0kF6;
 Tue, 14 Oct 2025 18:58:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 20:58:28 +0200
Message-ID: <20251014185828.3586132-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760468308;
 bh=pCQ3PRt+Q0264b7EW+QhMLx2xshPn+Ryg5jHsgkRHB4=;
 h=From:To:Cc:Subject:Date:From;
 b=TW7PaF4UsdYMbOMf+2/6WEzyb1JbcDc0s09/bGWz/oUAGlzE1IyvbV1+AaEd/kj21
 HkXF8P/l8PYEG9lkcx2h/uBTi8tq1E8B0q38vkwwKsxOjQWPNp7ffPSmwL8V9wluxZ
 pk5deYJDf+1Yqp2PQ7ev5GubBk55Pci5HE16vnCDyVMFX+SfuWSXdGa1WmmL9SxNAq
 CT7GsY8keAvP9E4fKiuAo/J+u6K1DRHhkUkigDYGqXOamsvdId8a8EFrGceeeh4T77
 xMNu82jMgr2mIFJr2KtCG16N5uhfVD0Es8ezH62KtVxPsJYx35EbXotGO61SZxSj6h
 aZ9b/mD6uRYsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=TW7PaF4U
Subject: [Buildroot] [PATCH 1/1] package/python-glslang: bump version to
 16.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/KhronosGroup/glslang/releases/tag/15.4.0
https://github.com/KhronosGroup/glslang/releases/tag/16.0.0

Updated license hash due to upstream commit:
https://github.com/KhronosGroup/glslang/commit/e70645c4571fb5136f2fb3f27f25daff2b83cfa6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-glslang/python-glslang.hash | 4 ++--
 package/python-glslang/python-glslang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-glslang/python-glslang.hash b/package/python-glslang/python-glslang.hash
index 04ec5313a0..16b399e542 100644
--- a/package/python-glslang/python-glslang.hash
+++ b/package/python-glslang/python-glslang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c6c21fe1873c37e639a6a9ac72d857ab63a5be6893a589f34e09a6c757174201  python-glslang-15.3.0.tar.gz
-sha256  adb783e734e906d1f46db5df29991dbde84bdb0ceab502ac2febb44fe3c2b5f4  LICENSE.txt
+sha256  172385478520335147d3b03a1587424af0935398184095f24beab128a254ecc7  python-glslang-16.0.0.tar.gz
+sha256  17e70c676e1521ff3e4686f04a2053d93a7e28a33be8de7ec37ab0ff72feb677  LICENSE.txt
diff --git a/package/python-glslang/python-glslang.mk b/package/python-glslang/python-glslang.mk
index cda95eb8a2..48e5531600 100644
--- a/package/python-glslang/python-glslang.mk
+++ b/package/python-glslang/python-glslang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_GLSLANG_VERSION = 15.3.0
+PYTHON_GLSLANG_VERSION = 16.0.0
 PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
 PYTHON_GLSLANG_LICENSE = BSD-3-Clause
 PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
