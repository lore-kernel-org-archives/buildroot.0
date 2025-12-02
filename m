Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA3CCFD2F6
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 06:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D17F36100E;
	Tue,  2 Dec 2025 06:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xD5og39nsSWf; Tue,  2 Dec 2025 06:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FEA60BC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FEA60BC5;
	Tue,  2 Dec 2025 06:39:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E50D3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3EAA4079D
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4pIdf9tvPQp for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 06:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B11C540791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B11C540791
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B11C540791
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:39:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE3F0A4C0B4B
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 07:38:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58310)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQK2N-000000000iU-0Oxg
 for buildroot@buildroot.org; Tue, 02 Dec 2025 06:38:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 07:38:59 +0100
Message-ID: <20251202063859.497258-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764657539;
 bh=s6qBOnuzdD9j7juOMYlpfnA4DhtO53nNUzDqjG0z8WQ=;
 h=From:To:Subject:Date:From;
 b=Bn1KtRROeXfLLfxrhcfbEa/NG6Dm+6lyLti8dQ4BScBbR47Eu1KKbk97//x5Rzu1g
 nVNCA1GeHbn4C+lX5DA+rc5e8KyHNXeWg8LsBB+r2HgQ2Z8j87poRv/gPLuMB/gKqi
 TNR0/pmigJse8xHfHC+Ot3WEejUgI6/kP5ovP3F54/WSFx54TJ4pRvwkmsR4NLFLyx
 eZZ97AAbDK8X14bD5CyN+8CxmpTBNTPTHb7B4t44RRMlQfUzv6pR8AiThoqFgGz1As
 nfovY46lDnAZdLnA/J6WDRsTP6B48Qfs4uo8yZ1l1YlxJDiHwMDA094n63s7RzvJsL
 SqrfqyOKvuY6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Bn1KtRRO
Subject: [Buildroot] [PATCH/next v2 1/1] package/unionfs: bump version to 3.7
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
https://github.com/rpodgorny/unionfs-fuse/blob/master/NEWS

Version 3.0 added support for libfuse3.

Updated license hash due to copyright year bump:
https://github.com/rpodgorny/unionfs-fuse/commit/3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed dependencies (Julien)

 package/unionfs/Config.in    |  8 ++++----
 package/unionfs/unionfs.hash |  4 ++--
 package/unionfs/unionfs.mk   | 12 ++++++++++--
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index fe03b95f20..41210c2039 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
-	depends on BR2_USE_MMU # libfuse
-	depends on !BR2_STATIC_LIBS # libfuse
-	select BR2_PACKAGE_LIBFUSE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse, libfuse3
+	depends on BR2_USE_MMU # libfuse, libfuse3
+	depends on !BR2_STATIC_LIBS # libfuse, libfuse3
+	select BR2_PACKAGE_LIBFUSE3 if !BR2_PACKAGE_LIBFUSE
 	help
 	  A userspace unionfs implementation.
 
diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index 7c4a9f4ffb..7ec654591d 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f56a5579d670e18e0667700bc599acbc0b8217ca1f76b2adb3dad7d2953c4049  LICENSE
-sha256  c705072a33a18cbc73ffe799331d43410b6deef5d6f2042038f8fd3ab17b6e2e  unionfs-2.1.tar.gz
+sha256  026f5302279110ceb7465e5c9e863cd0319ea0dc32ad253d162cf9db0f5e9a81  unionfs-3.7.tar.gz
+sha256  b03db54bff4b5ff9d1b4c7ef54513e52afaa32830f36a6da6db8c0fcd35a4431  LICENSE
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 12cd368fe3..4909d80a70 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,10 +4,18 @@
 #
 ################################################################################
 
-UNIONFS_VERSION = 2.1
+UNIONFS_VERSION = 3.7
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
-UNIONFS_DEPENDENCIES = libfuse host-pkgconf
+UNIONFS_DEPENDENCIES = host-pkgconf
 UNIONFS_LICENSE = BSD-3-Clause
 UNIONFS_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_LIBFUSE3),y)
+UNIONFS_CONF_OPTS += -DWITH_LIBFUSE3=TRUE
+UNIONFS_DEPENDENCIES += libfuse3
+else
+UNIONFS_CONF_OPTS += -DWITH_LIBFUSE3=FALSE
+UNIONFS_DEPENDENCIES += libfuse
+endif
+
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
