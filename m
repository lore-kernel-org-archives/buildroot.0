Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178E6C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 21:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A782C60A90;
	Sat, 29 Oct 2022 21:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A782C60A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unH3Y-Np3rtD; Sat, 29 Oct 2022 21:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C26605DB;
	Sat, 29 Oct 2022 21:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C26605DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 870AF1BF4DD
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7043D605DB
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 21:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7043D605DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24WX_ZEKF0j9 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 21:28:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49E3F605D8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49E3F605D8
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 21:28:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so5905550wmb.0
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 14:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bK1CHQjlCKttQv9bdB2bj1UOXGnqLDolN7yV7qdoHIw=;
 b=SEI3qE/Y4SuM2Ah2x7S4KQ4Hu32vVgglr7JO48tfo0tTGTgJZofs3vmE8MFyLhQKKe
 I7c6pFagJrv0qddTvDt5sdafyH2fA/ooRNWYJplaC2rjd3EUXOvbDqXId+DjKHL8rovo
 hp8SHNOVtqdQJZ7Fpc0FcFEJGeALOmi5GuSuu83r0x79jQl0hVsmeIvYEljTwADzYS3r
 BVGMMtf5ZLYAeyBacmGf/vHout2Nq1zKPVe4hLmxIz4yEgcnXHssJZy3/ECMwrwRXU+7
 DrbYFnOCdgTBKTmugwQyfTIkHch4If7I6grE5pCudscm8WpN8GWG+4BbgKANTCRWU+5H
 ObMg==
X-Gm-Message-State: ACrzQf0yFsKpMI5GoScWL201f7QAedDG1LkmR/kAKoeXY2TVHcOnkn9O
 RrnmenkrIeF8upfxrFOXEeS6k/AQjWk=
X-Google-Smtp-Source: AMsMyM4sWyMdI6agJtbnJYG2nZKBoWoFRfuw4gKBmrJnTplf5a72tziKyxpYz76kD3iq0Am5R+cScg==
X-Received: by 2002:a05:600c:384f:b0:3c6:fb0d:4369 with SMTP id
 s15-20020a05600c384f00b003c6fb0d4369mr3350588wmr.18.1667078907015; 
 Sat, 29 Oct 2022 14:28:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n4-20020adfe344000000b002365f326037sm2925756wrj.63.2022.10.29.14.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 14:28:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 23:28:24 +0200
Message-Id: <20221029212824.315760-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bK1CHQjlCKttQv9bdB2bj1UOXGnqLDolN7yV7qdoHIw=;
 b=Rhle8NSO1GMVJd+ZP1aQBAaiN7tw7JaPrDpfFH/KKJCdSAfLZN3864AAhDZ7l8Hdcm
 CjQuubMcPAaFRPakD0DLu+5Nanv3wIUWS3/0pZYTl5EypvtkKFOIpKzLAuAB9klvSiID
 VHWy1eZsG7PGANv50JoQSpEkZrU/NbtHBmrqupg2aTKv2QdY71BdZi1gYhLYDLAtxbB4
 l6/8VkOiObqgOkpM7aGWTtHA7cB3wY2dxZ5Ke1mojZlr+h6UBBpftOY+HVUOqhsF1kxo
 /XahtzQHZryghWW0ZQC/RDcY/ZBNxAAUq4EKZY8PTOY6pBXGDs0vvsXFkoBrV3zLjkKo
 RKgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rhle8NSO
Subject: [Buildroot] [PATCH 1/1] package/libpam-radius-auth: bump to version
 2.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch site to get latest release

https://github.com/FreeRADIUS/pam_radius/blob/release_2_0_0/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpam-radius-auth/libpam-radius-auth.hash | 2 +-
 package/libpam-radius-auth/libpam-radius-auth.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
index 0bf97c279c..63f3f1e45e 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.hash
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking PGP signature
-sha256  742d79fc39824726c098e746bd3dc3484f983f5ee082c621c1e848b2c3725305  pam_radius-1.4.0.tar.gz
+sha256  798dc358e7a143163e103bd38c4101645b2e93d82aa0ec63d32c0cb929d9c65c  libpam-radius-auth-2.0.0.tar.gz
 
 # Hash for license file:
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  LICENSE
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
index 184e48d3b7..9519aad750 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.mk
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBPAM_RADIUS_AUTH_VERSION = 1.4.0
-LIBPAM_RADIUS_AUTH_SITE = ftp://ftp.freeradius.org/pub/radius
-LIBPAM_RADIUS_AUTH_SOURCE = pam_radius-$(LIBPAM_RADIUS_AUTH_VERSION).tar.gz
+LIBPAM_RADIUS_AUTH_VERSION = 2.0.0
+LIBPAM_RADIUS_AUTH_SITE = $(call github,FreeRADIUS,pam_radius,release_$(subst .,_,$(LIBPAM_RADIUS_AUTH_VERSION)))
 LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
 LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
 LIBPAM_RADIUS_AUTH_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
