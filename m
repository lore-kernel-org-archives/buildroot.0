Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2FBECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 23:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9BC417A5;
	Sun, 11 Sep 2022 23:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9BC417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAVXyWP5O_uz; Sun, 11 Sep 2022 23:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F0D417C3;
	Sun, 11 Sep 2022 23:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F0D417C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EB0A1BF427
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F3E6105E
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 23:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F3E6105E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MptI6-g-tw8i for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 23:05:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA006104E
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AA006104E
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 23:05:26 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id n81so5285018iod.6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 16:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UsqF2qFBauMHtOd9hK1Cj0nFcO0KOgA5j5Y1ZgGXNVo=;
 b=lDki0fQGFXJ/7FjgT6Wk56UBaWro80etDvbeRpsI+ZTw+H4k/b4ff1RkebtV0ZvAfQ
 76LAKxMmWYC6Tohg6WU6FuwhOpvM+4Ggx9ssswyfuVzLbLBPaRdqV6Iqp94CKx5k6Be7
 UvWeaGjANIXpGRcFaoUsXjXsUkqZDjeguhV5l6aLvMJDN6PpsU1u7lAhaMXb9FNE31Ju
 l3AunaU0tXd5tr0AAhaE+q9MhLh2pyMUJ79pG+rhmlQeyfjDzdGZzVrIgJoJxz3Wnt42
 ruiCxVCMHza2poFz3n7ikbpY5YteEpbkrM4oN9lM8Kp4pUgFnRe5ahQWJ7VtYEqPkYlt
 Upzw==
X-Gm-Message-State: ACgBeo1layp4qG9SupYcwkLrouLzT4qdSZg4LTExYve9L5zVYVcZPa2G
 HeiUMPpgyBB48O4kBn9UIWuqHZtlo9U=
X-Google-Smtp-Source: AA6agR4NbCUov6CEuvJhUomphWFXsTxrXmiJ9u3Q8b5tFHVi88cCHfINZn15HP4q8SkeSn4p0yM6DQ==
X-Received: by 2002:a02:7b19:0:b0:34a:74d:118 with SMTP id
 q25-20020a027b19000000b0034a074d0118mr11844524jac.62.1662937525772; 
 Sun, 11 Sep 2022 16:05:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 m12-20020a02a14c000000b0035671c2e249sm2781646jah.146.2022.09.11.16.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 17:05:24 -0600
Message-Id: <20220911230524.3733051-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UsqF2qFBauMHtOd9hK1Cj0nFcO0KOgA5j5Y1ZgGXNVo=;
 b=SeGnd4XcwYJztEKrNxqDgTNiAHOQ0fWPGw2uSQ/0Nrgqk0IMPIM1jkd8SQ6IitvuZJ
 r+rnpJGHJMliHC329owWFAXKxZbvsrlIHe6hxCaaHcLq3VR3Q5S5ur88oJ1mhl9rAB/I
 tKK9QJS5fs5qiy/TZv4AzB1CiUs4JRZWrDGUoEk76NHEru6JNsUGbJLBMPJ4FYg55/YP
 f6lx6NUk3dMLbmTvDJ09XW7u0KpmH+8RebIexgjDKZ6+1A+103E8LDhv+ZTMGfvXaHDi
 vlZYl+ksP+R1DfKm3MjQe4R3lRcnSzQGgDarFzd5+XY4vnc9VrT/NnOBBsYc88GEnZQa
 0Fzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SeGnd4Xc
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.5.1
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
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 066d5d8a48..e503e7ef18 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  b38674b0b0f8b21063a07d442aa0d759  setuptools-rust-1.5.0.tar.gz
-sha256  0b8aeb814afe0e9d7c31569ec0936d1f5201993530639244fa973e1742005671  setuptools-rust-1.5.0.tar.gz
+md5  deb0db6178d296876564d0bcbda8d212  setuptools-rust-1.5.1.tar.gz
+sha256  0e05e456645d59429cb1021370aede73c0760e9360bbfdaaefb5bced530eb9d7  setuptools-rust-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 846ff84356..44fce8f843 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.0
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.1
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/20/84/a98f6714ec6aafe3ec2bfa26232af3302453882a1c135f9b518a36275e22
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/dc/20/0b16eb0dd28c3ec6fccef77230b11e4b9ec94aa7ade1c99b1ab66d237fbe
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
