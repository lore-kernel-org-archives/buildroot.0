Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A1C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348236089A;
	Fri, 24 Jan 2025 21:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glr_rOrq4QsL; Fri, 24 Jan 2025 21:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C01B608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C01B608C6;
	Fri, 24 Jan 2025 21:04:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C9E3941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D3CA81026
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkoxxNmlXu9n for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 21:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A5A281004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A5A281004
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A5A281004
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 21:04:27 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-844ce6d0716so189131939f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 13:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752666; x=1738357466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1zYMy5flsjIAozKtrHeqFadkbWxn31g9p1se9/zhyc=;
 b=WWOwq/A8zIspBN1CmNGaNKlsXnAv4QFS4680GIIQeS1xvUtdQKuGGuB3sPRd5Kha2i
 e33pNLxm5iva+xMyXPBNCP7CXa4aw2c4I5jUbugiw4V1IismsYubVyOV9ivEWbeDmf9a
 YO2HMl6D9cDQqsXKkAe/KotoAoOC6nsDkXIl6MBY4yOsN2y1Ja3arQTbAWxQ3291tJKc
 iRdFjT5RzMJ6ACw30PQETutkNoSb5DU60CkKOp3QXNEUVwaIFdJYjYquhq1LFv/TM1xu
 5B3FTLmfDlM9odCQjXj1138pMxesBjT4SH63K+cuQcs025tWl9mgi8WPrQXcUCW95RmH
 On+g==
X-Gm-Message-State: AOJu0YyFhMsKFjcl93sCH4Z9orXxuDcnSC6lpq0CasfxjH4A/ddRaZe/
 7e4jw/J992q4QpPV2a3dsGV2mfKqKfs+IjA49ruOGqNTICvgHpgPummnsmrx
X-Gm-Gg: ASbGncs8gn8zuHxgXsN9v59ju9rcKBiS9d61jvgal0oVlILCEz8QH6Iz7xsrOzIXi7J
 LSnruINSAr8XJuj6Nz3kq4TJxwobU33hwb7f7crwe5jTeDwLQ6+GLcHPZzld4LkY8UeEz9QODjo
 CdoSXE6sprJWgW8b5R8jLLK+Pm5lb9293Rm9Xzl82GbW21Pog25eeO5+XNOLKMV8aquhdjpAkqW
 uUKCIeluLmM+nTTTPVc9RuD2BCexsqrJL/5L4jjBQ7aUc21OuFd5r7FQEyE5yO01xI3oOl3M16n
 sp21QhJSez2cV/H0GmtMuEOWqMSki8cwFRB43K/xTwkekSxBprC31NQ=
X-Google-Smtp-Source: AGHT+IHQN612oisBh6M+VvGDfy6X+RKu7qqfTtXNzn3aW4urk94MeCXFtP8aIMqwtc/a2XVBQHWg6g==
X-Received: by 2002:a05:6602:3e94:b0:83b:a47c:dbfd with SMTP id
 ca18e2360f4ac-851b618f83emr3145985339f.6.1737752665856; 
 Fri, 24 Jan 2025 13:04:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da4b774sm846296173.73.2025.01.24.13.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 13:04:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 14:04:23 -0700
Message-Id: <20250124210423.3865575-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737752666; x=1738357466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R1zYMy5flsjIAozKtrHeqFadkbWxn31g9p1se9/zhyc=;
 b=R/RjwBnDy7pux1ufr9Sngtq4Mg+vNtufFnTaVf3TrOhrDwjtqth9UhK1Lbe5+9gEmu
 WeS3JbkFcFBi90dTnYIjIoFVWS6rpuae3NM3Fn5SA710K9HLBu0k/HRKi618XbW+UbfA
 cLBa//C7/bZdC1IOrMBNAlOgI1JnvBSibYB890QVeJ6dGKX7UBwsThVgqnAI6mwlh7RA
 ENK7DeV6aH0uO8maBnkv5mWA0rd93+wDFCG+6aMJZtUvOPl/Q1fiq6qs5fiIKWi7vLEg
 UTALmx3HgWVVbfEwyRzXN+FC0BlqFlwmXs/h2GYJEMAplxMlEAkABy0FbP9Div/NIxaZ
 nKoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R/RjwBnD
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2025.1.15.22
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index bb58e4930b..bb9f40a7f3 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  b8c01a04127e7929f588fabbd0352ecb  trove_classifiers-2025.1.10.15.tar.gz
-sha256  be2c7d25e46cd39d5c7151acd389584df3919f61890f5f163c8ee2090ff71e7f  trove_classifiers-2025.1.10.15.tar.gz
+md5  3656424a10a761108fa8250033ffe3d4  trove_classifiers-2025.1.15.22.tar.gz
+sha256  90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9  trove_classifiers-2025.1.15.22.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 98ebcc4d1b..8d2238d41a 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.10.15
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.15.22
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/db/1b/7bb619b31396d550022965673a0c284c914a0a4c68480f78097401e1b3e5
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/f3/cb/8f6a91c74049180e395590901834d68bef5d6a2ce4c9ca9792cfadc1b9b4
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
