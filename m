Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B58C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 23:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3C55417F6;
	Mon,  6 Nov 2023 23:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3C55417F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3svsJSPVQQcb; Mon,  6 Nov 2023 23:29:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25DB8417CA;
	Mon,  6 Nov 2023 23:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25DB8417CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FB2C1BF2EA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 23:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B89417CA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 23:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B89417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEqNdKte00qA for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 23:29:30 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EE49417C3
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 23:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE49417C3
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7aca968a063so196852239f.0
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 15:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699313369; x=1699918169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K7sDJ+BOFxjjSYBxSyfgIGSYWlIm1MYC36Vpb35oda8=;
 b=k6FeEF0lbkqxZ4ovf2lrsZ26s9kfir07zstwh4c2z7TWPwkFzksyqJFay2dF+dRvhO
 iIc2LQDvLzCtTtkx8JVaM5Iyzvnqhhe2Vj5GKscuOLsQSmc+EInujXBgd3MMwe3uqlJw
 b3jUDI44LvzR7giVVNSKK4aYOJcvX+sj5iiaa5ZDntmOkEF6JsyWavMKTePlFncFQ3Gv
 gIkYjasJH9orWnz3EYfZL0xJ0IisUbfTGevN+C0kU+QINydcjozzUdjVeI0YojcaiR30
 h1m8TblElFBGRfOANzW7BiGaMOLUqJgbmyBcelqM/sVhmeKgowYU1Gn5qPIqnYRWmper
 ouPQ==
X-Gm-Message-State: AOJu0Yz1IGBMYfzk28GE3GUuxEFQZlqdEsh1uYLyK9V6oohpb0oIoXTL
 rC6r7n3XqPToT5bKvE2+hRaDK2nPM6k=
X-Google-Smtp-Source: AGHT+IFdBED2Oo8h3xUF0boOKgcQcFZfQUVs7unp8e4NEv8Gug/2eSReoUsytG+5ppGcalalAb5JSQ==
X-Received: by 2002:a05:6602:1655:b0:7a9:4090:b7d5 with SMTP id
 y21-20020a056602165500b007a94090b7d5mr42211088iow.13.1699313368781; 
 Mon, 06 Nov 2023 15:29:28 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 k17-20020a02a711000000b0042ad6abe0bbsm2471750jam.20.2023.11.06.15.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 15:29:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 16:29:26 -0700
Message-Id: <20231106232926.2972118-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699313369; x=1699918169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K7sDJ+BOFxjjSYBxSyfgIGSYWlIm1MYC36Vpb35oda8=;
 b=awUSbNa1oSr5eyjZd4Ijn3pYqSYLFDp2dy5YfOF/6jVgLDncGIPaFNi3KKgWARj23S
 QSsaO79ZDVrF4YtBZYd976TP0aYxG9MjXpuzaowNl30XGpvubWip4QXsYJ64pyXED9UN
 lrvphLR3UZAnWIrOBwzafoJdnbC+LsRryZ6pmVF6wjxhIh/aDIYwbxNCdAit1Rr34ywV
 4AqIgkXdwkQ6TfSf3h1OPJbXMYPi62X8EtNIzhkFir4toZhaWt8/uS421VlXxsgSwHiO
 CbOLvJRDxXYPQTwwD76e1PSdbTf2a/AcsGiq31E3h9EnTE8Bg2MLkbq2mSk72LMrMLIj
 0SRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=awUSbNa1
Subject: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to version
 1.4.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Esben Haabendal <esben@haabendal.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 4 ++--
 package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index 7f2e263a5b..900027a88b 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  34796908455c3b23c889439b541e424b  kiwisolver-1.4.4.tar.gz
-sha256  d41997519fcba4a1e46eb4a2fe31bc12f0ff957b2b81bac28db24744f333e955  kiwisolver-1.4.4.tar.gz
+md5  20dea6992699d6be8a563995d7fe0309  kiwisolver-1.4.5.tar.gz
+sha256  e57e563a57fb22a142da34f38acc2fc1a5c864bc29ca1517a88abc963e60d6ec  kiwisolver-1.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  26da8d49744796f2601fb5fe9e5d8b9e8102064ca60a8dc1825b6177cb05450c  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 2c5db26dbc..04a0779b37 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.4
+PYTHON_KIWISOLVER_VERSION = 1.4.5
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/5f/5c/272a7dd49a1914f35cd8d6d9f386defa8b047f6fbd06badd6b77b3ba24e7
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/b9/2d/226779e405724344fc678fcc025b812587617ea1a48b9442628b688e85ea
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
