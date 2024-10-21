Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381A6D15DB4
	for <buildroot@archiver.kernel.org>; Mon, 21 Oct 2024 16:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6DF40251;
	Mon, 21 Oct 2024 16:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrQiW2cIuW-H; Mon, 21 Oct 2024 16:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87CDE40285
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CDE40285;
	Mon, 21 Oct 2024 16:03:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 098D3963
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 16:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECE7940251
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 16:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bItis1zmXFvd for <buildroot@buildroot.org>;
 Mon, 21 Oct 2024 16:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB5BD4024F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB5BD4024F
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB5BD4024F
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 16:03:56 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a68480164so421809266b.3
 for <buildroot@buildroot.org>; Mon, 21 Oct 2024 09:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729526635; x=1730131435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v3DL5YHTXsv8RZuPvrBEz/A92om6ssT0kT2HNd+pnA0=;
 b=LCKUHS1AfqdD62E3pHqZLGplp8kJAhN9b2BLQxWkK88CbWFspPQc5V01eaCanZLjX2
 qp+6qmS94nhAbY7c5HBV2ESlmLYwXsyGhjdva2JmrpstDSpg4pNOqpofE5eEPS68N6OM
 eBDnwebd3dZNfXosV5Az5liF7cm1oeNutNv+DGP7tdlsMAbZS6NmVrnESBWKxz5amQ3w
 DCefSkbP7gExEDGdBUo3Y/9y/f4yyyoUgQeBCnG6xfndO7EaCAJ6qMOeY5Hoh1JFjplo
 g0uQ7I46YkgFsPywg0vB83r9AnTwXpc/iZsZ4S3P4LAy4QSfAy4W+f3kwLCM2ZVWAdZT
 fksQ==
X-Gm-Message-State: AOJu0Yz3G2UvzOmYlloSoiOz50YB604lZ+wTY1vjlGVe3M6ANUE6A+tu
 9rVa1KCrND80Z7QJFtqnGzbDxowcWUNt8PoX9bGc7VXZJAClBcfhqn31MYy2
X-Google-Smtp-Source: AGHT+IEye6PxrqDBe3USmh1Z2MKbWihQ1D+35zA9oYs7/+VLZnCID7fAjKU1BpgWpKDjgeqoB9K0Zw==
X-Received: by 2002:a17:907:3f28:b0:a99:f4be:7a6c with SMTP id
 a640c23a62f3a-a9a69c9eb05mr1027652266b.52.1729526634651; 
 Mon, 21 Oct 2024 09:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::f68b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9101f9ffsm219390966b.0.2024.10.21.09.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 09:03:54 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Mon, 21 Oct 2024 17:58:35 +0000
Message-ID: <20241021175835.466778-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729526635; x=1730131435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v3DL5YHTXsv8RZuPvrBEz/A92om6ssT0kT2HNd+pnA0=;
 b=QsoeBh6GqZG1sa6ksPra0PPnHP1vZ/j6UcTDTQetWuPjrIFWlm8YNrUNub7gRNt4rR
 2CkRyXcudnvHasRWD74OPEylLI97CziHZxl8v1UasUjswFyFvcAohFt56za+9wzorLjj
 aQ6i47fj42KZXXaUWPAo91OTJG09kQkxrv0aHSpTT7vR40k3DC8D/u5Rooi7H4bNVK8B
 w6d2C15huR8fy1pkzEJEcB6owCyLNOJ4Gsiun4prkXR4I5fc2HmWC11XVnJdmAiQfFC4
 b3bxErpKZiEKUwxX5EoVcYm2Dr8CY71nivMK1lTeasUqGEiGueVtdB8chUigsTYxjOle
 mOOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QsoeBh6G
Subject: [Buildroot] [PATCH v1 1/1] package/slirp4netns: bump to version
 1.3.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/slirp4netns/slirp4netns.hash | 2 +-
 package/slirp4netns/slirp4netns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
index e310da1af2..1a6a657066 100644
--- a/package/slirp4netns/slirp4netns.hash
+++ b/package/slirp4netns/slirp4netns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  acce648fab8fe5f113c41a8fd6d20177708519b4ddaa60f845e1998a17b22ca5  slirp4netns-1.2.3.tar.gz
+sha256  a3b7c7b593b279c46d25a48b583371ab762968e98b6a46457d8d52a755852eb9  slirp4netns-1.3.1.tar.gz
 sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index 7fa992af6d..ce8ea34f2e 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP4NETNS_VERSION = 1.2.3
+SLIRP4NETNS_VERSION = 1.3.1
 SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
 SLIRP4NETNS_LICENSE = GPL-2.0
 SLIRP4NETNS_LICENSE_FILES = COPYING
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
