Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC4CC4451C
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 09:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1F1607C3;
	Sat, 18 Jul 2026 09:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z9D7NQ_jgvmQ; Sat, 18 Jul 2026 09:50:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F93A60796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784368257;
	bh=oDSQdfBu3btrMxeIzNkB7hQUORa2zBYmgiqc+2807+A=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mwdaUytsiFsgH2g+iujyVyDlOHnw9qXi5ysUZrWvCZ7m40B7IxaUY9L03v7urT85K
	 dpUO2NA0yxlgDvuY5eFcSHs0WaACCRXdij5Xb+PFIgD44OW27HrhriNyGkU0h8vPru
	 C1Bjrpf1ELxC1oFE89viIDI2gD+H62hwC5o46b2l6mQ1lUG4spGITLExY3si8jrkRP
	 kxPHdSyRUG+TXZciTi304MbyfcFNLSIk51g2+iq/Ggeb6GPLX8HTJIaVdZU3fg7/jg
	 kE3NfTnHO0DeCxcZSvTSJ8kTWeIRSanoowbHOMKXemAcs4ki/SNn+AxbDjJ/3PIbz7
	 Wlle2lRNdkNAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F93A60796;
	Sat, 18 Jul 2026 09:50:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4D336E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 09:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F3AA400D8
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 09:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6QQc6IBDvFW for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 09:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A7D440054
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7D440054
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A7D440054
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 09:50:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D96CC5FF88;
 Sat, 18 Jul 2026 11:50:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Jul 2026 11:50:42 +0200
Message-ID: <20260718095042.230873-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784368250;
 bh=ev8lEfInk2D7meoH7y1aSEauIzqGLnkFIULBoCE2v5o=;
 h=From:To:Cc:Subject:Date:From;
 b=MgF818RWzFcQVtsWknsRAszgjvMhasNuAkwbZOAOcOg9V75sfPodVW+ulEuoDPNAF
 hVykpCcFvxA6Iqw/0XNifIrVZKCv+2xaG1TawzQxxX8OXnrrbrgGf6xoUQcCu7cdfY
 rxxDCkgDKmbLx1RNjg05m1M0d0DdvC906qLURIqbKXmvPWEu13Q/3uqMqAERiDK5hU
 J3seCw89YYKAC78721KN2JPULc5vWPSz29S76D/V1Q1vX+5EIZNkv8dSqw8DLRYxkp
 dXFe5bP7HdpIAhC10Ris96WDztVbYRVJxmZFLJKPWUNZ5k3N3QeR/TEhI2DBvZ7drx
 ldEcE3WFxLMKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MgF818RW
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.34
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

For change log since v0.3.33, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.34

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 37685185b8..e4b14cda50 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33
-md5  96c5cd9013013faefc294bc57830c77d  openblas-0.3.33.tar.gz
-sha256  6761af1d9f5d353ab4f0b7497be2643313b36c8f31caec0144bfef198e71e6ab  openblas-0.3.33.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.34
+md5  ae9a0c2945f91b6f91747fd89a301d36  openblas-0.3.34.tar.gz
+sha256  cd7e129868320cc2d033afa920e31202dfe0b8066a5b66661900ccc0f197dfed  openblas-0.3.34.tar.gz
 # Locally calculated
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9a3bb42496..64e3b00691 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.33
+OPENBLAS_VERSION = 0.3.34
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
