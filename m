Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BE2ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3DB0842D7;
	Sat, 17 Sep 2022 22:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3DB0842D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkQnmcYA1yLV; Sat, 17 Sep 2022 22:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFC2D83FE4;
	Sat, 17 Sep 2022 22:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC2D83FE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2967F1BF2C3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 22:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F09D740119
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 22:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F09D740119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKl3smyoihUB for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 22:06:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FAF6400E4
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FAF6400E4
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 22:06:51 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id p187so10298448oia.9
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=9+fH3WiduPwgunOcvj5YOHakJ2ZN8TTntVUDcVm6AUs=;
 b=APgG+j4sou2nu3AyJqP0bev3hgSpoX+m54HRQ7Zxu2YkfUq9nXxahqEag37rqDIzah
 yeZF4yhRYSC16V3QpP5+7zeW528+otuo1x7VyhwRKRTeIx/1oD5hO+ir3ELG0vjdXDzY
 CwoyO3fCDP/ndGlpg9ORChCYMJxZ47+/NdCKpPD/EJ+BZcteMtN9Tkw//L7phIy5F9vg
 XK6vZ7LIAY7Jgv6KYkQgPV0eUZPCkRYon+PB+PF/dKAlOXUs1spESAgpsPfOgfDU9R54
 DikGXsMG1hFB0+dsJY3fZsGX8IF8YzbcFBwhjF0pQ9yqbRYUpCpCuD0ou5BxZ76dGygs
 LDpQ==
X-Gm-Message-State: ACrzQf0tpsYpUOa1WTygopgPWn6Nsln2uoTMwvOROTaLdrigW13ddl6Y
 NurtypdXUTSrcixUk18/FxuXOmLEOBQ=
X-Google-Smtp-Source: AMsMyM6kz/025uwKQkVo+E3GkCnqhYFdVJ35j1o/DeCkiiL5R3b5ghWqGdBzUQQbvFeCDlZ5JLu3ow==
X-Received: by 2002:a05:6808:2127:b0:350:2ff8:7e16 with SMTP id
 r39-20020a056808212700b003502ff87e16mr5088396oiw.93.1663452410348; 
 Sat, 17 Sep 2022 15:06:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 u15-20020a056871008f00b001278611f0f6sm5318479oaa.32.2022.09.17.15.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Sep 2022 15:06:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:06:47 -0600
Message-Id: <20220917220647.1453182-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=9+fH3WiduPwgunOcvj5YOHakJ2ZN8TTntVUDcVm6AUs=;
 b=DLT/qJkN3jYKqHehOf/VqLpyPLEzfdmOucJdoUG3qNUF3E1tJD1PxAqfrmnYoFnaIT
 WWQlq+scKoQg9Aax3n/1bIzfSN1hoIOt5WmredwYVyIBCqPR6wSkHNJ54Fkp3UZy4v9X
 JU3b5Gk0puF2dYycCPp6eamcIv6sziNZyBEzGD58j4POxbM4Mn/MtyzZdtJC/87bHvNc
 Txl2YNWBweNwKB0Jrf18KofU8xKit185mYwEBkyvfEF2Fqiorz82dGKyZvU8sqKW5Mw5
 hHEmnNBcmwXpG47+YmJziFE+AsTfa9eQ/XYczVSmJGk6crwlndL6P1v/DUudM7PJek39
 LTKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DLT/qJkN
Subject: [Buildroot] [PATCH 1/1] package/wayland-utils: bump to version 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for new drm(libdrm) option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wayland-utils/wayland-utils.hash | 10 +++++-----
 package/wayland-utils/wayland-utils.mk   | 11 +++++++++--
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/wayland-utils/wayland-utils.hash b/package/wayland-utils/wayland-utils.hash
index 00b6da4033..c9b16e0535 100644
--- a/package/wayland-utils/wayland-utils.hash
+++ b/package/wayland-utils/wayland-utils.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-July/041565.html
-md5  714875aefb10e7f683cde24e58d033ad  wayland-utils-1.0.0.tar.xz
-sha1  b5b8d498a892866d56ffbe862039d7c97acbe7bc  wayland-utils-1.0.0.tar.xz
-sha256  64fecc4c58e87ae9b302901abe10c2e8af69c7503c221a96ecd0700e0aa268c0  wayland-utils-1.0.0.tar.xz
-sha512  4c6f1822435b36b3acd361c0c54e56150e8a2697a9c4b2c20a149fcfaafe237e45807df3471884ddf594d89558001099e2d938e3f48988ba6950a0f1e3538db2  wayland-utils-1.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-September/042399.html
+md5  1a398cbb75c3ac1ac231b2a8f84bd6d6  wayland-utils-1.1.0.tar.xz
+sha1  38e5c37f5b35b86a84289659b4b0796811eb66cd  wayland-utils-1.1.0.tar.xz
+sha256  9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a  wayland-utils-1.1.0.tar.xz
+sha512  5b841ecb9b534a9b353e104dda9410961495495380fa65e32ef40855750609b03942a87c2fd66339aab57c05b3b8699e2bee055cfd44151f9609a5f6c53349df  wayland-utils-1.1.0.tar.xz
 sha256  1eba39c11640014a5841dd3017e5245fc31f47e1cf43a3287a286dd6a8de8a1a  COPYING
diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
index 30a33b61d6..bc648a6904 100644
--- a/package/wayland-utils/wayland-utils.mk
+++ b/package/wayland-utils/wayland-utils.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-WAYLAND_UTILS_VERSION = 1.0.0
-WAYLAND_UTILS_SITE = https://wayland.freedesktop.org/releases
+WAYLAND_UTILS_VERSION = 1.1.0
+WAYLAND_UTILS_SITE = https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/$(WAYLAND_UTILS_VERSION)/downloads
 WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
 WAYLAND_UTILS_LICENSE = MIT
 WAYLAND_UTILS_LICENSE_FILES = COPYING
 WAYLAND_UTILS_DEPENDENCIES = host-pkgconf wayland wayland-protocols
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+WAYLAND_UTILS_DEPENDENCIES += libdrm
+WAYLAND_UTILS_CONF_OPTS += -Ddrm=enabled
+else
+WAYLAND_UTILS_CONF_OPTS += -Ddrm=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
