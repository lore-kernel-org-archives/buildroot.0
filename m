Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4A5C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17B7410CB;
	Sat, 10 Dec 2022 19:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17B7410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPpCh854tYjI; Sat, 10 Dec 2022 19:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A14F410C6;
	Sat, 10 Dec 2022 19:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A14F410C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF791BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 472CB410C6
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472CB410C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TA1mM5FVIG22 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:07:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C5F4410C3
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C5F4410C3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:07:06 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id h6so3787111iof.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X0a/vwHGTPkpRdEgdziIoJzslsxR3IbVlOBWObfbpXA=;
 b=xYLHJsxbneA5fTqgNU7ezBDUxxbhyYUym4lyBmqGhUSr6kxezeovguI7n4NlSF4ppo
 MXBf+Yz8gxovooSlYe5Zu3kqJEDtFREsiPr8Rie0Aa8xf++sSu7K1hRi6TKDqBWKIGLZ
 nU9BRYA3hRhA0xWOJ/wS7721FwfZLAlckuxXvLv9KciZIUzwCJ8SZMab+JM7LlwVKJYK
 Tn0gqnwputzlDdy/TBxm/IXKRowqDEZIGGJP5lxTsD1juO95dKcBIlkci2Ab2ciFysNF
 unMZB59LxMKKdj9tny8dNxa3y9oM2Yx68U+j+ERLj4C6rPenBAdaqHATCr7l/no02rdK
 8HBQ==
X-Gm-Message-State: ANoB5plSS6Hf5KAcylsWNJ7i0CDwWyscJOciu984nh6kr+CCBg+rAmTz
 Bj4eHSIVltEMa2FnQGFu7rLSmQZ6CbvMCg==
X-Google-Smtp-Source: AA0mqf4G1YImr5hHQspI9dkfxoVtknTAtQVQxrDuOY+XVCHb3A40K2NNYQMz5D16wAAlGLqsXdNdkw==
X-Received: by 2002:a05:6602:2bc2:b0:6df:d2a0:383f with SMTP id
 s2-20020a0566022bc200b006dfd2a0383fmr5395437iov.11.1670699225885; 
 Sat, 10 Dec 2022 11:07:05 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 t4-20020a6b6404000000b006dfd3599b60sm2035551iog.26.2022.12.10.11.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:07:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:07:04 -0700
Message-Id: <20221210190704.3061569-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X0a/vwHGTPkpRdEgdziIoJzslsxR3IbVlOBWObfbpXA=;
 b=YKxPt7GQ+7P5NM3xawQgAy6icdD0xL82mRQ+35qtpSWCr0yXhn/uGRWpzGvhA/q6cJ
 YS+g90toAfOua3SpaY6bEEwb8eJt+x2T7HhintZ58Nzj/CVMe5zTtVsx+p9N5oOHKwC7
 01k31Wjw+9kcf5209/2724+SXk9TR2smfYZtRuwQ9UME9iopPOt0kZHQ+kHUhDcyatfM
 TO738pGQMqIi82eWerI6AHq0/AijPyrurRzuAEwy9Ik12tdcPgT/GW/1ohVlvyKLLpxD
 yVV4EX+RiG2o4k01Zyb2k1IDZPzwQBtun25lqwJy3PBavbFX7EWQXsPUtHmFuKrqC/gI
 Q64A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YKxPt7GQ
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: bump to version
 22.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to flit package infrastructure.

Drop python-parsing dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/Config.in             | 1 -
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
index 12170df84e..c09dfffe2c 100644
--- a/package/python-packaging/Config.in
+++ b/package/python-packaging/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PACKAGING
 	bool "python-packaging"
-	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
 	help
 	  Core utilities for Python packages.
 
diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index 0f353a9e36..e10c11904b 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  e713c1939f294fd729af4a7be40dd141  packaging-21.3.tar.gz
-sha256  dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb  packaging-21.3.tar.gz
+md5  806414ea4c6f17b029a7911b622062e8  packaging-22.0.tar.gz
+sha256  2198ec20bd4c017b8f9717e00f0c8714076fc2fd93816750ab48e2c41de2cfd3  packaging-22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index 74b5803525..c9190ccfee 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 21.3
+PYTHON_PACKAGING_VERSION = 22.0
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c
-PYTHON_PACKAGING_SETUP_TYPE = setuptools
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/6b/f7/c240d7654ddd2d2f3f328d8468d4f1f876865f6b9038b146bec0a6737c65
+PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-HOST_PYTHON_PACKAGING_DEPENDENCIES = host-python-pyparsing
+HOST_PYTHON_PACKAGING_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
