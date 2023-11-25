Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED36C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F0461506;
	Sat, 25 Nov 2023 05:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4F0461506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41Uv92DIFxC1; Sat, 25 Nov 2023 05:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01EE1614F3;
	Sat, 25 Nov 2023 05:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01EE1614F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E799C1BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE69F614F3
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE69F614F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE6cnM20cNL8 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:42:18 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4C1160D51
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C1160D51
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7b34ee2a243so90329139f.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700890936; x=1701495736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fQjDCqEnAnN+KWMSKe2cDkKTsbpLBDoKW69xgTLUUos=;
 b=h2nsjXAS33u6pMO+yjgpttuAhQ/P+QbA/P6rq0ZD2VUA3gKLb1h5yr6CHi6or5WfEr
 Z9JtQg/lmTeI/zYkmsqQlQREKy5nZ5E3OsFwppgLe5trvi8N152vp8YLMYxeS0TxDwcj
 96zKM0dfRrkhm0Ljxi1TiqVd+qNcF0KdtLUIhu2snqR9av+gvt0TZoVQ5irSn4yVwWyp
 nRYDu1PGQDkXJ+61GNYFaS3kBitbHJUqUUPoKrDq+aYCsSa6MuRb8JJh1pok85k7aRbI
 cdBzTcgv9ZMfNmJQQX0vm6tzg+JLYG+V0aDpereWHyUdrAEdT2eTp2k0qyNWk4K9TeYr
 tp+g==
X-Gm-Message-State: AOJu0YxgdZU2TMKavq3ISr/HcKsWVoVnn28X71Z/CR4hD8E7hi8ehBQK
 X2rTVvIPVPUnMroEaAX5b+QhJsV/EEg=
X-Google-Smtp-Source: AGHT+IFiPEf6c5ppZPLPDtxpI8yGWFL/aW7YcxYQdxK1w+pyF+mVX3HRC/qhqyBojiWg8ju0s2HOZg==
X-Received: by 2002:a92:c249:0:b0:359:4199:1fea with SMTP id
 k9-20020a92c249000000b0035941991feamr8452704ilo.14.1700890936535; 
 Fri, 24 Nov 2023 21:42:16 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 bz10-20020a056e02268a00b003594b40e4e2sm1473185ilb.0.2023.11.24.21.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:42:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:42:14 -0700
Message-Id: <20231125054214.313010-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700890936; x=1701495736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fQjDCqEnAnN+KWMSKe2cDkKTsbpLBDoKW69xgTLUUos=;
 b=dNiUJL3Gu27h3DzKSoWH4bPwlkv+1FaivHlO/EBsvcO/QAck8E9qOiUDnj22phaNj7
 AUPvY5Wq7jugEj6x3i2IkJCt5zQtm1pwdcVv2OUnBgdlIV5iIW6WtOxtBp5KvTXUK/Ux
 8Q5+uSly/cJ0uxUlaGOndCs2srYdIpkNkAT28IlKHWVoVOOoE+V6XO5WQ4j+asavEdDK
 sWqhLvURGtIdT3vOF0lbC4Nb9ixY3UqxjhpPJWYA3GpDS8FFS2pzAyFYavflC99bxaMo
 dILe0u4FOVHPDhS4yDGdiGgRPFLN46YwXwtP+VYPJI70pjgEUOv5u1PmhavSmMVlbfBY
 u7IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dNiUJL3G
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.41
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
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 62ba0c3cfe..54130f3ae0 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  5a2bb559c0bcbc617f507a320c64ba03  prompt_toolkit-3.0.36.tar.gz
-sha256  3e163f254bef5a03b146397d7c1963bd3e2812f0964bb9a24e6ec761fd28db63  prompt_toolkit-3.0.36.tar.gz
+md5  252a5d200e41d46b65a3076d2bc0a4bd  prompt_toolkit-3.0.41.tar.gz
+sha256  941367d97fc815548822aa26c2a269fdc4eb21e9ec05fc5d447cf09bad5d75f0  prompt_toolkit-3.0.41.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index 426fa41e0b..db40f6c7eb 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.36
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.41
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/fb/93/180be2342f89f16543ec4eb3f25083b5b84eba5378f68efff05409fb39a9
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/d9/7b/7d88d94427e1e179e0a62818e68335cf969af5ca38033c0ca02237ab6ee7
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
