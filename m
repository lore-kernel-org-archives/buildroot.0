Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E48C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 06:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A3341AFD;
	Sun,  5 Nov 2023 06:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A3341AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOTnr99iIk-t; Sun,  5 Nov 2023 06:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1D041B13;
	Sun,  5 Nov 2023 06:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE1D041B13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBB41BF2F9
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C1C81E93
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 06:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C1C81E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fx8go6OIZJN9 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 06:51:02 +0000 (UTC)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B84581E91
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 06:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B84581E91
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7a66aa8ebb7so141942639f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 23:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699167061; x=1699771861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lD2eD6kOuMqgoNyE+k69mT5XdSU1TANq9GUsT5o1VMc=;
 b=vIUvPDrtyLzMO/pLX6BhXDbapMWngs2HzWWFx9V0nHek9gW+XpXShsChByV+2EPdM1
 vW8PuFvBvbGeZZxc8o2c6LPDM5hWaZrDEUy+17oCd1n7uSC+Dih0RQxvQu5uB3b82lfW
 Cg9Dm6ddwbEoMdy8Li5pV1r6Bxfz+uiqQX3nN2quwXYN76sudh7Ql5CocL4gVYuFAHKW
 NJwFATwuG9vVFKHB714wf7m6I0Nd9xhYQeLsctH9p62IK9jKqTisy/bClrwc4FzkFse8
 Bs9BbsPLcqXM49FZ8Cf92SE0QyUwQo50txL8BNShWENfd9ucBGKOVsnXcM3ax3FS0zIB
 vCuA==
X-Gm-Message-State: AOJu0YwGPUkig2yoRhTqbf4XOCukEL8letPRW6YUXLqkDxmobXSz+6yQ
 0yKfsnhBAnmzs+it/ATGm6LATvMzap0=
X-Google-Smtp-Source: AGHT+IG/yvRDKKYekB9PIpwf6FCQUp7qfcuQBYEFJiBf5nutg+UcIt9XBfUT/VjtT0uGY+fDFSbMlw==
X-Received: by 2002:a05:6e02:3206:b0:359:4b8a:ea19 with SMTP id
 cd6-20020a056e02320600b003594b8aea19mr12971163ilb.30.1699167060966; 
 Sat, 04 Nov 2023 23:51:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056e02106600b0035260e105fdsm1697981ilj.36.2023.11.04.23.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 23:51:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 00:50:59 -0600
Message-Id: <20231105065059.2866540-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699167061; x=1699771861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lD2eD6kOuMqgoNyE+k69mT5XdSU1TANq9GUsT5o1VMc=;
 b=EAkHXQgBk3Och0Ww+gupozm6mkioPOPAV6phiqVZxi7CFXRhK0vo9b+FL/auKQeVf9
 ueny+TBblOBRX89NRqYjk2IKZ8PFT1qtG07tpNCEfsQwGFABefgUH9t5gSP0uBf1B2m1
 6tOt9jQu47Egr1vyGprg9n6io4or+rLjslbfVycTPRDdshQ0NN8eT0ogdQgaBYE3anRh
 SW2SR4aX7GfSNwnLFdEjXA/BaOQWuiCzIRXs2JznWOHj3SjIw4QJ38xOjC1WdBGM1q3V
 hiJmK3rLwFPFHlMvdYoDh4c8DYPrJdfV8G5c79dSp64YmDcLO6V0oai7HPeTuetP0pcU
 uUBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EAkHXQgB
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.44.0
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 84119d3346..8bcabb0c45 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  34d9fb935c3eaf5d2bd3572d88613bd2  fonttools-4.41.1.tar.gz
-sha256  e16a9449f21a93909c5be2f5ed5246420f2316e94195dbfccb5238aaa38f9751  fonttools-4.41.1.tar.gz
+md5  717f907e93dd6be3dd46fbdcdc33bbd7  fonttools-4.44.0.tar.gz
+sha256  4e90dd81b6e0d97ebfe52c0d12a17a9ef7f305d6bfbb93081265057d6092f252  fonttools-4.44.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 2fe7f50115..2f8a738600 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.41.1
+PYTHON_FONTTOOLS_VERSION = 4.44.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/e5/55/86c43d626bbe12fb384e61152ded4f76a280d30a022968c471f850cdb0d5
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/6d/f8/d3116b436553856df4ed9094584ac55c5e99ee9d9f3369f2912bbb8d0b90
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
