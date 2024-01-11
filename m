Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E80C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4619D40133;
	Thu, 11 Jan 2024 07:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4619D40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGJMUlxYcqQW; Thu, 11 Jan 2024 07:02:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C01F40538;
	Thu, 11 Jan 2024 07:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C01F40538
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9121BF359
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62DA283E12
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62DA283E12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4wVNIx5H2cq for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:02:40 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B7D083DCF
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B7D083DCF
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bc3e297bc9so226733439f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704956559; x=1705561359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5W3UVisoBiBEVxdo8SouWPv5B6YDuXDNlXysGiwUofM=;
 b=Mw25LDiqabM5yv8HSEDijPvBEHnNbHNffJkp1xpOxDjxS4cusoXpfH1h9JswKwy8Xa
 sQSLuEcLBXesWfIBBKA27sKnlscq+EmvZ9lXoZQpUAC0RGKIyW5zddIne6+a4gH/Ykun
 yfB14RYcBpscbAgL8OTJgHAi9mZ/S9pWtDUfCvULJEMYjhTsK3pkG/Huiyo0jO5YnL9b
 tNQwtmuqLYqezyskW39t679T6kotTIOrARVjOtkyHSW66kF5vqKlFOXQEY7w3xcUEa+Y
 ioUSsdlXb0GiCkLjpgXZdBPiydTwpyBf7zkF6Kdzx4k40EXQcfU5PsDPkmCEYANB8F0P
 Y5eQ==
X-Gm-Message-State: AOJu0Yz8hSKUKy/0GTLE04Tsd9xQ2rtXrNLYS+M3i4AMPN3gMMD4U4X5
 6nnZaLv7WFkVHG19oHJ+N0BDcgeS6vpP9Q==
X-Google-Smtp-Source: AGHT+IGoq868pw5XFV9Yw+V8zyYfwrxSYTvUUYPTO+VZT+cc0HTSNStWWD/CUu1ErJcCWfwj8lu9zA==
X-Received: by 2002:a5e:c602:0:b0:7bc:3c94:d888 with SMTP id
 f2-20020a5ec602000000b007bc3c94d888mr870884iok.0.1704956559174; 
 Wed, 10 Jan 2024 23:02:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 g21-20020a02cd15000000b0046df3b352casm150271jaq.38.2024.01.10.23.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:02:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:02:15 -0700
Message-Id: <20240111070215.3064748-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704956559; x=1705561359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5W3UVisoBiBEVxdo8SouWPv5B6YDuXDNlXysGiwUofM=;
 b=O6wEu+zaWEMkNNRF1h8mJDfM+2aBqBa0y0mC3ne2T3xwwJGoaaC/C/wqRgucFbNwOY
 bXfIIHhzw6SECQxCg4rcPovKzTCNeyPIR9sq4S3ED2x56RN/pohiL84tsvMUuBBXubrQ
 2N+GWr6O1uLX3WfKA5XRedHtrN2wKz6qMdMEZpExkHQaYLmwSdGeV4ONKaM/VQDv056L
 7k1R/vVMP3uxAheNVmqVoHXGkmd4Wj03h+8VH+LxU2ZvByCwfKSo04rx21CD9I8BOqOd
 rpwMTyeGvn+gC9+yH9kCgWszXcFTZDOtHQwP8FX6apoQDjWHNVz5YYOOPaaF16HARYrC
 jfZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O6wEu+za
Subject: [Buildroot] [PATCH 1/1] package/python-smbprotocol: bump to version
 1.12.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-smbprotocol/python-smbprotocol.hash | 7 +++----
 package/python-smbprotocol/python-smbprotocol.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-smbprotocol/python-smbprotocol.hash b/package/python-smbprotocol/python-smbprotocol.hash
index a46f9f635b..b9d5f74999 100644
--- a/package/python-smbprotocol/python-smbprotocol.hash
+++ b/package/python-smbprotocol/python-smbprotocol.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbprotocol/json
-md5  a7474ab4cf8912dffaab56ad5067f429  smbprotocol-1.10.1.tar.gz
-sha256  b5bc9d4930ec947d42c21089a4d373b97e3f6488fd15d32d27189312fd8a04c9  smbprotocol-1.10.1.tar.gz
-
-# Locally computed
+md5  ccbb42bdd58a0070f56e966d8562451b  smbprotocol-1.12.0.tar.gz
+sha256  5916a4b6c948bb70f82c246bdbfc86cf152226b71dac9f33b3d731d91e86274f  smbprotocol-1.12.0.tar.gz
+# Locally computed sha256 checksums
 sha256  4c3c550abc2b04c507ed0d641dd7e524eaff5bd06c7862af957301836d496d15  LICENSE
diff --git a/package/python-smbprotocol/python-smbprotocol.mk b/package/python-smbprotocol/python-smbprotocol.mk
index 17c2b17dbc..ece0744252 100644
--- a/package/python-smbprotocol/python-smbprotocol.mk
+++ b/package/python-smbprotocol/python-smbprotocol.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBPROTOCOL_VERSION = 1.10.1
+PYTHON_SMBPROTOCOL_VERSION = 1.12.0
 PYTHON_SMBPROTOCOL_SOURCE = smbprotocol-$(PYTHON_SMBPROTOCOL_VERSION).tar.gz
-PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/13/1a/73ad1883beebe4f6f47879cb9880690944faa00681141920c7a2219f6152
+PYTHON_SMBPROTOCOL_SITE = https://files.pythonhosted.org/packages/57/72/d95216a9fd5da1b2fa225130741f50d4949c8f76d46669d30921c06d69ff
 PYTHON_SMBPROTOCOL_SETUP_TYPE = setuptools
 PYTHON_SMBPROTOCOL_LICENSE = MIT
 PYTHON_SMBPROTOCOL_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
