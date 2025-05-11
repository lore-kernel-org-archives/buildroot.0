Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D0C3ABCD
	for <buildroot@archiver.kernel.org>; Sun, 11 May 2025 16:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E459260A9A;
	Sun, 11 May 2025 16:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZhDkimPobkW; Sun, 11 May 2025 16:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1983C60B00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1983C60B00;
	Sun, 11 May 2025 16:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 919BD17D
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C4560C20
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7g1zwWUKCJHs for <buildroot@buildroot.org>;
 Sun, 11 May 2025 16:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A23D060BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A23D060BDF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A23D060BDF
 for <buildroot@buildroot.org>; Sun, 11 May 2025 16:14:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b54c.dip0.t-ipconnect.de [84.161.181.76])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 557C7A4C0ED9
 for <buildroot@buildroot.org>; Sun, 11 May 2025 18:13:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59004)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uE9J5-000000003qn-2NzM
 for buildroot@buildroot.org; Sun, 11 May 2025 16:13:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 May 2025 18:13:38 +0200
Message-Id: <20250511161339.3195042-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250511161339.3195042-1-bernd@kuhls.net>
References: <20250511161339.3195042-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1746980020;
 bh=jAQc+uUYUmOZ2Da6C4i7LUuYhJBmahTSqCt0Xj3qTsI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bo8uSwn9VD8flghWbpoEfrOKM4+RqZa3yGzugpyApMBN6MOgJbdQO9eIi7oFIvXtC
 +AqAVEPKObOAEl+jCqZSzC2MgV6VT8Lq3Ugz3BXRShfe3bOWUQCUh9P/UH206xTEzS
 vHctPG5NyA5j9o/6K98ubZTn2vXobsMXaK7Ul7F30x4ybCP/aHtUSNnEmcp2dEoOfq
 npHG2SS/gtHXPHRqnIfuKS9ecIPg8Kc+Q4na1b4XElHTPFl2e9suINXieNbF1tkNRg
 +/D0JoBk83Mfazkg4Qc9C1l0XtB/xXXDcRa1+bbEF3n1edDj5qJCu4115WzhaIqrZc
 FQrREeo/RP19g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=Bo8uSwn9
Subject: [Buildroot] [PATCH 3/4] package/libvpl: bump version to 2.15.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index b88972415e..3c60fe960e 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7c6bff1c1708d910032c2e6c44998ffff3f5fdbf06b00972bc48bf2dd9e5ac06  libvpl-2.14.0.tar.gz
+sha256  7218c3b8206b123204c3827ce0cf7c008d5c693c1f58ab461958d05fe6f847b3  libvpl-2.15.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 0296cd7b5d..8dcb30f972 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.14.0
+LIBVPL_VERSION = 2.15.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
