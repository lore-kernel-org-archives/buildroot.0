Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789CC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8220881854;
	Sun,  5 Feb 2023 14:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8220881854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eL-JZYYuFW-Q; Sun,  5 Feb 2023 14:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B426381826;
	Sun,  5 Feb 2023 14:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B426381826
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE7DE1BF334
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C67104010D
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C67104010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4veElOP2lXg for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:00:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE2A40124
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CE2A40124
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:00:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o18so8276540wrj.3
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 06:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O01GUHJFbTuLntUMaaCyKL6124mqgHhMBX0fim08As4=;
 b=mVutvHYCHZg+ssia0xH0KhuI40PS+UXz7EPXBocNNUXDC5pzVP/NQg+yJg+EDaub8y
 yGdwlntJuWCCJ3QWSLXBL0HU04lLDPChHfsatgYlUjaRi1TkvMpVmaHgaOSjbUOwmeHW
 qm1yN7I5/hhmAikWeqD/SZyWEImKUtlzjsTULT82DrnfT+6DGP1GuFem8FZRs76h4Uuz
 EKFKhb7nkexV92Uo1DDcjnKlikh/gfLAVQcxFxJjISkFIVT2iM8EW1ugBSQZuw9nWqXz
 no1JhGD4aVO+AvMqo30bELaDgJ/XDK7NnBFcBIwFvOaYfcGGVIaIK7azJgnGVWHnEgwI
 hLPw==
X-Gm-Message-State: AO0yUKXj3JeDW8OXFzjVzgkySgqLeGp3eLuE5ZXMr/OAVv57vMMZvL4z
 rs9NqlNbtsfhrMd4POj6YaQML6W8Xis=
X-Google-Smtp-Source: AK7set+oCwGk1zBn7rNdqcGfH8z/7e4iR4ZTn34luDKy7mN2wQk2nIrlGyB5kL1qGYwrWXyl3tT5Pg==
X-Received: by 2002:adf:eacd:0:b0:2bf:d3ef:741 with SMTP id
 o13-20020adfeacd000000b002bfd3ef0741mr13655595wrn.46.1675605609308; 
 Sun, 05 Feb 2023 06:00:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d4601000000b002bdfe3aca17sm6590350wrq.51.2023.02.05.06.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 06:00:08 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 15:00:02 +0100
Message-Id: <20230205140002.154492-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O01GUHJFbTuLntUMaaCyKL6124mqgHhMBX0fim08As4=;
 b=hV8/RHvds5iiMEZBLQvOF2FKGK400aws7AlOX+Haq1FSSGMOfSk0O69GlAJZMhPx8G
 RDtkUCEPVxQJm4SMqNnUK2Q77aaCQQ2qqFUW/wXr054bn3LASUUNzNFMl0ez/ZcchwCP
 t0LyXeHAvMxtTHE9aSOfXs7eajY/yuQlyvnuun6FXApcrrZnJee3SCSUOvcZu8GspOPV
 uB8KtmhekpQCoJzb4BkMCedaUF+RuczEopjNowXRzJoOF/Qtuv3gUKWBL4+r16Ebr8VO
 XBOWEnNP8dj69Cy1kbrl4t9xzFbfpWvqBMRHdCdlDeGpH+9f/MURisdy+2ofhPd4QQKY
 WTjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hV8/RHvd
Subject: [Buildroot] [PATCH 1/1] package/modsecurity2: security bump to
 version 2.9.7
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2023-24021: Incorrect handling of '\0' bytes in file uploads
  in ModSecurity before 2.9.7 may allow for Web Application Firewall
  bypasses and buffer overflows on the Web Application Firewall when
  executing rules that read the FILES_TMP_CONTENT collection.
- host-pkgconf is mandatory and used to find libxml2 since
  https://github.com/SpiderLabs/ModSecurity/commit/baa38ddbaf55a87afecad7a1e1760c69a2689787
- pcre2 is supported since:
  https://github.com/SpiderLabs/ModSecurity/commit/8fc0b519b7a6c023259753a21f33bf3649a25b14

https://github.com/SpiderLabs/ModSecurity/blob/v2.9.7/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/modsecurity2/Config.in         | 2 +-
 package/modsecurity2/modsecurity2.hash | 4 ++--
 package/modsecurity2/modsecurity2.mk   | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
index 2870386a99..fb1bfc960e 100644
--- a/package/modsecurity2/Config.in
+++ b/package/modsecurity2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MODSECURITY2
 	bool "modsecurity2"
 	depends on BR2_PACKAGE_APACHE
 	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  ModSecurity is an open source, cross-platform web application
 	  firewall (WAF) module. Known as the "Swiss Army Knife" of
diff --git a/package/modsecurity2/modsecurity2.hash b/package/modsecurity2/modsecurity2.hash
index a19f4823a8..2c77ffd830 100644
--- a/package/modsecurity2/modsecurity2.hash
+++ b/package/modsecurity2/modsecurity2.hash
@@ -1,5 +1,5 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.5/modsecurity-2.9.5.tar.gz.sha256
-sha256  e2bfc8cd8b8de1e21f054d310543373ea5d89adbd96784e832be0da3e4dc149e  modsecurity-2.9.5.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v2.9.7/modsecurity-2.9.7.tar.gz.sha256
+sha256  2a28fcfccfef21581486f98d8d5fe0397499749b8380f60ec7bb1c08478e1839  modsecurity-2.9.7.tar.gz
 
 # Locally computed
 sha256  2c564f5a67e49e74c80e5a7dcacd1904e7408f1fd6a95218b38c04f012d94cb9  LICENSE
diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index a1ad8fe5bc..c251291e64 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODSECURITY2_VERSION = 2.9.5
+MODSECURITY2_VERSION = 2.9.7
 MODSECURITY2_SOURCE = modsecurity-$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
@@ -12,11 +12,10 @@ MODSECURITY2_LICENSE_FILES = LICENSE
 MODSECURITY2_CPE_ID_VENDOR = trustwave
 MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
-MODSECURITY2_DEPENDENCIES = apache libxml2 pcre
+MODSECURITY2_DEPENDENCIES = host-pkgconf apache libxml2 pcre2
 
 MODSECURITY2_CONF_OPTS = \
-	--with-pcre=$(STAGING_DIR)/usr/bin/pcre-config \
-	--with-libxml=$(STAGING_DIR)/usr \
+	--with-pcre2=$(STAGING_DIR)/usr/bin/pcre2-config \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
 	--with-apu=$(STAGING_DIR)/usr/bin/apu-1-config \
 	--with-apxs=$(STAGING_DIR)/usr/bin/apxs \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
