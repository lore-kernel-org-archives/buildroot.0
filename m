Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592EFC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0104B80BE9;
	Mon, 24 Aug 2026 06:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8IbjUwGcNzl; Mon, 24 Aug 2026 06:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553537;
	bh=Uvg90O0Z/uMVlBXn34c2BjrhIfSg3AdaLktX7ywtCbM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbQrVxntK8izqTiZJLlIdcIK2s+fAQd9kW9qmzd3he5BWZV0p3Y93P+nYsyTE4WFY
	 Se/825NHct39KVJ8vpXFW8O2TDGEJQIv9X9fj0MESewn3eO9uu3uXHF+CHMjTUOi8I
	 Nlf0zVI9e8aQz14vW0OXbTjoJP0Q9RyZAdfe3ZHozjd5hL6NgUVW/k8Cd1IfreTqvt
	 iuiBtLk67nz+fb9ZgCNcWmSDqK2OoebgF8arkNZX//P+PR3nzJbW7CcGaE7uvaMVyl
	 oWe8HvBvwfeMwhli9qmMRU7NmK9DU1z+WgAdzCGAYD1qKL/YmTRe7PuG2EcpzoL6cv
	 E3hr/IOVywMKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AEF380DF4;
	Mon, 24 Aug 2026 06:38:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63031386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49AF4400E6
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMJGF3c0fJIP for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bhlFFjk1
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50AF5400AE
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:53 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6a1a546a6bbso5402859a12.1
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553532; x=1788158332;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KWBtMgUxGDYP5eBc3fICQGpY/CIBzigtXv7+wpx6zrU=;
 b=bhlFFjk136hFuAbQbpvbGrTc+C0tfYE59uSucPubkX7QHZugUyIsdBmlRr9X6Nt3bc
 FOOAPR9brUYO8Ca97w0Ec7KuGVcOZkGnC6LKZIVy+h5O7q8GZEltbVMOPyY7t01n7dgy
 7t2upd/VqCuYzqb5eRgPaXBIF5WPPAyiOSckE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553532; x=1788158332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KWBtMgUxGDYP5eBc3fICQGpY/CIBzigtXv7+wpx6zrU=;
 b=bozfEjlmKyrTM8Ul52uYVNhzlAq/2k9o0cm9Rf6XiGVvDd8tywE6T2P8EKsF3UwFJf
 QdM8qQ0ouJRmEYRNiGbos/WdgJq/xSg8U8pAReQdUVBsPoEKDjVZoG28FGkF7eXLfPVT
 Noz11HU8yCPssfmlNrIlbi/00/DoZZbimCx3cyH4bZZ4DtxBPm/AW5jdQcU5gK54B1Ax
 5PTTRj277Gw61C8y0Q57afnKKxpK1NgvQCif7TMlAv2Y4uyZ8sOiGZaw01ktsOlbE46p
 y2il+idFSY76uLWNo356eRlUW42JL7OTapvujVH0ZzCLQ6xDDrS1oKFITmIZh5CCqT0M
 qN4g==
X-Gm-Message-State: AFuF++nGezjPeDCVKtUzI+CPhSCFIC4f1E2i5vS6Ao2Eu6e3DVuRzXus
 beRh0sBYC4lPgGh0xzIimky1V5JEuwPboCQERSyihfY9oYhXVhY75rOYwNlrKc/465k6V5kj/cn
 hh9FZsRY=
X-Gm-Gg: AR+sD13ORKAs3t24DVmOCRbPRAWbEUKnqccH6UZkfP11jR2vXW2voVkwRPkFFutbQ9X
 9iS9qfn7NqcY6XpVecqfpX+anGJ/Q4XRw03tcqMXM8lNeR0DdfFbJy2gNk37nSYQJwEpAEno26y
 qLdNe2Afn/eJt2PgB6KCQ/UGNgcejKcMlFqA4ESMEFMkOEZd63g3bSzMZRvAI401f0DSXNxESxd
 uF2hmnh9bnkMCbhukjkRafWdENC5yCZPD6FutLz4CL4U9bEBOJRr4d7WSIM9w5OV9jnYLCaSxE7
 sZ4L/y6ozpJchKq+DTtBJlmYmyiLtLx0XSInC9yBReQ2heB7z6FoaoAgc/qFSx8JVkCvYTh44tE
 GbCZoyxvj390r5ZGuwq+uvmvDzXLAzsgxSUsu4q3EX+wbJW2h6akGZvvYOaqHyE+heC6lcGaJLY
 9vsAbtc54ipqBBZ82vwclvbHdxcqczE20h5Zw5YX4SQuJxKzYlK7mZHeuAJNia0iF3wZaB6tnDV
 7OpizzVmtS0OyPuBqcTl8JBd0srHQcF/JoxWpSwont0yYyi3vQtKgHD9K+eTg47n7utKiBQPSQY
 d1PCEOwk7AgTSlNI4A8NPVYS+ewTzswcFN6VCGq5ImcYuErPX/dsg6zRiOhhEQ==
X-Received: by 2002:a17:907:9628:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c2469f94a1bmr2646392166b.0.1787553531628; 
 Sun, 23 Aug 2026 23:38:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:40 +0200
Message-ID: <20260824063843.839745-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
References: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 3/6] package/pocketpy: link with libatomic
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pocketpy uses C11 atomics, which require libatomic on architectures
where GCC does not provide native support, such as sparc.

The missing symbols are only exposed when linking an executable against
libpocketpy.so, so the issue is not detected by `test-pkg` when testing
pocketpy alone.

Indeed, in my use case, which was integrating the canopenterm package
into Buildroot, running:

  $ utils/test-pkg -p canopenterm -c canopenterm.config -T bootlin-sparc-uclibc

raised the following error:

  ld: .../sysroot/usr/lib/libpocketpy.so: undefined reference to `__atomic_fetch_sub_4'
  ld: .../sysroot/usr/lib/libpocketpy.so: undefined reference to `__atomic_fetch_add_4'
  collect2: error: ld returned 1 exit status

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/pocketpy/pocketpy.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 23789dd62028..c738e21855a7 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -12,6 +12,14 @@ POCKETPY_INSTALL_STAGING = YES
 
 POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
 
+# pocketpy uses C11 atomics, which on some architectures are provided by
+# libatomic
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+POCKETPY_CONF_OPTS += \
+	-DCMAKE_EXE_LINKER_FLAGS=-latomic \
+	-DCMAKE_SHARED_LINKER_FLAGS=-latomic
+endif
+
 define POCKETPY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
