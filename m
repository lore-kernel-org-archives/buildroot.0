Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F516C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E021581570;
	Thu,  3 Nov 2022 21:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E021581570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AHJIU3e9sIrA; Thu,  3 Nov 2022 21:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050F8813E3;
	Thu,  3 Nov 2022 21:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050F8813E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DC671BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1215640BE5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1215640BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JibfF42R5kp for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 759E540BF4
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 759E540BF4
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:17 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p184so2385841iof.11
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3O63tvE9b3ipUiGlkpN+cZjGd10LqcQIQUS57HOh6vU=;
 b=02dyrIKrUiblgq2WqI/MhyJ8kaiozXUpiIDZE4Lq2NIDphC/IkvFSs+4ps31ac8hJB
 lDGIhA1KM5QrD1K8IwW9XOx5ZK/gBsKsZeCd/enf2LnQRMcuqeJ3RQWd06VQKw8xEgEv
 vLsNEyLA8191FozDER2wUI2X+18lRW9Q4PA0X8ofy1SctL4YxA2p8fZrO0kovSXO5HKL
 iAEwwQk0DEn88Z6/Raqm3IrIJNbry1KYbDObVLzfVWFNGHTEEGJ5d8VT9O/pFUqyaljV
 8bi21iL14y7Pbi0hH61g4FB4+kn6aX6K8R0Npuabevb/2CG2f16fn03qVie8VXaYTdpc
 fQEA==
X-Gm-Message-State: ACrzQf3/tNtD7VtAHp4uuB+tdtx7OrJOVMeh88SGzypZPPEaH5jpVZ8o
 1QBA0bp0GjYjCsxW0GDVd9q8ZHxiCNdRKRG6
X-Google-Smtp-Source: AMsMyM521lCish51SLq3rvgDZk0XQkmCNbAKl11S+rl7Cfmeol34IYBmeYpn795LwOZNTlGhZDLOwQ==
X-Received: by 2002:a05:6638:1186:b0:36f:ae2e:a396 with SMTP id
 f6-20020a056638118600b0036fae2ea396mr19572620jas.89.1667508916269; 
 Thu, 03 Nov 2022 13:55:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e5-20020a926905000000b00300d3c0e33dsm669139ilc.4.2022.11.03.13.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:55:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:55:14 -0600
Message-Id: <20221103205514.2477642-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3O63tvE9b3ipUiGlkpN+cZjGd10LqcQIQUS57HOh6vU=;
 b=nqR6Rb5e7GS8grVkKN1TL/Bm1/a+l0xew17Ugong0r/pNBw588iWfC/Aie9jWS3rr7
 cpdkzkf81YWI64acCo9/u3Mm3Gus5J8LVhGPaUtmDXzSpLzI7j5YFb0dL85b9Fb5DQJq
 sLGFqLjluUMUKrdRzWKlM8AYdrMa5C+Rk9IZnHoTeOXbf+TRuEbsblXq/7DLsujZoQi/
 8qJzxHQ3SSdVS7Rv5q09D2AMAw1LQMySOY5kBfaDeB9hpSBPCGmgTPxvhRbiM86sluWq
 P6lgnHncVCee9dz0hW/nJF/vptlefEKIDsBjEVnCuYsJxh/OnrJmdHWSJzIN0SqNdbZ9
 mAjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nqR6Rb5e
Subject: [Buildroot] [PATCH 1/1] package/python-wrapt: bump to version 1.14.1
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

Migrate from distutils to setuptools build backend.

License hash changed due to year update:
https://github.com/GrahamDumpleton/wrapt/commit/240fea86df0357f3642db040f912031e4ecdfcb1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wrapt/python-wrapt.hash | 6 +++---
 package/python-wrapt/python-wrapt.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-wrapt/python-wrapt.hash b/package/python-wrapt/python-wrapt.hash
index 63dae991eb..cb62e19aa7 100644
--- a/package/python-wrapt/python-wrapt.hash
+++ b/package/python-wrapt/python-wrapt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wrapt/json
-md5  6d56ed0de4336462a73350341462f45e  wrapt-1.12.1.tar.gz
-sha256  b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7  wrapt-1.12.1.tar.gz
+md5  6e7340264f038efdefcba707250c91c2  wrapt-1.14.1.tar.gz
+sha256  380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d  wrapt-1.14.1.tar.gz
 # Locally computed sha256 checksums
-sha256  e37c13f84fb3c9a54161b0fcf75f4d302fb86ce42cd6106147bda79e4197d9f2  LICENSE
+sha256  77d2a9159cffe12473f539a71a3e741f35117e61bfd005ebd60c3a1778e2c1f1  LICENSE
diff --git a/package/python-wrapt/python-wrapt.mk b/package/python-wrapt/python-wrapt.mk
index 32d8a24c14..406f6c3aa1 100644
--- a/package/python-wrapt/python-wrapt.mk
+++ b/package/python-wrapt/python-wrapt.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WRAPT_VERSION = 1.12.1
+PYTHON_WRAPT_VERSION = 1.14.1
 PYTHON_WRAPT_SOURCE = wrapt-$(PYTHON_WRAPT_VERSION).tar.gz
-PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797
-PYTHON_WRAPT_SETUP_TYPE = distutils
+PYTHON_WRAPT_SITE = https://files.pythonhosted.org/packages/11/eb/e06e77394d6cf09977d92bff310cb0392930c08a338f99af6066a5a98f92
+PYTHON_WRAPT_SETUP_TYPE = setuptools
 PYTHON_WRAPT_LICENSE = BSD-2-Clause
 PYTHON_WRAPT_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
