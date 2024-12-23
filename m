Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C0EE7718D
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FAFF812F7;
	Mon, 23 Dec 2024 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID9vkwDoh3q7; Mon, 23 Dec 2024 16:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D4A81302
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D4A81302;
	Mon, 23 Dec 2024 16:46:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98DBED8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 796F88130E
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1cK6hUzJLBN for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68C8F81302
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68C8F81302
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68C8F81302
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:46:48 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a8c7b02d68so35750225ab.3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734972407; x=1735577207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrPgYXwi79ubXIu7+wjcJaIQA13f3rbdr9LMVEQiY6E=;
 b=tivkZVtEheDkRJRRsc7OU5McTXRUkgqYw33nQyq6rtHdnzKwxQ85KD8cqPH0KoeS0I
 IVQdbIdyo1/Ir/Q4nPB3hNGxQ4B9HZdXYorLG20vAK73ogxYPR0n7/O+cuAcrZdzKlSm
 fJfudAdhjHeg4XXK2Flbh9TACNLqwHBiMlCwnYk1ThjI+TEu+3XI34+J7gMZZAKwhvS0
 PwPcOz1oqQBgx6dxL6BI1WJUxdHAL4TbqBRC4a7SwDDqZZRbD8fhZzA2OpoAzUWbGHje
 ARDCTQvw3fpnEUlVK+ivSRnjwbC0LIy9cB7rHVdSXtk3Dw/VtoSgnV3bt9Y6IQkOV6d7
 QYVA==
X-Gm-Message-State: AOJu0YxtS2NnyLLzwUg9ojjJIThG1PX5ZJzKDRT1BnUxOlMwR9lqdQsX
 kfeyprccsU5tuG3BcOTYJCioCq4Bpjg5EPYyWoVuXnM2TB0S8x8kgI9FTZeqnfc=
X-Gm-Gg: ASbGncvOGTPt7wV5plFFXoRECwoDMuE0e065Rq7ds2ugxYU8XEbh5s1EaHOG+vMsI5i
 HVXgZ8zIC3g5XdrhRJ3LH4y+Lo526enTbkWP19qcXpN7upMafs/uVOnuu5q0yXnnK9OcRuthTc0
 NFZY+d9c5mnNE6qDXO1ZYaOPiS+EozmnlgMnqbkLT1e7XbgVQiSIoMTCCqiizGsq0DIDXT3JS0z
 yYmDMrgfKdDU0WdL0SrNEQjs/23Ak+t8AgHmUXHZtyx9ZhbBnty7PF/NkFs8rnEPYfnwZerxZE9
 o+P96mfRiN1lOK5o7U93UM7D7Md2Ez/ipA==
X-Google-Smtp-Source: AGHT+IEFAxvkqFEPZSQ2giok3Tgh4YQQ3XRzLMe/xQ7ysNFN8hF0+OXJcTZKzisoe2gIcN/fkGdXOg==
X-Received: by 2002:a05:6e02:1b0e:b0:3a7:c60b:ad90 with SMTP id
 e9e14a558f8ab-3c2d1e7df4cmr150851535ab.3.1734972407227; 
 Mon, 23 Dec 2024 08:46:47 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0de05312bsm25060695ab.16.2024.12.23.08.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:46:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:46:45 -0700
Message-Id: <20241223164645.1877142-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734972407; x=1735577207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrPgYXwi79ubXIu7+wjcJaIQA13f3rbdr9LMVEQiY6E=;
 b=Pnv7etbO5WZaAR3gWjrUMBPh1jUBWvI0atBYeg5ehnaVQ7+Ol/mPUJrzb63Or7Pe3D
 +0XShogYBFMyRu8ts3n59sXD89BXhN0Rw9VzFXM+Hv3o0Xl6JAKLUxhO/uf9IJDM/kwe
 79NCS252+03hubHnIzyu2K3An2lufdm+2YZ5pP20gvHQrvO4LRioZAZ1QyfBFGbNglf4
 JzG0+GNPkdIqnqJn1RSs08MiGSURnSxYSrUAEgd/vyq+9ibosVS8ycdFHaweag7nIHMs
 TYScEqLqf17Os+VKYFZ97u0AiK0KEYWnITZoucyrmS1DHdsmQIf89DxENkBO9cf7O5fv
 NyVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pnv7etbO
Subject: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.24.0
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
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 397ce7cb40..43bf50a5f2 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  b69067b81abd55aa7eecc22858ea326c  google_api_core-2.22.0.tar.gz
-sha256  26f8d76b96477db42b55fd02a33aae4a42ec8b86b98b94969b7333a2c828bf35  google_api_core-2.22.0.tar.gz
+md5  5e5fbe5e5e6b14b9243b74055b8a50b4  google_api_core-2.24.0.tar.gz
+sha256  e255640547a597a4da010876d333208ddac417d60add22b6851a0c66a831fcaf  google_api_core-2.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index b48d934e73..d79d0eb749 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.22.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.24.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/00/c2/425f97c2087affbd452a05d3faa08d97de333f2ca554733e1becab55ee4e
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/81/56/d70d66ed1b5ab5f6c27bf80ec889585ad8f865ff32acbafd3b2ef0bfb5d0
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
