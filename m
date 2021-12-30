Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29672C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 13:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7AFF400A8;
	Thu, 30 Dec 2021 13:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nww5B61cEKaI; Thu, 30 Dec 2021 13:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC934400F6;
	Thu, 30 Dec 2021 13:57:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 312591BF408
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E63A400E6
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuYPLLY7Y6rv for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 13:56:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CBDB40024
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 13:56:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w20so41609321wra.9
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 05:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltSOsGHOQIQ1VwsQezG7SfJrtTmzp6m1+SSnNrzbZnw=;
 b=iQLoBVwuSB+tp3VjxG6+nfSYdmtNPGM1h4KQjjFPsdpPySoqL7Z9xKSw3EWRiPbats
 nAQ+hRa7FXacRXCh+i7JuVMZ5rBhFKFaOFoc5j0nIoE2uYqmP6DFNeQjV1hLmetssnw1
 aRBa8ahzxpfoxXpII9Hu/4O9qw39WpY4nEeiHQUStVZoE9X6TLk/VwRHG+BhLuHaz35A
 QcUzZoyP747wciSvE6BIMuurdIuxLUvBI1BPjQqFmaP7Zei6XETNCvOTNMJJXZwpgLP1
 jS5ibgeaU1jn4ifWcPKq6nPwub01ZUDkVx9Yd1Gjr3Qq95JcE49RE2n5BQGMJZL/dPLE
 2ihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltSOsGHOQIQ1VwsQezG7SfJrtTmzp6m1+SSnNrzbZnw=;
 b=e9CXy2tqDWSQl33L16Xo9mnce7nBoe/uL9Rb3CABJnfR/kAKJ0C+m4Ktmr053MFMA5
 G7jrxt2xpsD7SCcHCtkdQaT8CnZXU+U2NaDY3BrV+tdvZmmaBv1bB/+v8WUNKNR0AyT8
 xOGxhj7g5KBiNCngcOWnhnm6aB3h2J+XXWt1aLEBGV9RPitPdUay9HheOinb6Yio1JH7
 dPn+UODum3whVf3Z5ZZzpZsMrDwOWGEVtMMvCnJPqq93JSG7jxAO+k1B1zujDVpPx+Gd
 gVTsj7bT8SiEXKmBEHX+7xs1dC8qiLdAZKmFmweGmAaiXvg1EXko8GAHUE40FsjeGrYV
 TawA==
X-Gm-Message-State: AOAM533KacR0icRYff9iM8LmAim06GtCAKi8WrBFrwky7dTO0ee0F5KQ
 5F/wNy2jNRd6lIy6D7UXnap9SWFVnKI=
X-Google-Smtp-Source: ABdhPJwqG1vX85+OIDOFK36gKKT+JpX+FsBmFr76EfkbTbkJVkmzX+uRIcAAbjnSdQ9Ktl2q9EjAJg==
X-Received: by 2002:a5d:64ef:: with SMTP id g15mr25511907wri.297.1640872599484; 
 Thu, 30 Dec 2021 05:56:39 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l7sm24353765wms.1.2021.12.30.05.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 05:56:39 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 14:56:18 +0100
Message-Id: <20211230135621.2255847-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230135621.2255847-1-romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/7] package/enlightenment: bump to version
 0.25.0
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license file hash due to a tree-wide trailing whitespace removal [1].

Disable optional dependency on libexif [2].

See:
https://www.enlightenment.org/news/2021-12-26-enlightenment-0.25.0

[1] https://git.enlightenment.org/core/enlightenment.git/commit/?id=01fd3da2a33c411b41eea3b175c496c14777b358
[2] https://git.enlightenment.org/core/enlightenment.git/commit/?id=10ac9fb3277e599d1ac4d54c0d59faebc064b186

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 8 ++++----
 package/enlightenment/enlightenment.mk   | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index 7f0f3f3e7b..dd4c4d78c0 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,4 +1,4 @@
-# From https://www.enlightenment.org/news/e24.2
-sha256  be18e2f18d6c0b058f633e769863d3cbc4c07b629058ae670dec74cd7906dff1  enlightenment-0.24.2.tar.xz
-sha256  17dda7902d3e1a743f91cf2545f474be93f612768a9e9022593d788ecc83935a  COPYING
-sha256  f4ba47ef8f4ff588202e721ab10f0208a3fa678147e7f928e6b2820f2e646e13  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
+# From https://www.enlightenment.org/news/2021-12-26-enlightenment-0.25.0
+sha256  7d6e72ceed5aca135b7a49c2a1c1eb9d8fde1318613517401d0418e0e5f6df06  enlightenment-0.25.0.tar.xz
+sha256  8d2fbc393e967cd6f5b8559d1744881a6a1ceb3ec6e1c2368c3916809ffccb8d  COPYING
+sha256  cdc77ee1732455b203610f923fe4196046b3f7509038c48dc0b0c7e3492c23f3  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 969b391cdc..640d5a62bb 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.24.2
+ENLIGHTENMENT_VERSION = 0.25.0
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
@@ -22,6 +22,7 @@ ENLIGHTENMENT_CONF_OPTS = \
 	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
 	-Deet=$(HOST_DIR)/bin/eet \
 	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
+	-Dlibexif=false \
 	-Dpam=false \
 	-Dpolkit=false
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
