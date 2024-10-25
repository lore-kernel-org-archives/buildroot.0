Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA058D149D6
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63DF2410B1;
	Fri, 25 Oct 2024 17:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwiOllGoOOHV; Fri, 25 Oct 2024 17:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 052F3410AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 052F3410AF;
	Fri, 25 Oct 2024 17:18:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F5642316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FDEA410AE
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYGA8KlhDCae for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 107BA410A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 107BA410A9
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 107BA410A9
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:18:43 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83ab21c26e5so91429039f.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876723; x=1730481523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uR1DK/TRZw33sbBv+p03eKBXyGjJQmPTcEdv+tN1H5U=;
 b=vbbjvIQtrzaSfZC5XdTfDauZUbt9ukvvPZeEgA7abdhWDUwN0rE2ZVp7IkGc0VgZra
 q2VwRRZVcW9F0HTcFKLrXyp5T+wZoas4CNkT8zNrZPvpmWVUJokvYB0tp07gg2RWszkF
 9cYExAUeKS15k/qUa50lEm6E/fH5rDVVCob1OFzlLWU95/PPzdA9uTme+a/CNKQG4OVo
 4XdHp6CX9hrwBQgYDHOVABt1xvKOgyBogkZ/R9WHgyw+Fh0LxZcgWuJ/oRc1GDb0mwMI
 L68ND2elQfFDRsBagGdAn7hVS+kMQ2JkCPdz0LEs6R5LUnnGuRSt3kmwa0k3pESUWSFQ
 ov6Q==
X-Gm-Message-State: AOJu0YxMg2braxnd6JEpYY8TAHOjIr1FFOBgY16cK2zXwCUqQcooEzGJ
 kXCN/OS4l50j4aFgSQtpNWMN6ntPUMDNVeUXhnQfhxzbgRXZk+Rqqc25Ig==
X-Google-Smtp-Source: AGHT+IG8uenOobG22M+MSsP2ZJ8dty16DDD0Vqu3q0DF1gEcE2NfEMw4126gPeX4vxUYtJ6qPERRfw==
X-Received: by 2002:a05:6602:27d0:b0:83a:cc2b:c9ce with SMTP id
 ca18e2360f4ac-83b1c3dc1f0mr18600439f.5.1729876722791; 
 Fri, 25 Oct 2024 10:18:42 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137de1bfsm30566939f.13.2024.10.25.10.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:18:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:18:37 -0600
Message-Id: <20241025171837.3572512-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729876723; x=1730481523; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uR1DK/TRZw33sbBv+p03eKBXyGjJQmPTcEdv+tN1H5U=;
 b=d/udfCTXExIEosUGTz/MCY21hzXKq+U/m/RssR0ASoKlFG84ayCCl+yLqFv7IfGMuv
 ww+5ywKo87f0qHrUV2k2BP+wA0RiISAqk2y6+8k+BDsmaGOVoDu1kA8G3QStizjxtiQD
 LrQBCFgpaSq7bmMJIXmH6naFQauMUWiwEQghtP9/3w3BLts012oOzZrpSMWBYkdujp/E
 Ld4cjgNXgnj/Jg5Aiok9+Iod2y7zIIQens1E25ouJza9dvxUREusngh9OV91cPmL/UY+
 +UpQ0G86O4Q4GV6jjA9us5TSVvXWKsAweDg5cTrO4Noy6h65TfRaQrvWKkdZoLIUeMVj
 txhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d/udfCTX
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 43.0.3
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

Add new host-python-setuptools build dependency.

Set --skip-dependency-check build option to bypass overly strict
setuptools version requirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-cryptography/python-cryptography.hash |  2 +-
 .../python-cryptography/python-cryptography.mk   | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index bde94ab7ce..61d9ca598e 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  c57ae743b2adfb29a3fc005b6f39bf1378e20d10529a859b6e2e425845bff8f3  python-cryptography-43.0.1-cargo2.tar.gz
+sha256  72c5686ee70cf37075e2fdea332066e4e2351fab8beaa4a22268983f092bca4e  python-cryptography-43.0.3-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 1f3b4564d3..7feb4076cd 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 43.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 43.0.3
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/de/ba/0664727028b37e249e73879348cc46d45c5c1a2a2e81e8166462953c5755
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/0d/05/07b55d1fa21ac18c3a8c79f764e2514e6f6a9698f1be44994f5adf0d29db
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
@@ -14,8 +14,16 @@ PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi host-openssl
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python-cffi \
+	host-python-setuptools \
+	openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python-cffi \
+	host-python-setuptools \
+	host-openssl
+PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
+HOST_PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
