Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3E5C4707C
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C254E843B2;
	Mon, 15 Jan 2024 21:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C254E843B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1xebz7UdnbL; Mon, 15 Jan 2024 21:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31AFB843A7;
	Mon, 15 Jan 2024 21:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31AFB843A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB741BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5033941FCE
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5033941FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lbf4hhOg6eHr for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:48:15 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CCE341FB3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CCE341FB3
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55790581457so10464360a12.3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705355293; x=1705960093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASgOApS7+Z7PUE/qrdwsHRMRolvyc7iH13a8jIQsqTk=;
 b=rNregKeylTMIBTSLYV3FmDUHU6xxk2dP8OMg98galYczfxqp1tBb56UIj7Io0IFXMh
 HWAASH/VaW+iNB7eqOo6xJvcYMnmnalimwS5ZAvgNBGAbxkgj1OR88+PqmOCHj0Tb3Bh
 nfcGtRsJWxRK8fG7zXFEyL76eRCwwuxaSUOM+JZaXEjGGrlJ2BuGAthVB98+dFxYCXgR
 TztH/hO4/fuJrUq1LnBYfZwJnSVwubFB3MiFrrmJfC+8k8gkSCDfRCFHxyjT87mSGQCl
 FPvl7IqrBFQn7haVPUW6S2kI5xtpW67C5/c0k7AskqA7ZS5BJQFvblZUds+2v8AYhQRT
 601A==
X-Gm-Message-State: AOJu0Yzf/Xss1Cuo7rxE57qGsT4x+vzoXLZjn5qoU3YkHvMJLihpBBQV
 EGZjflm2uyM5G9aSZociiuMpO8It4Mw=
X-Google-Smtp-Source: AGHT+IFXFqRCEcUbSda2jdBAVGvYiRItNJcQNPnuLoubO1p8ULjJs1VpjchMIHCNW9KjZmUDZdfHPw==
X-Received: by 2002:a05:6402:1745:b0:555:3b98:7540 with SMTP id
 v5-20020a056402174500b005553b987540mr2888769edx.33.1705355293473; 
 Mon, 15 Jan 2024 13:48:13 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056402110b00b00558aa40f914sm5636471edv.40.2024.01.15.13.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:48:13 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:48:09 +0100
Message-ID: <20240115214809.2352232-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705355293; x=1705960093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ASgOApS7+Z7PUE/qrdwsHRMRolvyc7iH13a8jIQsqTk=;
 b=XqDQlNr0VlVRaVGmmpqivHHmOd+emhNuZQ3fiDiALZhlhGC0L4P1yaQyqNEIQ2waIb
 UxdE5ASN4jOr9EpAwBtYE+gH7HqivOo0cpT3c/qsortsNwXNv2shfaz5ra8lJrFOiv2E
 TKYNz2MT0alIoeFN8SymaoXTo+mumU6/j6OLzmUKzgn5hQefnD5dD4qfC6nXt1kcy2+N
 tmQ4q5lnV9TtQlX+qc7xFIxcEZwOK4D4g8WlRERleqtBw5wxaf+ekzr55/b/ZGCLknEF
 87FUnwR5zWbxskr4CZbywgVMq1CIz0PwP0qIvjHhAe9oMcczIDRN1YET4tSvbitGos4r
 Mx9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XqDQlNr0
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: bump version to 1.3.4
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libtirpc/libtirpc.hash | 4 ++--
 package/libtirpc/libtirpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
index 1efc3e47e2..40e59f9bcb 100644
--- a/package/libtirpc/libtirpc.hash
+++ b/package/libtirpc/libtirpc.hash
@@ -1,5 +1,5 @@
 # From sourceforge's info on download page:
-sha1  6e52c39148494e4836e2d5d4f28b11ddfa65394b  libtirpc-1.3.3.tar.bz2
+sha1  63c800f81f823254d2706637bab551dec176b99b  libtirpc-1.3.4.tar.bz2
 # Locally computed
-sha256  6474e98851d9f6f33871957ddee9714fdcd9d8a5ee9abb5a98d63ea2e60e12f3  libtirpc-1.3.3.tar.bz2
+sha256  1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860  libtirpc-1.3.4.tar.bz2
 sha256  17cf6098f95bdbb269f0bbc68e76c88fe20487ca7ec53f454923ab4256ecd2e7  COPYING
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
index 179adc97d0..298b3c36bd 100644
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTIRPC_VERSION = 1.3.3
+LIBTIRPC_VERSION = 1.3.4
 LIBTIRPC_SOURCE = libtirpc-$(LIBTIRPC_VERSION).tar.bz2
 LIBTIRPC_SITE = http://downloads.sourceforge.net/project/libtirpc/libtirpc/$(LIBTIRPC_VERSION)
 LIBTIRPC_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
