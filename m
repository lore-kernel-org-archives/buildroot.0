Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F209BCD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 19:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBAD81D4D;
	Mon,  1 Apr 2024 19:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys7TX41l3d8q; Mon,  1 Apr 2024 19:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C9F181D5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9F181D5F;
	Mon,  1 Apr 2024 19:26:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3667A1BF966
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 19:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 226856085E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 19:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyLNdIIEQLmd for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 19:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=afshin.nasser@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1BC2605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1BC2605C1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1BC2605C1
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 19:26:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41589af7f63so1309365e9.3
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 12:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711999604; x=1712604404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nuFxOVS9VwdZkvKMow6wgCttbgU+oFyaa9y1Kkhn8JM=;
 b=FcLR+pL0FZm3fWYHhACxPvgWgQNPm/LcGlUBVOWkn1VjJxrGVR7QDZZ0z8mjWHXG7Z
 27mhHL4EPdDh4Qgox3AP4iy7TYqfWY8FC3sWCBI9dgONNCEq0oMFgbbAJzA1MBJZcfmY
 c6TyAYEZ94Ga/NcikxCx5pfJEQiYPLqRPN3kn2zjAdTEKrdCp3lBy9wYyOMmR1Zz1ln3
 bt0tzwxJIgdTTI8Kzwsv2YvfSzAWJfrCVFgpE1ClQeVkwCMH4Xt3tNtfMseYwgGhJFHp
 fnNs9plF887CRrZqQY7eoyMguFCJE+7jnk/gBrKaUlRmNAMVzPvx8p/ea/q0kDtqM1Y0
 U9bw==
X-Gm-Message-State: AOJu0Yy/aVBqP15lkwVrdlPj3s30JDqIJ0sva9kYW6gtxhy0XPtR/E0l
 aBoFclvni5qG7PYkZPgwQ1ShQ9ZSfvx/dASdQZC0e/WpJO7QJSEwsx40hKH82sneQw==
X-Google-Smtp-Source: AGHT+IGRf1hbp5MptLGS6lqmFjSQECcRSmZpdbrhHeCO5DkXz78xT3Ed7nod4U8yrLy31gvyQIQlpA==
X-Received: by 2002:a05:600c:68c6:b0:415:4efe:e9b0 with SMTP id
 jd6-20020a05600c68c600b004154efee9b0mr7132741wmb.18.1711999604066; 
 Mon, 01 Apr 2024 12:26:44 -0700 (PDT)
Received: from localhost.localdomain ([151.244.106.34])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b004155ea07080sm7054748wmg.43.2024.04.01.12.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 12:26:43 -0700 (PDT)
From: Nasser Afshin <afshin.nasser@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 22:56:29 +0330
Message-Id: <20240401192629.932481-1-afshin.nasser@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711999604; x=1712604404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nuFxOVS9VwdZkvKMow6wgCttbgU+oFyaa9y1Kkhn8JM=;
 b=GPNi6h0vtIs+jHdqKC9T5CK2jhVeXT/n4qn44uckwaGfRyQltJWXx3a/HFF0/0Rj4s
 nOYY4n027mA7/co1r2nb3ZRgAxhyNo3KusYVDzS5okf8nYjkKbpvLjsOUNyNLQ7wJyCw
 EPyeOQt7paTstkiHFjO/Tgcmv2svmvg7sZS4InI5GDrSR0GMOOHRWGHqPTDmYYagYi77
 e8GXnEbYWjNdsc+N3DCf8zv4KXDb4jIu6dIU6AiOdXo2KuqTIx+8TsgI57hKUkiPlyCb
 2KdeiTz43r5gZZYfPm1ihImo5VgzURk/eCKlI00zSGL3TRQCO4//KMObleEE9zNgk9AD
 fUcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GPNi6h0v
Subject: [Buildroot] [PATCH] package/python-pycrate: bump to version 0.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
---
 package/python-pycrate/Config.in           |  2 +-
 package/python-pycrate/python-pycrate.hash |  4 ++--
 package/python-pycrate/python-pycrate.mk   | 12 +++---------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
index bbd6873938..e78df43fcd 100644
--- a/package/python-pycrate/Config.in
+++ b/package/python-pycrate/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_PYCRATE
 	  A software suite to handle various data and protocol
 	  formats.
 
-	  https://github.com/P1sec/pycrate/
+	  https://github.com/pycrate-org/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
index 94ec99b738..5489f9290f 100644
--- a/package/python-pycrate/python-pycrate.hash
+++ b/package/python-pycrate/python-pycrate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycrate/json
-md5  bd21fa697ecff7ad93bec4943230d281  pycrate-0.7.0.tar.gz
-sha256  c83232f522b5bbc3b3eeaca2cf38ee63cd3c25d0c15f3ba221e6dafa89b9a763  pycrate-0.7.0.tar.gz
+md5  37e1bda10f41fe947512e9d5f8289518  pycrate-0.7.2.tar.gz
+sha256  8abd3fb9f3e7a2dc62061490f01e99b2a6185e88b1c9bf30db68853b748b8f61  pycrate-0.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
index 1645eaf52c..182644df6d 100644
--- a/package/python-pycrate/python-pycrate.mk
+++ b/package/python-pycrate/python-pycrate.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-PYTHON_PYCRATE_VERSION = 0.7.0
+PYTHON_PYCRATE_VERSION = 0.7.2
 PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
-PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/a6/a5/aab94e6bb8b3281cc450dde3961b417bd56abde2401955a9a4904df44c68
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/f4/01/09aac6ea758ca7b7b1b4832c0c39003752ef7b6c1478e6db2f34171db3fe
 PYTHON_PYCRATE_SETUP_TYPE = setuptools
-PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/$(PYTHON_PYCRATE_VERSION)/license.txt
-PYTHON_PYCRATE_LICENSE = LGPL-2.1+
+PYTHON_PYCRATE_LICENSE = LGPL-2.1
 PYTHON_PYCRATE_LICENSE_FILES = license.txt
 
-define PYTHON_PYCRATE_ADD_LICENSE_FILE
-	cp $(PYTHON_PYCRATE_DL_DIR)/license.txt $(@D)
-endef
-PYTHON_PYCRATE_POST_EXTRACT_HOOKS += PYTHON_PYCRATE_ADD_LICENSE_FILE
-
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
