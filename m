Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55305C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 08:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E27E6820E4;
	Sun, 18 May 2025 08:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEnXRa-5z7Kn; Sun, 18 May 2025 08:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0078E820EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0078E820EA;
	Sun, 18 May 2025 08:28:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 462DFE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C83F60B11
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSSfZnK5ziQq for <buildroot@buildroot.org>;
 Sun, 18 May 2025 08:28:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5305F605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5305F605B1
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5305F605B1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 08:28:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-231f6af929eso17299665ad.2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 01:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747556907; x=1748161707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gqdEy0E61MgZQ0hS2nnp5CEK1CkaFUVt/kwNmZxXlHs=;
 b=SgzAnSwHKAbOSrJkiuqR9D2wSg3FKeFyTysN9+L6vqRtXp4RSnUFvM8NTdrDDIE2/E
 dKXfnco2wDDrpMOOpqmIXovCRRiv3e8aQUdazZjl+DPRoXuVD79dflK+S/ZS9QMwiniL
 7gNJvQ/NrPXJgrMNqQyIac6oO8HpnvMJhf5yAwnHAOQKBVgUtTZVbYqwk4uxvLeIWXEz
 4ogsQKgaRI0fX2n7TR2W0alx2fVEUmCKldoyQgGBHPvqGvb4VR6JWsJGmCKJ5qdE1xJW
 nYS26KiPO55f5LW+aiLzh6Tr8GQkD7Pd2JxMbprV+cdt87Sfi1jsSiYqVMqVIYhyAO8h
 e0eQ==
X-Gm-Message-State: AOJu0YwJ8hoEPKEnonGHfxLpmRMlJJMmDU8PqdSMfJA2V+IZS+afE4Ir
 iklmpMc4cktLwqE1VLn3WXAcXFEIHdes0BjRzcE6WrC9O00ojM+AnYi5eoveZOKA
X-Gm-Gg: ASbGncurRAhibq/mQONyNNvBrgNrEy07hakLvLRDnrTkTggh7mUM8Na1mpN1zK6Qixi
 ZXsZpsX7TVAwit4Gl8nWs6zubudQhnQvD40H2G5KyEvcc2AP4fVQNCOD6sYg41stbVvCZXokVkZ
 aXLPMI/y0yVyluIiZPswg3sUv+M2MHJ0pNu7rNK6of6jKGrDYff1Wtse9rIxBHtxLIZfRM6cEE/
 XOh7l4lMjb7DNTFC/k3jRd/e+DASouFHCf4MnJ7Pm9qyAOLqcfAvcTlKqviQrpe24ELdtmEw2lL
 d5CNLAj3zMV4GtQO4y4FBifUsuFHgOyUwPkSX58fuGCFiK36xmmDE6tn7y7VEuF3cKCcCqFhKQW
 E3L1a1+18sgns1JytgCOCKf4Ks6zZPX1lYpNd/w==
X-Google-Smtp-Source: AGHT+IEsptVXdw3yd7/B3/nkyZSVx4zLur6mesD0gJd38xY/cELAtFGdS3cWxob9wpxeyNy3gmpiVg==
X-Received: by 2002:a17:903:1a28:b0:231:c05f:29d7 with SMTP id
 d9443c01a7336-231d43a54f8mr125192775ad.13.1747556907499; 
 Sun, 18 May 2025 01:28:27 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ac93besm40273865ad.12.2025.05.18.01.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 01:28:27 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 01:28:21 -0700
Message-Id: <20250518082821.41023-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747556907; x=1748161707; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gqdEy0E61MgZQ0hS2nnp5CEK1CkaFUVt/kwNmZxXlHs=;
 b=mCq07W6HHVvjuF0SrTrMOHC+QQCJxWbnRQJ+ebalKOHbQAiUCkxKVyTzCNzn2peykp
 mY6uVgCT2KcIrTvv+0L8GBhUYEDftgqPfBwRncpAvgBEm3yTW2m4AHjbQY8u8NCYIIla
 C6Rbps8hMEb1hirl962rNkfRUV+yrIbvmckHy7a3jFLZ/xf+hUVapP5XQxNJzM+BCxPq
 dHtmJkK30zqH+BY38h587zWfRv6wyWPpRg+3sD68041BLCCwAZAEUZbFsZNsIjywvkMX
 GppT14dm33bhhbOjRdaHPSHdD8xSPo6RO2MooXOr6xpDKAxlQ3j0+mFcaNxja5FbL5PV
 kaRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mCq07W6H
Subject: [Buildroot] [PATCH 1/1] package/avrdude: bump to version 8.0
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/avrdudes/avrdude/blob/v8.0/NEWS
https://github.com/avrdudes/avrdude/blob/v7.3/NEWS

Updated COPYING file hash due to the following upstream commit:
https://github.com/avrdudes/avrdude/commit/ececf3258e77eb147b0af75275de5ba7d071d7a4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/avrdude/avrdude.hash | 4 ++--
 package/avrdude/avrdude.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index cb34e6b6f9..2a11968eb5 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  beb4e0b0a07f8d47e550329ab93c345d5252350de6f833afde51b4d8bd934674  avrdude-7.2.tar.gz
-sha256  201babc7da198873304a77a30dbfc7ca449c9bba52df2dffa4cca0009dbdfcb2  COPYING
+sha256  a689d70a826e2aa91538342c46c77be1987ba5feb9f7dab2606b8dae5d2a52d5  avrdude-8.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 89637d4ca6..619987119b 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 7.2
+AVRDUDE_VERSION = 8.0
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
