Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D73C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8817B60E43;
	Sun,  5 Nov 2023 02:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8817B60E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fM6uSITURnb; Sun,  5 Nov 2023 02:41:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F9960E37;
	Sun,  5 Nov 2023 02:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6F9960E37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58D421BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DC8E41761
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC8E41761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dS7rq5zEuhv for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:41:19 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67D6241758
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D6241758
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a692658181so110288439f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699152078; x=1699756878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uWTdKe3DsVExV0y+yFLTF8Vc/plCTywSHUZNYgZPwfg=;
 b=pJDbHFVBtaPeCnMOrHaH1FgAYVvG1ZeQS04LSrz3BSfOFKnfgnsgPEiu4a5EE1g3z1
 5Mz0+HWREdo+fzk73yfBK8OYdZvgS8S3GgM07RA3IZVO9ZhNY6Q34vlLAxnQCxDchfN9
 HREIJDfNZulHPxT6KkhK525gB+5b2gXlPtm4OWhryCtbGSIs6NfCYYUSIiwElxOSpzJ1
 yCKYYafPRRAQXaMsOxsMxcxx27weHPr8epG6ZFxekr/BLRnUUmjD3S9L8k7OP6UyWIr1
 GezVn/SRRF83JPvhyA76vQpT6R+fZyESKJTtw+bPX+WVTwrvWITul72phdqMpc0ktuw7
 0mMw==
X-Gm-Message-State: AOJu0YxPG0cIWF0AKPYYYU2Q7qEpmtZDSW1MWYWnzoPGvCrJsjl8p1Zv
 Dlss1Rt41srwBQoED9IHhOam2Ohel8o=
X-Google-Smtp-Source: AGHT+IE18WxVOSWjzE/QekbmbG/0+sYmoUqgXolXHEgR7wrZ7lxA5WBU3QHfHXP2uOpa27ie/6dxtA==
X-Received: by 2002:a05:6602:1587:b0:79f:96db:f33d with SMTP id
 e7-20020a056602158700b0079f96dbf33dmr38583626iow.9.1699152078030; 
 Sat, 04 Nov 2023 19:41:18 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 q23-20020a5ea617000000b007a94c54b7basm1477123ioi.34.2023.11.04.19.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:41:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:41:15 -0600
Message-Id: <20231105024115.2762262-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699152078; x=1699756878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uWTdKe3DsVExV0y+yFLTF8Vc/plCTywSHUZNYgZPwfg=;
 b=J2uWcl5mTZ6qETe6MfuSTCsvtl2qAijytyUoOrojL17F2vPuqpq6+qY8Z+7EJBWyf7
 dDVgxCrxWwOHJbg9XH2mvR2COpEtXr7rv7rN3uSGnFB0QmCpdgvJDKvVOahylYITQz/5
 p+O08TdwJhpPaL9F17fHyTW7t7dqG7jEBpjqRzjahHamRqaxFsI18HRkg+QcmkL3g5bB
 vAtLmHrMxtXJaiABOrGQ+BiUUNSPnzS4yXghTwBfbHKcEFZ7PMcaNLHO+qaTvcfeEob/
 pI4Ow5SswMIcxMrDB2nlvcM6LULIKO6ipo6c19e9gutDiCh3auT8/5NWVGQJIgKvErOJ
 b8qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J2uWcl5m
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 1.16.0
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
 package/python-cffi/python-cffi.hash | 4 ++--
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index ae7f9a477f..0573d6ec06 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cffi/json
-md5  f493860a6e98cd0c4178149568a6b4f6  cffi-1.15.1.tar.gz
-sha256  d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9  cffi-1.15.1.tar.gz
+md5  0bcaed453da3004d0bea103038345c1e  cffi-1.16.0.tar.gz
+sha256  bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0  cffi-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index c1fcfda5fe..1f83db079b 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.15.1
+PYTHON_CFFI_VERSION = 1.16.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/2b/a8/050ab4f0c3d4c1b8aaa805f70e26e84d0e27004907c5b8ecc1d31815f92a
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/68/ce/95b0bae7968c65473e1298efb042e10cafc7bafc14d9e4f154008241c91d
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
