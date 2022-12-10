Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2E0C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FBD94048E;
	Sat, 10 Dec 2022 19:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBD94048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QRZ1EjgzY45; Sat, 10 Dec 2022 19:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98E9940239;
	Sat, 10 Dec 2022 19:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E9940239
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87BB31BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F231608A5
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F231608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onwD6bApxyHh for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:16:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624E2605AB
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 624E2605AB
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:16:22 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id i83so3787867ioa.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jf5LGwiaZGJexBQ3AKpHZHIZmPUnx3sayZdfe+Xj3Lc=;
 b=vLO0GiZniyiaJr24GXv1DneibjXtoCK7R3JtUMgzpFX2jrGqTr9QJsMfJJShxL5QA1
 8qiCloREMn2sfNAF0assPVjT0D65Ay/33vNxRd6zqeRbOoTcuOGH+z5o1EEWs/q9OdMB
 dBXWaxNMSAMvq+MtW4lvJ6WWLkXOy3z3S4Ri26X3/avyla+mnSCteoufIB4qZWjqN20a
 u1+eZZg/HdifBZl2bQhVWeVqyeb6NOVlqiqi7yG/rk0pZrUet6bg2B60ft758WJ5qOGN
 p8DH7Kt9Jdu+2QrepUfz+BH7n0hw4CjOONPdRgvQWaiCuFAsWuQLyhAQditz0+iIwzy7
 CcoQ==
X-Gm-Message-State: ANoB5pljVodaEOrS+s//JN2hYxyjyW0cZp4mafeP3cw2P94wasoUhxaG
 k6h3pYYmm+ht30peSZYd1+J1vBL+SziSxg==
X-Google-Smtp-Source: AA0mqf6mIR+tWExhFo/ycGHp/t5nRbDaC/o4R1SRGEHlTbHPZRf0R5Yoh7PbvEvvkbSqtLoD5g14ew==
X-Received: by 2002:a6b:e414:0:b0:6e0:2f8f:7bf0 with SMTP id
 u20-20020a6be414000000b006e02f8f7bf0mr6115195iog.9.1670699781265; 
 Sat, 10 Dec 2022 11:16:21 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 i1-20020a056602134100b006bc039e3224sm2076049iov.17.2022.12.10.11.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:16:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:16:19 -0700
Message-Id: <20221210191619.3085142-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jf5LGwiaZGJexBQ3AKpHZHIZmPUnx3sayZdfe+Xj3Lc=;
 b=DSb/I8sxcKnlTPwRdLXEvjwymK5vCpFVVVKalUmif0yQSCFwSPz2jdCat9cnrAswC0
 3tf4F7V7TiUAb/93xjJHiSw8T0zXXNKiY+lhEzWYXOn1YWRy4oP46sLfQYxLwywPg7ry
 +bBMH6HZDsmf3dB8fWhN+ys+ZFawFbki4gWgUkOSTCVsH3cYYqjSFhwYiWEtTAYvRIe8
 wjqLD/klrUxYWfiXZpy3zHOblV3JfSIfA/2Uh/iN7O8czOzM6/q4uSDvAWlDLe3w5BBl
 RLLmp2q1A3ISA+45+FXVWyEd0ksWAQu1nEqG8Yf9+Q8mNvqigZpBw/itB+DweDkjQijk
 EXRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DSb/I8sx
Subject: [Buildroot] [PATCH 1/1] package/python-pathspec: bump to version
 0.10.3
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
 package/python-pathspec/python-pathspec.hash | 4 ++--
 package/python-pathspec/python-pathspec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
index 91e4fb85b7..5eb76cb5f9 100644
--- a/package/python-pathspec/python-pathspec.hash
+++ b/package/python-pathspec/python-pathspec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathspec/json
-md5  6f4fde5e701d328a2846d206edb63aa9  pathspec-0.10.1.tar.gz
-sha256  7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d  pathspec-0.10.1.tar.gz
+md5  d89408b52aff020ac768a14c0ef1c7de  pathspec-0.10.3.tar.gz
+sha256  56200de4077d9d0791465aa9095a01d421861e405b5096955051deefd697d6f6  pathspec-0.10.3.tar.gz
 # Locally computed sha256 checksums
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index ccb794cce9..e88bce231f 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHSPEC_VERSION = 0.10.1
+PYTHON_PATHSPEC_VERSION = 0.10.3
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/24/9f/a9ae1e6efa11992dba2c4727d94602bd2f6ee5f0dedc29ee2d5d572c20f7
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/32/1a/6baf904503c3e943cae9605c9c88a43b964dea5b59785cf956091b341b08
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
