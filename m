Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E0FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8128B40550;
	Sun, 11 Dec 2022 20:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8128B40550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JFx8LzNksQp; Sun, 11 Dec 2022 20:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC2E64051C;
	Sun, 11 Dec 2022 20:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC2E64051C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9895F1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7256F408F1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7256F408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CRtDb71j_EHx for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:17:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314B740352
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 314B740352
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:17:14 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b9so10530881ljr.5
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JdkJdjRSi1+Lo+ibsunW02EglLDT+iHcLwC1e21+APM=;
 b=kEik39OlubWU+Dw79kY00t69b1HLrKgKSOv3f6K9iPSjZgi+mPX+dSs5a8vb5EhcEQ
 JFeNxAWbJaMTEaVS1SzZ8TdOQ8E6B4VeC5xb8BSU7+tcFppQZEZe3RUiY7D67j1VZRmk
 Bmlg9IRWHWOBc1K3bs++Tjelaa0LABFav9acY1d+O/AvGnUCLHxhomOxVhWvSlCErYq8
 OPfzCSsyUkA1A/uei63yVB6eTOIs3sTBEqdMlGiNvHdViX2bCdshsb12oHN+TgAKeiMn
 pANaMymflatAWZgNArk/nSEaN90vGoL8q8eW0WA7F3h8wd1/vs+sGN8zntHTPExs3+7p
 7H3g==
X-Gm-Message-State: ANoB5plYBInK9TSjHghYJkDkelM0PDslpa5L8Q4jMIWDDfnBtlmBdxQS
 DQ6lDkakna6pFMgLfgFJM/KwWD4EqeI=
X-Google-Smtp-Source: AA0mqf5vA6F+ak6IXdcI8icsONglcEkTisN1EMz30GL1q+fJR3LWUuFiREcMZCFA2vADn2q5gmFW6Q==
X-Received: by 2002:a2e:9248:0:b0:279:ccea:6839 with SMTP id
 v8-20020a2e9248000000b00279ccea6839mr3069434ljg.22.1670789832811; 
 Sun, 11 Dec 2022 12:17:12 -0800 (PST)
Received: from stuudio.localdomain (94.246.253.165.cable.starman.ee.
 [94.246.253.165]) by smtp.gmail.com with ESMTPSA id
 e30-20020a05651c039e00b0027a2a26a655sm1012867ljp.8.2022.12.11.12.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:17:12 -0800 (PST)
Received: by stuudio.localdomain (Postfix, from userid 1000)
 id CE6392A24A7; Sun, 11 Dec 2022 22:17:12 +0200 (EET)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:17:03 +0200
Message-Id: <20221211201704.25858-4-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221211201704.25858-1-indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JdkJdjRSi1+Lo+ibsunW02EglLDT+iHcLwC1e21+APM=;
 b=Me7b6ByFQUAXw4QRuzwgO8dWFFf0UPnld9/4HQ8OfnzAq4J2CillDnrnaUNZ2G7H3q
 sXAGsyQeQgnTkB3HGg90+csnDHNXkj7fK1eoOwebOoeQkUx02AHK42MAYzrS0oBPmjr+
 49/yWa05g8Db+279dHqO77medbR1Rdj0f6gi8izjKBxDuGvVVt3YJDncN55U/Fu5e/5k
 VV/zIGNaS49ZbW1Yke7pMRQGlhw3ZQ9ugh6OM3r4Jr4jq7TJ7ZLuYyLPQK5X46V4HHMM
 ZjPxTG5XTJGsQjndnJb10uUx+sRk+FnYY97v3vi1ZwQrsqcw9hojBRwuDRfK0qWrvafr
 iurQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Me7b6ByF
Subject: [Buildroot] [PATCH 4/5] board/nezha/patches: delete obsolete
 patches for uboot
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
Cc: Indrek Kruusa <indrek.kruusa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
---
 ...pport-building-u-boot.toc1-for-nezda.patch | 54 -------------------
 1 file changed, 54 deletions(-)
 delete mode 100644 board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch

diff --git a/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch b/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
deleted file mode 100644
index 6e89a921df..0000000000
--- a/board/nezha/patches/uboot/0001-Makefile-HACK-Support-building-u-boot.toc1-for-nezda.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4a923e0e4ef6d2b41cb89d658e269adada847573 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Thu, 4 Nov 2021 22:32:04 +0100
-Subject: [PATCH] Makefile: HACK: Support building u-boot.toc1 for nezda board
-
-For easier integration into Buildroot.  The boot0 / toc1 logic is WIP until
-U-Boot gains SPL support for the D1, so add a hack to make it easier to
-integrate in Buildroot as-is.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile  | 9 +++++++++
- nezha.cfg | 9 +++++++++
- 2 files changed, 18 insertions(+)
- create mode 100644 nezha.cfg
-
-diff --git a/Makefile b/Makefile
-index f911f70344..259d93bf80 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1084,6 +1084,15 @@ endif
- .binman_stamp: FORCE
- 	@touch $@
- 
-+fw_dynamic.bin: $(OPENSBI)
-+	$(call if_changed,copy)
-+
-+MKIMAGEFLAGS_u-boot.toc1 = -T sunxi_toc1
-+u-boot.toc1: nezha.cfg fw_dynamic.bin inputs
-+	$(call if_changed,mkimage)
-+
-+all: u-boot.toc1
-+
- ifeq ($(CONFIG_DEPRECATED),y)
- 	$(warning "You have deprecated configuration options enabled in your .config! Please check your configuration.")
- endif
-diff --git a/nezha.cfg b/nezha.cfg
-new file mode 100644
-index 0000000000..2d23b9b388
---- /dev/null
-+++ b/nezha.cfg
-@@ -0,0 +1,9 @@
-+[opensbi]
-+file = fw_dynamic.bin
-+addr = 0x40000000
-+[dtb]
-+file = arch/riscv/dts/sun20i-d1-nezha.dtb
-+addr = 0x44000000
-+[u-boot]
-+file = u-boot-nodtb.bin
-+addr = 0x4a000000
--- 
-2.20.1
-
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
