Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28001C74A5B
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A89F61AE1;
	Fri, 17 Mar 2023 15:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A89F61AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_Gb6ksVX1JP; Fri, 17 Mar 2023 15:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6343561AD5;
	Fri, 17 Mar 2023 15:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6343561AD5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BEFA1BF21A
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2399B42499
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 15:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2399B42499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lG-o6kXE3gTz for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 15:18:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7BF5401F3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7BF5401F3
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 15:18:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g18so3601533wmk.0
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 08:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679066286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fJTSPCGmMSTVAa9aHbevIyGto+kqxaNQDi1e50anF0s=;
 b=34UKcKh/edZL6/53T3LpZih3aWy5pGifxGVtliehoX8ud0gy9SzIUkCPDp292rKZIo
 juk3PsnkmwUjMXWkl3o69UZF+9np2u/gSv0oHuMDpYO8P6ykMSUAom1BTHg3z2XjRlID
 oSr113RG3wn7wtCKLYawAgj+Nq+DUGEzv9CP+FfQ64HCfJq6vE/qYeNiWpbKyRuiFFgi
 iAxxqAAEHFlwpPzPJMy/BYeeOREqpKCzUwywGdjA/KNFpnBvOd0Y7gu2REFhgikEl6cG
 70PLWGVySSUu4esXpMFMyfJu2a/9ujCHvwqqTJCAypH4AYSdX411NN1u0I+ob/+XEEI2
 PzMQ==
X-Gm-Message-State: AO0yUKWt85H9sp1G105ZtBZbo+CRTeW8n4R5mTHHGcKUEPK+Pf/O7SHa
 nULdFRIZBjmjvK4IByZr5S5zTAa6Fji3Ke2QJeM=
X-Google-Smtp-Source: AK7set8la55HavbgM6YmpmRLDmhx3kZilPT1mtlhbatgJ7s5gTNX1ESZaCXJBzxaMwBcWMF68vVqxA==
X-Received: by 2002:a1c:cc08:0:b0:3ed:711c:e8fe with SMTP id
 h8-20020a1ccc08000000b003ed711ce8femr4195736wmb.2.1679066286319; 
 Fri, 17 Mar 2023 08:18:06 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:536:f783:8f4c:a6f1])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b003e1202744f2sm8487612wmo.31.2023.03.17.08.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 08:18:06 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 16:18:01 +0100
Message-Id: <20230317151802.1242858-2-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
References: <20230317151802.1242858-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679066286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fJTSPCGmMSTVAa9aHbevIyGto+kqxaNQDi1e50anF0s=;
 b=xq1YP07N6rHE6FgdVsK22iSymTGh79RNbUfB+NcX1HFDurnwCOwicliB9YCoUfwHTJ
 vMrX6jeg2Prioq73Uo4RCYbUr60CwDnR57Xj9GS5HK/E9NypLYrmpZw6AQ/6A3qvO+FS
 5F6ncg7pPBJrBJ9D6sc0GyU36l5/aIOwufJzHOfXOBhQGs1VZAEw6TBzFP0sQenLmaeJ
 QP0RhuMXkB9TSXoYyacE9Qam7RzGsiH9wSxV2G+jFlJuIosqe2TGAB8XGwn9EFBy1sew
 G6Tkp6dZ0BVmg0DBq/Tka70GxJMt3PLVAp0dRK4X9E6B0UBrDDPA3BXSo+OfIVENYccv
 vVmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xq1YP07N
Subject: [Buildroot] [PATCH v3 2/2] package/uutils-coreutils: remove
 creation of autocompletions
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 ...emove-generation-of-auto-completions.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch

diff --git a/package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch b/package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch
new file mode 100644
index 0000000000..524b5b05da
--- /dev/null
+++ b/package/uutils-coreutils/0002-GNUmakefile-remove-generation-of-auto-completions.patch
@@ -0,0 +1,45 @@
+From d212a5bdfe4207316c4410191e61b4d52c3c633a Mon Sep 17 00:00:00 2001
+From: Sebastian Weyer <sebastian.weyer@smile.fr>
+Date: Thu, 16 Mar 2023 15:58:25 +0100
+Subject: [PATCH] GNUmakefile: remove generation of auto-completions
+
+The install step of GNUmakefile by default includes the generation of
+autocompletions for bash, zsh and fish.
+
+There are 2 problems with this:
+
+1. In a buildroot context we don't always have bash, zsh or fish
+   installed and therefore we probably don't need these anyways
+
+2. These autocompletions are generated using the compiled binary. Therefore
+   if desired it should be generated on the target itself. Otherwise it might
+   not be executable on the host.
+
+Upstream status: not applicable; Buildroot specific
+Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
+---
+ GNUmakefile | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index faecf420b..1c44cb3c6 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -346,14 +346,6 @@ else
+ 		$(INSTALL) $(BUILDDIR)/$(prog) $(INSTALLDIR_BIN)/$(PROG_PREFIX)$(prog);)
+ 	$(if $(findstring test,$(INSTALLEES)), $(INSTALL) $(BUILDDIR)/test $(INSTALLDIR_BIN)/$(PROG_PREFIX)[)
+ endif
+-	mkdir -p $(DESTDIR)$(DATAROOTDIR)/zsh/site-functions
+-	mkdir -p $(DESTDIR)$(DATAROOTDIR)/bash-completion/completions
+-	mkdir -p $(DESTDIR)$(DATAROOTDIR)/fish/vendor_completions.d
+-	$(foreach prog, $(INSTALLEES), \
+-		$(BUILDDIR)/coreutils completion $(prog) zsh > $(DESTDIR)$(DATAROOTDIR)/zsh/site-functions/_$(PROG_PREFIX)$(prog); \
+-		$(BUILDDIR)/coreutils completion $(prog) bash > $(DESTDIR)$(DATAROOTDIR)/bash-completion/completions/$(PROG_PREFIX)$(prog); \
+-		$(BUILDDIR)/coreutils completion $(prog) fish > $(DESTDIR)$(DATAROOTDIR)/fish/vendor_completions.d/$(PROG_PREFIX)$(prog).fish; \
+-	)
+ 
+ uninstall:
+ ifeq (${MULTICALL}, y)
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
