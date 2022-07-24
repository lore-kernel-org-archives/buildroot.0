Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3A6C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEE9940B36;
	Sun, 24 Jul 2022 03:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEE9940B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YohO150Q6Dvr; Sun, 24 Jul 2022 03:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C9D40B40;
	Sun, 24 Jul 2022 03:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3C9D40B40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8061A1BF332
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5979761075
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5979761075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id voUO-rcovY8x for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 767706104C
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 767706104C
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:22:22 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id x64so6395026iof.1
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yc+wUlL8QJttoSaLJ2i2c1Ob+KQnDXMOOqi57U2r8sk=;
 b=5kJhoalMbTXrbRmbEiWf+IjcTGb/8K139GHzVpsEoib2zuYwwx0LUr3Sdbw9yrfwrU
 H76EBAGs7UPRjjBFKi9rrQn2HFHQS0vHcIaXVURugIYzP8/Gg2JP/01p0BIUcP+XiGpG
 GtSWPUHHspZezVFx/7gQVbBrx60JZ5lrHC1Wv+I+VyC++n6I/UFC0pjT8jIL/8Aw04AD
 QFd871a0k8hULpRDZbh97tReZa1NnMAPcev6EmiZWyDpEvZZgrAOZH9yNeFntytVt+NG
 aXRBnzfMceGhR2fM+6KREK66k/paFV1zVEqiXNY5/2TKOxBAtDOB3vBrZk9eKL6GeYuu
 xY6w==
X-Gm-Message-State: AJIora/DwwGOZ96EmKG44ygcDPOW+Ew8xuPt+tvFaEEg49eh2168ZcmX
 ufoqSzRgP1ETGpso74vTfCc2d5GzcPZeIA==
X-Google-Smtp-Source: AGRyM1utTN9BH3zaOlPWxh8hJkqlinLSPow5J5JzRG08JH+9ED423e/ONtarPbJP9YMnC4z4Z0cXxQ==
X-Received: by 2002:a05:6602:486:b0:678:dad9:e56a with SMTP id
 y6-20020a056602048600b00678dad9e56amr2236607iov.97.1658632941407; 
 Sat, 23 Jul 2022 20:22:21 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 z13-20020a027a4d000000b0033f4ee78c07sm3824455jad.29.2022.07.23.20.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:22:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:22:19 -0600
Message-Id: <20220724032219.1264647-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yc+wUlL8QJttoSaLJ2i2c1Ob+KQnDXMOOqi57U2r8sk=;
 b=LcIrR3ylcjFl/F/TOwu6Ge7QOdRJdpe1xAY1/vJyaEtchZQmh+KOo5OwrHoWf6nZDT
 8qunWb+XuK2/fRfMstWntCkaVuKQ+0fDhUcNmgoX3jmltOsiI61Iu1waODL6NWaJxrJc
 IDR7B2zvMIHlkxlVplaxuB8oC0oiCiLyAEE7wiNEYxfC3znvbnOzyqIzGgFd6kX8fTze
 +cHPg4uITluredNAJi7NLIsOCaQH4Tx2ge1EAWc08y5zYe7PA7uVxDMhEH5E6IjFsVTy
 heQRotn2ZLv4VtZSlVttPom1c0qEwB5C42ddfBByoi0KFK9X6x5ECrCz4A68PnelqEhP
 06Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LcIrR3yl
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 85e0848b96..2037c17172 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  9e66aa767a0afd681e2a797b835cad1d  pycares-4.1.2.tar.gz
-sha256  03490be0e7b51a0c8073f877bec347eff31003f64f57d9518d419d9369452837  pycares-4.1.2.tar.gz
+md5  92fa9622ba42cb895d598910722e80b5  pycares-4.2.1.tar.gz
+sha256  735b4f75fd0f595c4e9184da18cd87737f46bc81a64ea41f4edce2b6b68d46d2  pycares-4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 9be295d900..e2b813b278 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.1.2
+PYTHON_PYCARES_VERSION = 4.2.1
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/83/61/17bd0cfb9c4dc8c3738484d604b50d47c78fe4fcfe0ca2c58a61a106f578
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/99/da/d3d20bc7bd5baadeea04ee84db16f1f07557138c313bd6200e1cffab5bee
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
