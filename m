Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6061FD4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 15:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0142584BAE;
	Sun, 18 Jan 2026 15:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE6HgARhUJgr; Sun, 18 Jan 2026 15:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8E4F84BA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768748859;
	bh=f/M8ediM4LNpW9jtg9k6NrafqKXc7kAPDqb6A8tZki4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=mj3K75JLvraCOkR8+/mzuCgdnwJjav+q44Hmghkw92lYRL2aASUza3Kzr12zznN2t
	 Fwg0nUZilMczGXM5zTaGywW9LoKl9qsaaTaNyWreKbMe7zlVO8iQtSHp1SOF1WVGir
	 ICvDffb5B1x8PNUCPgAy1jL36X0xjpkZGEEK1sV1a4HW1Gu/zRF/6MIVnBUD3lxWdm
	 8PZIiwM0k7opPa+ROWX+hpVhDWCZUiIEqh/4mg2I1Nk3nZuKEYmcQPXOn2L6Ak/9ia
	 0pqkUd7zjpj87BCKuVwDTT6hU4FdlfTp47Ofr93U5vckGffrkj1185mWmXjCRTCE/N
	 Op6RERpLUez8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8E4F84BA7;
	Sun, 18 Jan 2026 15:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8F7F160
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA77C6F5B9
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n33yl4SFU2G5 for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 15:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 361366F5AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361366F5AB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 361366F5AB
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:07:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3D6A419F574;
 Sun, 18 Jan 2026 16:07:31 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 18 Jan 2026 16:07:26 +0100
Message-ID: <20260118150726.245853-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768748852;
 bh=YS3ndHgJ8EQoymLkgSc0/gM5FiUMgy+EqZzqPv2dhnU=;
 h=From:To:Cc:Subject:Date:From;
 b=QoRGInTEvAREKyknqQx7QEJClSXE7eRYJm4cqyPoQiG4Z/xYVpBwjLPrKPoaxtK6v
 sMSaRG7g5x+59r2NGnAknv7ampAaalkP0uUiXL6pvWTtV3EIzz7dsZ5MPZ1ywvRPfy
 oXP/2F6/HWDn9aTYW9c/NcvLVhJ7BIbLi3PSUVp16c/079Gb/JZLLNh8JTgxo2sEsZ
 jldUiXvyfYEUCNu3JHSfO0SKMJxYwXk1RSV5IeETc7F4LChwuu9FX10XA514tLNeCZ
 92GYjN8zvn3fQlvYQZQanealJyrPTlwoJh58v5mlZNKt+4HRBx23CP9r4vEfnMytWA
 KRDtMSbojJXuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QoRGInTE
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.31
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

For change log since v0.3.30, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12758222200
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 965d7458ba..e97e32271a 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30
-md5  8db3d57f4d4485c6ae3f21ea465660e7  openblas-0.3.30.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31
+md5  05050271d9196f65bc4ac3a89c6a3b05  openblas-0.3.31.tar.gz
 # Locally calculated
-sha256  27342cff518646afb4c2b976d809102e368957974c250a25ccc965e53063c95d  openblas-0.3.30.tar.gz
+sha256  6dd2a63ac9d32643b7cc636eab57bf4e57d0ed1fff926dfbc5d3d97f2d2be3a6  openblas-0.3.31.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index edab26493d..d56934e41a 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.30
+OPENBLAS_VERSION = 0.3.31
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
