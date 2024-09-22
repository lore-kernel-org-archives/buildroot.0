Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB67CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 03:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D53605B1;
	Sun, 22 Sep 2024 03:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1dJiJG4u58V; Sun, 22 Sep 2024 03:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4E23605E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4E23605E6;
	Sun, 22 Sep 2024 03:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0931BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39BCF605E6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 03:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tp4HwL8tcsIY for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 03:47:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30E4F605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E4F605B1
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30E4F605B1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 03:47:18 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82cf3286261so125327639f.0
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 20:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726976838; x=1727581638;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zH5PcnLla6q6bpXFIPRvRlFhpT0UEda1YyUn+J3S/2o=;
 b=xTeysrlOq3zRWFzZCUW9ZoFOncgEi1Ow3JhTnZNnvvhsGielElFymQRXm7vTxtlYHu
 rKBGJzK9RMWjG50/Ynhr94169wQrtMLYh+AZvwoS1urEY6kTo8tfvYVG4PafQMma6oRx
 9WgZLgWZkYhfl78zssvbXYIM37iMtOgcvqqbjoEX5NeAa3Bsmd9jfGRMS5KvXg6YhUSp
 HX/BMCOpFJ7Uevg3cSbP6a3eusqcpuwd2N2/RQB8X/SQB9zx4n4S8FFaPnXP0m5jKE9K
 73hEpPjNUEncU5BiQAXRfXkORMwBtisBP0t3jlWgnxNo6iSkcaYOiTvCGNaMVzlu62lV
 BnJA==
X-Gm-Message-State: AOJu0YwD33OhpYrIDOeQVYeO3lvY/gbk4eaviOVtbcBDe+ERfs8JTd1O
 tuqcUsjnf7zaDAJPI9iWmjVsXwF7bqMOl6D+pv5/vG9DCrEawO1ruIbHkw==
X-Google-Smtp-Source: AGHT+IHjuM8gv+dJ76jlXfMiiLwLAv2E2YAKYr162T2tNEWzYqHXmqW0bUQhM51PYq7lIxWzYYv0FA==
X-Received: by 2002:a92:ca47:0:b0:3a0:4250:165f with SMTP id
 e9e14a558f8ab-3a0c9b7f9a3mr73739435ab.0.1726976837673; 
 Sat, 21 Sep 2024 20:47:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a0ca84091dsm15578575ab.15.2024.09.21.20.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 20:47:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 21:47:15 -0600
Message-Id: <20240922034715.852415-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726976838; x=1727581638; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zH5PcnLla6q6bpXFIPRvRlFhpT0UEda1YyUn+J3S/2o=;
 b=DTxMbu9fNLHLL1SAkZxKmCIAkFK5JqEjvp7+CCGgorzAgbLreib+XrQrlkuLz26NCt
 zq83mq9K2o8R7TvYzKXspXs6MM6aj4MYmv6WdKwFjYUcpHW0AD6IWr49InaXZGggwOwp
 Awb4glefcj68dPNqOXrabg1fPFejcb6ly3g23OLgaHT5fHzX4sLCFn4C/JhtL7FpQBc7
 OmhJW7K/iJgkBUGp5UJ1NfFvnHORSQdX8pQ9jFxFKzj7x4aF3S5wBSkzp4B/PdWun9y2
 uul9RTruzhBSwq6Lo9xqS2WYVwgSsF6dVrGDzrm2pjite5G7flQCjZzwN4vWT9XWEhwM
 BS4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DTxMbu9f
Subject: [Buildroot] [PATCH 1/1] package/python-tinyrpc: bump to version
 1.1.7
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

Remove no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tinyrpc/Config.in           | 1 -
 package/python-tinyrpc/python-tinyrpc.hash | 4 ++--
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-tinyrpc/Config.in b/package/python-tinyrpc/Config.in
index 3c643c754a..e8f0f9ea0c 100644
--- a/package/python-tinyrpc/Config.in
+++ b/package/python-tinyrpc/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TINYRPC
 	bool "python-tinyrpc"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  A small, modular, transport and protocol neutral RPC
 	  library that, among other things, supports JSON-RPC and
diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index d4bd348e61..f1b2781ee3 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-md5  cc7e62891eee806dfbbafb6e3875825e  tinyrpc-1.1.4.tar.gz
-sha256  c99f412e5d9849c2deb468ea37fee2faf12fbc95bdd3616ae5c276ea195ed6bd  tinyrpc-1.1.4.tar.gz
+md5  b5079a23bbd8c41a33fe15c7486acf3e  tinyrpc-1.1.7.tar.gz
+sha256  15a8f41838e7b8be274467de59ad5c571e4cb5a2fe93bc2940b1d103bce4c6e5  tinyrpc-1.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index e976778fa2..1b3e4a83ed 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.1.4
+PYTHON_TINYRPC_VERSION = 1.1.7
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/d2/86/2741f0c74cc339416c9803b6393eaf230254ecf36ffd839614799e15a202
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/6a/31/b0d0403cafda7965fab0741bcb7c63b26eab7fcfb605d4ece31a6f7b034d
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
