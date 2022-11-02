Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D601FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D359416DE;
	Wed,  2 Nov 2022 19:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D359416DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6-y_iddm_mG; Wed,  2 Nov 2022 19:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07A7E41477;
	Wed,  2 Nov 2022 19:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A7E41477
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9247D1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BAED41477
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAED41477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUhIPKZo_U9B for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:44:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B03405A6
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11B03405A6
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:44:12 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id o13so3656757ilq.6
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OkjcHytj7Vkt1QPAke86PXv/w463p6j9m7MQlu6JjGg=;
 b=XQ5SU2k/fVTQe7cMs8Iai0gXTMZn3CJAKD7hqxWxtWwaiL/WLIRS+FNErPPEOnTekk
 wS2U0Nh3WlMLl1Nh9F7ynQKbsVvMgz8148IbN+lKTaCIC4rcCk5R7ZZZ7aIMlr+QMoKw
 kJzKzzR+wX39j9+Ww292MC593ExXEJRXr8UKz/Gmh1j08rIoTvMV+O5ZcyPq+7EKtqLX
 xuem7bWLeiOAddv/ncLXrw7V5/wqdlbkueHKyjpVNxwNFnSTJBe/FlczrexkfqxMwPP6
 nUr3sjBLUIL9GZYW6Nhezlzu80xKrvTZw7tiUReyQwsGAHL8YD1YpCBoCtylQm3B47/r
 F0qg==
X-Gm-Message-State: ACrzQf3KtEDmpAVHiSK1U8JS1tv3TH+x7w8+eWIbY9JLstahNglrnk4F
 tetCeqI+aD8o+LLMnVxF14dbG2Edk61Mwg==
X-Google-Smtp-Source: AMsMyM7HBmENsFcW/BkTGVzH1mmZHLTu6xe8LmO6QP0uRZB5tql3AQiuu82XQNGzyyZid6ck0kcNVQ==
X-Received: by 2002:a92:710b:0:b0:2f9:6c7a:e82 with SMTP id
 m11-20020a92710b000000b002f96c7a0e82mr16161856ilc.258.1667418251812; 
 Wed, 02 Nov 2022 12:44:11 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w13-20020a92db4d000000b002f1d7850037sm4826535ilq.44.2022.11.02.12.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:44:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:44:09 -0600
Message-Id: <20221102194409.434684-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OkjcHytj7Vkt1QPAke86PXv/w463p6j9m7MQlu6JjGg=;
 b=GQC29lNoDcZklBbSmW87rLyuJJgZjBl9ryVdf4u+K34cj8vZWtAlrD6eIZR9Es1Au7
 Z/jW4Yr+UYv7qezw9qUqZ4KYtSyoEIYoD1IjbQELtAqWMbiSY1YISK+US6OV2pjmH1yf
 85Fjl4mzmasCyBZ76o77Yc05yfEzrtfnop+x5AugFsBN8h9qHPc/IsOX2qTHDXTJDy9H
 kUqUm2Zoe/elNPK50pgkFJzQPf3AuAIn6c7It3pVB83SsomH10l7Cl8GIr6yDsJFZnhi
 G7P7kizaQ2zsEAB+hjHn7tAzCGQjm7ZvKyK1EfDHvKla4srvjb/Rix/EwIzxalMxwZm5
 Ctxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GQC29lNo
Subject: [Buildroot] [PATCH 1/1] package/python-daphne: bump to version 4.0.0
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

Fixup remove pytest runner patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-remove-pytest-runner-requirement.patch        | 10 +++++-----
 package/python-daphne/python-daphne.hash               |  6 +++---
 package/python-daphne/python-daphne.mk                 |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
index 30acf201d6..70cdb4f19d 100644
--- a/package/python-daphne/0001-remove-pytest-runner-requirement.patch
+++ b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
@@ -15,13 +15,13 @@ index 64e94f1..4e3abb0 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -23,7 +23,6 @@ setup(
-     packages=find_packages() + ["twisted.plugins"],
      include_package_data=True,
-     install_requires=["twisted[tls]>=18.7", "autobahn>=0.18", "asgiref~=3.2"],
+     install_requires=["twisted[tls]>=22.4", "autobahn>=22.4.2", "asgiref>=3.5.2,<4"],
+     python_requires=">=3.7",
 -    setup_requires=["pytest-runner"],
-     extras_require={
-         "tests": ["hypothesis~=3.88", "pytest~=3.10", "pytest-asyncio~=0.8"]
-     },
+     extras_require={"tests": ["hypothesis", "pytest", "pytest-asyncio", "django"]},
+     entry_points={
+         "console_scripts": ["daphne = daphne.cli:CommandLineInterface.entrypoint"]
 -- 
 2.21.0
 
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index f80d7175cb..90d053bff6 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  564353eaed92659e3b113d966a0288f2  daphne-2.4.1.tar.gz0
-sha256  1e41d02d78da373c1f8504835cdca6d447b5d64c2941661d4bd968d412b6c383  daphne-2.4.1.tar.gz
-# Locally computed sha256
+md5  f0dcc0618459ad7d25508704f9505b56  daphne-4.0.0.tar.gz
+sha256  cce9afc8f49a4f15d4270b8cfb0e0fe811b770a5cc795474e97e4da287497666  daphne-4.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index cd4739db19..c08088278e 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 2.4.1
+PYTHON_DAPHNE_VERSION = 4.0.0
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/03/6c/847d1c962f8c45aa2ab0791583c4a41669d158e28fd6369ce940b8ea8417
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/d7/77/57b19d5caabf8537879aa4cf3a017b99d0b727f2521ffca7fd9140573509
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
