Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670DEE8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 17:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22FFF406EF;
	Fri, 26 Dec 2025 17:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxu6Dfpaeycg; Fri, 26 Dec 2025 17:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C160406D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766771193;
	bh=2ubSnD57ppp9fqvohMFyHpL7LKJy1T+pUt5E/aovzew=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UiynmauJss8gLYOQj1TCNO5M8mFMk4R45hBhcqqEGEy7dZ9UA/w0xCMvMo6FdZRTd
	 SaDYmypC6vIK2CEy8Dn7UmpqWJBdYhIz22J0YRDnoRYmJaIbbGVowiVG1cLuYC1zCQ
	 Z6UnVMam1ZVsR5iXjljxHLhSH0UH+cpQzskAlbBlg4FIf/K0awLjQNkeE70XUMK/br
	 WMt0PQA35LyuRTCupZmQg2WVdjTeEDgtNvSGmJPlhbu1AxBvaVq/R8fOd1CmgLwmrj
	 r3EXdwAfQiEe3M/jnsQtS/Ghh3XIFiN92CEfmGUro2XwTC+QbMOGhm2A7TjLlSFKaj
	 IpRd0G2XDHMmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C160406D3;
	Fri, 26 Dec 2025 17:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF5DEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3966A608B0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79YV3351cQ65 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:46:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F0D360893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F0D360893
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F0D360893
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:46:29 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64b560e425eso9463132a12.1
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 09:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766771188; x=1767375988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJaOQ5XsLrl+mPZeqkprwIM10gpYynIx5zYim7x3+oM=;
 b=ZwuBsr9HWgcel7tVn3Lg1HJbGCJ29bp5Rjxs3FNQRZNx5lKC8pXUULAOyr9qe3nKVO
 X8C8BO68kG2H83JDx3LZHLItghim+SdRpRYjKWkzbrqkIgoIPxwpEhlLMm0zdf7uRvyX
 rytixbDxt4H1DApAc5+j6tlrOAKxKEKOxNgz2AXAEkA55D1Mdfbp+56scweXFrswGsQ5
 df30KdNqlMcF+wv69AGz4ndGF/Tv3xds+h/uHbn14Px3D5/khNuH9/AFYPAGb4tBnd4p
 L7QwQK7LvHZUJZUC/jR80IKuQRKP+mQdmFQryeR1aEPVHaxpGi9I1qwUJvzzwiss+Zn8
 XFDg==
X-Gm-Message-State: AOJu0Yxx0wCuDTPvUdb/1nVyZXlkEFzLXW9uRf/y5oXQWD5ag37D+Z8U
 vLhGjJhnCi0pFvinppziuqFv34k1sQlc18+AogPMGWhJpawW2gOcvo62+jZQuOz8kodGAKHbS5V
 RnB4/
X-Gm-Gg: AY/fxX6OFC+5FPtl5TmOxowltvtXqD0GRZpScOsltSJ7i1YpkkWWRHzCirVFASgt/Fq
 VKLGCNLl86n0O98We74GoXp1nm73lV+yu20D182RXsn9SNstnmwvZeZhHhj5jF4zlDfReLwFKgO
 chHPuO34MQRhjoiaLs48ghBYGXfcjyh1gzNW759O93GAkgDk8kd4wNxRnbOZFZOYL2NxMDIFSRk
 uQejJNsLXn8/n1wULMBynTadLMjd/Dn1k730mQrTQmhaidMhW31L+lyykONh2Qf4V5iy3eDRJHp
 8s+kbHi59WTEDmrYcSqIcJsphY2Yrk/Ik6wo7y+HPD1qrzZC530BtsN0QCvXwtQYr+bqZR8tNZk
 xDnYD3m9ViBTnzZdOwwyJfol7fUhgMitcPfh+KsYXl8shLafgJUxGSKN5aZflAgDI40DS/gDt/g
 1MzG/858o5Fjhc+xMYyhfmfhJVX7fcXr7KpAGA6WNnW4tHUrqu0PvtbGHp/0PTjKPpRtqQUubHp
 sm9M9Xc4ZZ0D/8wy4+FhGHmA+qMYUOwZP/Dk8v28YmH0dtGsx81BxF4GUTpgrWVv3+owJEzwjGv
 7B4JHbCK614=
X-Google-Smtp-Source: AGHT+IEVI5BJIls9OUArnSM4pk5T7qeBdK/WlEaTpXvcxMU2siF7D3Pnvhs2MNTQSyknI1VBQzn34A==
X-Received: by 2002:a05:6402:4314:b0:64d:317e:8ae3 with SMTP id
 4fb4d7f45d1cf-64d317e8df1mr17270331a12.33.1766771187609; 
 Fri, 26 Dec 2025 09:46:27 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-45-45-148.retail.telecomitalia.it. [79.45.45.148])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9ef904bcsm23064936a12.22.2025.12.26.09.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Dec 2025 09:46:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 26 Dec 2025 18:46:23 +0100
Message-ID: <20251226174623.2006300-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1766771188; x=1767375988;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJaOQ5XsLrl+mPZeqkprwIM10gpYynIx5zYim7x3+oM=;
 b=DQNkqAS8QgEVqX0sQjR7bO7CeaTqh+9N08bPRkraIrEPmMk/d7hKdykBJ14GFqUmHH
 +g2MuLlVuot7gXo2C0iE/89i4WuWe6R/zAaS2mwrrRJOjwJgF+rVfWbV5HTRaNrXDr3Y
 VK6ZcVkyg7ffjNbVjTe8RUsjmwNALKkFdEEoc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DQNkqAS8
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: add option for RPC
 Database support
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

Commit 7cea8ad66aec ("Add conditional version script support") broke
backward compatibility for the RPC database interfaces, and indeed the
build of xinetd fails with the following errors:

buildroot/output/per-package/xinetd/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/14.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: confparse.o: in function `cnf_get':
buildroot/build/xinetd-2.3.15/xinetd/buildroot/build/xinetd-2.3.15/xinetd/confparse.c:990:(.text+0x34c): undefined reference to `endrpcent'
buildroot/output/per-package/xinetd/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/14.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: confparse.o: in function `check_entry':
buildroot/build/xinetd-2.3.15/xinetd/buildroot/build/xinetd-2.3.15/xinetd/confparse.c:752:(.text+0xeed): undefined reference to `getrpcbyname'
collect2: error: ld returned 1 exit status

Fixes: 3f3d6e43de9b ("package/libtirpc: bump to version 1.3.7")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libtirpc/Config.in   | 6 ++++++
 package/libtirpc/libtirpc.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 31f1636ef5fd..e7ab2d9c1136 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -16,6 +16,12 @@ config BR2_PACKAGE_LIBTIRPC_GSS
 	help
 	  Enable GSSAPI support
 
+config BR2_PACKAGE_LIBTIRPC_RPCDB
+	bool "rpcdb"
+	default y
+	help
+	  Enable RPC Database support
+
 comment "libtirpc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index ab159545614a..a764526aaf1f 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -25,5 +25,13 @@ LIBTIRPC_CONF_OPTS += --disable-gssapi
 endif
 HOST_LIBTIRPC_CONF_OPTS = --disable-gssapi
 
+ifeq ($(BR2_PACKAGE_LIBTIRPC_RPCDB),y)
+LIBTIRPC_CONF_OPTS += --enable-rpcdb
+HOST_LIBTIRPC_CONF_OPTS += --enable-rpcdb
+else
+LIBTIRPC_CONF_OPTS += --disable-rpcdb
+HOST_LIBTIRPC_CONF_OPTS += --disable-rpcdb
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
