Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2E9C4332F
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 13:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DA94410A2;
	Mon,  3 Oct 2022 13:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DA94410A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efzllLGnZVap; Mon,  3 Oct 2022 13:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB74E408F4;
	Mon,  3 Oct 2022 13:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB74E408F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4BB1BF3C2
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23F65402ED
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 13:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F65402ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsKWtUInTp28 for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 13:03:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D5E40154
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6D5E40154
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 13:03:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id a2so1876871ejx.10
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 06:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=WRKVcbhaagnADjlzlyR+vaTd/XXCKMOTP/gMe4kYMQs=;
 b=STjpMR7yMz2iC8+HMKw9426eNR1jg9FPfCWGjCXpBe3LLNls9h8qGa+YN0AAouQjvK
 fJYR4KrsweGT9fIp0H2MFU5XhLa80KT6KLytywUuuLBZfsi3EPx08SNUfR5sj5eDaxBC
 Tcm91zCggdDGjGRtDQvQ3YS1rfaELFVGra2+Pk5Ulcuy5/tlXD0B8q5RuNfe5QKibNbK
 1o/lyqoM0095pSpusHPsoNSHCG//XiDHj7ZVhKhqdAT39txZYxoMXrCgfL3BfqFX95uG
 8BAPTKGxbvODgGPX79V+oXeUvpD7E4U8IdvymkfIANA7eMDg4VY5wrI2iZE32XYGOetO
 kvEA==
X-Gm-Message-State: ACrzQf1dKMGthX6W7OvjeahxjB6N5Mpu9xnLeBGEXRK2PPQp1cN6pRdo
 c+URFChuB4OfaoQ1pHVnYtC19XJb/WDpqQ==
X-Google-Smtp-Source: AMsMyM4jLmHpgJ9EKgMH6v3aI2VzmVo7rgAYqqVXUMY1QZyAOyfIyvr5FS4slS47qwEO6bGzHD0Rhg==
X-Received: by 2002:a17:906:4fca:b0:782:2484:6d72 with SMTP id
 i10-20020a1709064fca00b0078224846d72mr15336552ejw.150.1664802214794; 
 Mon, 03 Oct 2022 06:03:34 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a17090618b100b007826c0a05ecsm5321217ejf.209.2022.10.03.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 06:03:34 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Oct 2022 15:03:31 +0200
Message-Id: <20221003130331.3074242-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=WRKVcbhaagnADjlzlyR+vaTd/XXCKMOTP/gMe4kYMQs=;
 b=MHko/3dFz/lSausq0GRgC1qUHN827RwsZZUinH8FBc7a8/IIe8lQuN/QTdREvv2e+U
 dTuKfonSD7TqGuG5WljZCzHqWj89Qu77FdZbSZRvi2goFzFN5+C/9OlOA5AMbGmhWAbs
 2rWSWu4nXp5uTfOsdOQ1Zt3rLhgc07V/W42E4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MHko/3dF
Subject: [Buildroot] [PATCH] package/cups-filters: bump to version 1.28.16
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Handling the newly added libexif configure option.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/cups-filters.hash |  2 +-
 package/cups-filters/cups-filters.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index d05cce3734..b910cdce13 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  614e053404bb833f78e1edf077f7759d27e475a212eb9a3bd3eac2cfec8bb6c1  cups-filters-1.28.15.tar.gz
+sha256  0ca77bb820719a040ff003ecb478d0c2ceffc94e8bd1cd03ddb5a199444127ba  cups-filters-1.28.16.tar.gz
 sha256  38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 976549e65e..7a3c894112 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.15
+CUPS_FILTERS_VERSION = 1.28.16
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
@@ -73,6 +73,14 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-poppler
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEXIF),y)
+CUPS_FILTERS_CONF_OPTS += --enable-exif
+CUPS_FILTERS_DEPENDENCIES += libexif
+else
+CUPS_FILTERS_CONF_OPTS += --disable-exif
+endif
+
+
 define CUPS_FILTERS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/cups-filters/S82cups-browsed \
 		$(TARGET_DIR)/etc/init.d/S82cups-browsed
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
