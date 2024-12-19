Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C792E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6D260781;
	Thu, 19 Dec 2024 02:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2P8iep_w-ojL; Thu, 19 Dec 2024 02:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A38A614A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A38A614A8;
	Thu, 19 Dec 2024 02:07:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9D0ECE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A011460781
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3Sxrp4_jsUQ for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B3A1614C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B3A1614C0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B3A1614C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:07:02 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-84435dbda4bso50921739f.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734574021; x=1735178821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pq4lSZYxIA71YRJdkUJLt8b7QQPPu1ypFiL8FT8B4Aw=;
 b=Y4g9hMnY2zccyVanMf7JhhNEQd8OcLEdooeAPn70GDirQTDGDlrAOdRoNlmyPU/RpX
 0X3r80CnHQlH1Bd6I6b4rMsIPzwF778HDotlXBCB+bzITCKWYCFUQX8fFNExFtXgcEmV
 rwjLZvaoux0R0eViiSfKdrZY9Cgh7/ibVwxuYWjRIhxIlpIviQZdO4KCpBUWI6wErV6E
 q5mNzZthrPKNUHVczxhH8yVjHHrZhkoKwT0d1dfjuaWOpOIgmwEssgsTK3YfuA4CX1WO
 qCv5NNVCX7GCg3V8h8uf/XrvncAYNwfkzziSEfAXFH1qaK8vBBTm8ltRDg2abJL511wD
 LPdg==
X-Gm-Message-State: AOJu0YzeJ1DHRWWks0MnTVqtsDm1NSUqMvEZTNo/3f25e8DnVBmyjszr
 Hh7ZOsxvWNVUv6F5FYJCFcdd1e/vt56Q0sXi4LOjWbkMogtSXYe85rv7fk4ftaU=
X-Gm-Gg: ASbGncswO9JTzQWmJp1yIRDYUaNHPbK4BsbLlFzaRZUx8nfsJP/j8VyaUJIunA+zL6W
 dhBO6tR8dWx0lPIotYxqoLsr1lB+nn8JgANuHakYZbHthwYMaeZ3GSZMj6ZmH7/1TpYQRSWAxSV
 hHyPbIQWYNheMLsm17U+zGuwPnkXlH5Cj3d/RkOpKBxWToBLKIvGT3WW8PN2cel3Xodm/bu1q2z
 SVGXRGqKhUGPq5AX3wyfld/ZKpwlbEDz9KUqbJD/36nnsToa4mCiKTEDLXKKEnw8qJwKAAzLVuj
 wJnWItGA93QPmMOhLJlFoNKnGPaZORNRVw==
X-Google-Smtp-Source: AGHT+IF2jilpVY/ht13dE9bPsnJzYGD/vFtVs+1iuNOI2uJBP1+nCvIYO6dhZGHdgqLitpQ1nZvehA==
X-Received: by 2002:a92:cc8c:0:b0:3a9:cdc1:f8a0 with SMTP id
 e9e14a558f8ab-3c02f9e9979mr11933225ab.8.1734574021202; 
 Wed, 18 Dec 2024 18:07:01 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf66f7fsm49464173.39.2024.12.18.18.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:07:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:06:54 -0700
Message-Id: <20241219020654.272290-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734574021; x=1735178821; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pq4lSZYxIA71YRJdkUJLt8b7QQPPu1ypFiL8FT8B4Aw=;
 b=St/R/C+pS7XK2Pn449x6K4tZIPmklgKzzJZ2GB1nZZfSSKmDuFSenNdIdv3W5NTpY/
 6Bw3mfD3Ol6Lrziyf9GeBZ0t2N2uBp9jeP2KboH5NnxA/EBr0GAvdEOtHGLDTWTepWAo
 /EHnebJKhmkJs3wmc8C8z1sp/oG6TZC4BTGHrDMNqM81zSxRl3GIEIA0odPiBkkxTY0u
 AG8qJbEUhfmsdf7PZN5ScRFUvcMV0pD4B0gr375XVt044aMMGpOZrsOLGlnAedtlrcAy
 rICp/QjpcSNBHwk5NkGxjTfC3CQ4AjxKbEgN5BwXC8zYHjAQz4p5u4kBZ12jO5M0eQnI
 W8iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=St/R/C+p
Subject: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to version
 1.27.0
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
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index b01d3df254..bb19d63561 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  ac265366ccd17365db319dc95a9e5bc5  hatchling-1.25.0.tar.gz
-sha256  7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262  hatchling-1.25.0.tar.gz
+md5  6ffb3087c9b6a9ffbfc1bb394f7ed1a8  hatchling-1.27.0.tar.gz
+sha256  971c296d9819abb3811112fc52c7a9751c8d381898f36533bb16f9791e941fd6  hatchling-1.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 2ca2caf67c..57fd34530b 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.25.0
+PYTHON_HATCHLING_VERSION = 1.27.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/a3/51/8a4a67a8174ce59cf49e816e38e9502900aea9b4af672d0127df8e10d3b0
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/8f/8a/cc1debe3514da292094f1c3a700e4ca25442489731ef7c0814358816bb03
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
