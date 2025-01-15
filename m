Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4778C02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 07:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5082F4161B;
	Wed, 15 Jan 2025 07:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 55dYyuRjf80D; Wed, 15 Jan 2025 07:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EAFF4161D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EAFF4161D;
	Wed, 15 Jan 2025 07:59:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AD694B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F27A34161D
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 07:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtcBRhILUilA for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 07:59:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E63AE4161B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E63AE4161B
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E63AE4161B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 07:59:33 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2166360285dso113355495ad.1
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 23:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736927973; x=1737532773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6/A++uZU/OSjxPArKQUBplkt9Azx/pj3jztTX0OYXOQ=;
 b=BiDdV52EcIEJwipwO1cUhg9hLPx5/fpOr99uEUpPWYgJ7/scgT+IGuLcy5NtBXYtZB
 6LpNiJrinPoAN7mVdcPP95JGSIzl6iykQlLRj9nnveJjQ8jZdYrl4XcCG93fqqDj082h
 BMA+iNjC684d5eK8+m6TK8bYlg44b1tqiEAvX5abIK9Z7stgI7uoLMaCh5NOBhiINzOJ
 P0wy4pZ+tPIudCTs/3mPOO991U86ZVLjuXEKL344iuZVQqt4JXSwfSMi58GvxTe+4sKv
 Bitwy+D2o8BsMNamYi8U5Y1tlesPQQTpvpjQY9v7oIE5opBtdQwPs220rGjCOmtzbChm
 am3g==
X-Gm-Message-State: AOJu0YyJSLWXtSL2PBxdp0iM5k/NIb368CgLQ9N358sXhlS+ehoH2DF5
 5gHH0MLBt9eCeqOIRlmXiw+pfJjdAS2XYHjSNzSRnWBANR7NrBI/yS1g5CZ9
X-Gm-Gg: ASbGncth+24S/E59LcNOXRIqzCTX1MkEiiFd+dGwlctnk1rLuC8FfpLi9SyqePtP2GJ
 PpP4FMedNx7CV9BeThFRA4okbpiVRrmLjgV4rPZDJXuVCu62IShkx9HBf6Mp9W9yK7+oTCF5DEA
 raSYFJEoq4M7+nGp97JmHz3E/tHjl0+OfYapUIIXDTKUkQfkc2asGUpoEItjWHJm6IYXetwFyzM
 yQR08g6Oz7PBTpxjEG/ROdyyftqnanu0ERG2wQWfAcNScGiPsWfpMvXfi3VHpx6COs6V+gLT7QY
 PrTZoWjyOGoaHFedV8AZtAfV+Tm/j3+9Lop0Uj07
X-Google-Smtp-Source: AGHT+IGcdsT+ArulB3W/ItTRlEs44rVc5SxotqlO2hOjQlg6SVcc6lesK1AZERk3NsHeSxKZHvC7SQ==
X-Received: by 2002:a05:6a20:a127:b0:1e1:bf3d:a191 with SMTP id
 adf61e73a8af0-1e88d2d4fd8mr41102887637.33.1736927972967; 
 Tue, 14 Jan 2025 23:59:32 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406817absm8912267b3a.147.2025.01.14.23.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 23:59:32 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 14 Jan 2025 23:59:29 -0800
Message-Id: <20250115075929.794762-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736927973; x=1737532773; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6/A++uZU/OSjxPArKQUBplkt9Azx/pj3jztTX0OYXOQ=;
 b=d6yxlejM7uwO6UJCvaeRGAcTINWpKMN5m1D67WMthK9nhnw/e7ffedmERV6Qw+UWvm
 MJ2hpzv/5rXJJUwWe2ua+ejvZQmpMY/iV0xtdNDMViKrNdlCRQd7C/8/OJniAfCjwhVb
 6ag3n6gFw7vNfU5V3rVw0d8YWlsTw4jJIC5Td/a9RG8ovc7E9fy+svDjdX5ZV4cJwJQE
 T6hrnnSuEoslLabQp6AW8LQOgOa2w3EbB3MLHwGD5uVVcVrFW/77WPajaqTsBLnTYbjE
 ckw7H0mBVGD4ru063aIbp+KWo06mgKVpe3J2/YXcyRxdRRcB9TFIAD9Yjm+8L3EPUnS+
 YLsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d6yxlejM
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.48.0
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

Updated SQLITE_SITE.

Release notes: https://www.sqlite.org/releaselog/3_48_0.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 788e89f99d..5b933fba8f 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b  sqlite-autoconf-3470200.tar.gz
+sha256  ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5  sqlite-autoconf-3480000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 30505a9dbc..c8f12a427a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.47.2
-SQLITE_TAR_VERSION = 3470200
+SQLITE_VERSION = 3.48.0
+SQLITE_TAR_VERSION = 3480000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2024
+SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
