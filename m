Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A807BCD37AC
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 11:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10DEB42803;
	Sun, 17 May 2026 11:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9OO9wZgcpb8R; Sun, 17 May 2026 11:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47AFA427FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779015710;
	bh=nm6IN02pQkLWj1bpv8Du+upL6Rb2yWiODXudwrqf2t8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=huVFPMW+LP66B97Lswxvyl/i7Mb301gLAgnBjszxerMjEsP2HPkSJkwJ9x529XAU8
	 OvDRSVj7CUsWAbRtxFKpb6fw/SW2x6CIkcDkzzgtiO2B0B72iOC4cjQClEY9Q9Bp1/
	 PGyPqZqPQsoNV3xU9sXL8VTuSaa4V9M9hDu6ts+IVnhb1crWeay+OwjDAtb+hVQAwS
	 DEMNm0vKY792xfqDvK2fEmtqZCDmFpQfjLsPhrPwgz0R/+WrzbjmKpL3hXXcA8tM27
	 qVU0XShuH8Gq8JnyFuPTElIO7zCb0nVjC14JF4J03Jv+NwdvY5i8S0yEKEhpvL01UI
	 V52ASJcaql62g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47AFA427FF;
	Sun, 17 May 2026 11:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC99390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 11:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF90860C14
 for <buildroot@buildroot.org>; Sun, 17 May 2026 11:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fAbZLfWSukG for <buildroot@buildroot.org>;
 Sun, 17 May 2026 11:01:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBCED60BE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCED60BE0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBCED60BE0
 for <buildroot@buildroot.org>; Sun, 17 May 2026 11:01:47 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9DCF060128;
 Sun, 17 May 2026 13:01:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 17 May 2026 13:01:27 +0200
Message-ID: <20260517110127.230239-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779015704;
 bh=hlcZ/PQUL5uZfm8M+6a91kHEcO4ZjQfZeGJBZ+xUzKY=;
 h=From:To:Cc:Subject:Date:From;
 b=gz2hV9qsl1tVtsLlRM+PfZI2d+hST5wkvopavh6WRyg5ZzcdayZtEpq7S9B9lqQjj
 Z346NHXC8iml47QCB1+OP5hMZoT+6GmkiYcF9Vc0yLD3qYppLnQWOLxWcf87tl2Lwz
 JH4N69/E9PWoWja3DCBSz+15EQOevmh2bbR+ixzwOZvrApr/+ufKwKB4+m9SGOx8HA
 laYS1j8Jb9HUsE5jAdS2aCJuX1+XkwkuHMvLCLACbtWQis/rZH5jCHDHzNhvF/Cnfb
 I5LZCzpDlu2XlxDbuywFvaG6y+1+Bt6fquEE2yDwPFtRn8nuuflWIrS7Myr7wthj/8
 1m1yS9IJLz2Ow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gz2hV9qs
Subject: [Buildroot] [PATCH next 1/1] package/openblas: bump to version
 v0.3.33
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v0.3.32, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33

This commit reuses the sha256 hash published upstream.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/14407045940
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a1e1cfc851..37685185b8 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32
-md5  021eb76c3fc66290b6ce14fa4c1ff3de  openblas-0.3.32.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33
+md5  96c5cd9013013faefc294bc57830c77d  openblas-0.3.33.tar.gz
+sha256  6761af1d9f5d353ab4f0b7497be2643313b36c8f31caec0144bfef198e71e6ab  openblas-0.3.33.tar.gz
 # Locally calculated
-sha256  f8a1138e01fddca9e4c29f9684fd570ba39dedc9ca76055e1425d5d4b1a4a766  openblas-0.3.32.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index e8836a9d27..9a3bb42496 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.32
+OPENBLAS_VERSION = 0.3.33
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
