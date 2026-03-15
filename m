Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAF0D58B2B
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 13:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8BB0824DF;
	Sun, 15 Mar 2026 13:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5INTmgLCfRJy; Sun, 15 Mar 2026 13:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4152824F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773580288;
	bh=zg17wFu+IrPY60PY5pOF3vbhGR2C2XD/TxTyjFAB4eQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o6l96MWRvqnUueVyqJM5Rvk9rYmrpG4GnKYJUy+Zo0QSE5vmgGremJQOUDqx9Jtjr
	 JtvC+UuiTYGx4SPQQHrfW7rlZYRoMOlro5+2Fuq1kYPB7CFUt8AB35lAzRTISaW9LC
	 g8hxUckijnimpuBII2mP4hmSRu64Cuhind6QRCk5z+Rti7kdTXUuhpXabwVFQnBvCr
	 O21rt1b7smXHNIoSPJH/XYHTnf3IGtREdDYPecT3Vu8dN52QgMkqWIw/oE6RKvExIm
	 ZRipVuuwIDOWS56ycK0xf+M3KgxpgQsM7QXPTt66HAWcYZaCvdzfCGQNUqT3Upa/g8
	 sgHWKL3aRRwDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F4152824F4;
	Sun, 15 Mar 2026 13:11:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 378531B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 286EA400A1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kX6mAVmDhPip for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 13:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1685640018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1685640018
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1685640018
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:11:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74E3DA4C205C
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 14:11:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47170)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1lFL-000000006LA-1AC7
 for buildroot@buildroot.org; Sun, 15 Mar 2026 13:11:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 14:11:05 +0100
Message-ID: <20260315131107.3959487-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773580268;
 bh=f+PIclto7WwBtm42lvLET3jDdbT8qDhjO1cyzz5mSno=;
 h=From:To:Subject:Date:From;
 b=d/lwPjyNMr6twxr4TXf21ssFDufl0qMqMCkiux7NGNCGtuNNlpCeIzLTBh4sjMx+2
 i+W5/alcwFyZruiM3YakifNsewg29BDsCn31X33hFjYhqc5L8nLE8yYPbpSjb5aWWy
 W0C2R2CoPULMw3pX05VYj/FDhIkVDRi5OOa01yu4u9OqQKHfMKtz8+3OjMdgUmL/0Q
 R7utG+7wSOOMiukApmpAxXVbJ2R4QHFBq4aLT4IGkzyh107fYjdRU13HfK4wDS18hP
 H6Gvwhiu4OxksqIuKDmOQPuH+fANs58rnpIjRUeodTWGXS5Xw+QCwyy6fmFT1VVCPC
 1WfBIBAV41EhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=d/lwPjyN
Subject: [Buildroot] [PATCH 1/3] package/giflib: update tarball URL
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

Upstream moved all tarballs to new locations:
https://sourceforge.net/p/giflib/bugs/190/

Fixes:
https://autobuild.buildroot.net/results/c7f/c7f918fe7c879706c5a5875ea11c5f8b57007a85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/giflib/giflib.hash | 2 +-
 package/giflib/giflib.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index f11d4f1505..dcc384a523 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/giflib/files
+# From https://sourceforge.net/projects/giflib/files/giflib-5.x/
 md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
 sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
 # Locally computed
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index f37ec8af21..00922ce2db 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.2.2
-GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
+GIFLIB_VERSION_MAJOR = 5
+GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).2.2
+GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
