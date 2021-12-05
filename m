Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DF7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7FB16077A;
	Sun,  5 Dec 2021 00:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wp95zq9ZQDSj; Sun,  5 Dec 2021 00:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033E760A93;
	Sun,  5 Dec 2021 00:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26F891BF95D
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2449182D0F
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9qvYKDGavTB for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:12:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38D5C82CFD
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:12:04 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id x6so8440093iol.13
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=epw+aKjYX5SPVZHTzj7JHcdVHVkuFf5bP9wUzPntS0M=;
 b=CmufnPY4GUjocfjyGmg57k7kkuNyEq6oouR2RZyNBmMYgin1uw1GgVvN7co6fGhWvH
 Qr7b1M2pObi9ocJVAbaCWx3a38HaUcia3PFR7JLoNOvL7yoaNvHEUpif/Tni6xhc0prY
 tlEsWFfrtFAC3HEptEGUDvxPHARMJJDiTb0undQ0dkqPdzceQXmGjCFCHh/4Vdf1sEMs
 OGRhTDs9q4nz8qmoCU4k6s1BFrmXm2VHd+anGDC9LMZNnpAMqaeDjtTIkr5/dKsjzhle
 5hURqGlxOt0AHFLG/FeK7QY6nFc8FpB9s7kzjn9rHiaP9HxHxTjTiSu1efg/X7Sa+nzA
 NfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epw+aKjYX5SPVZHTzj7JHcdVHVkuFf5bP9wUzPntS0M=;
 b=rGn3QqmubyaPrv8dZtJElVfZa6xtkG2GGOYHpU0OCcCtrLf5a3Tln+pOpCXwg5UeS/
 JGGCoFUZmpmkRBlZ1IrRqbs4Xjkye2QtOMMn+DwAglDCQFAUrTVFX9QlFjQAfhnAQy1k
 wrpZM8FpjZLLVEXhjaNwG04yD7nUF7FTIalggFobVsAir40ZWikZA9RpP4JQEj2R/XgJ
 Zi7yeFiLxjTQU0gK0hv6TZWwOx2lQkb+F19UUnzhCC3oO9/LhwR7qxYViQ+SPXhcDQch
 389Spd78U+DfniUD7yDoWDxL6zH5SJFPEkM9lMa3KGsUAEjIHb5Z1pYPgPTLln6jPVJn
 wYVQ==
X-Gm-Message-State: AOAM532sd3yDYCr+7ImRhcFJdu5atnkCq6iwlDdpIvQrGjINIs3DU0k+
 XZ2h9FMLUvV7dutmkf+KBDJ5/LR3Hf0=
X-Google-Smtp-Source: ABdhPJzOl7a1rzyCM1aq7xsJBdOeO2wvbek3GXp2jZqdCeaUdjO0Z3D8fEJ/upQCt8pOqFFcus9Bqw==
X-Received: by 2002:a05:6638:d0e:: with SMTP id
 q14mr32286241jaj.12.1638663123255; 
 Sat, 04 Dec 2021 16:12:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id b8sm4333309ilj.0.2021.12.04.16.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:12:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:11:56 -0700
Message-Id: <20211205001156.2402104-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205001156.2402104-1-james.hilliard1@gmail.com>
References: <20211205001156.2402104-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/python-tinycss2: bump to version
 1.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version now requires flit package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - rebased on next
  - bump version instead of add package
---
 package/python-tinycss2/Config.in            | 2 ++
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
index e6c992b8c5..e7a5bb3659 100644
--- a/package/python-tinycss2/Config.in
+++ b/package/python-tinycss2/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_PYTHON_TINYCSS2
 	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
 	help
 	  A tiny CSS parser.
+
+	  https://www.courtbouillon.org/tinycss2
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index eeb3754752..e8e1d93f83 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  7caf513c4e87fc2449dcfbf407a8416f  tinycss2-1.1.0.tar.gz
-sha256  fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a  tinycss2-1.1.0.tar.gz
+md5  60272f58f8d5834b2e09ffbc9bd5de53  tinycss2-1.1.1.tar.gz
+sha256  b2e44dd8883c360c35dd0d1b5aad0b610e5156c2cb3b33434634e539ead9d8bf  tinycss2-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index 4bf5b97766..e4fc5dc9c5 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.1.0
+PYTHON_TINYCSS2_VERSION = 1.1.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8
-PYTHON_TINYCSS2_SETUP_TYPE = distutils
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/1e/5a/576828164b5486f319c4323915b915a8af3fa4a654bbb6f8fc8e87b5cb17
+PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
