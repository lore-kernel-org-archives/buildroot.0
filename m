Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8EFCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAE9D414B6;
	Sun, 15 Oct 2023 19:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAE9D414B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBNwhTz6CTIN; Sun, 15 Oct 2023 19:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3ABC414BA;
	Sun, 15 Oct 2023 19:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3ABC414BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9FCB1BF5A5
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2FFA80E47
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 19:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2FFA80E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAyXSxcAz4lm for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 19:15:14 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C55A280E3B
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 19:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55A280E3B
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32da4ffd7e5so673603f8f.0
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 12:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697397311; x=1698002111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5pP/HMoJ4Pui1K8WQtW4e7rNbTtq+pp5J4y4n4T8J2s=;
 b=JocBDR+cd8H6ocBF3R6Uu3it/AlxJDDuu2BtWZKxzWIkO05z2ga2UP3iq8ORfeOH6J
 tnXIpIOeeJ0P3ExJHOpHs5GNCVJzRbbQG3MlNKbg6QCmtlfCsZ9cwLIj0qvzPXpQ9tFS
 J8VpVHnULPD1yT1aEpoePXRz3uiTKLWPGhZLwgb20tIu+onAd06Y4ICE/PBDxV1gWzhz
 W2QRl78sGAvjCKxO23WT3KvEsFSgb7Zn2JmPUSjRPE7se6eCAFq5+NhgJrLb3azRe/0M
 P+cplruufLnLtMaDkuOmhES26+QxuZF0U1u/FZRh94sq4MKk7LrhjLGdicpBl4OxqjrZ
 xy9g==
X-Gm-Message-State: AOJu0YzR387ttc5cixrATeTiHCgiZptoqAeN5wzx0LLPRTPT3qnQplK9
 pRs7KznRb9p0IWsDnQmws2OWhBqnVHo=
X-Google-Smtp-Source: AGHT+IGB4eeqRrIzu0rwKCavdvtpBxp0cBAf4OABUsqZxICra0Q2DPEJFxfJhiCR6D9Q1/mQ7Ermew==
X-Received: by 2002:adf:a49b:0:b0:31f:fc9a:a03 with SMTP id
 g27-20020adfa49b000000b0031ffc9a0a03mr3406271wrb.20.1697397311360; 
 Sun, 15 Oct 2023 12:15:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e28-20020adfa45c000000b0032d892e70b4sm11465859wra.37.2023.10.15.12.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 12:15:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 21:15:08 +0200
Message-ID: <20231015191508.735072-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697397311; x=1698002111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5pP/HMoJ4Pui1K8WQtW4e7rNbTtq+pp5J4y4n4T8J2s=;
 b=JmWX7WjQQorcroFrVwhrxAN+g2jbls//Neln4rf7XbiErWEOzS272Bb5ed2+bWDDSc
 9nPoaCEAGJ3+L1Bjufyt0OckgBcQq6GL50lQ642TNo83y5XQ4ptH/gDn7GP+RqrE3VNK
 zwHQAQCabwnl+E9HlOypA+2JDe3AsDk3L3OYpThAXLwLaH9DPDrgK+NyLiqvrcy5ksiK
 4IfViS006JeA3pBltvCS6uVPdQfi6t8lg80B4uA6ADALZKmx+qEhjVkrlGUZt/Y69ecj
 dYskamjSTlLc6fatUbwPu3bQRwiVptEL65lxfoYPjLmeFfc5EnPD87SMs1yZecyglchz
 R6DQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JmWX7WjQ
Subject: [Buildroot] [PATCH 1/1] package/nushell: bump to version 0.85
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- This bump will fix the following build failure with libressl raised
  since the addition of the package in commit
  f8047ff5987efc80f6ead51edae126911c02a8ad:

  This crate is only compatible with OpenSSL (version 1.0.1 through 1.1.1, or 3.0.0), or LibreSSL 2.5
  through 3.5, but a different version of OpenSSL was found. The build is now aborting
  due to this version mismatch.

- Update hash of license file (year updated with
  https://github.com/nushell/nushell/commit/a256f6d0d15c9fed69365be36b3484c4c8418d21)

https://www.nushell.sh/blog

Fixes:
 - http://autobuild.buildroot.org/results/8b7e277bb67c52a57e7b9f17c30f1780b9c5ea67

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nushell/nushell.hash | 4 ++--
 package/nushell/nushell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index b553a6c2bc..02fc8214b6 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  352e807698d5f95e9bfdd9dd5512acab3cbef315379299a32e5f322a76eb718a  nushell-0.76.0.tar.gz
-sha256  e189616e535e9f7bf410a72e6fc51ad1e0ae461c58d592e186c2669daa5d1e5d  LICENSE
+sha256  94af22278f584b59c7c4b2390e2d15d9934d5207a756309259d1c4b92f5af7ef  nushell-0.85.0.tar.gz
+sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index b9c1ee6434..779a3c4393 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUSHELL_VERSION = 0.76.0
+NUSHELL_VERSION = 0.85.0
 NUSHELL_SITE = $(call github,nushell,nushell,$(NUSHELL_VERSION))
 NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
