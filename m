Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9F9C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 12:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A96981B36;
	Mon,  6 Feb 2023 12:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A96981B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t5210XYT8ez; Mon,  6 Feb 2023 12:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBDBC81442;
	Mon,  6 Feb 2023 12:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBDBC81442
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 135E71BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 12:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0EE9410E0
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 12:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0EE9410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeoBVD136lrZ for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 12:04:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93A6409A5
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A93A6409A5
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 12:04:07 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id k12so4576664ilv.10
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 04:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sCwM/ljQTAxMd80XMJi8HCvLKE4slIqhVz/emowmomw=;
 b=PKqg2GRO7pgdlmEJmU8es+bTd6NBdXLw0rj8Af3Hzwkzc5Ea/UdOZe7G+dgDcfTE7u
 Ms/4ZIQif3hsoXN7ni69CagLABB4Fw+akB1blWO/sMRmr9+WsNZnSRkEdCm+ZI4YHi7P
 oQzeKEGOXB5pX81vDgEDbiF5xz8PFsJJMck+HtC6IgMUiwEXO3Va1WB2Gf/oK/HljI/i
 Lg0kOE8chfs+tGlo9+TZiH+KoyRA5qYmBw97VdE0x5cYMK3e5FsifqUT7CI2V5ZxRYBV
 1K7OMWpAraYpcCF3Pe+h3tuiaIdj8p+ExSRURK+JJNOc4Rus6935li/mVNrDGiOFH/yi
 Ku0A==
X-Gm-Message-State: AO0yUKUscz/XzrOoQZahhOeVMRGsbOQUkqwmJAqrs5cZCpG1+pEtucJw
 1qp14V/p5ytFBwgh6uUwxROicYgKt2eOjQ==
X-Google-Smtp-Source: AK7set/GOSkNdrEJqRNpZkretTvuKuptG2Qxvagd2bP+hLsuO2q8mj57zqC/ntvZ9z4kjQGukF6uUQ==
X-Received: by 2002:a05:6e02:dc3:b0:313:b9d5:7d4a with SMTP id
 l3-20020a056e020dc300b00313b9d57d4amr3978632ilj.26.1675685046416; 
 Mon, 06 Feb 2023 04:04:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 z12-20020a02938c000000b0039ea34dffcdsm3467587jah.129.2023.02.06.04.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:04:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 05:04:00 -0700
Message-Id: <20230206120400.3188421-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206120400.3188421-1-james.hilliard1@gmail.com>
References: <20230206120400.3188421-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCwM/ljQTAxMd80XMJi8HCvLKE4slIqhVz/emowmomw=;
 b=SjKKIx4SQw+bS+0uXH78HipKsh4W/SkwS2ijoNUpBsvHxnV8f82x9+1XYhYbBMd/0j
 +Qp3Jaw1Mykqrn0PyP9QQHo0YgKdQowCI7xiXoKwAUgTr5l7vthrXz8GkDFhhEfIon0F
 RR3qrP8UA/z6taoXbOMx4p/UXM+ylZKLzDFwLCjCRPFKJH1M2rgbeO4/tvi58UjjPEZ/
 iAFxHqc2w1Yu6IKYQBt+YSkflPt01kcRWTGU8laATfE6Vt+/g8vcxXd9REUl2NfYkoPR
 QwWuLDjc4yDAvfQIiqyk1MmDVeItcdVp1Ci1+NBHXqWxsK/gyXRZ+XTB2bF4K2lS66l1
 x9zA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SjKKIx4S
Subject: [Buildroot] [PATCH 2/2] package/python-pypa-build: bump to version
 0.10.0
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

Migrate to flit-bootstrap build backend.

Remove no longer needed host-python-pep517 dependency.

Add new host-python-pyproject-hooks dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pypa-build/python-pypa-build.hash | 4 ++--
 package/python-pypa-build/python-pypa-build.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pypa-build/python-pypa-build.hash b/package/python-pypa-build/python-pypa-build.hash
index 4c02ee1dce..9da56f9f68 100644
--- a/package/python-pypa-build/python-pypa-build.hash
+++ b/package/python-pypa-build/python-pypa-build.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/build/json
-md5  f2dc1823b0eff7037e19be18e354b2f1  build-0.9.0.tar.gz
-sha256  1a07724e891cbd898923145eb7752ee7653674c511378eb9c7691aab1612bc3c  build-0.9.0.tar.gz
+md5  742e7cd0a67455c1df90061b42088bd2  build-0.10.0.tar.gz
+sha256  d5b71264afdb5951d6704482aac78de887c80691c52b88a9ad195983ca2c9269  build-0.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  aaf9a29ca5907971ccf07de025375db34539a8d5eeebce20b46099805722106f  LICENSE
diff --git a/package/python-pypa-build/python-pypa-build.mk b/package/python-pypa-build/python-pypa-build.mk
index adc124b074..d7c03323b7 100644
--- a/package/python-pypa-build/python-pypa-build.mk
+++ b/package/python-pypa-build/python-pypa-build.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYPA_BUILD_VERSION = 0.9.0
+PYTHON_PYPA_BUILD_VERSION = 0.10.0
 PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
-PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/0f/61/aaf43fbb36cc4308be8ac8088f52db9622b0dbf1f0880c1016ae6aa03f46
+PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/de/1c/fb62f81952f0e74c3fbf411261d1adbdd2d615c89a24b42d0fe44eb4bcf3
 PYTHON_PYPA_BUILD_LICENSE = MIT
 PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
-PYTHON_PYPA_BUILD_SETUP_TYPE = setuptools
+PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
 HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-pep517
+	host-python-pyproject-hooks
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
