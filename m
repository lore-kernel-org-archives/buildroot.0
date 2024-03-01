Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A4CC5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 09:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5557160730;
	Fri,  1 Mar 2024 09:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3Xh5qSpDEQH; Fri,  1 Mar 2024 09:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A3EA608E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A3EA608E7;
	Fri,  1 Mar 2024 09:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDAB71BF83B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B924C405F8
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 09:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaH4JhwfnKNq for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 09:55:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99524400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99524400A4
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99524400A4
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 09:55:20 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d944e8f367so14346885ad.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 01:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709286920; x=1709891720;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BzMc+sJjah+8ebgldZrk44Qfqi8RNm4se0fzB5jruE=;
 b=CaGyYx6k0H+0rt4isyOGfBzXpWAKs7xx0Sb+/u0eDG82fajVTst0rIMkyH5rpIhiCf
 kuBGOOOGbsO6Hs7RUHYJ4eWijSSWOiyWO2FXjwCAD3MA6fE8yDg5q6cChFKdQBvhvCji
 ozsfct1L4X5PlTHulM8oHzpYKnXu8p7ftcXYu9ZkIF+H/GmD5v7hmp/OtNP7xRJPhomA
 NQ/9UQI66cLIqd0rdWgu9wgdC7G4JRCWP20p6owNqmcHAcOcbhRVT+tsI/aIcqZFqS1Q
 azwnPiKpxaiFbn2JFYqWlroBVZtYE+oHpuUmUR3b2osYuvP41/cLoFgydTkCqM4NNF8b
 wv9A==
X-Gm-Message-State: AOJu0YyD5aEMxMRPRGRaxTyyy3TNGGs01iCTOwB7xBSLxajKruf4RH4f
 cJdO7HVIzAg9e6LcUdVoG3p93/u3gtBGgIGeycLcg8kJKOuoQku5bzH8mygmv9g=
X-Google-Smtp-Source: AGHT+IGHYZPEtoqAKGKhMKP+j16zDyVZCmhRAZ9uA9zSbOUuBSaR7TtH6fGdaZFqjCBcNpp/mRQPqw==
X-Received: by 2002:a17:902:dac6:b0:1dc:81a4:4c73 with SMTP id
 q6-20020a170902dac600b001dc81a44c73mr1666234plx.0.1709286919605; 
 Fri, 01 Mar 2024 01:55:19 -0800 (PST)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 w4-20020a170902d3c400b001da1ecb05f9sm3003210plb.240.2024.03.01.01.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 01:55:19 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 1EAEA183BF64D; Fri,  1 Mar 2024 16:55:16 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Fri,  1 Mar 2024 16:54:44 +0700
Message-ID: <20240301095442.953549-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=bagasdotme@gmail.com;
 h=from:subject; bh=KsqrysxhGzjAKjbjk5LiLKZZtzbn7hR3jekJU5wz+xc=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhtSHSx9vqd9weIpJ2kvGi9cl75geLpkmvOpo0qtPoktM8
 jtmzLrwp6OUhUGMi0FWTJEleq3sLmPevZfMYhKKYOawMoEMYeDiFICJ/H3MyHBJI/jFy+ttsUUT
 XPhTOE91WqcYbKuv3Xu98dPE6rBziz4xMuxJmHMou5RLw0lvxcFl8lsdLmhZHi8t0Feaol7g4xO
 myggA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709286920; x=1709891720; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0BzMc+sJjah+8ebgldZrk44Qfqi8RNm4se0fzB5jruE=;
 b=Hk5cSIuUI3zHBNbCdmxemATL1aeCgzT86NIhT9P0JDAftglCrI9yD6nnBrxW5wuxqg
 BoKJ1WA+8hygueONJG3YaFx5xROaoq6xG5vG73gkIMcSjKoWS0RbJz8kw2NxGCjSd3Qu
 95GCUcW7RYBW3Myh9PXMcUlBlmwrL6UsEPV2oNy139wtD3HPsoBr3Gy0kEhnPxsWcK9j
 F7bYL1m1sVb5cS+lfwM3VPhT1GnD4257lKf4rLEchlFHjsReZkXkcSjzKzG39tdyg4Yp
 aOHDdE5chYPGdIf752cBhlufgB0ZiZ5HQ6eenqR1U9AlMGJMdY9SANxgixQGI/grBC92
 r/7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hk5cSIuU
Subject: [Buildroot] [PATCH] package/git: bump to version 2.44.0
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the package version to 2.44.0. For the full release notes, see the
release announcement at [1].

Link: https://lore.kernel.org/git/xmqqbk87w164.fsf@gitster.g/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 9cf044cc07..f609a4aaa4 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  5446603e73d911781d259e565750dcd277a42836c8e392cac91cf137aa9b76ec  git-2.43.0.tar.xz
+sha256  e358738dcb5b5ea340ce900a0015c03ae86e804e7ff64e47aa4631ddee681de3  git-2.44.0.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 1502968186..a9cc3c30a7 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.43.0
+GIT_VERSION = 2.44.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+

base-commit: 5f253e3e04e57d72f470eead8591a2606f98d396
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
