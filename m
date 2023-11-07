Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2707CC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 16:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13F842222;
	Tue,  7 Nov 2023 16:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D13F842222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqnbgWnMirAX; Tue,  7 Nov 2023 16:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0575F42225;
	Tue,  7 Nov 2023 16:18:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0575F42225
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5610E1BF27A
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 16:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C4F141859
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 16:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C4F141859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9u5xHgRw1OPL for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 16:18:28 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F00344152F
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 16:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F00344152F
Received: by mail-pf1-x441.google.com with SMTP id
 d2e1a72fcca58-6c10f098a27so4445236b3a.2
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 08:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699373906; x=1699978706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jZMFf9GtO91ZhdxaP+/g+/19NKGQWmb97Y7ytsL1H0Y=;
 b=E4ic3GcGNsXn5ggY6O2FBiVk1g9QU/OtIlPzKL3mG71pAeTH5NIaO1+k5fEmj1bzn+
 iZV5dqTn/dIhz1Q+Xs22BJoJjYi6a74sV0wN56/ezeDns3IlIh5VeuNIJWxWHODVx2Ck
 EyhyFn8Jtm+i3pt55vbX7e4X4D3DVc/MXRB6F49sH1bEkwC1ySehlyKJgeuwZyk4g/4K
 rsCYyJV9WVoYPDjgunplf7ovv3bBQwyNA/dk4dasGrDOJaiTGA1EgrcElpAlFhcm9zrp
 6bWLHeYRX1OMkYR8/JAUJEQNW8pQOVYPCFRSot6w5ypvj61yPXAkXpn0OEiVn+vuOIUS
 CJPA==
X-Gm-Message-State: AOJu0YyX2uJepBZMxkWMM4oMYVGQ2o4iLuxlZLzXV8/ZSwdlp67qHWaA
 l30WEYrrCzRE4lBCmz/PIJVQuqA+Y+6y3Q1aUZNgKBoJ14I=
X-Google-Smtp-Source: AGHT+IHapYa69Ll1GR6BDL2lEq+noncY3bbfk3vZSa1tdS8oZMV/TzA49KVAWMFpWxfUYz9RmUjPmg==
X-Received: by 2002:a05:6a00:1822:b0:693:3be8:feba with SMTP id
 y34-20020a056a00182200b006933be8febamr29034261pfa.19.1699373906530; 
 Tue, 07 Nov 2023 08:18:26 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a655a8a000000b005b6c1972c99sm1437794pgt.7.2023.11.07.08.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 08:18:25 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 09:18:19 -0700
Message-ID: <20231107161820.123508-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107161820.123508-1-adam.duskett@amarulasolutions.com>
References: <20231107161820.123508-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699373906; x=1699978706;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jZMFf9GtO91ZhdxaP+/g+/19NKGQWmb97Y7ytsL1H0Y=;
 b=YAISSUr9/QF8C+dFjbP8qncT/YTdwNWLpRWsC0/7+ibVwQZKrPjcjUqwLuI63hAIR5
 7/8zUi63ZJCRC3OmGQAEGyMkm5oQz1GWgtt++ssPdA7xRn09QAX8Nkdzke4x2y16LjAI
 EUbjVXqGIh0PQRnDBW+2vyxPr+rs7N8cYDb9g=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YAISSUr9
Subject: [Buildroot] [PATCH 3/3] package/gobject-introspection: bump version
 to 1.78.1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.com>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/gobject-introspection/gobject-introspection.hash | 4 ++--
 package/gobject-introspection/gobject-introspection.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 063b96275d..d6fd8a9d72 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gobject-introspection/1.76/gobject-introspection-1.76.1.sha256sum
-sha256  196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf  gobject-introspection-1.76.1.tar.xz
+# From https://download.gnome.org/sources/gobject-introspection/1.78/gobject-introspection-1.78.1.sha256sum
+sha256  bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4  gobject-introspection-1.78.1.tar.xz
 sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
 sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
 sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index f0c7fcd2ca..2c0253fae3 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.76
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.78
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).1
 GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
