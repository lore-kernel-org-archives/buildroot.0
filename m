Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741A4C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0D07409E9;
	Mon, 22 Aug 2022 07:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D07409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iozqfFw7KAnH; Mon, 22 Aug 2022 07:54:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E7C2409A2;
	Mon, 22 Aug 2022 07:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E7C2409A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E675D1BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1ED281826
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1ED281826
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAoPDaUb_SHt for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:54:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E43AC81678
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E43AC81678
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:54:25 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11d08d7ece2so5235737fac.0
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=GXzOhn4w71GXDobJdPlrbBdDa6LtHk4IQVVPbCvSzUI=;
 b=6sYp715a2cYeccU8MjYOgF/TCcgA2kiUyr/Tps7NOC+ZkVRxawkRQZqGcbiXeU3VDd
 no5a1wdpjj0vDbkz1m7MApncYMOBRpE1SlzUZlEwA+fZuejTHJVZ7TKal8QtBHT6/+qV
 KNY65UAG1uoe3VXzAVRoUGR9pg9rghKm1aJ4alNzDIcM2nhaLZ2kVU8hfr1bdjEfCLAc
 9v7WYGQEyTVSAK80eQDoAmGFx/z2ts3r5yaDDJshNDb8muE5rJYO85mOS+m3fzW65I/V
 sNwJtxSduoGaaX8zzq6lPG2TF9FfNv5z6wcDt8QH5moDBK/7pVGOUXuaBhP47XZlipMU
 8pzw==
X-Gm-Message-State: ACgBeo30TfHo5r3xurw9QZ+JAWzY4eoPGjPN8tXdXQvPlw7twHSoRu9D
 2P9u3OcMZ3lOFZFE8ZzcgzGWmtKKe/I=
X-Google-Smtp-Source: AA6agR4DeZk8YH2O3QDHIYJ6aQTJPpx7bBX+1mlewWxV1cpHJDujSJozu18ESQ3+ioDdXwEST725FQ==
X-Received: by 2002:a05:6870:5704:b0:11c:8487:6e8f with SMTP id
 k4-20020a056870570400b0011c84876e8fmr9491110oap.207.1661154864374; 
 Mon, 22 Aug 2022 00:54:24 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 i7-20020acaea07000000b00342fc99c5cbsm2516047oih.54.2022.08.22.00.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 00:54:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 01:54:17 -0600
Message-Id: <20220822075418.903230-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=GXzOhn4w71GXDobJdPlrbBdDa6LtHk4IQVVPbCvSzUI=;
 b=ULuDG20JBcUQYR7VUzyVF5gExT9MU3fxpi5ZfZDInOVq64RxfnCqvoMIs71PgpUf6I
 C4dE8R2Wpn1vIxItRPtlCp0BQYjDc7XhemWvnXKjzVy5jqF8D+ffSknUB/ga7t7TT/uq
 mZK/pDRVCrAwEs1YoN5jgM8lZZwcyhuKhiDbEb45CAfvBOHR8oiub6aSCHIuf0PGy+Ee
 zX6HlM4nTMEnl7Qmp/Gekzg6kLqm1XmpzG10pzHvMDLicba4c9brtAqBCL6UmED2v6es
 gCFbe28A0/7jPY0O/kSe5jUsWgL8LBYIBOtJL+PonNvo0qZmfICiDz7/L3k/CzWrdSZ/
 Ky2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ULuDG20J
Subject: [Buildroot] [PATCH v3 1/2] package/pkg-python: use pyinstaller.py
 for host python packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python installer cli isn't able to overwrite files of packages
that already exist, this causes problems when doing a rebuild or
update without a full clean.

Since we need to add functionality to our pyinstaller.py script to fix
this issue we must also use pyinstaller.py for host python packages.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
Changes v2 -> v3:
  - set interpreter to $(HOST_DIR)/bin/python
---
 package/pkg-python.mk          | 12 ++++++++++--
 support/scripts/pyinstaller.py |  0
 2 files changed, 10 insertions(+), 2 deletions(-)
 mode change 100755 => 100644 support/scripts/pyinstaller.py

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 5794e3a195..c15a168f60 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
 HOST_PKG_PYTHON_PEP517_ENV = \
 	$(HOST_PKG_PYTHON_ENV)
 
+HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
+	--interpreter=$(HOST_DIR)/bin/python \
+	--script-kind=posix \
+	--purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+	--headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
+	--scripts=$(HOST_DIR)/bin \
+	--data=$(HOST_DIR)
+
 HOST_PKG_PYTHON_PEP517_BOOTSTRAP_INSTALL_OPTS = \
 	--installdir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
@@ -200,7 +208,7 @@ $(2)_BASE_INSTALL_STAGING_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/*
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m build -n -w
-$(2)_BASE_INSTALL_CMD = -m installer dist/*
+$(2)_BASE_INSTALL_CMD = $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else ifeq ($$($(2)_SETUP_TYPE),flit-bootstrap)
 ifeq ($(4),target)
@@ -208,7 +216,7 @@ $$(error flit-bootstrap setup type only supported for host packages)
 else
 $(2)_BASE_ENV = $$(HOST_PKG_PYTHON_PEP517_ENV)
 $(2)_BASE_BUILD_CMD = -m flit_core.wheel
-$(2)_BASE_INSTALL_CMD ?= -m installer dist/*
+$(2)_BASE_INSTALL_CMD ?= $(TOPDIR)/support/scripts/pyinstaller.py dist/* $$(HOST_PKG_PYTHON_PEP517_INSTALL_OPTS)
 endif
 else
 $$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'distutils', 'setuptools', 'pep517' or 'flit'.")
diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
old mode 100755
new mode 100644
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
