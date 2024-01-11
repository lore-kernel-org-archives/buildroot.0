Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEC2C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC6643825;
	Thu, 11 Jan 2024 06:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC6643825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCnAx5_PvZwF; Thu, 11 Jan 2024 06:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E31C40538;
	Thu, 11 Jan 2024 06:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E31C40538
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9039E1BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 748D340133
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 748D340133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kjVJbsaUSmmc for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:55:28 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CA0240538
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA0240538
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7beddc139c4so88853639f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704956127; x=1705560927;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00zILtAFYWH3rsS4aO2A6M4xCKdNK/Ljf0wpJUj8T8k=;
 b=E7R4vfGvSKvQPId3rSN8VPmHAzQsk2eSBaD02vnowe57ehdV2WxNIIQFMjSYfoEh0x
 z0wR1VSoyD0GwTbdShj5gNqgV07QLIY3VR6eMbdDgAH/Ae68B5BiYfhkTpc2vADJb/aZ
 7QIdR0bC35K/WUzF+BgaqULxNhIeHYh5AN9s3jcqSVnW/oOQO3JAvNmfzlHkNPVVDGNP
 kG0gDxt8X4aCBftnoBmpkqjsYm4VIBTvuv99lnRVsXdLzV/0PQFvFsWUwie3gkVTUeT2
 pYjab7KMmEs5zf0LpdaSdW9bUCcp0+JC7TUo2N9P9qPG8kQBYZFh3VX7e8gD7iSXFUxr
 jwBw==
X-Gm-Message-State: AOJu0YxLC92d6Iii7mvxdf/f+ZK5OLyViBgrw1M+Brql9z2jQDWtKCFm
 2hTwOY+v0yUKQy1vT8b/qKMa8pqiOWY/Nw==
X-Google-Smtp-Source: AGHT+IF0a/l72BL4axHPjU6c6YVzu8BROkzXhB4x/cg1G+o2J/3kcesPDj2cPBRphy1tV2/mXa2lvA==
X-Received: by 2002:a6b:7307:0:b0:7b9:13f4:a234 with SMTP id
 e7-20020a6b7307000000b007b913f4a234mr934087ioh.3.1704956126812; 
 Wed, 10 Jan 2024 22:55:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 1-20020a5d9c41000000b007bc4622d199sm107433iof.22.2024.01.10.22.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:55:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:55:24 -0700
Message-Id: <20240111065524.3060233-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704956127; x=1705560927; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=00zILtAFYWH3rsS4aO2A6M4xCKdNK/Ljf0wpJUj8T8k=;
 b=mffWjhKqOCd0NicDaA4ic3XZ3WWw2F/OLXAvyIYU8WOLQV37UGvpxD/+dnaNjPuyp/
 ho8+XHPV5CPZ97LpB92T45r3oQ+jyXM6J8WES4vHWsjE0tsHoz0QAGAsEDGuZ1LYfnOG
 Aak6kf1zgwDFbUav2oOP9hUdgmoQFA82N0bEfGM/Fd2rzjkcl25I9yxJBFfNOETbPC4l
 yAEd5fgjm/jx9AJpGZtEQml3EvO2/yIeEV+kfElQ1G+2jFVlB6GTbBPmeeJ0pC1XWLpJ
 4YkCJsJkZTGW3ffodcS9CtGA/BsvrafLlA0PGiT+UzT8rAc+0hV50pWT13s7lJ6k09iA
 i4Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mffWjhKq
Subject: [Buildroot] [PATCH 1/1] package/python-simplesqlite: bump to
 version 1.5.2
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

Drop no longer required python-setuptools runtime dependency.

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplesqlite/Config.in                | 2 --
 package/python-simplesqlite/python-simplesqlite.hash | 4 ++--
 package/python-simplesqlite/python-simplesqlite.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-simplesqlite/Config.in b/package/python-simplesqlite/Config.in
index 81501c9e83..d650439dce 100644
--- a/package/python-simplesqlite/Config.in
+++ b/package/python-simplesqlite/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_PYTHON_SIMPLESQLITE
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_PATHVALIDATE # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_SQLITESCHEMA # runtime
 	select BR2_PACKAGE_PYTHON_TABLEDATA # runtime
diff --git a/package/python-simplesqlite/python-simplesqlite.hash b/package/python-simplesqlite/python-simplesqlite.hash
index 06edbfab3d..8060437718 100644
--- a/package/python-simplesqlite/python-simplesqlite.hash
+++ b/package/python-simplesqlite/python-simplesqlite.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplesqlite/json
-md5  11f2ef73243fb0d677ed00d22f1441b2  SimpleSQLite-1.3.0.tar.gz
-sha256  f7e862bec5982059e665cc73b6fdb4c8340a1f565ba3497387c3c48f10d43bf8  SimpleSQLite-1.3.0.tar.gz
+md5  a907352592539345bf8145c3e39015cb  SimpleSQLite-1.5.2.tar.gz
+sha256  f9a25b9e43d7aa28f551d170a42cfae10139c5c81a1bcb8776f857816ef5ae0f  SimpleSQLite-1.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-simplesqlite/python-simplesqlite.mk b/package/python-simplesqlite/python-simplesqlite.mk
index ea60cefc16..d8efe23a6c 100644
--- a/package/python-simplesqlite/python-simplesqlite.mk
+++ b/package/python-simplesqlite/python-simplesqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLESQLITE_VERSION = 1.3.0
+PYTHON_SIMPLESQLITE_VERSION = 1.5.2
 PYTHON_SIMPLESQLITE_SOURCE = SimpleSQLite-$(PYTHON_SIMPLESQLITE_VERSION).tar.gz
-PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/a0/2c/39a9e7dc4af46d101f48753086c686982790ecc2bdf5e9fa88f85f027e7a
+PYTHON_SIMPLESQLITE_SITE = https://files.pythonhosted.org/packages/c8/07/92e3291fda6f1bbf6e7ff4721d87566e1615572d9c205ef64398c5d22efe
 PYTHON_SIMPLESQLITE_SETUP_TYPE = setuptools
 PYTHON_SIMPLESQLITE_LICENSE = MIT
 PYTHON_SIMPLESQLITE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
