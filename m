Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0D6D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F8A260680;
	Sun,  7 Dec 2025 15:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIfqngDiupfN; Sun,  7 Dec 2025 15:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25D04605E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765119979;
	bh=WdRe/JDBEyiYvQYGIaJu59gwMZsUwoUr2qESE35q8DU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HLBbCfhc59k+6rQqLl7ZvRdFwDcar94ZGolKXOmC/mZWeOGWMr0us7Istw2RvaRt4
	 UyIuKybf/qFo3A0CAuSj54nKxs3WHxpSyMsAue2HKDJ0FXNASFz5bkwzP0D1MgudfD
	 cacSp2Kyv8ROTlYWT3YM6ogjrviBCQikZog7lgZtpv4ibhtzjoHb2Pghz5ALYIEYWY
	 FW0OjJYH+bczy9GCZ3gmrq/FoHP8ccLRPUN6cCMqxJfWhil9m9BUlDCRgsAIVi3z0d
	 tOXoVVw7iFNdAJ9Z8B78agEeFEnR9fdHpv4d4GO71wIBL1LuBfXfGLPsD2JTRUxtc8
	 QEDuHtUqOqHEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25D04605E7;
	Sun,  7 Dec 2025 15:06:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E802CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F07DA4050A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCtRwYIWfe8D for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 15:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 229BC40486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 229BC40486
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 229BC40486
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:06:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1CBB41A1FF0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:06:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E02A1606D3;
 Sun,  7 Dec 2025 15:06:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CFCB6102F2368; Sun,  7 Dec 2025 16:06:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun,  7 Dec 2025 16:06:10 +0100
Message-ID: <20251207150611.2882304-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765119973; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4LCiePrkEIpUk/2p6Wb3MYlC7zzPR6P9epuw/QC+YFU=;
 b=HPTuBM8MG9uWmtlG+4OwSlTnBFkcjMJdXhHBebbKOHuhvsS/RES2y2oOIkQ6cUqDwv2b9e
 Hr1v456vXNLwOKwqgoE0vhvjgaOBOPw8yjkJlTCUyXE4Klz+QLpjvu7oSoantEACqTmFZA
 cAbUBP2gJFcQ0jc2OGID0jSlMkdv2kWet9QCrS1zr0CQKGGeSnGPFukti9S3rFkxxbGXb5
 P1C4KtcYNeBZhlaCTOmefy3sOaEKnIKFjQCHBaczpMo647Ks9iGQftdo01sHlkoxeEWdXq
 VPbMDfHKUKrfcM1rmzMd+evXKESLu5L13s5rl1Uhk5S7+pcbM2XFZY+mDQ15Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HPTuBM8M
Subject: [Buildroot] [PATCH] package/glibc: use DESTDIR instead of
 install_root to fix build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building a simple configuration such as:

BR2_aarch64=y
BR2_FORCE_HOST_BUILD=y

Under our reference Docker container, as an out-of-tree build:

./utils/docker-run make O=output-test

will fail during the glibc staging installation step with:

/usr/bin/install -c -m 644 /home/thomas/buildroot/br/output-glibc/build/glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e/build/libc.a /usr/lib64/libc.a
/usr/bin/install: cannot create regular file '/usr/lib64/libc.a': Permission denied

The problem being that the install_root variable is for some reason
lost along the way. We definitely pass it during the staging
installation step, but then glibc calls a sub-make and in that
submake, install_root is empty.

Observations:

- Building the same configuration inside the Docker container, but
  in-tree, doesn't exhibit the problem.

- Building outside of the Docker container, but with the same make
  version as the one we build due to BR2_FORCE_HOST_BUILD=y doesn't
  exhibit the problem.

However, it turns out that glibc sets install_root to $(DESTDIR). And
passing DESTDIR just works. So we drop our custom
GLIBC_INSTALL_STAGING_OPTS to rely on the default one, and this fixes
the problem. It's not extremely satisfying to not fully understand
what's going on, but after spending quite some time on this, and
having a trivial and actually pretty nice workaround, we simply
propose to use this solution.

There is no autobuilder issue as we're not using our Docker container
to do autobuild builds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index b0fa66218a..a7727cbad8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -60,8 +60,6 @@ GLIBC_SUBDIR = build
 
 GLIBC_INSTALL_STAGING = YES
 
-GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
-
 # Thumb build is broken, build in ARM mode
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 GLIBC_EXTRA_CFLAGS += -marm
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
