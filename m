Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC7EC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE93043818;
	Thu, 11 Jan 2024 06:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE93043818
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtpdrjVkAvEX; Thu, 11 Jan 2024 06:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 986B84381F;
	Thu, 11 Jan 2024 06:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 986B84381F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEE1B1BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 960BE4381F
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 960BE4381F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WXFwlmZ7yYPk for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:45:15 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68C8A43818
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68C8A43818
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3608e206f27so22142805ab.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704955514; x=1705560314;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z33Hlo4kwzyBMzTdxSjwe85g+ThbgdELWE/7Y70+5ak=;
 b=XnjIY99E8t5EJbABVmb0MCdTDeuIR72cDCoTcMbVzAPNhjLuJog5I0IKVwFk4WN8hX
 ep01mRsRVRXj5w7cl+04Rzw0vK/nogcTsjFiREikc74T2ci8jmonwO+qTEbcZwVBhtoE
 xWyryAy56m4QJOWkJ1DkpSOAUqwsVVF3huFvoHp8hwFupPAOfybKv59303uWrTGMK5Kr
 H+EgROamr3fqv4YmKl0VSFqRfsFzDHmvenlGk3+4cLtxrymjzYLXE37ZTgrOBWxgTy2X
 EhXtezh4z/Ik7f1jFHrJN1npe2PW3NAyHpTWazhExJ6dwuMp1jjhhXCQwhpINR1CaO4r
 xn/g==
X-Gm-Message-State: AOJu0Yx6e5qwOeGcRP/2Fx0u7NAdLmmf0ViQQdnver/yz+1t+yss6O/c
 h25LoOW7V8kHpIQqUYO3ioLMlVnAxSQ/ig==
X-Google-Smtp-Source: AGHT+IHDD5R/4RomZFaLErCIzTlV1Tr8f4Q2ucydw2aBT0+63oNTFIG5ZrYRjFyMa76CfYe5Z+0Reg==
X-Received: by 2002:a05:6e02:f41:b0:360:7ea:ac4f with SMTP id
 y1-20020a056e020f4100b0036007eaac4fmr650844ilj.105.1704955514017; 
 Wed, 10 Jan 2024 22:45:14 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 l16-20020a056e020e5000b003606b6d1070sm106925ilk.22.2024.01.10.22.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:45:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:45:11 -0700
Message-Id: <20240111064511.3053913-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704955514; x=1705560314; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z33Hlo4kwzyBMzTdxSjwe85g+ThbgdELWE/7Y70+5ak=;
 b=BHIbQndsBwVfDtHpGB7hIDwFsuADPE5L4ZZqo6WLTO80GG6TFFSISy2h+Ntm4Fam+b
 ojT8JGk4zb1YI6LIPnLRlDgoxwhnc+/qS3zp0Hu5qsh2cvMLDhYKSe8B4vsKrd/p89tB
 oD/509vUvycumXr6/yKyXG/avJYNZIoybi1GXLjlxTg2jhXQEECvE+UtI3k1qjv/7qKw
 nX8VTuxxOym7hnbW88VEzbr0mtWUxL2KqDa2rSRwZAJvSQj9AjRc0pH1jiYBkD4HJEsx
 B6ljIl4Tdug6/mF8A/1ac8CCTvOe6STS0qb5BzlnpFbV2N45vWHo+D8qqbBFfUMDaOjn
 jR2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BHIbQnds
Subject: [Buildroot] [PATCH 1/1] package/python-sh: bump to version 2.0.6
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
 package/python-sh/python-sh.hash | 4 ++--
 package/python-sh/python-sh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sh/python-sh.hash b/package/python-sh/python-sh.hash
index a31aacdee1..c0d3f62f12 100644
--- a/package/python-sh/python-sh.hash
+++ b/package/python-sh/python-sh.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sh/json
-md5  d60498172876f35aef6303a9cbb8eb11  sh-1.14.3.tar.gz
-sha256  e4045b6c732d9ce75d571c79f5ac2234edd9ae4f5fa9d59b09705082bdca18c7  sh-1.14.3.tar.gz
+md5  aadf37759a9cb4862257cef3cf44a27b  sh-2.0.6.tar.gz
+sha256  9b2998f313f201c777e2c0061f0b1367497097ef13388595be147e2a00bf7ba1  sh-2.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  d8491c6e236568d04f7c8c07f2f1b8f5d142706dab6ab88f6e0d2dd476b6c706  LICENSE.txt
diff --git a/package/python-sh/python-sh.mk b/package/python-sh/python-sh.mk
index 781de88ab1..af4da3f6c9 100644
--- a/package/python-sh/python-sh.mk
+++ b/package/python-sh/python-sh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SH_VERSION = 1.14.3
+PYTHON_SH_VERSION = 2.0.6
 PYTHON_SH_SOURCE = sh-$(PYTHON_SH_VERSION).tar.gz
-PYTHON_SH_SITE = https://files.pythonhosted.org/packages/b7/09/89c28aaf2a49f226fef8587c90c6386bd2cc03a0295bc4ff7fc6ee43c01d
+PYTHON_SH_SITE = https://files.pythonhosted.org/packages/cd/51/7355831d8e1cee8348157d769ccda8a31ca9fa0548e7f93d87837d83866d
 PYTHON_SH_SETUP_TYPE = setuptools
 PYTHON_SH_LICENSE = MIT
 PYTHON_SH_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
