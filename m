Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1165C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 04:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96CD783E7A;
	Wed, 10 Jan 2024 04:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CD783E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nP4_vji1hX8U; Wed, 10 Jan 2024 04:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A0B83E70;
	Wed, 10 Jan 2024 04:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A0B83E70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 772F61BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50F25614F9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 04:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F25614F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6N-daBDm6FqK for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 04:56:07 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BFCA614EC
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 04:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BFCA614EC
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3606f8417beso13665095ab.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 20:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704862566; x=1705467366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=778hmjBFgEMyRMai83jwl3tSddwWsyyLpmCjG1h3z7s=;
 b=fL/gpENGYKqt6L8jA9joLtgkm4V4PB9cHJYhZnzYsIiOLJc6gDfCFWvyLzBJfcrPJU
 K9Tgpf+cnjnTRazWAI+2h3kIPYZ4VybCGCXp5SCMN4/cPCtGV2Np63rgi6E/Oy4Hk0Gm
 0RLmQ/17b9amSf3YEn1EfqyXLRXOoSnyC+Hu6HPioeIhRdwDlILCwS1M/BsmqYsB6i8O
 emHWDYBtiPoHJNdsyLoM9xCzjAP8IjKtn7SNyigbCaDMf259S84w0uohETvoBz6q4IWr
 oqqYTOmgXj6pr0VmDkJT0VjrNnzDmfHL8BaqQ+jk7wTKYQiMN0qUN3R5xqoZrKaCksm8
 hJXg==
X-Gm-Message-State: AOJu0Yz4qo8uXM98ns+Lncy7CymF1QBNIkllmgndhYFrgdfFjDdzTiRE
 KY2CRhFTdHF9WweeDxs8Qo9il8/eguZNtw==
X-Google-Smtp-Source: AGHT+IGBZsXgrkk1Qw34Y+5HXNM3yIKyTRvzZHc+GgKeSCbp48MtzaeQorTTp8pSq0T9gh/lLFIdpw==
X-Received: by 2002:a05:6e02:218f:b0:360:6260:7d4 with SMTP id
 j15-20020a056e02218f00b00360626007d4mr1501123ila.27.1704862565853; 
 Tue, 09 Jan 2024 20:56:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 t17-20020a92cc51000000b0035ff99b966asm988988ilq.85.2024.01.09.20.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 20:56:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 21:56:04 -0700
Message-Id: <20240110045604.1099561-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704862566; x=1705467366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=778hmjBFgEMyRMai83jwl3tSddwWsyyLpmCjG1h3z7s=;
 b=Qeh0mp9BQQxkTShmCqbuCE1GXgRZNabFl0ntyR3UOmpjJeNG6oCT6yeOy/W37pap2c
 yjAivyDGd4+GOi+oqgkhIe1r4ZhH4WP7bw75IlPOCKOG0gd66kTF2iop3xktr6lE6w70
 McrSszeNcdQvXn6W/AdQl23eW6Q9fiuvppm1Y4jO1SQ6h6+FlYq/9BiWJlcAGqrcFQtS
 4iOnvXBSG0aw3nXWlCcjzjHFpbw2Ws6bQgg8P9uPVDK7eYJVWz/0St815jlwhtUDpzeW
 5wYHiU3hNj4CysqEca+ZyDIU2C+UrO1nUnjcWhHak9Gf/OrUviIBHHjhw895E+Jgt2ry
 akUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qeh0mp9B
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: bump to version
 2.5.3
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
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 0848debc1c..75ecb23053 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  348281a5a27eb5253c7a83927aae64e1  pydantic-2.5.2.tar.gz
-sha256  ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd  pydantic-2.5.2.tar.gz
+md5  4651fb3374d2a0d74442c2cc780770d0  pydantic-2.5.3.tar.gz
+sha256  b3ef57c62535b0941697cce638c08900d87fcb67e29cfa99e8a68f747f393f7a  pydantic-2.5.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b5bb7ff853..7ad7abeb8d 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.5.2
+PYTHON_PYDANTIC_VERSION = 2.5.3
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/41/3c8108f79fb7da2d2b17f35744232af4ffcd9e764ebe1e3fd4b26669b325
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/aa/3f/56142232152145ecbee663d70a19a45d078180633321efb3847d2562b490
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
