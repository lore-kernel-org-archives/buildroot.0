Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEB3C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1463B43805;
	Thu, 11 Jan 2024 06:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1463B43805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZujEfH-PRY9; Thu, 11 Jan 2024 06:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E727F4380B;
	Thu, 11 Jan 2024 06:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E727F4380B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2721BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBA724255B
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBA724255B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ai8saaEcAGiU for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:36:26 +0000 (UTC)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 074A542557
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 074A542557
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3606f57e08aso22610725ab.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704954984; x=1705559784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PwIb2EPatNGO2LlwKOuodyBKWgF/EFqwq1Tlga2//vc=;
 b=jER6dLfCrVkAJdr7ZeCeOZjrk9H5yuR+4LcWPx3ZL4umMS8oneUO5wxYVwckwmpOkb
 cCMfVabjXVpzvTDPOf/FpmxchBCyJ96yhIzrMXtWwTSE/dSWiemy1Tcj4SAf3traTMEM
 Ncwnp6OmZcEQUlb/4KjBACCAkCUub9aSuJxIqJ4ZeobsgGYRVphoopVcbDk69SH1RuRW
 dlKCOGeSY1fwq5IiScL8br9w79G04vafzZRmTkcvBtwVyTBYn12Cht1a42/SxLPXRo5S
 06usUgUyDjM38suNSLJDNizv4vxqECUfvNBOjajCt90BsGAsj/tLsdyVpVCyi+5areGc
 xpxw==
X-Gm-Message-State: AOJu0YwqrD+Aad56BbmYETvYukwkGt4REBnu+cSbEJpbFCT5idfDokyk
 xPntSYnHX0J4N870gOQo+1SU6y+P4WHGpA==
X-Google-Smtp-Source: AGHT+IEhAodIClAqsUSkFh/c2JytkFb6plXKfq9PmiFMYUQSe2eNk/d40xAGc0nF8fy+G0dfpbI5Sg==
X-Received: by 2002:a92:d352:0:b0:360:8a29:aeaa with SMTP id
 a18-20020a92d352000000b003608a29aeaamr775660ilh.57.1704954984646; 
 Wed, 10 Jan 2024 22:36:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 v1-20020a056e020f8100b0035d79f5d8acsm101243ilo.79.2024.01.10.22.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:36:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:36:22 -0700
Message-Id: <20240111063622.3047258-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704954984; x=1705559784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PwIb2EPatNGO2LlwKOuodyBKWgF/EFqwq1Tlga2//vc=;
 b=ktfhMBhdAjw0yosb0D/HT/x2aQJBX7n6CsXA29n8sBtiydAf0MGE3UI+6I49ZMRp4U
 VoiyM4dWgRky/hO6jxKAQN+nrwb9uR6aAOWCJekj4RzjYByY+yNR6EDfvNvb4Z0kN9pQ
 1i+jCov3rbnKmGl6mRN45MOLPQknIqalooU5HJnG1BAhfYSMzJJrkFjxTilCNhvqrk91
 Y1aD2pRZPAVdNXIFdCnlZRmr77fIrYqwTRvYT+lJLtvqGx13zR2Dz0p97xSedi9qw811
 myA7o0flvtRaLJAypSjl4DSUihGEN1QK/WELiZnqvRYfEWVrVxJa7YYVt0S0ET8yHwSl
 iXJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ktfhMBhd
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 8.0.4
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

Migrate from setuptools to intree pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 6 +++---
 package/python-setuptools-scm/python-setuptools-scm.mk   | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 8cfe07d1d9..1a884dbbbf 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  158dc741637fb4fa4b955c62bd2c08be  setuptools_scm-7.1.0.tar.gz
-sha256  6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27  setuptools_scm-7.1.0.tar.gz
-# sha256 locally computed
+md5  a05e98ab9ae447e173f0c747e0d49e81  setuptools-scm-8.0.4.tar.gz
+sha256  b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7  setuptools-scm-8.0.4.tar.gz
+# Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 5a35c35a1f..4cbf914690 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 7.1.0
-PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/98/12/2c1e579bb968759fc512391473340d0661b1a8c96a59fb7c65b02eec1321
+PYTHON_SETUPTOOLS_SCM_VERSION = 8.0.4
+PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools-scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/eb/b1/0248705f10f6de5eefe7ff93e399f7192257b23df4d431d2f5680bb2778f
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
-PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
+PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
 
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
 	host-python-packaging \
+	host-python-setuptools \
 	host-python-typing-extensions
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
