Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C5FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447B6826A4;
	Wed, 20 Apr 2022 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2_udQ94EQlv; Wed, 20 Apr 2022 20:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5461C81A18;
	Wed, 20 Apr 2022 20:37:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A241F1BF2A5
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 992DF417CF
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 20:37:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGzFSM-Lf1ZD for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 20:37:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C34E4161A
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 20:37:27 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id i196so3180303ioa.1
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1U1edYv94qCYVHjswrKsUOLp3WIxln1V/D/2NbKW4Y=;
 b=gJjJ6EMSDo3KXOW8TdZG+mGOo3rnl2ZM9IRhQAOtht4AKP7VFqGrysYfe6uKAnTJzn
 kg0PX7N0NrUEgKmEk0obaPN77qIBAUdE/+SXXakW+EavOS2Eznantzsq9Jj8hRl7zM4r
 DMotr/vZDP+psanj7GkMmLB3H5VgUNYzKnQmljX7wmJrWqeXLDHjICmopTgVB6GCstoU
 AxbCEcgUGTRPaAuZCHHUIFdQGnzD3z3aFgBlKf9QJM6TDPtSikDHifUr885A6CpjAaOQ
 NcNXxS7xlxHp0wgydvTrNcNfhGEqsJC3JfKYXRUGJEkjtAwz+IcVmwyMZ5POyYS/oQPi
 BexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1U1edYv94qCYVHjswrKsUOLp3WIxln1V/D/2NbKW4Y=;
 b=GEE5ZkxbdrM6J7DYDR7CDdfM6LrV3P9aUdPC/Z+Skpd7a7tUvn30/r0U9ueG3sH0b/
 XbV/fFH1LvLDc4uzJqBalXkhllhhinXfP4W0fqwMptBUiMtkdvIbT7WTtS7QVsbsqRjV
 n8O4heBfkSLsicqvTs7qXTM+Tiwos6wZGJNSOG32cTzcQx+jwD6O21vWzCxvvl1Ly1Xz
 zYL2oErzvtsC1BxM/lwLM9qzxdzqbJ4EN/mzwhBGl4YSvDve5Ahe/nKeSJX4WYAqEufQ
 dghlf2tHImlfeXwEZpKUNj3uRtebfxrvZQBXm5qtJ82FNel+Ycyfgnt0sXPEC9ZzefH0
 cvzQ==
X-Gm-Message-State: AOAM533gErrMOMziGUuMIIlXZqczHCIQGUbfeFodJ7hYD/TLcVtS6L/O
 9kzqaFXpOSTxVOAsEOYynVtM/4Xid/2Fnw==
X-Google-Smtp-Source: ABdhPJxWG67GD3s67oljiebblUX3B8/kMvxOPqtKTUM4KgvViOk4gh5Z53JgidsW6yWBQAs4Ihbslw==
X-Received: by 2002:a05:6638:cd2:b0:326:6043:e3d5 with SMTP id
 e18-20020a0566380cd200b003266043e3d5mr10183843jak.35.1650487046405; 
 Wed, 20 Apr 2022 13:37:26 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 r13-20020a6bfc0d000000b00649e7a72afcsm11433460ioh.29.2022.04.20.13.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 13:37:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 14:37:20 -0600
Message-Id: <20220420203720.1002314-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.2.0
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
index 6bb42d918c..ae3a3463a5 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  479fcd267ff48929bec9a7270e1a96d7  setuptools-rust-1.1.2.tar.gz
-sha256  a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1  setuptools-rust-1.1.2.tar.gz
+md5  50c85a5d19ebb7985dc548c76a3bcc25  setuptools-rust-1.2.0.tar.gz
+sha256  0a4ada479e8c7e3d8bd7cb56e1a29acc2b2bb98c2325051b0cdcb57d7f056de8  setuptools-rust-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 394789b056..c2d8c6d9a7 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.1.2
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.2.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/4e/02/2fc4c83b4f816fdd30f38c0c4837a322d21967f953bb9a51bce91b4511f6
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
