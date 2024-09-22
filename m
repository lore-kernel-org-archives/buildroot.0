Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1268CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE2440687;
	Sun, 22 Sep 2024 09:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvaANpEAqVug; Sun, 22 Sep 2024 09:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D20406CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07D20406CF;
	Sun, 22 Sep 2024 09:23:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1E991BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0CCB606B8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFruj1kWIVq4 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18305606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18305606B1
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18305606B1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so807724766b.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997023; x=1727601823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucWYeingJI9DCD8hQDaZ1DGr9qbnpw2gXZFhvPSmJfU=;
 b=TWoEo9OHDd09TK7vbUvXXw6SrzNOdXFm3cD1sKzi+Q1gRZILqeh7tiyGQzHu0DMKRa
 uxalGqmPfqXR2YwMBQ8FYdbhxKRVw8YA8bLnjcxWx8HhxifBzaxCamdySEtz6boyx5wi
 vaylllTKLpIrQoIDWMVegBcTFwq1nRiFE9zD0OqP2JQenUUNb0W8K4eFerMzRVAlcRRz
 ULG8wyQpdyt9BVi6xERR+iIgrdKK3nWlH5w12/7fBDpzfAnqescl5MnqKdmsKyxeCENZ
 2Z9fAcSKLiciAcYWbY1pZXneO0chhMTt89O7pg4ftqF0J2dvzsLaiTXqN7oc/9yJxaFk
 d71g==
X-Gm-Message-State: AOJu0YwjbCRHCXw6usb7n5rBjNyI12rBdYlYt+nehoMOz+vDwCOqG63S
 o3Du4v9XXff+aLO+dSeHn+CWThsTMka/zRZBbTcL15VwuzIxQtZVJIsHnyUaLnUSgB6fkVp5Fn7
 cnb0=
X-Google-Smtp-Source: AGHT+IFQso4OjwYlXQeyd2GxwSB2OwNrWgqKrHRxj0c0q57HZfnu9VzLDunM3YfFlRgsmmNgaHV1xg==
X-Received: by 2002:a17:907:7ea3:b0:a8d:4e69:4030 with SMTP id
 a640c23a62f3a-a90c1cfb99bmr1378167366b.19.1726997022749; 
 Sun, 22 Sep 2024 02:23:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:10 +0200
Message-ID: <20240922092312.2061358-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997023; x=1727601823;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucWYeingJI9DCD8hQDaZ1DGr9qbnpw2gXZFhvPSmJfU=;
 b=pabKqn4f/B0IUdorDT6E74Mu041yDBhTdnrCGJ25Y8CDainXsCm+kzvqYMRy0WKWxE
 eLshcM3CxtBJo6DVHbv0pmuu+lFISPywtAy9eifFA1XvbYMMLkghRcWd6Zc+NWOe1LO/
 xRyMy8EOQbs18eA29Ca4hr/k1gtR3EpUPCOjo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pabKqn4f
Subject: [Buildroot] [PATCH v2 7/9] package/uclibc: enable NPTL on no-MMU
 ARM w/ FDPIC
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
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

NPTL is supported on no-MMU ARM systems if FDPIC binaries are used.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 73ddd5ef5819..4c360809c3ab 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -78,7 +78,7 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU || ((BR2_arm || BR2_armeb) && BR2_BINFMT_FDPIC)
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
