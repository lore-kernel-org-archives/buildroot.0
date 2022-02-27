Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F87C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 10:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7286240500;
	Sun, 27 Feb 2022 10:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YFyHs4_dkfT; Sun, 27 Feb 2022 10:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5DA2640165;
	Sun, 27 Feb 2022 10:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D29DF1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB2E6600C7
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mA9lkSqmql6q for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 10:10:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13EF660087
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 10:10:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n14so10978470wrq.7
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 02:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tg5YxJrbWBD4OloNU/dCDFRe1US+emd0zgxDrIwsFjg=;
 b=fya0KUnrTcfEohb9tMWphY2uEKjV1jULA/YPE6BNC2H+rHABP8yi1vxaAJQOEMxuIZ
 PycYRywzjYqKXkFqVerX0TPiVSEWXNB9jSK9me8WVkg2vbrxLhDvcVnsRiatWliZG74V
 c5FWmxqpWOJUh0J1lwqkZAjHyR4oAxY0OE1qFxEyvUHNcnlMZ+TTYaohueh46I15L09M
 cP9k6ENBDGep+MDdhS3ZvxXP8HDxJquGFebxwQivUrkFGaCqkLzXVMNtBAQd1cO7nGTe
 NIA01KXKnOwiu1YrMYZYhp4KLzfzPIadxJRrT6WjeVZmeEzUNvm+Wgw90kHBeW7n52uM
 +kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tg5YxJrbWBD4OloNU/dCDFRe1US+emd0zgxDrIwsFjg=;
 b=2jqgudkGY/a5J+UOSQxSWXKqgwMwGpj/ITLvGt+SK6qSOHYIE/sXRwdtdPwqnf1CZR
 fBt0VG6UVfhbXnd7BC3o6n9hplmCl9K43KqfRMDw2qOvLB8xwZi9WZCJ9n6RXfF/6GKc
 S13po2Rtk3ysj/tqxtYtkMd1P2A/h2B5JJQOSW6pD2gacUwO00WnpHc3/hpt5w7Fsu/h
 rLNhX+TLlFc0/jEYfGGyrVk0hgv5jIZ/JY3WMf7Kdw7yQH6SHHdRhlvtYD5WN20f0LO1
 HYhvnexywFOg/ODo2xHNzdP4ZCmUrqXV6pA/A++WKRPCm69OpJ1hkaEioGiOsg8se6xL
 QJ0A==
X-Gm-Message-State: AOAM533SOjUesvA42xbWXzy/HaKtIXIVQwxzOSom7cJ7djEkdrJXj9Yj
 VFjmx8noQIoH67+738CMOYtZ20gOpU0=
X-Google-Smtp-Source: ABdhPJxM15FK5XG3Nl1yT2fj7hN5wGg4n2dHEp8CdaEvlvuRTMXDGoqNAndnS2+QDsMMOh6LvjSwRA==
X-Received: by 2002:a05:6000:1a8f:b0:1e8:3301:1273 with SMTP id
 f15-20020a0560001a8f00b001e833011273mr12349135wry.707.1645956653053; 
 Sun, 27 Feb 2022 02:10:53 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m12-20020adfe0cc000000b001ede2dd604esm7092493wri.106.2022.02.27.02.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 02:10:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 11:10:03 +0100
Message-Id: <20220227101003.3702134-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/ocrad: bump to version 0.28
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add libpng mandatory dependency
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ocrad/Config.in  | 1 +
 package/ocrad/ocrad.hash | 4 ++--
 package/ocrad/ocrad.mk   | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
index 38d37c612a..b6c4300f86 100644
--- a/package/ocrad/Config.in
+++ b/package/ocrad/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OCRAD
 	bool "ocrad"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBPNG
 	help
 	  GNU Ocrad is an OCR (Optical Character Recognition) program
 	  based on a feature extraction method.
diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index 7ae38c30e8..cd5b0039ea 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 a9bfe67e9a040907aff5640dca56392476b6a89e48e37dc94ba846c5b6733b36  ocrad-0.27.tar.lz
-sha256 3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  34ccea576dbdadaa5979e6202344c3ff68737d829ca7b66f71c8497d36bbbf2e  ocrad-0.28.tar.lz
+sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index e037a08195..982bb002c9 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.27
+OCRAD_VERSION = 0.28
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-3.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
+OCRAD_DEPENDENCIES = libpng
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
