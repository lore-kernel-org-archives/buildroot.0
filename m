Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7166C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570A14048D;
	Thu,  3 Nov 2022 18:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570A14048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wPle9k1dTlGB; Thu,  3 Nov 2022 18:06:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28BF3404C8;
	Thu,  3 Nov 2022 18:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28BF3404C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A1541BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DE40818CD
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE40818CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_iAF7PvsQuL for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:06:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E977817F5
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E977817F5
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:06:11 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id n191so1993220iod.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JtkHArIKLjYpsivPgOf2pFx7iB//JkdNPVm5sDuCG4=;
 b=ALvi3Stxcvp16WcruwtrKxiDEJV3w+iT8fNoQ5Qf2X14+137Mc3g2t496SPV0hH+dp
 OoR9hcBeSJ7CM9nTrfuObfhDnHhpkupcRBoZ2P6q95UV1dVdtDUjJJyDXVFu5yXYEb3N
 X76iPBHlejIvAKONRq3Oh8tHR1kbUBv6aIADjUh8bDExSt+h+OG3nfVRNakiuzOr+/Pn
 NYvJgqafJyHVFRKx1wzd09wYXocycadbvMJp8SX7ja9Sr6wBOLUUwbIqUrmCKl8lNLrf
 WO5YHSzwViIx5He4/jcgjxaMi32EleRbJR6YLJNbdb188i4NBq2k3juDLBEpDsu3Lzh+
 5MUQ==
X-Gm-Message-State: ACrzQf0OZ4fzNmN3n6dA0lb2+jXaRqnJePSqSid8mKfLDwMXRjxCizxc
 ufAhvLIobyA1aL2Hz2GTPROZzDjjSe5FUtHo
X-Google-Smtp-Source: AMsMyM6ULAPdTMc1Izu08OUqI8i4f1kohRA99kEmYx0IRR4L5lNNYpOGw+wutf/7ywIEods0CZXacg==
X-Received: by 2002:a05:6602:1544:b0:6d3:d635:a697 with SMTP id
 h4-20020a056602154400b006d3d635a697mr8584749iow.141.1667498770670; 
 Thu, 03 Nov 2022 11:06:10 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 a7-20020a92ce47000000b002fd00a8f8fcsm526525ilr.47.2022.11.03.11.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:06:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:06:06 -0600
Message-Id: <20221103180606.175153-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103180606.175153-1-james.hilliard1@gmail.com>
References: <20221103180606.175153-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JtkHArIKLjYpsivPgOf2pFx7iB//JkdNPVm5sDuCG4=;
 b=G5yzAv4gx7oKpF95rtxPM90WfqBiLg34FWG1dH5S9uLJy0Cz6aii1pR6A+JLxGxCEC
 HYZXVbVI8Sp3XJ7V+Khjzo1BM+PF5/5zWhoZCbv+IktNu23UcnJ+8H/RAAoRE3LWL+9C
 OcWrRp5qOJpVHWnpQSYQ0JKDEfv/Ry2587ujc5Hud+H1yjHJSdCSELbbLNiyNNOesJ36
 pgFlm3Lx+Ue6h/FeygWyopX56y1lRxjtvoinxOpr9tHbfATaX3EmQGAmP+NmVO3g0jXi
 VyQdFjvzyx0Hpe2moDiCUz/9BGLPrUayvfady5b6k3r5fyt7e8JVjvZvn70wwcpi/fsd
 MlSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G5yzAv4g
Subject: [Buildroot] [PATCH 2/2] package/python-pymupdf: bump to version
 1.20.2
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License changed to AGPL-3.0+ only:
https://github.com/pymupdf/PyMuPDF/commit/dcbd9bb8c3fd2002b9e03a8c61b4b8bf90cfdb01

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymupdf/python-pymupdf.hash | 8 ++++----
 package/python-pymupdf/python-pymupdf.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-pymupdf/python-pymupdf.hash b/package/python-pymupdf/python-pymupdf.hash
index ee7a916519..21befb3b7c 100644
--- a/package/python-pymupdf/python-pymupdf.hash
+++ b/package/python-pymupdf/python-pymupdf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymupdf/json
-md5  70d6c2232e531772bbe9a813044262f9  PyMuPDF-1.18.14.tar.gz
-sha256  efe85cb80f79cc3f3890aa2ab82b962b8a999ca078e33e9bacc5d0be5c4656dc  PyMuPDF-1.18.14.tar.gz
-# Locally computed:
-sha256  282751b8c98ee9e445346eb57a992c9ecbe25ed8dd554df046777313e19b10f9  COPYING
+md5  450f0c613fec4b0d061299d3d935fafa  PyMuPDF-1.20.2.tar.gz
+sha256  02eedf01f57c6bafb5e8667cea0088a2d2522643c47100f1908bec3a68a84888  PyMuPDF-1.20.2.tar.gz
+# Locally computed sha256 checksums
+sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/python-pymupdf/python-pymupdf.mk b/package/python-pymupdf/python-pymupdf.mk
index ceeeb0a55b..238fc4dd47 100644
--- a/package/python-pymupdf/python-pymupdf.mk
+++ b/package/python-pymupdf/python-pymupdf.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-PYTHON_PYMUPDF_VERSION = 1.18.14
+PYTHON_PYMUPDF_VERSION = 1.20.2
 PYTHON_PYMUPDF_SOURCE = PyMuPDF-$(PYTHON_PYMUPDF_VERSION).tar.gz
-PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/41/f6/dbefe3d6949fa81fb7bcac9141e4345330d272724718ac5a6af78297498b
+PYTHON_PYMUPDF_SITE = https://files.pythonhosted.org/packages/4a/09/6afe87a8ea7acb6e4709223a704270ffe9929497add4d06b12305e229ba8
 PYTHON_PYMUPDF_SETUP_TYPE = setuptools
-PYTHON_PYMUPDF_LICENSE = GPL-3.0, AGPL-3.0+ (code generated from mupdf)
+PYTHON_PYMUPDF_LICENSE = AGPL-3.0+
 PYTHON_PYMUPDF_LICENSE_FILES = COPYING
 # No license file included in pip, but it's present on github
 PYTHON_PYMUPDF_DEPENDENCIES = freetype mupdf zlib
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
