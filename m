Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328BFC4829A
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 07:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E395E4085B;
	Wed, 14 Feb 2024 07:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ar1KE7UHjWed; Wed, 14 Feb 2024 07:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9937C406EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9937C406EF;
	Wed, 14 Feb 2024 07:20:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F276E1BF364
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 07:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF911406EF
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 07:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SCXAL6VQtw5i for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 07:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7692406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7692406E2
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7692406E2
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 07:20:07 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so6818293a12.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 23:20:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707895205; x=1708500005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lohmS/ThJKZl2ZM5G+WnPKc/zHzq+x8FipgcUKEJU2s=;
 b=v2FOk73cceqIGnpAYNWVVONb/9x28iaY4ZIe2bBXRDtgOVj6LmEhwCd2jHhdpi4dBe
 tkvG3UTX4EOPT42wHHwXaVizOpGLzG73nXce8A9AUjxec59gV3tny3uM8b94SyoD3Sdt
 PgZzhC6R75maJWiS7lGJZbpFb9NWHSD1YClzDnjtAdQDPI72VI1mgNIJCUEJdir1Y3mn
 bmG1ma80P6LrDray6gaXx9IDptBfbrkUqC4XaziBkkETXaoNdkj3V5O27wI5U4nXQAId
 umyvJ6hijegxIcwAdHjcE4M+chwvutffThVuvplE+IIBO/YBOABvZJLfavmlR1kmN61/
 tYaw==
X-Gm-Message-State: AOJu0Yx9MTAVEh3SImH+1DsYLPB6juvvwqGegjw329ga0udzDqGnZglA
 kC94F/6qZd37ueAfNvAlsFFb2rocZOjYG3Zu1ToQ9ixPPdRCLCjWsFXEHSiX
X-Google-Smtp-Source: AGHT+IGivB+Ea9atm2BSIG8oYOZJ2LeYGuCc589xZWNotjMFnD6q6GvdRitD0r0vYvg1WwNld/xLKQ==
X-Received: by 2002:a17:906:ac7:b0:a3d:48d0:d518 with SMTP id
 z7-20020a1709060ac700b00a3d48d0d518mr512699ejf.53.1707895204458; 
 Tue, 13 Feb 2024 23:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJdkTULfMUghLtHA2Ho7f1lvNd9yGwyFl7KkM7HGCg821TGeMTnSM17kafh2IyA3HZUOH+e3gBJFsm5sTjfj01s78gFvFSgdVqvjGoZEVZy3F4nTni6OsONsKRghXWnR3bCtVNPq9+KRAPA9nvVJNczzyRZV/59JUFB3bIZXVViHA=
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 cx9-20020a170907168900b00a3c956773aasm2023270ejd.5.2024.02.13.23.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 23:20:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 08:19:08 +0100
Message-Id: <20240214071908.297656-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1707895205; x=1708500005; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lohmS/ThJKZl2ZM5G+WnPKc/zHzq+x8FipgcUKEJU2s=;
 b=kiCEiiIyK3jyFZLIhX1PQITZ0u8rneoFZ+o4HHX0BaqlAwRPvPj4cjUAtRoP6s6jjV
 KQ/bdDW/OqjIanNNFkIhcQofT/X/VgJo61UCzyXYxVU0Pt6+6clb5FVnEiW+PUvl0YGY
 OEY4H3Ffolq/sGLDCpooaM3VbbG0mYy5EaCfxjO/98eNvJcRoegS6z3mDzFgjoGWJHqu
 hLEAknX+HmMyrQlm4PxJHYAztDQBd0WmyofU0rroP9j20SQin9XOzA7ZJkmBe8uOgbVZ
 6X9QleC2QAQWEZqMqMUFfz6MnnL5Hledmt2wnGDby/x4NNheNC2yfqStd3SsK+OYbcu8
 RfrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kiCEiiIy
Subject: [Buildroot] [PATCH v3] Create a .gitignore file in the CANONICAL_O
 directory
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This .gitignore file ignores all files in an output directory and
hence doesn't change the git status.

The .gitignore file will be only created if $(O) is a subdirectory
of $(CANONICAL_CURDIR) (aka TOPDIR, but it's only defined later).

Remove "/output" entry from the main .gitignore file as it is already
handled by this general approach.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
    - create .gitignore only if $(O) is a subfolder of $(TOPDIR) (Yann
      E. MORIN)
Changes v2 -> v3:
    - also support nested subdirectories (Yann E. MORIN)

 .gitignore | 1 -
 Makefile   | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index bb02d9f572..14b7ca5040 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
-/output
 /dl
 /.auto.deps
 /.config.cmd
diff --git a/Makefile b/Makefile
index ac625152c6..aea6abb4d3 100644
--- a/Makefile
+++ b/Makefile
@@ -65,6 +65,13 @@ endif

 CANONICAL_CURDIR = $(realpath $(CURDIR))

+# Create a default .gitignore file that ignores everything and doesn't make git
+# repository "dirty". Perform this action only if $(O) is a subdirectory of
+# $(CANONICAL_CURDIR) (aka TOPDIR, but it's only defined later).
+ifeq ($(filter-out $(CANONICAL_CURDIR)/%,$(CANONICAL_O)),)
+$(file >$(CANONICAL_O)/.gitignore,*)
+endif
+
 REQ_UMASK = 0022

 # Make sure O= is passed (with its absolute canonical path) everywhere the
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
