Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBC8C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 17:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0419B8143C;
	Wed, 12 Jun 2024 17:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvwHZV6ssqF8; Wed, 12 Jun 2024 17:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA398143E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA398143E;
	Wed, 12 Jun 2024 17:06:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 929A31BF36B
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 17:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8043D8143C
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 17:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5PE2Hs2q23U for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 17:06:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AAD081434
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AAD081434
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AAD081434
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 17:06:23 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a62ef52e837so19641066b.3
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 10:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718211981; x=1718816781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JPOOKwSEmiwKMWoqzWVPqIidcEhB52tLbFKca2Ytxk=;
 b=fIF27AsUf2pxNxGKjZ5oFduvX7v1VSA4GfryOwa6RZeFNe7/sSM8D2q4IfDq8Tk8SF
 jMPCKMDSk2uq3EpJzm14tNup/tRzu/oJAavLd+tbxBQ2BfCCKatTUmHCVdcNH5LiVpt1
 Nys2uow/5lk4jieIUxILQ2U+JsK9aR/zY1vlUoRPnION1pUMx5w6OEZX46/vSBcMWmf2
 Ke0605RPE61ZQO7DB9+s4KHL8ZCIFBVhP1wJUuFIn/qRjODVh0BIGStuSLti+RhWRciJ
 c/HZhhA8eeCSS1t5MVV/vWaIEjS2dlFxIS1TU4ANY3s+Jc8WS8aTff+tFzMCDVtwkIfm
 0vBA==
X-Gm-Message-State: AOJu0Yyr5EHQ7eyrQD87MjnZOrLq6LiT9IUDgHepGaWJslCl0TVpAYue
 iaiTdKZxWLN1uM/by7ZTLydlVFZiJhA7P7A0wVKTMLmeiFb12yddX/dIJv/JgEC+zTcrpVviq3e
 27w==
X-Google-Smtp-Source: AGHT+IGbuznYi1KXLZJGOAETVienonCBHdWXjXQ4F58ZN5wkdbgYw8KWqq/237OUtKHseBMaLElMww==
X-Received: by 2002:a17:906:3498:b0:a6f:16c7:9130 with SMTP id
 a640c23a62f3a-a6f47f894b2mr161537966b.28.1718211981014; 
 Wed, 12 Jun 2024 10:06:21 -0700 (PDT)
Received: from vm-2404.. ([37.66.35.151]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f15095318sm507136966b.131.2024.06.12.10.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 10:06:20 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 12 Jun 2024 19:06:03 +0200
Message-ID: <20240612170604.1931016-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1718211981; x=1718816781; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9JPOOKwSEmiwKMWoqzWVPqIidcEhB52tLbFKca2Ytxk=;
 b=m8hHrsjPwefskkYqxDBO5WaZZdapMvTKgoQRKGEX9CjQTRmR7EH9i62nzmihnWQ4eL
 lWVXKLSScABz6ET3eWsQ6i+eWh12/kNny34ZT6VQf477006mNp5PNunEIAFrllGfy+wT
 UFgY1YWyvBNVCpqmQL2CEuY9/pv5tkk0BFz/cf6w9IiFAG+MQoDV0sOyjuLwW8zhqLYq
 BYZ+X5Onx0GsUZQ45OKbJTr8GvHAZx6uhzhXz3ccYEIa2sbL+8ElRRbT4IM+RYsPoLXY
 1JIjRKhOKBDYYfJy3guLCot5iv+eAY6Hp9RLuZEqkV2ZvEAMVAA9JQMkm1SUIGSkYhIB
 GsLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=m8hHrsjP
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.42
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 0fa487344..a1d8b1694 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.41.sha256sum
-sha256  47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7c8988bd651b6fa  gtk+-3.24.41.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.42.sha256sum
+sha256  50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a94725e2de112377e2  gtk+-3.24.42.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 7e5882f83..547fd194a 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).41
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).42
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
