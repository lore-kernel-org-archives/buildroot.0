Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677ACD10BED
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 22:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DFCE40634;
	Sat, 26 Oct 2024 22:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl4P4Ui-i-6v; Sat, 26 Oct 2024 22:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC26A40632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC26A40632;
	Sat, 26 Oct 2024 22:45:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 260F75C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1432B607B8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgpbdgyH9Gka for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 22:45:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35C2660779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35C2660779
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35C2660779
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:45:31 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-83a9be2c028so118801639f.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 15:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729982730; x=1730587530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J8YthoQSHQlPoPuQZBtq/HpqhQkZcaQwyh1ZhsPX2xo=;
 b=Vlxq+AemKRI65RuhKPcLYcYMWI6qPKvmHFr5edqW0oj/b4luN7yrNyMJ60Ow+IUcK9
 oJ7+VRAiGrtwUlpdilseyiIU0R0dPvWRmXFyhughV4NR3cRm9fKemuzfKrVevY7hRMdf
 ONtEkdsqdcYxisaV3bAXJ2ZKiS//33XmMvaoDuLFCHz6yZtNT4pwGXmHJWR776KxenVV
 weKs/82gmTpD/acjYUSFhIpZF1/BDerb/S+nqvKPL7v2M3d0+q4pn267CIvJ5Egp/Rql
 ALILc87bTRN4bh8ysB5Inu+syHkYx0CmS3skWFE1GK4Ds3bOlzxgkuL/WHz8Yf95v52D
 zCHA==
X-Gm-Message-State: AOJu0YyyBziGpA/wYVe7aK5b2DGEUMfHkIKRT96sYMlirbtVNtOUKPDe
 J5NhY20MhOiQeG1vxzKjo5lX8N/WKBYvuaox6/PBJLZbXhrxCj358V49NQ==
X-Google-Smtp-Source: AGHT+IGHJ8ljhtZBFGGguIzxpCbsc9JFEobmLrJ9VEAXxKeWlbixGmNMh8M/VZ8TyRE8y/ejZAXXdA==
X-Received: by 2002:a05:6602:2b01:b0:83a:b7e8:a684 with SMTP id
 ca18e2360f4ac-83b1c60b7d9mr397913839f.11.1729982729911; 
 Sat, 26 Oct 2024 15:45:29 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b13891df4sm79617339f.46.2024.10.26.15.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 15:45:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:45:28 -0600
Message-Id: <20241026224528.3843185-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729982730; x=1730587530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J8YthoQSHQlPoPuQZBtq/HpqhQkZcaQwyh1ZhsPX2xo=;
 b=lvnA+WM96ctTO0pFMT/avdGKFscW8o7uhGBFNXpBiapx2ZReLUQuQ9ALT5gpZQT1IN
 TJ+QusJCaVv+6Ib9iU1Iu+kL+S7Jyb1XpKhsPOoHD2BhscZBue8v5o/PKSvmqag9baz5
 fanZnJdlO7qpw+gEMpcXv3+iLhCNAQi4T7uRUwK/a8ugazdIqXEWM2NiNFqjWG+sOfNK
 Xhkv90fll2oAKlQYG/wqdAroiDymw0wnAqlurALWIH6kIPEf5B/yXgbBgMT7FeoyIUbe
 k/4N16mLtTKgBxUTnGNnogrU7GxktnKUc0J9KFkHxioR5vfloq0c8QQgQ+9OfHijOpiL
 GTUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lvnA+WM9
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.9.10
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 6659c6cef8..52f3f76712 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  eae35fa97cdc92b910b706c720a257c7  psycopg2-2.9.9.tar.gz
-sha256  d1454bde93fb1e224166811694d600e746430c006fbb031ea06ecc2ea41bf156  psycopg2-2.9.9.tar.gz
+md5  3a1ed36b492a74789563577edc0b0689  psycopg2-2.9.10.tar.gz
+sha256  12ec0b40b0273f95296233e8750441339298e6a572f7039da5b260e3c8b60e11  psycopg2-2.9.10.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index 59a3190ae1..0df79c5412 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.9.9
+PYTHON_PSYCOPG2_VERSION = 2.9.10
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/c9/5e/dc6acaf46d78979d6b03458b7a1618a68e152a6776fce95daac5e0f0301b
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/62/51/2007ea29e605957a17ac6357115d0c1a1b60c8c984951c19419b3474cdfd
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
