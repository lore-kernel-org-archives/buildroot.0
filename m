Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DF5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BBFB82B1E;
	Sun,  9 Oct 2022 21:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBFB82B1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLtVfkpiCDyJ; Sun,  9 Oct 2022 21:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ACEE8299E;
	Sun,  9 Oct 2022 21:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ACEE8299E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 226F41BF376
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F292D403C4
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 21:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F292D403C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwDaQtl3874v for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 21:15:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E71514019B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E71514019B
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 21:15:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id f11so14489415wrm.6
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 14:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bEK8ELtCHw0BHQ6jFx2Fxg34rooMhGVlCG+nFwNX+Rk=;
 b=YyAYr3JnRVlOd7ueaSohz7lxrcCsD/GBTkuHbuB04eQRW529qpsQrsRozYLYOcVJf7
 2pEIDiU1mPkI7SFINCuUE61FjsU7DVhkLZeQJzJ9zbEOH0bEuiSrxQUKpc/sMiWxUrwz
 2z7q0jyemsmj7mCXWNnHYtU0+EO0UGRUQMsXMHN3YrRnv7O3wLH1tp4bT3mrqhb3Qdpl
 ENaYL7ERjc3ElBEGGVf5/h2JaTlcoIIXUFmWRXlydMnCCU19Rs33QxAm3QKyEVvOcFjM
 k8A9jYZC5Kz5vme4qvak6EAyA0cG4XK111p9SwuVQWFGqaKwVZlRqvSwr2cAaxf19pdk
 LlAA==
X-Gm-Message-State: ACrzQf1W1urSGmSjCmFNPJov2n6j6Vq3x01Cfp/xT0WXBa9zEDLo0pzl
 IwCIXErGkvTphQ9VZw3MvZUarcOiY/Q=
X-Google-Smtp-Source: AMsMyM79Ug3zqev2SfQHF+wdMBif0k7GKex5e8qU+QTSDWU9tbrjLdE8aFlj5IzdKI+ot13RI/81bQ==
X-Received: by 2002:a5d:6906:0:b0:22c:d6d5:6322 with SMTP id
 t6-20020a5d6906000000b0022cd6d56322mr9747666wru.355.1665350146651; 
 Sun, 09 Oct 2022 14:15:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003b4a68645e9sm14310872wmo.34.2022.10.09.14.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 14:15:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 23:14:45 +0200
Message-Id: <20221009211445.62107-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bEK8ELtCHw0BHQ6jFx2Fxg34rooMhGVlCG+nFwNX+Rk=;
 b=K7tC/MdXQ/FtzqpGjkHRBs8Yv7TZZcN3rZpXKOn5H76lBZgAgV0CvuoJQwFqN5Fiye
 D690WF1M0iJgw+iGhWj7CmqWK0CHc03NlH69B2y5iAP+zNSQnqn/gkdepmi8b2qC+RRe
 tCDI0KywKRJWi8h44937vV1tjJwVE9iavpDZAuMXf2F5xDmwPOnBZhEMbp47W5gmQIVh
 QgM/vZoYxlu9c2NEGLkVgurrFY4lTeQbHfPkaID3uBftsMd5GCtn9jdoyNxhDHCoWMe7
 riVQE2XxRyVjQfBzgGJveBbw4EB6hDJ9CEYzNOTgyYXqbqUsAEiwKpAJApebWy/rTVBG
 FJrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K7tC/MdX
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.9.0
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/zeromq/cppzmq/releases/tag/v4.9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 31b93275df..3fbee7af28 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7a23639a45f3a0049e11a188e29aaedd10b2f4845f0000cf3e22d6774ebde0af  cppzmq-4.8.1.tar.gz
+sha256  3fdf5b100206953f674c94d40599bdb3ea255244dcc42fab0d75855ee3645581  cppzmq-4.9.0.tar.gz
 sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 570ad4e3a3..d702cc174e 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.8.1
+CPPZMQ_VERSION = 4.9.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
