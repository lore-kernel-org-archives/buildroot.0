Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D4BC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 05:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA146143E;
	Thu, 11 Jan 2024 05:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA146143E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-Wd0ZIrMjUj; Thu, 11 Jan 2024 05:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CED61418;
	Thu, 11 Jan 2024 05:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00CED61418
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 648A81BF23C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AD92423EF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 05:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD92423EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juBkGN6So2vg for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 05:22:28 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 506F64226B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 05:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 506F64226B
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-36074b286d8so26033445ab.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:22:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704950547; x=1705555347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lic+NIxKHr16PWExw6f3M9DCLrkVGUgL2YDZzRYVtT8=;
 b=oGqFHQCTAZFldeK9VWnKM5YAtBWKT74ELZPCpL1C8mrz+Zk1tQnUFuxHbkop0BAs2/
 hCcR9oR632akNM23JBOL2RPRoBC5gMEOUm4929OiXziw9GjZMmPuyPvyDKkVX5zGyozq
 RXGvJrDRlNCpkxnhHEFfF8NptYoHyozrCuBBfcQqJxvo2AC6bsL1tStNqXROMBSCHen9
 Ume+T2jkupvKg6FDom/nDTGbbyEWXS7K/s3NyqeLw2Atn6x6e7OeNC9OhHMCtlkPnaGL
 2IEdFoMIlKS1/uB2ldq/FYaipaWh19JNOQWSYCu9BEoAzpCcyP3SipHo5DidD5/+LFhM
 u+Rg==
X-Gm-Message-State: AOJu0YysHDch7oPWvQbLv32JGl9ewXIRJlcXQWzC6UrBZTjm4E1E4tFq
 hL5l/pVQaQQvBB0fPpPHfg/tmFVxoxzEIg==
X-Google-Smtp-Source: AGHT+IEHyOvdfkCN6O+EqV9fKgH1jsnHVWcCnAAQHAOsHQ/BLgOc5bQUa2Lnepx5GAoUKRZ1sMRj/g==
X-Received: by 2002:a05:6e02:1562:b0:35f:f59f:96c5 with SMTP id
 k2-20020a056e02156200b0035ff59f96c5mr816746ilu.36.1704950547089; 
 Wed, 10 Jan 2024 21:22:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056e021a2e00b0035d6f8d02d7sm73373ile.7.2024.01.10.21.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 21:22:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:22:25 -0700
Message-Id: <20240111052225.2922249-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704950547; x=1705555347; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lic+NIxKHr16PWExw6f3M9DCLrkVGUgL2YDZzRYVtT8=;
 b=TrGw5oDb/mJNXoucoGXnPrzwA6nidUD1JMG98xH/mKKhts4oQsz2K0zGbIDSXGuJKg
 BNW6ZmAb5OBaKrZ2YyIUGPcrLd2VS34SEBKiubwzqdb9P/FEwmtoOeMj1g0s58NPDlEQ
 aW7fHavKHs0qfQeFZ+jvTM7CZinXxF6omA4raANvLG/8q7Re8aM6MlT8bEhF9x/k353n
 /sCmOVD5evBUUsdgoeIqIA6Re3XmrhIG5mVVQzbzMGd3t/2pzqS7LHfyH8PgqDLDMcR3
 t8DKbpRo1z6f98nlIkINKgV8Y5o36r5T7JEOxxqApGvbgZ3IOG4QJ4ddNT5QXyN0MRTZ
 Hcvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TrGw5oDb
Subject: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version 0.10.0
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

Migrate from setuptools-rust to maturin infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-rtoml/python-rtoml.hash | 2 +-
 package/python-rtoml/python-rtoml.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
index 04d22ed1a4..59f17d9d62 100644
--- a/package/python-rtoml/python-rtoml.hash
+++ b/package/python-rtoml/python-rtoml.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  821a430ab6587bdaaf7cb95044e8e0d99c77c6aed0adce5a370045b270f7ee20  rtoml-0.8.0.tar.gz
+sha256  987d3d9e9d56761b17c3e4e172937cbcc793bf24b0ebb2730647a9a2cf86c789  rtoml-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
index 819dcf3288..16f9dea573 100644
--- a/package/python-rtoml/python-rtoml.mk
+++ b/package/python-rtoml/python-rtoml.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_RTOML_VERSION = 0.8.0
+PYTHON_RTOML_VERSION = 0.10.0
 PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
-PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
-PYTHON_RTOML_SETUP_TYPE = setuptools-rust
+PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
+PYTHON_RTOML_SETUP_TYPE = maturin
 PYTHON_RTOML_LICENSE = MIT
 PYTHON_RTOML_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
