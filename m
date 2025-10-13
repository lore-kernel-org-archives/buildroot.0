Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F151ECCD184
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 03:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C331F8227F;
	Mon, 13 Oct 2025 03:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I9E3OKpgiMg; Mon, 13 Oct 2025 03:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1452A82233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1452A82233;
	Mon, 13 Oct 2025 03:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EF72A8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3D040A82
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TBtAVxg1SeG for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 03:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCAD140A7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCAD140A7D
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCAD140A7D
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 03:17:13 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-33292adb180so3728046a91.3
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760325433; x=1760930233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJ65+PpUN188bq+Ir08uzXmULNqT8eHrYu8EiETM7QU=;
 b=VPnLspq0cwH7tPrKG1Qy67DH90SXEkDbUb1ZGRxqwXOI6JT9PeUuXr9g9jtMN56u9q
 dtUHC3r29jm/WcBruB08Y0cKPcnCCejzLvsg5DUhqYT90zy6O3T4QtGBlxBj2yznAI70
 orzapwIfD0fjLYuLUVF6EAiaoZa2vVDTLe+Z1uteavJesvxzJ7XaBOwsy0yCDY/3KD0o
 6gKbM7EyRn2hJfmahDex2FXkrd2/VY50v0x6RbFrqZgFnKcz5AdU6w3Yjb8fLo1vbA1u
 I8COplca0kJEd6IJcUbketxqal6o3JtEaKZ7k6QGZ1C7x71bmB6r+amhpTz9wLaa6yQY
 6/tA==
X-Gm-Message-State: AOJu0YyKiBabnR1ecj5dIWBUHV1I9uIoZsrQIrFRYQ7nqJF/tTJju0kL
 DfLrfW5jHYNkpkuAV/yTA4rDGIVZC15+5T1I1O/uLx1W4Nz+U1BqcZKv+xDSIwNr
X-Gm-Gg: ASbGnctQUASGGfJNppCDUPOWuNDZsz/LEn9tmiM42/ro+ZH7DH94mJH1Qx6mNsUJg3T
 v0tYWk7T5yjmr9z2hxf6y5Yx8kYYZY5SsTL5AwqTZcVjU3tROygOaxj3CjX8dscRJciNZPkQOut
 qdWp15+OmdtThGDpX5J3RgxSbChDjGq/RAfvtdgS5FbpMqvBkS6fg95+oY/7A/Qcp2uoGXdvts7
 bDP4uZE61oi+YfqDVYMPYjnoLOSKqPuKukc/QbB9PBFkG60cG3Pm2khVXEqVLA2cOmw2IRSJ38M
 YAzDpO8UrOJZ/JLM6rCphBZ+v8urzhrvMMaD7MRO1qLEeQ0cfECMAgTyMR6OZJrsx/yS8FobXL7
 W2PS+ZK4eom6ncwce/yhs0XGLKBOcWgzW5/OXWGVNgWQ11ACsrGbwAZ8tthEeQFQFV4s8mJnm6t
 QsLo/HAqaakHCrcV+mQ/RK3LUNsOWfqgK1kKiBU8FcN1C5T2GChMKLYdzA
X-Google-Smtp-Source: AGHT+IF0PXClz6GhASwfNgnQAhv3k7nqWAcV2au53tyXmWk0TYDe2PGUupfSJQV7dmlmCm4lf3bYtw==
X-Received: by 2002:a17:90b:1b42:b0:330:a228:d32 with SMTP id
 98e67ed59e1d1-33b5111891emr26807197a91.10.1760325432719; 
 Sun, 12 Oct 2025 20:17:12 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61ac8d7fsm10195647a91.21.2025.10.12.20.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 20:17:12 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 20:14:51 -0700
Message-Id: <20251013031453.566526-7-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013031453.566526-1-nemaakhilesh@gmail.com>
References: <20251013031453.566526-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760325433; x=1760930233; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ65+PpUN188bq+Ir08uzXmULNqT8eHrYu8EiETM7QU=;
 b=eaOgf+wDdutxJv0sGosYf+gO42hK30wjrlwlOrS3I18hdPfE9ERza7R0qGUDblDOuK
 C4Lyp8jsfRxopZeQ+6UBkru7gTZhssKni0BXrhXbs+RqQwsxnf6xYRa035rygmSH5eMy
 RdDlCBk9Kwfhum4keXjMl1eSihqjhjO2W2WqDvL0jfJT0QYt44m6/ohO9lFD2HMQfENj
 3QYaJfgdV59ivcBlu4WdIQURj5VnDzUbhyHcRUbV6vmxH7QJ5+L3po9VCkV3LImhYgvT
 U5QQe+KQreiyb0/D+dl+aMNWROUGR0UIz1+VHmUKyV1ZQ6lY5l+xh8/qOc/E5vnnRNB6
 tS5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eaOgf+wD
Subject: [Buildroot] [PATCH 7/9] package/qoriq-ddr-phy-binary: bump version
 to lf-6.12.34-2.1.0
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
Cc: Vladimir Oltean <olteanv@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 439d8e3a8f..6ae08a3152 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0837d5752a89ae7b9779cceac4aa758aad89688154a6a110a53fe16cbe6adca4  qoriq-ddr-phy-binary-lf-6.12.20-2.0.0.tar.gz
+sha256  d5a5a9b7f25295e9e41c8e7c18a1986d1b59ebe519113ed6b45ede51639da92f  qoriq-ddr-phy-binary-lf-6.12.34-2.1.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 665b653d20..04cedbbe00 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.20-2.0.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.34-2.1.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
