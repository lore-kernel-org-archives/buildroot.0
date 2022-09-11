Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B8ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 21:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A571404C8;
	Sun, 11 Sep 2022 21:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A571404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyIzs_iui4i4; Sun, 11 Sep 2022 21:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4669440169;
	Sun, 11 Sep 2022 21:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4669440169
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 623201BF36D
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 491EB41DD6
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 21:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491EB41DD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJw5D_jZpjUZ for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 21:44:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC914176A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AC914176A
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 21:44:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 v185-20020a1cacc2000000b003b42e4f278cso6690453wme.5
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 14:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=D6HJb1tUuoN+rH4cDLj4g+eNxZyrnnHv97w1fQ1/NDc=;
 b=GXNzW9iYwcJG8OvtLYWii0IVzobL3n4HaqHYCN7dvu3ZSh+8E9J5qCnUHs6dIIskT+
 g1ly6z+kKxx8qZglFu2ouuzRtJb2qNZXu7YaGOktS4qs8KO8DNT+UnHJeyHvqQHtVdtf
 LFXY2nXw91kZN80JGeA0yWEL8e3q58CY60o3aMrCDuTiEdfeJ8sXegRWSzw/lGWAj+j8
 gqAREhO8jLaQJp8dwSG/BOElE1998PXyGfXuTXElEC3NJinUXEEWZRsAeV8F+HzNf1GU
 Mz38MdL3cuzNdeiwRE6ivg3fylg0Gg52bSdz6edk0xap+Krl4L/HvjDNhMuNkjUMaPjo
 BcqQ==
X-Gm-Message-State: ACgBeo2wzrUx93ZgVJg6YUSkXT4ilWsLi6SoVdVqLvOInOTB5c08Cn/o
 bSlHFgKuGj+dmLsjOe7BkNJgmW2un7U=
X-Google-Smtp-Source: AA6agR5pSronudwojsrKVEDdsijrpX9SyTUm3dK8CKCzVM/YX6VMKdDOQ73pfVzxAyo8ftJY9rtT6A==
X-Received: by 2002:a05:600c:4e8d:b0:3a5:f7ed:873 with SMTP id
 f13-20020a05600c4e8d00b003a5f7ed0873mr12258286wmq.170.1662932660953; 
 Sun, 11 Sep 2022 14:44:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 s18-20020adff812000000b002205a5de337sm5626449wrp.102.2022.09.11.14.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 14:44:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 23:44:18 +0200
Message-Id: <20220911214418.192286-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=D6HJb1tUuoN+rH4cDLj4g+eNxZyrnnHv97w1fQ1/NDc=;
 b=jFqjs693B7i66lpZJAJh8Y11ciH93uZaN4ABFhBjV16n9oi8lOBCqHFCcuPBgj6MW5
 X4LqrWO3cxybEoaAQZLQ8GueaPmi+m/dk4LPtEc0nUFRdKYJexbZkBd0iWNhEnGufKZ2
 zAKbqb11v2TWeaj80tMP6gMMYOVxl0YO1It7VmnzxkJfOFCJach7JVQLeFDKviThzc7t
 DiEFu2tajucf4Iq7vyYIzyeApgSKN30lWtdVyCycnSWGHPZfbFp6Jv5Q2kGV80XzLSOD
 2sBaXx1mh0foASZJ2ifH2fZvOw9bvEDNmWLFJO6+5fcMyIyyhxUGapqsOSrcjb4ul9EA
 a6qw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jFqjs693
Subject: [Buildroot] [PATCH 1/1] package/libpeas: bump to version 1.32.0
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

https://gitlab.gnome.org/GNOME/libpeas/-/blob/libpeas-1.32.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpeas/libpeas.hash | 4 ++--
 package/libpeas/libpeas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
index 2b030c01c5..c503558f85 100644
--- a/package/libpeas/libpeas.hash
+++ b/package/libpeas/libpeas.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.30/libpeas-1.30.0.sha256sum
-sha256  0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3  libpeas-1.30.0.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.32/libpeas-1.32.0.sha256sum
+sha256  d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e  libpeas-1.32.0.tar.xz
 # Locally calculated
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
index 097cc860eb..5550162e04 100644
--- a/package/libpeas/libpeas.mk
+++ b/package/libpeas/libpeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPEAS_VERSION_MAJOR = 1.30
+LIBPEAS_VERSION_MAJOR = 1.32
 LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
 LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
 LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
