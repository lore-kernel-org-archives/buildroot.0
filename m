Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0DFD1358B
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8B7402B5;
	Mon, 28 Oct 2024 00:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NY35Tav_4q9W; Mon, 28 Oct 2024 00:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB39E40251
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB39E40251;
	Mon, 28 Oct 2024 00:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24323AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11CEC60645
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u26feKphtxHb for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FFA760623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FFA760623
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FFA760623
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:51:23 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83ac05206f6so149109839f.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730076682; x=1730681482;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Zowa2IwKVnnWpcd0D04QAAcDCpBkiK4caxAkuR2JmY=;
 b=XL7Ystho1JAEGFgD6BJF9ZS7cbkq+zJTY1EklAZrLEUitioyqD/qCnsBY1FWe4ecFA
 d6JWUg1vFRwDVh61I+KE1pWSmw3hORdWGo+GVj5NWVoijeJVNqSbFEatabWDBWsNEvEq
 CItw4Nf0GQlhkVQkjH6cUig0b4k+YIYgYdf1wM7D1K+6ANATZSbPOVcJa3WJmntxlRxH
 4LLQcTm7PvwQZChnNOiQCZTWeL0iw7B+WC9OKLb0lmENCMugftW5csDU9NCm/ZJYiQeo
 eP3hihgzw1OkK7SEu/GZWHdjGa1MjEFvvXu6ldr2HPez23S6JNbo5KUkzXi8Y3XTc61V
 st3Q==
X-Gm-Message-State: AOJu0YyBIb25RBz9KxX+r2Xs2YOPMxn7t9HIHJ91gMYS9SQnHHeqPbZS
 2/2KEVZij/Ktzd3AcQyQuvD053ivvsSZBvPrW16lhEqWSxSef4o+JBYdTA==
X-Google-Smtp-Source: AGHT+IE+11qChaIEu7FHpO3o3t1chvbsH/B0gG92QH2t6M7XsJnWLbArn8KqMxs0Uc1NM76Q6lKtGg==
X-Received: by 2002:a05:6602:6d10:b0:83a:b188:7a4d with SMTP id
 ca18e2360f4ac-83b1bcff2a0mr495071139f.0.1730076681872; 
 Sun, 27 Oct 2024 17:51:21 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725eb746sm1397086173.17.2024.10.27.17.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:51:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:51:20 -0600
Message-Id: <20241028005120.4117906-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730076682; x=1730681482; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Zowa2IwKVnnWpcd0D04QAAcDCpBkiK4caxAkuR2JmY=;
 b=mm0eSuxX6gwi6jqvaMxvgU3s7SR0AO6OGMVzSgBq95A8wcjaayHQxEDnzhLBQQb8eG
 ofInPOCdHqKzLgjNCP/9ulUVR0KS4Vh2t+ggZSA99GRShjtNtua989h3NMNsHtSOKt1N
 3GjCetecC0K8lmzn80QeHQrgYrZ0b0Mi+LAk5B4zGHtklWDeYIrRjsS/ElvFMwQJR7TX
 S1eM75jKQxoheo+0R04PouWq3MdgnWn+9ZozyB1/LdguPmurjXZG9/vJ7lwMtRQrlpgT
 /bpOBiSQVCD7YEHglMKY5NukGvpqXchipMMIcaOFO6UrGkAZKU4pd5/qiKE9ai37sJwA
 16aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mm0eSuxX
Subject: [Buildroot] [PATCH 1/1] package/python-trove-classifiers: bump to
 version 2024.10.21.16
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
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 2ed97b541d..02ea021527 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  4560fbc4037de39ccc59121438a14af8  trove_classifiers-2024.10.13.tar.gz
-sha256  b820fc6f9544543afa15e5d9cfc426cde3b20fc2246dff6f019b835731508cef  trove_classifiers-2024.10.13.tar.gz
+md5  c2820cfbb09e91d84ade85e0e65d87ae  trove_classifiers-2024.10.21.16.tar.gz
+sha256  17cbd055d67d5e9d9de63293a8732943fabc21574e4c7b74edf112b4928cf5f3  trove_classifiers-2024.10.21.16.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index d7426f5a27..ab2421cbe5 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.10.13
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.10.21.16
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/10/51/be10158183105d970d7bfc81401cf6076c13844a5869c24c72889f4bf658
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/99/85/92c2667cf221b37648041ce9319427f92fa76cbec634aad844e67e284706
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
