Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA84AE6F070
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 17:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8092D42394;
	Fri,  1 Nov 2024 17:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xr7_si171_wH; Fri,  1 Nov 2024 17:03:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA374243C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA374243C;
	Fri,  1 Nov 2024 17:03:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F38A60
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3074B81F0C
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqBQS4tAbxi0 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 17:03:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D57080E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D57080E55
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D57080E55
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 17:03:11 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e604425aa0so1193104b6e.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 10:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730480590; x=1731085390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hwsgWK0hHNN0gsYp3IzWgAqfc0ujS4XitL/nQmpvkw4=;
 b=Vbl4cLGeWfSFnzq/zyYjSvE0ax4nlSwvI+vxx0U0HtzIMSCnh+mnc5lTcvs0ZbUnLE
 71c9PKFbH7Fbe8i4dHRt/IjAb5NHyI2981XQPSRuEjHCA0xU1DaIEZ8Z8eagzEOkVCjp
 V/ALAFmkp2uaReepIy0Ua6PBfHo2WswyzwkUXhEoEtQQ0LfQX+LurjFo0G/AdVFKIR7L
 XibWebYDTgd4ulU5kG6O+YGXMAqSSMXTeAk1VoOj1LBNluC9CTVuwHcygg2W9IEK7JOM
 WQ2GYovHwa66++l9JNt3vlqwnaay7LI0k99b8ylb50RqXyqdVIjP0KkMfiXIfgn+OQvl
 FPDg==
X-Gm-Message-State: AOJu0YzU57gOD5T6FJrX+O7V5eZ5SO19V8Un476hOVBFJoYjuQ66ZR7O
 OH6UcL8ff28FgrrTMqVKkXEj2whUJDl3SHB81L+lPFWuXimUyMbMeVk2FA==
X-Google-Smtp-Source: AGHT+IEL1bk0H2rgjlnvFxEjb1p72sz6egoL+4XCCufxI/ntMQI9ukARQrkn7R8BM6dd/mBB5NsJ9A==
X-Received: by 2002:a05:6808:3094:b0:3e6:35da:8f2b with SMTP id
 5614622812f47-3e638453e7bmr24086217b6e.4.1730480589778; 
 Fri, 01 Nov 2024 10:03:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de048881b6sm816854173.4.2024.11.01.10.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 10:03:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 11:03:07 -0600
Message-Id: <20241101170307.389500-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730480590; x=1731085390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hwsgWK0hHNN0gsYp3IzWgAqfc0ujS4XitL/nQmpvkw4=;
 b=EUivzFDJ8LdjzbePEMv9qO100DGw5BFKmOIAMKkfpzmik4LriXQdouAmwl9RU7HWlW
 q/B2nfXE8EuTq6vegI6F6zLYR7OgUvFIOwLCF2a53DKarM3cu5c0957qL9G5t92TeUgU
 zkyzb/zX7tGZJpzO30tDZoGbrkS/oBrbuVt+p8arKqRFl14xJAxvLOXtc/ONUklddM8E
 w6H6cgYGgr1x+pqPluIiKKBhmUZXopwvEdVBksTzhu7EKo80O8/PCpI0NWxPoePre0cN
 Ux7KpHJDB+9fELYsuQuVW6B25k7a/zFXkAztguAMWIn1P60cIIdXMRhura1JvSTl38ke
 9etw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EUivzFDJ
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio: bump to version
 1.67.1
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index e47f73f694..5784e4758c 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  7f03599b67e1959d616b16a29f79a30d  grpcio-1.67.0.tar.gz
-sha256  e090b2553e0da1c875449c8e75073dd4415dd71c9bde6a406240fdf4c0ee467c  grpcio-1.67.0.tar.gz
+md5  f1e17b3bf215880d87fb8d853bd5dc4c  grpcio-1.67.1.tar.gz
+sha256  3dc2ed4cabea4dc14d5e708c2b426205956077cc5de419b4d4079315017e9732  grpcio-1.67.1.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 6aad3445b5..ed854b5098 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.67.0
+PYTHON_GRPCIO_VERSION = 1.67.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/ec/ae/3c47d71ab4abd4bd60a7e2806071fe0a4b6937b9eabe522291787087ea1f
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/20/53/d9282a66a5db45981499190b77790570617a604a38f3d103d0400974aeb5
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
