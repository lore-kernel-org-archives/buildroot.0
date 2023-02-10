Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D0C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 18:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A87924115D;
	Fri, 10 Feb 2023 18:02:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A87924115D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tm0nDQleXI7A; Fri, 10 Feb 2023 18:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C96FD41164;
	Fri, 10 Feb 2023 18:02:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C96FD41164
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE1511BF479
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 18:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8866261042
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 18:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8866261042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juh6S5vYpHx2 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 18:02:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BAF460A70
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BAF460A70
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 18:02:41 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 a8-20020a17090a6d8800b002336b48f653so4579731pjk.3
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 10:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AnUmkZlf7MK5lhSMJySlvmuOJ4YW2tQ+fw5E3H2uI78=;
 b=m7iHBVKkOOkXtJWWa5IX1T5FXaMF6Y83CGBB5qgVtHlU+QJIEBoaDjA1/0aiT1hDQO
 lIhLnsGKgbKhl4s3JlmF7fk01PZEiySsddg5XuIj52NltC68jsR0oKiDk6z939NQG7uj
 CsXJR8+kyx+mJNuAihgxRdqHDMmwAspkFHckjYdd9qikXZsp6PGJpJ5uCBrRw6XADH0R
 /Dqaq05zutY4fHKlimccoGFFGLVaoHgDFLlWmmPK6E21SJ6GX0ZmeiWJrEcgqczpyo2k
 EJrgV+P1QESF5/UQkkyV+9WE9g+/9+9Cp47yi3AOGLXYU6WaklG0kU/4n5rAZ5UktFcF
 sLDw==
X-Gm-Message-State: AO0yUKUQMSzEQ+cGE2oUzG1loh6qxUJXTVQ3Kof+Aa3W/nRTWcj5StyT
 tcfqIZPbBSA0jXJ6NaCli8dIanu8eFs=
X-Google-Smtp-Source: AK7set+wfJSv69U9sIH0QXmFvGtcII8s5NXukvrSdq7rw2FAJzDOpa5XsnXHJ6rBnBV/Fwg5y5t9ow==
X-Received: by 2002:a17:90b:1c0e:b0:22c:6d7c:c521 with SMTP id
 oc14-20020a17090b1c0e00b0022c6d7cc521mr17180995pjb.45.1676052160438; 
 Fri, 10 Feb 2023 10:02:40 -0800 (PST)
Received: from ax.lan ([64.139.108.195]) by smtp.gmail.com with ESMTPSA id
 q32-20020a17090a4fa300b00230d7b6d162sm5386374pjh.37.2023.02.10.10.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 10:02:39 -0800 (PST)
From: Akshay Bhat <nodeax@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 10:02:22 -0800
Message-Id: <20230210180222.88328-1-nodeax@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AnUmkZlf7MK5lhSMJySlvmuOJ4YW2tQ+fw5E3H2uI78=;
 b=qHh/xXvr+Xgr4RL1WFwvuSG93yW6sO9xsYHnVhCZeBLK2iH+TLAnuduojvhT8dRIR1
 Kr44UgvXEZD9RD7AGfa+5wlvtvJdoAqqAiHcGTNDKyakdhQkeVlOkq+zS7e40cuYLtIv
 ahKMQfiI3+sp19Qa+RKoY5Pz0NuSp0+/JMbEjWRQ0MtFjS2u4KWAKhvkfO1cbJtfi6Mm
 MXUNLPeIoMPjbnCNRW/b+4VHz3GOh9EdQdovzGpNH80V1Uhy3iMOEe34djSyjd/mcZVQ
 dYPJ2Jx0DELthb7VWrgh7WfKjbYdYAQl/9TTvgFjxBPOOWxtwZxWDAyrt6e2FRjO2ZQF
 JA2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qHh/xXvr
Subject: [Buildroot] [PATCH 1/1] package/libiberty: bump version to 2.38
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
Cc: Akshay Bhat <nodeax@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the libiberty package is not the same version as the one packaged
with binutils AND if libiberty is installed before binutils, then the
below error is observed. Hence for now let us keep the versions in sync.

/usr/bin/ld: ../libiberty/libiberty.a(hashtab.o):(.data.rel.local+0x0): multiple definition of `htab_eq_pointer'

Signed-off-by: Akshay Bhat <nodeax@gmail.com>
---
 package/libiberty/libiberty.hash | 2 +-
 package/libiberty/libiberty.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
index 0dafcea520..74b2d89d31 100644
--- a/package/libiberty/libiberty.hash
+++ b/package/libiberty/libiberty.hash
@@ -1,5 +1,5 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
-sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
+sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
 
 # Locally computed, same as binutils.hash
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
index 6235a8b956..e0e6987ad7 100644
--- a/package/libiberty/libiberty.mk
+++ b/package/libiberty/libiberty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIBERTY_VERSION = 2.32
+LIBIBERTY_VERSION = 2.38
 LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
 LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
 HOST_LIBIBERTY_DL_SUBDIR = binutils
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
