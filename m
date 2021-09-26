Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF36FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:15:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA10460F70
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA10460F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83F6960711;
	Sun, 26 Sep 2021 21:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYLAeFiHrqUA; Sun, 26 Sep 2021 21:15:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD5316077C;
	Sun, 26 Sep 2021 21:15:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3BB1BF370
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD08605D6
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yejwjmQ7YUyL for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:15:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F110605A7
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:15:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s21so6102492wra.7
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 14:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0X04Q49CjYh8sfLQLOQ/FP3JJgXfzl1G27SKSOKr6c=;
 b=bSE3t1Py0rWVYZmOb/8mTv7sT1XDCHTc4/znYsyqGMaVM1XrBm15ZhXCiSEiNqpRNg
 XHNqwVIabB3b+Na1lHGHoJLO7htTA34Zer9cAS1BqmjKfg9FjqtOZky8SJ+AKxbCuKjY
 qU1BNvRJK2eYTYQVFLSzY2miTzmRhk5JXnzno7fffGM0yLuOCbrVmBOP4/QKYUjj7wwe
 zmLzR04Ahs9kjE3JVqJftUnNiyZa0JvHl8WITFh6yIAmcuj9OFbzD4T9967TCHFTBC41
 ECUgt+3OF8w6H/ANWNxbwbieQlvMxY/m0UAnHjQC5dMeXrXHoWopDTrT+Jc2NgJ7j40h
 KrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0X04Q49CjYh8sfLQLOQ/FP3JJgXfzl1G27SKSOKr6c=;
 b=YeIXkdn1/ynfJpqWEyJ9DtFQqXnmb7+7EfvFZ8rvz6I1o74G2RXNTLkvYaFnHTxS5H
 i222krDuYeZ5vrJLaCQQOMhVeoMKJW60GHQeMvMdThGYn75faTGJYtlkzLk4xu0U+m+4
 OttJBg0FeCxrV3Jdj75CHQb2uZm++BvnTd67Dl5mpb6xmec/qAs8VfCvVhSr2EG/czmZ
 P2AwOYDAJCOjvIVit/uLJJIPY1prWsNTQXnms/SFnUTeXn74tha5j8TTAXolht01NWom
 cJKqNc1zRmUcKZtyn+aFPxvXTBJ6V5VFOYSLAA+mbB0NbLTSekUDar7DjJGT8+g/bDVY
 D+1w==
X-Gm-Message-State: AOAM530bfXP+idt5k6KTtpAc0Pa6U9iPJrOZYgq/5DRs5zugDIb7NWjs
 PiKvSSIfthrgKXx4QafeRvDiUhXOPG8=
X-Google-Smtp-Source: ABdhPJyk2z5D4bFc/2I8K4Woa9QpVD6Qk6CA9+OisdKXce7jW4GB4QV/jpTog9v49G26uhspKb/UvQ==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr1805330wrr.294.1632690936153; 
 Sun, 26 Sep 2021 14:15:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id g2sm15475087wrb.20.2021.09.26.14.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 14:15:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:15:03 +0200
Message-Id: <20210926211503.897587-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210926211503.897587-1-fontaine.fabrice@gmail.com>
References: <20210926211503.897587-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/mtr: bump to version 0.94
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

- Add jansson optional dependency:
  https://github.com/traviscross/mtr/commit/c2739eaf139b96f4b4937aee9aa484f0e6d1df55
- Add libgtk3 optional dependency:
  https://github.com/traviscross/mtr/commit/5bd8e6c3ba67fdb9445b1ddc3777aca3b0f7053e
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtr/mtr.hash |  4 ++--
 package/mtr/mtr.mk   | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
index 7771e091e2..d6062ef08f 100644
--- a/package/mtr/mtr.hash
+++ b/package/mtr/mtr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3a1ab330104ddee3135af3cfa567b9608001c5deecbf200c08b545ed6d7a4c8f	mtr-0.93.tar.gz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  ea036fdd45da488c241603f6ea59a06bbcfe6c26177ebd34fff54336a44494b8  mtr-0.94.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 0400a12021..07c58a1e93 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-MTR_VERSION = 0.93
+MTR_VERSION = 0.94
 MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
-MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap)
@@ -15,6 +14,20 @@ MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 MTR_SELINUX_MODULES = netutils
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+MTR_CONF_OPTS += --with-jansson
+MTR_DEPENDENCIES += jansson
+else
+MTR_CONF_OPTS += --without-jansson
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+MTR_CONF_OPTS += --with-gtk
+MTR_DEPENDENCIES += libgtk3
+else
+MTR_CONF_OPTS += --without-gtk
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 MTR_CONF_OPTS += --with-ncurses
 MTR_DEPENDENCIES += ncurses
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
