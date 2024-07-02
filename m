Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FC4C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D46BE81091;
	Tue,  2 Jul 2024 19:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SUpr8i1kYA2T; Tue,  2 Jul 2024 19:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E530A8106A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E530A8106A;
	Tue,  2 Jul 2024 19:29:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0996B1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01CA18105B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OjfjvMqmM_y for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:29:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E4728104F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E4728104F
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E4728104F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:29:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a72517e6225so534879866b.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719948587; x=1720553387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OjpKSZaXC7yuW4cOVC1a63NeFjjyF9a1Gh+23EtbVE=;
 b=lTDH7xpgQWbspaDOjCmucl+/RKLmMMfNtdG7WCk/j1eaC3LAiiSAY2F+ipMoNyifLA
 WSMrTpz3gOHWRrb+fnO9AJy6S7v7jmZs1r6xgzb5oq2WQ1PvckZDWoijWoZ3OlQ8N9WP
 EfEEjXK1jJAM0HhITKwYHGZn7e6h/PoVEP+K12UCgolObOZsqT1jT/M6dNHILz93+ibJ
 MFXU3lSWllMqupMc3QD9yoytSP81FNUKzlt08Tefbu2emrcVduhRVkbEM15OHGLKfGax
 l8wsf3B6TfCI/Hc7L8SPi0zhRW66Y9GXJc1UQN2HzuE16GwTcss7566LNjTOCpivB0uk
 0Fhg==
X-Gm-Message-State: AOJu0YyJ//sHTjkGM48LC0bbnMhCXKjqMfoQL618TzcE5JjNNOkecJzC
 WT0HkcQcVTCedYSc0RXjLeKEKRyCBbrGMZ3JyILHLJjK4DkDrC7K2rRJ16zop5er6TZidmdwGR4
 Kw10=
X-Google-Smtp-Source: AGHT+IGtr/pVscnz5JE7mBplnwXFydpJE/4Bp3YFuv3iypuR764uSP6qUpw5zMISsUYIKnhtCoeZbg==
X-Received: by 2002:a17:907:724c:b0:a72:6b08:ab27 with SMTP id
 a640c23a62f3a-a7514438782mr838620866b.36.1719948586597; 
 Tue, 02 Jul 2024 12:29:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab0900f1sm443703466b.168.2024.07.02.12.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 12:29:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 21:29:41 +0200
Message-ID: <20240702192941.2480257-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719948587; x=1720553387;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9OjpKSZaXC7yuW4cOVC1a63NeFjjyF9a1Gh+23EtbVE=;
 b=MspPXsdaPEiWmtyR34WYpFsJn+32aTn4Iyrnni3Na+8946reFSDt5oBakMI8mOhlgN
 HYs6aLqnh/dk/4XKUIXPPewezwJ47HgSKEe5knTUYKHQfmNBKAfyrkRgQekw0sxjFrPG
 dOkmmhe897j60f2XWp8fubjeLc6APXZtxTAX4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MspPXsda
Subject: [Buildroot] [PATCH v2] package/libhid: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libhid fails to build with output:

    Applying 0003-uclinux.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 80.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Add Signed-off-by tag to the modified patch.

 package/libhid/0003-uclinux.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libhid/0003-uclinux.patch b/package/libhid/0003-uclinux.patch
index cb3c45216a09..9f4502ada931 100644
--- a/package/libhid/0003-uclinux.patch
+++ b/package/libhid/0003-uclinux.patch
@@ -1,13 +1,15 @@
 Good old 'uclinux is also linux'
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -Nura libhid-0.2.16.orig/configure.ac libhid-0.2.16/configure.ac
 --- libhid-0.2.16.orig/configure.ac	2014-06-22 09:35:50.277261742 -0300
 +++ libhid-0.2.16/configure.ac	2014-06-22 09:36:10.688951947 -0300
-@@ -80,6 +80,7 @@
+@@ -79,6 +79,7 @@
+ AC_C_STRINGIZE
  
- MD_CONF_DEBUGGING
  MD_CONF_COMPILER
 +AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "uclinux")
  AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
