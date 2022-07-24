Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916B9C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17F9E416A1;
	Sun, 24 Jul 2022 08:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17F9E416A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id by1wsIE-_8p7; Sun, 24 Jul 2022 08:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A68240253;
	Sun, 24 Jul 2022 08:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A68240253
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78F641BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52DC860F23
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DC860F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id herCZWQvedG7 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:38:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE2A60E90
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CE2A60E90
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:38:01 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id p132so10127531oif.9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MSz/5veT/VEr3UTFp20lX3D35xKldqCRzbKTfFSaUPg=;
 b=6aveobQM1TD90GrelYO8/psAMMhRN7g/BXxwK4ZzOx6qH2xzJjKFg8XukRMrBo6mlW
 huiKX/5F7l4K2fFJD0ncH6PjyNzIpiAEktZRd16gxEQp+DLpXXTDl6r2eidAOpq3bZSg
 g8qbUqycgEmdxN5tqhsbd+rNQmBfjI7Lbf43OyEm/NckUi6ZpErajo+CThLfjtdcBaID
 DTtZYsfYWLxm+2G8h7qw1oO5EWisAKK4m9YIHha3f4ynDqMcNH68Je8FpjYBOAQ534gv
 wMkH8+FVt0NJGdGxbTKp7koIiD7l70eFrxSYLJa4EOsCAQM/1xZ+yAlkXgHh2PEj3Lsw
 tT2w==
X-Gm-Message-State: AJIora9gO6QnaWJow/9VLO/DK5qggR8UEXpSYG1VAYRyFHFRxqv92sJh
 +9sHO/UNGj5wNScNoR66VNphEE9NK+tqBQ==
X-Google-Smtp-Source: AGRyM1vakP263wcE+1nlqN0e/4sYd6kgdnEH2DeZuok0F0w3EJgIefsOxSIuNM0yiosgTCXN14QVfQ==
X-Received: by 2002:a54:4e93:0:b0:339:d719:6d5e with SMTP id
 c19-20020a544e93000000b00339d7196d5emr10024735oiy.259.1658651880533; 
 Sun, 24 Jul 2022 01:38:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 64-20020a9d0f46000000b0061c7e5d270bsm3973632ott.48.2022.07.24.01.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 01:38:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:37:48 -0600
Message-Id: <20220724083748.1503238-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MSz/5veT/VEr3UTFp20lX3D35xKldqCRzbKTfFSaUPg=;
 b=TpFng7Scwso6LLcpUlQnqS5eaLmfj62ll+THOmG0+f9+Hgp6L3et3v7MAhll8XecBT
 uE0TguMJTQlOygvIpa/0Xm8btZsN3+S9LpoUchans1UorNx+5aqR+F/rJq+YeL2mJ5Tj
 kE8pFP6xUylZOEZe1i8aVKXWwRcVb3vdG7N87AFe1Lepf0Kc5MCKvnonpf/2GgM88uv0
 8xV4LCPcDr6KgVWpzg+APhVGkSVlLm4xJtNjizfpoowIEZAvPVaKfsEGPfn5g/F9oTmp
 2aDfxhwr7XGyLjW4yviRODFM9y9PRXGfdGCSmdRs07XGTAOTzaPpJ6Mfx0yEXcRiH/cF
 hXkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TpFng7Sc
Subject: [Buildroot] [PATCH 1/1] package/python-{maturin,
 cryptograpy}: fix PYO3_CROSS_LIB_DIR path
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

Host paths should not have /usr in them.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.mk | 2 +-
 package/python-maturin/python-maturin.mk           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 99eba3eeab..582a7f7891 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -27,7 +27,7 @@ PYTHON_CRYPTOGRAPHY_ENV = \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
 HOST_PYTHON_CRYPTOGRAPHY_ENV = \
 	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 3d5ba70391..9ac11f264b 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -16,7 +16,7 @@ HOST_PYTHON_MATURIN_DEPENDENCIES = \
 	host-rustc
 HOST_PYTHON_MATURIN_ENV = \
 	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
 # We need to vendor the Cargo crates at download time
 PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
 PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
