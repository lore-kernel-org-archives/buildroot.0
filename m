Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B66CC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:30:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0090D6023D
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0090D6023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6E8440288;
	Wed, 21 Jul 2021 22:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oafvr8B-R5Bp; Wed, 21 Jul 2021 22:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA0E40290;
	Wed, 21 Jul 2021 22:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39A001BF3D4
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 314BE40146
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kK5xQVBfrY64 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29057400E1
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 22:30:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r11so3763288wro.9
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 15:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xbq2QCFuW4VLRh9wtkxxWQQsUrtmqnZED1lkmMmoSE0=;
 b=Xw74Hg6Tf1JBYdZy8N8hDmvmr3E79DQmp+CLCc4nadv1uPUEGeFgZC3yTtgYmClFjl
 agyeii7dPkCENqcOrLXLSGzESBs9n+QzXd7TM6UlWnGMoKptzhdjwJZLzFL8hkkkZmq4
 o1o9CNdUHp4nYZYAU1/ZoF/KlyDk33TntkTpVq7oXCXypsQhmVqvcZRT40ZfuFWuQCjQ
 HobafRPE4hODVYh75L3wa8+Rby2achPbyzqCJOjSyx1WGvCfGVayhLQs3i6fq5eypQNI
 AOXJH3twSjz+k5mtdaBj04vUttD2LeVFpg/j83fBOPTElPNZDSqNwNBT5hIIW1cd+UkH
 k7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xbq2QCFuW4VLRh9wtkxxWQQsUrtmqnZED1lkmMmoSE0=;
 b=cK9gu7u7/UUEgz7nDtpzu/XFIlly59Z630zsiaPK67IcSSpWmnrNefkKFdl5xdtq9s
 Mayriqt7QYeLfwFjOd6ehTQIY8y8VxkcfbfEEbriypLQzM3MWqJc5wyz+KvagOuDBfEd
 fWHbh2aH1+7dKmzx/yu/9afQJfCgGO6KCez4w+nkY/uVr/XSa0Cx9vcQx1akdmfWvIRM
 SJ2ewGrupp8ibBUz2tVI2KUs/U/A9iUAOzjjwyR/6jUBCwJxs7e+MkDA1s76CYFu6bAF
 9TMxFG/Merb1NRcL4xs4l7cQtFTiUDFqe0u3Uuon/MxNfU0YEHK+Ys6IfP4Wlx3EV6jL
 tLIg==
X-Gm-Message-State: AOAM531xJDsvp848aL8eHr4vF80x63XLLnq6QfCjdmBeH0FK900kziVV
 JXxn8A/52JAt5P8+OUyCz1615Hz3c2NQ5Q==
X-Google-Smtp-Source: ABdhPJyQhoDxfbdTfEZlFYTTYHSAw8mBT7xm1uAbN5LhbbeCB6dw+kU6YuFvpBFwL3B/FlE6cEq+ow==
X-Received: by 2002:a5d:428d:: with SMTP id k13mr45406810wrq.269.1626906627793; 
 Wed, 21 Jul 2021 15:30:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id w3sm27935611wrt.55.2021.07.21.15.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 15:30:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 00:29:57 +0200
Message-Id: <20210721222957.1169330-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-passlib: bump to version
 1.7.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Update site URL
- Update indentation in hash file (two spaces)
- Update hash of LICENSE due to update in year with
  https://foss.heptapod.net/python-libs/passlib/-/commit/02ca63576ac7749c28ef48365218f291eac9b8e1

https://passlib.readthedocs.io/en/stable/history/1.7.html#whats-new

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-passlib/Config.in           | 2 +-
 package/python-passlib/python-passlib.hash | 6 +++---
 package/python-passlib/python-passlib.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-passlib/Config.in b/package/python-passlib/Config.in
index 23546a18a5..ed4097c562 100644
--- a/package/python-passlib/Config.in
+++ b/package/python-passlib/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_PASSLIB
 	  comprehensive password hashing framework supporting over 30
 	  schemes.
 
-	  https://bitbucket.org/ecollins/passlib
+	  https://passlib.readthedocs.io
diff --git a/package/python-passlib/python-passlib.hash b/package/python-passlib/python-passlib.hash
index 867223e19a..c0652865aa 100644
--- a/package/python-passlib/python-passlib.hash
+++ b/package/python-passlib/python-passlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/passlib/json
-md5	b908529cfd4c33057c244324c692eae7  passlib-1.7.2.tar.gz
-sha256	8d666cef936198bc2ab47ee9b0410c94adf2ba798e5a84bf220be079ae7ab6a8  passlib-1.7.2.tar.gz
+md5  3a229cbd00dfb33e99885b43325e0591  passlib-1.7.4.tar.gz
+sha256  defd50f72b65c5402ab2c573830a6978e5f202ad0d984793c8dde2c4152ebe04  passlib-1.7.4.tar.gz
 # Locally computed sha256 checksums
-sha256	49a74ad666f456493d6b9e2cda7c55e46ad512ce2c67db4accaddb27bb240bb9  LICENSE
+sha256  a95ba8f1af88ff8d5f0d0c33519f430b7f9d8992b69d4bc369ac0423a7a05a89  LICENSE
diff --git a/package/python-passlib/python-passlib.mk b/package/python-passlib/python-passlib.mk
index 6ab94fd66e..013fec74de 100644
--- a/package/python-passlib/python-passlib.mk
+++ b/package/python-passlib/python-passlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PASSLIB_VERSION = 1.7.2
+PYTHON_PASSLIB_VERSION = 1.7.4
 PYTHON_PASSLIB_SOURCE = passlib-$(PYTHON_PASSLIB_VERSION).tar.gz
-PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/6d/6b/4bfca0c13506535289b58f9c9761d20f56ed89439bfe6b8e07416ce58ee1
+PYTHON_PASSLIB_SITE = https://files.pythonhosted.org/packages/b6/06/9da9ee59a67fae7761aab3ccc84fa4f3f33f125b370f1ccdb915bf967c11
 PYTHON_PASSLIB_SETUP_TYPE = setuptools
 PYTHON_PASSLIB_LICENSE = BSD-3-Clause
 PYTHON_PASSLIB_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
