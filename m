Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12185E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 14:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 907F94048F;
	Sat, 11 Jan 2025 14:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9y9UNPPsN9g; Sat, 11 Jan 2025 14:31:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB47404DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB47404DC;
	Sat, 11 Jan 2025 14:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71584940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 528C7600CA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKmk1AoZkRsl for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 14:31:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5565160603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5565160603
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5565160603
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 14:31:18 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a8165cfae8so8469435ab.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736605877; x=1737210677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4u6DWACRzhbDkfnPzaA6/B909tOuS5l4UpfgWCF5i38=;
 b=PPuLuur5lVvjZqGWTo4mrfj04mrByOA9ar8BIZEZDqjTAWoVU25BdWWuEAokjDtgSW
 IOmk1qyio/OAGuUpy6ILZL+FR3s3D98YgS47y/Id4zytqNDevHVNY9ggS4vBIxL8iP8B
 FLU3v1DT9aqMsllWa2ztXj/uGIndoHQNbAN3x03HWdPlANkpjUmjrypi7N/5Kjp2r7t2
 FLKgC2b6ZkdufJwz7SwfrqQU3vc5LfNWmliro+LRb8zQv9RX1kJFKp2RV6PHIJuQW5+P
 g1hWkDlVDXGoOahjSn37wGf1VdudQH44BYH+KSWyA2GlIdXaU0SxaOgbf/pjdQj6TxuL
 KKLQ==
X-Gm-Message-State: AOJu0YzrebYfvhEkhHv90vQuUtLnbxN2Qgzv40idtPeJFFcqdT3Pat2B
 2memN/31pXBpEi21nfx0bXyYMOgO4pdGeL79rMCPhPFu+AhdNhX77ohBoO4+xUs=
X-Gm-Gg: ASbGncuK/DHKOD8mzoUfqc6L+dPoHIF/AG1l+h00DOxSKY+zRYzfL01PXuVwKNxyqqc
 dta/qKqalv8roNmu2z+/l+GpRtYVQXn86aIZrdGqWhGJk625bR7XwRWuoyGmQgjfVwgU3G2uqan
 BBAZcT/BZXjqkslL+3bzgQdvqvYOsbAiB+uOxdhPxyMSd16Xsu+pkg87HgOj8MU8Nl5taTrjaK/
 tCGAFz3roGtd99GGjmHHPaisBaGPwAzMfOnwlmZ8e7FK+ImQx2nif7C/6nnCA30yVlIlHZJ8qFa
 0jsuZNHh0KszZapPgesGV7JFrOAml6Q=
X-Google-Smtp-Source: AGHT+IF9qoMfHGZ7ihYbRCo+1I8ZdMHKOASMjhUF95HexEBj5/EADjRgQXT8LQkAcieXHq6QFm/utg==
X-Received: by 2002:a05:6e02:1988:b0:3a7:bcbf:ba99 with SMTP id
 e9e14a558f8ab-3ce3a9b57eamr115735345ab.6.1736605877152; 
 Sat, 11 Jan 2025 06:31:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717821sm1534464173.81.2025.01.11.06.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 06:31:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 07:31:15 -0700
Message-Id: <20250111143115.2739414-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736605877; x=1737210677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4u6DWACRzhbDkfnPzaA6/B909tOuS5l4UpfgWCF5i38=;
 b=l1PS1Uv/yInVBQb3erQ6pXfzAZS5OD/rVcamz1SWDoWb6YK84I3Xk1Jr8Rfg59x6CY
 zxx5DUW4ydEyV2eSWPdLRYllZQWSX1rX/YDZIryDs65NzZVWVZh/qZTIeLAUdlH6+2Ee
 hRQbC2qmsWkABcItXJuNQbFFhufY+Fqoyra0wfME0fo43IRcadSnt066+ulR7AZFBR3K
 KYNn1YNfRKoadkBHLTohEmJl7nkDxae9yWoaA7gXK8iuFxublW0m/P+u9iNAcJHlGgBV
 i1ATDD1iE6yqYP5KwxCKPihdJSuHIdI1nxH7nEs/nCXpaKGuAdpnpBSeOwGtbKHFU1lL
 VUAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l1PS1Uv/
Subject: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: bump to version
 0.5.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ml-dtypes/python-ml-dtypes.hash | 4 ++--
 package/python-ml-dtypes/python-ml-dtypes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ml-dtypes/python-ml-dtypes.hash b/package/python-ml-dtypes/python-ml-dtypes.hash
index e11ae88abf..9f81056cd0 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.hash
+++ b/package/python-ml-dtypes/python-ml-dtypes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ml_dtypes/json
-md5  0d4d585a69dc36ce685c487c99fcc59a  ml_dtypes-0.5.0.tar.gz
-sha256  3e7d3a380fe73a63c884f06136f8baa7a5249cc8e9fdec677997dd78549f8128  ml_dtypes-0.5.0.tar.gz
+md5  410474c03a1754e6b5197a24040e3f3c  ml_dtypes-0.5.1.tar.gz
+sha256  ac5b58559bb84a95848ed6984eb8013249f90b6bab62aa5acbad876e256002c9  ml_dtypes-0.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-ml-dtypes/python-ml-dtypes.mk b/package/python-ml-dtypes/python-ml-dtypes.mk
index 060fe555c5..ab50069696 100644
--- a/package/python-ml-dtypes/python-ml-dtypes.mk
+++ b/package/python-ml-dtypes/python-ml-dtypes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ML_DTYPES_VERSION = 0.5.0
+PYTHON_ML_DTYPES_VERSION = 0.5.1
 PYTHON_ML_DTYPES_SOURCE = ml_dtypes-$(PYTHON_ML_DTYPES_VERSION).tar.gz
-PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/ab/79/717c5e22ad25d63ce3acdfe8ff8d64bdedec18914256c59b838218708b16
+PYTHON_ML_DTYPES_SITE = https://files.pythonhosted.org/packages/32/49/6e67c334872d2c114df3020e579f3718c333198f8312290e09ec0216703a
 PYTHON_ML_DTYPES_LICENSE = Apache-2.0
 PYTHON_ML_DTYPES_LICENSE_FILES = LICENSE
 PYTHON_ML_DTYPES_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
