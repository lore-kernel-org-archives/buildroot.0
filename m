Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F11ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DC7A830D7;
	Sun, 11 Sep 2022 21:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DC7A830D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dODDhAyDmWQP; Sun, 11 Sep 2022 21:39:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0BD82F32;
	Sun, 11 Sep 2022 21:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B0BD82F32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39D0B1BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 139F841675
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 139F841675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfYZJjtMyodZ for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:39:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE304163D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBE304163D
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:39:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so9703291wmk.3
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 14:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=FQKUgbgD9Pp7PaPdBOD8WWsn5pJ0b1+rnFq2gFmJciQ=;
 b=1U0fJUMemzgGgU0gitOX3jUvGfTvzFkJxIFqlLi15944OO4uKhmWOC5xHxR3UN+iNb
 tucEM2P7KvsOUjyT+8fqdUcgehhaUqqDaMPueGL5di9qdDFK/HUqvGq7yQlSiyhqZcMp
 vHiqriSdgHAfV3gfVsscps4/yBlA5X8DXPbtHEAa8DkyZuUjMjjVjJQZ15hcBb8noN2C
 218zT50RywsOt96mPMwAdVEBwNiSdrUkwZyQi8T66EAQ6DnVd2/194NNTVs/1jJoEKXj
 H/S8KlhlO1uLCT801v//zJlsunmqrU+g7E7C/ITaaZB6l3ag6U2pzInlUEX4yKV/jGw0
 oRmg==
X-Gm-Message-State: ACgBeo2Gwc9E2bK3bD+Yct1Iq+n7y1OTGyN5fPNiQk9+PgaA4K7I++ZV
 BmHODdPQa1UO4QS8UbZ74btTCTR1p+w=
X-Google-Smtp-Source: AA6agR7ohmkW/xdZGdHqPlwzJr6uAI61LXgImh2Myg60sU2O3myXQOnAjqIyH2+S+mCiuQiE1Z/yHQ==
X-Received: by 2002:a05:600c:4e49:b0:3a5:dd23:90d7 with SMTP id
 e9-20020a05600c4e4900b003a5dd2390d7mr11943373wmq.41.1662932348839; 
 Sun, 11 Sep 2022 14:39:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n186-20020a1ca4c3000000b003b47b80cec3sm3242633wme.42.2022.09.11.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 14:39:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:39:04 +0200
Message-Id: <20220911213904.189808-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=FQKUgbgD9Pp7PaPdBOD8WWsn5pJ0b1+rnFq2gFmJciQ=;
 b=ii7GUFv7wHMYHzJv03Jg7d0jCREqRsSXAEYkFwq9kSQcQ1sTsvXR64pOxZAEtucqPp
 +lLvvf1iG3di3Bz5oywSQsGa0gWpDhgbQHitUwiAOAtjZzeHGmqxJke7JfkYxsxs0U+l
 Tz6CtpPjg8UXX0ky6dnPcG/lrnAmxXR+DaRWNEJrTaJnfFyWfR22aihFJY6hAM7zB9Ji
 R0LKG/C/KnZ7W64fpjdo0zvjeUVYMDYbesxKI2oLdqdtdGBd9HD1sw6APsdt3XDYNGLw
 +Kr0DXrNlgj1aFUmksDvdft/E1piP+I60W2dC2gsFrRx1p0p0mkIZRwJtZh5fL6/ZFSm
 iRwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ii7GUFv7
Subject: [Buildroot] [PATCH 1/1] package/libqb: bump to version 2.0.6
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ClusterLabs/libqb/releases/tag/v2.0.6
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.5
https://github.com/ClusterLabs/libqb/releases/tag/v2.0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqb/libqb.hash | 4 ++--
 package/libqb/libqb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
index b2c216f24c..de247c2660 100644
--- a/package/libqb/libqb.hash
+++ b/package/libqb/libqb.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.3/libqb-2.0.3.sha256
-sha256  a74582bc886fa625f5238374c7c8ca98672a2519c8196b91276be55886d84e9c  libqb-2.0.3.tar.xz
+# From https://github.com/ClusterLabs/libqb/releases/download/v2.0.6/libqb-2.0.6.sha256
+sha256  f1e744208e8f69934804c14e05d9707668f99d4867de9cccf2f7a6bf4d48331c  libqb-2.0.6.tar.xz
 
 # Locally calculated
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index fb132365f1..0f409fd646 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQB_VERSION = 2.0.3
+LIBQB_VERSION = 2.0.6
 LIBQB_SOURCE = libqb-$(LIBQB_VERSION).tar.xz
 LIBQB_SITE = \
 	https://github.com/ClusterLabs/libqb/releases/download/v$(LIBQB_VERSION)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
