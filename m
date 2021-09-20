Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C130CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:12:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCB060FD7
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BCB060FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34002607BC;
	Mon, 20 Sep 2021 06:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4kaAr-IBggN; Mon, 20 Sep 2021 06:12:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D77607B8;
	Mon, 20 Sep 2021 06:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD0A91BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD0CC403D5
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0euSO7WFJQz for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:11:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCD6F40395
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:11:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id z2so3156187wmc.3
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 23:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ry/aPJVkrJtOqacdfHTjYBwj9UrCOq/B4wseUNYBOoY=;
 b=Ba5j9G9CEYL4qpfGS1hTJ3BtUUzE7kOB6a+/jbR6j7LUOCOjl/wVthkCiOYdQ+s3SU
 t9GKPlg5ew0ZBhAnCgfgGrBQrL+ZDWrUsAt72ZAH5uy5Wrqz6AV3nHD4ics01QMEqARW
 +hikRwT2/nyKvpYag/gE03NR61fiMMeMfWav92qqFrbSYfLzdYcsV0ZGlSIORz0NcEWX
 dy/SELrso8FDQi8xEruIkAZi8eL5pIul0X4+HeqL0S8QzlILhvouCy/AspzUyEUpxxUL
 0/y7GeZrvGGdxHgt6Q8IKyJTTyyjOA3DodYpLCurmoGJPWQ8SsLC6Z+36Ofaj3bqoP8T
 idKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ry/aPJVkrJtOqacdfHTjYBwj9UrCOq/B4wseUNYBOoY=;
 b=nmADsI4KAPReZjLrirIfpLsEDVMPMfuIuagDdKS4quVmOPFydKKEcaGOMjYb8RDhZm
 9g+yhNA/P+ohN3PYoWF8LmYoFq5pUwtEyfEFDPo2OovfhUZO6SoziizHgdoQh1o8vf/V
 u1MHODo7a6SfOsGSNQS77z24kIdBOi+6Xvoe3QsDIxEoFtTUhcldRWNx1HU3AEUrIPDI
 NHuatqNsmg0ToMjIt6c/ydWIcBEtWukLntY3ZFAqpSrpLivTvACV72+9xWX3EP/HH8Ox
 8F259dhZfPUda/wHZMuXW/u448EOBrFUt5GeN29aweDT9f6XB6hxGXvWuRyYgY+TxIiR
 GLDA==
X-Gm-Message-State: AOAM5328zy5io5es4BtQ4tpJhmQEuI7z+nZyGLQlck7jOIoV3ATY6ZgV
 vto9oXGBLNYmOh+znsdg2GbWDQ0ouCo=
X-Google-Smtp-Source: ABdhPJwYFbJf2ylv+vc0E5hqkHOG6k1J0iXmAsSPoGUP5xfty0gfYKc/eOuzndN91e6UebfARVEX+g==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr22530560wmi.4.1632118293941;
 Sun, 19 Sep 2021 23:11:33 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:72db:d93a:e4a7:fd06])
 by smtp.gmail.com with ESMTPSA id o1sm14622480wru.91.2021.09.19.23.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:11:33 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 09:11:23 +0300
Message-Id: <20210920061125.221541-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920061125.221541-1-asafka7@gmail.com>
References: <20210920061125.221541-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 1.14.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 37676f2664..8ab672a56f 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5	3cc2f1daf62dd66eda79b4d6281cebfc  cffi-1.14.2.tar.gz
-sha256	ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b  cffi-1.14.2.tar.gz
+md5  5c118a18ea897df164dbff67a32876fc  cffi-1.14.6.tar.gz
+sha256  c9a875ce9d7fe32887784274dd533c57909b7b1dcadcc128a2ac21331a9765dd  cffi-1.14.6.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index f0b5b4560f..2504cf18f4 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cffi/python3-cffi.mk
-PYTHON_CFFI_VERSION = 1.14.2
+PYTHON_CFFI_VERSION = 1.14.6
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/f7/09/88bbe20b76ca76be052c366fe77aa5e3cd6e5f932766e5597fecdd95b2a8
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2e/92/87bb61538d7e60da8a7ec247dc048f7671afe17016cd0008b3b710012804
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
