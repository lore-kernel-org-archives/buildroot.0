Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9001AC636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42541409D5;
	Mon, 13 Feb 2023 18:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42541409D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyPpC30npnQa; Mon, 13 Feb 2023 18:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7394840A14;
	Mon, 13 Feb 2023 18:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7394840A14
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 878211BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E34581BC2
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E34581BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7sLn6wNuzvG for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:20:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F48813D9
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99F48813D9
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:20:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id sb24so10099785ejb.8
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibP5XnSr2CZ8K3N7AgDhAySxWPJhU4l6JQxR3tkjqqo=;
 b=FieZOUPMzf1MPb1DdFYV6FYLIWihjXDnchw//uyAkkF2xr8FMqFipKaAhklcV6LEYZ
 nKLEMf8L0dlv9wI7YA9nPoHI8Sn2wNojjeLd4o1iHYFsUyVZKVzB5ATuB6aPSuY3wG77
 kaqjSBP4Ip6hHcy+e05vm8z5wN2mJkYQLvalXIYVXB3KuV/OY9GLWssQC7DggBdUl4dm
 FL3i9e/pGy+w7i9PUWFC3YF+ivSNlF2d48GVfnaBpMt6uDwnh2751gF9WFeZhoo+vbUG
 pFBT+BelQupdMToo6kMXG8l7K/1WRrXPV3yY9BVVXxQHWd64YH+Z4R+Ze9a9PEvy7J5a
 +GyA==
X-Gm-Message-State: AO0yUKUoBNi2im6h/tPwjZLHeBrWgKaa3qFtG9eFrxpFyacz1VTn6wvG
 /499mnlL3svFM8vqQKOUlrryQLqxB7kVQQ==
X-Google-Smtp-Source: AK7set9uqylAqX3Le9B/3ys3QDfhLyPhlpzQejbE05s24+qpt10oAtpvQdiPclmfX+E9ViDa98GF5A==
X-Received: by 2002:a17:906:af76:b0:88d:9cf8:2dbb with SMTP id
 os22-20020a170906af7600b0088d9cf82dbbmr24120093ejb.12.1676312435357; 
 Mon, 13 Feb 2023 10:20:35 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 v24-20020a170906859800b0088c224bf5b5sm7145165ejx.148.2023.02.13.10.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:20:34 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:19:49 +0100
Message-Id: <20230213181944.10292-4-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230213181944.10292-1-heiko.thiery@gmail.com>
References: <20230213181944.10292-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibP5XnSr2CZ8K3N7AgDhAySxWPJhU4l6JQxR3tkjqqo=;
 b=XpPlQNkIZTTr7H6z8j75tvAoAYsAFLA8LuGmJYMgcpSe5QxN9FmVNBLwtcdf2+jWH2
 hPtWvfV4cgEgo82WHBs9aWKwWgQFbVzKMTBqBWd6KoKJRMZrmbE1g5xff/Fqp3SCWUtC
 rIBlS0AINGnMldgIz/FMBkvrEbrbLr2QqjPqofdaBb05bIxWp1JEt+8cwHWeJTLGwI38
 JzIYrvPmz4BgoZF5otkGLkXUHLMXdv/ELeFVYzLKkUIaDHUB+xll2Vl+vPWbAbIaeuPf
 NWJf87K80CTdJ/QewG5LS34h4JCV5Ib5DGfvNZTnHxE8IK5wMZwEUsqeE/JoVbLR2KkA
 SZfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XpPlQNkI
Subject: [Buildroot] [PATCH 4/4] package/netopeer2: bump version to 2.1.49
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index cc71a2dab8..6a278fbbaf 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b166fe3425bb55b5f330fb7f53158f613bffc07493925ac437193e4d2defb3e7  netopeer2-2.1.42.tar.gz
+sha256  2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d  netopeer2-2.1.49.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 7cb9202575..47fcd31acd 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.42
+NETOPEER2_VERSION = 2.1.49
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
