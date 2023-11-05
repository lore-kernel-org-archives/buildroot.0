Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944F3C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8D241B6F;
	Sun,  5 Nov 2023 07:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8D241B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwV7j5N_iYLO; Sun,  5 Nov 2023 07:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 933A141B6B;
	Sun,  5 Nov 2023 07:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 933A141B6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFA741BF584
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCAAE41B6B
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 07:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCAAE41B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKgAkuFXL9PY for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 07:26:55 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 793D641B6A
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 07:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 793D641B6A
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7a67b9cd230so128486839f.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 00:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699169214; x=1699774014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x/QrwgcoSFWH2qL/hRMjOlzLQ/J3Yry9IeYdKtHGDBg=;
 b=J2lmpSx0kLzTcPMn7fDziiLfcSh+ghTAiNqL3pQXaayvW5KrieMiI2AxIiC+XYjfZo
 rtDl0yoiDs0mdTUejq7exfU9nVv3cMDTd3wNF7ii6Nj85S4URUKcgrciA8vJNstSQSqA
 3Ow4sQmOF0ZFLv5Yqcv/x7R4Mek63NVaPfsdiCKNRzJC4UAHK4oAMd5IKRj4C1uuuXwv
 sSg+PdkETACgj4xB3W0dATTpMp3FATCymxGYhfbl1Vb3H+w6OZNAkOzGgPpFTAsJJ6r0
 jPeMfcBLxmKD3ISYfZ1mdLVTZ0DNzFmTFWtoalCD8G6k+rhgXsUfCmj1lXU13ewE3FW4
 PaRg==
X-Gm-Message-State: AOJu0YwTGfWbJj8wvbLf64Prj6/5t7ElYVbJT4/L8vhfXC2WgV3SEQeZ
 pCui8i0Re0/eglqQSYchuq+uPBsxL/4=
X-Google-Smtp-Source: AGHT+IHzucKOPK9jiA8TEMPb7huGSHezS3bDOCbwz3Wl0041mhk+1HdvOtvQwg404kk0jYB8GHpdjw==
X-Received: by 2002:a05:6602:2b91:b0:7a6:7bbe:5aa0 with SMTP id
 r17-20020a0566022b9100b007a67bbe5aa0mr33458626iov.0.1699169214065; 
 Sun, 05 Nov 2023 00:26:54 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 ca9-20020a0566381c0900b0043a1d33a341sm997203jab.81.2023.11.05.00.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 00:26:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 01:26:52 -0600
Message-Id: <20231105072652.2879462-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699169214; x=1699774014; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x/QrwgcoSFWH2qL/hRMjOlzLQ/J3Yry9IeYdKtHGDBg=;
 b=gGplmmDEIC+1owcgXIGgfFJ7gQ9T7Ey6wJF6suNH7Jrcd+UaKwgFzW3PTWwkUgnDcY
 2suXEjt65w4YO55h1znk7nMUr0Uyw7sTbZE9bExEpRep6BxkxJEG+npl1XFMucvd9kbd
 GSoGKYQ3t7y1VGDcEs3uirnUGSDf0ZqxmocMcE+unBDgck7WXa5Bg6cudsvgdKvY60hu
 ByXx3MHj4LEHpz1gHA7LiqcAuC3p5U2wWOr6YqzkyKxNnI331PgHUINH5uUqOKI9d0UD
 DdOqX0JdnGGLZGDI7dUhxFxIhbqxnC0DrXjzGcB9S93a8PqRuMziFc/dw40U65opDkj0
 UOVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gGplmmDE
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: bump to version
 21.2.0
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
Cc: Lionel Flandrin <lionel@svkt.org>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop python-setuptools runtime dependency.

Add new python-packaging runtime dependency.

License hash changed due to date update:
https://github.com/benoitc/gunicorn/commit/378f0d04ec390a754cb819f095bf65bfcc04ed99

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-gunicorn/Config.in            |  2 +-
 package/python-gunicorn/python-gunicorn.hash | 10 +++++-----
 package/python-gunicorn/python-gunicorn.mk   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 18f0c034ba..a670dd4814 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  Gunicorn 'Green Unicorn' is a Python WSGI HTTP Server for
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index cff4915b72..bd4dc1b3ca 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/gunicorn/json
-md5  db8a7c5c2064000af70286534803bf1d  gunicorn-20.1.0.tar.gz
-sha256  e0a968b5ba15f8a328fdfd7ab1fcb5af4470c28aaf7e55df02a99bc13138e6e8  gunicorn-20.1.0.tar.gz
-# Locally computed sha256
-sha256  789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
+# md5, sha256 from https://pypi.org/pypi/gunicorn/json
+md5  cb41319d6929842c5af7003d48c513a2  gunicorn-21.2.0.tar.gz
+sha256  88ec8bff1d634f98e61b9f65bc4bf3cd918a90806c6f5c48bc5603849ec81033  gunicorn-21.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  fc71b8f2ce774a47090c106ac5d1145359f5c0e25a0d9ab42acacd230f596936  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index fb747bc00e..03ff5a49df 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 20.1.0
+PYTHON_GUNICORN_VERSION = 21.2.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/28/5b/0d1f0296485a6af03366604142ea8f19f0833894db3512a40ed07b2a56dd
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/06/89/acd9879fa6a5309b4bf16a5a8855f1e58f26d38e0c18ede9b3a70996b021
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
