Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0E0CDB474
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ED6D41490;
	Mon, 23 Oct 2023 09:26:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ED6D41490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIMrbwIEptZb; Mon, 23 Oct 2023 09:26:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D030041556;
	Mon, 23 Oct 2023 09:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D030041556
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95B0E1BF955
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E93281026
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E93281026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZnvrL8J9R0j for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:13 +0000 (UTC)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86CB880FFE
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CB880FFE
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2c51388ccebso45114231fa.3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053111; x=1698657911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jKiss2ee1pUivtNXHxRU2ScPGM7K1NmIowdyNMXMTDU=;
 b=i8q5RI7nJEzPG7IHwcrBAUDcXaQEwX/mE/TjVQ9lLkV+XY7xUVzug87mk/Om3tYBN0
 ijbJX+f0V9uVLuFicD4lEulG+xtqdfRvS0szYjw1l4Lju0wbz5yYxe8DkWa44EQT9BGC
 378Cfw9EPiVtX4pqjk1BrWbM3m5QkkH4L9/KtnvWb5R6UTy6oumfgwfwtVqVG+Tb5G0r
 xtBhLhVPzRmsRVnTV5xFY3LVHGFkrJD5cdomVyk3xY/iY0jW7dINxpeb9gKyEzyrMpcs
 Gz60xPXdjDZKqFq9rYMAlV0H/lP4TPzpwZre0au3hxxUBNwKw8Z6V4C+JUeOw7bB9wmJ
 3RyA==
X-Gm-Message-State: AOJu0YyRoEwzNiO0QcEdQLOstQdD5nj5/x1UJkXDzANrMKS1/R6/i7BE
 fScBtWTB9Pk4OAozWyTNWjmWKppmq/2y1fobio7glt4mzploKw==
X-Google-Smtp-Source: AGHT+IFDTM9n1iCCXnnhdmcVdXF0AV+fC5CIAPQLnvc++rOnnkND0MjMr+lvfF5U86hlDXCK6Abuhw==
X-Received: by 2002:a2e:a788:0:b0:2c5:996:9e28 with SMTP id
 c8-20020a2ea788000000b002c509969e28mr7162894ljf.19.1698053111222; 
 Mon, 23 Oct 2023 02:25:11 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:25:00 +0200
Message-ID: <20231023092501.481436-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053111; x=1698657911;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKiss2ee1pUivtNXHxRU2ScPGM7K1NmIowdyNMXMTDU=;
 b=DwkkjwbjDDJw/DYWweGdD7EE0lSmWLgs6/Hpwzc1HmivdVxct5/jgOmqXoMN5us2TH
 /W0xRYA3/R259pyV885qMe+CkH9qgMXu/SzNc7vV80Uf5W5I3uKh1/IU3Q+bp26r/y9Q
 wfXnU/dtD/5zU4Pb4Sm6Hbh31vl3c0dFToybE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Dwkkjwbj
Subject: [Buildroot] [PATCH 7/8] package/opkg: add curl support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg/Config.in |  6 ++++++
 package/opkg/opkg.mk   | 13 ++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 7bc02e429e..adf39ca145 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -21,6 +21,12 @@ config BR2_PACKAGE_OPKG
 
 if BR2_PACKAGE_OPKG
 
+config BR2_PACKAGE_OPKG_CURL
+	bool "curl support"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Enable downloading with curl.
+
 config BR2_PACKAGE_OPKG_GPG_SIGN
 	bool "gnupg support"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index ee14e774e3..730aa4cfe7 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -10,13 +10,24 @@ OPKG_DEPENDENCIES = host-pkgconf libarchive
 OPKG_LICENSE = GPL-2.0+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPTS = --disable-curl
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
 	mkdir -p $(TARGET_DIR)/usr/lib/opkg
 endef
 
+ifeq ($(BR2_PACKAGE_OPKG_CURL),y)
+OPKG_DEPENDENCIES += libcurl
+OPKG_CONF_OPTS += --enable-curl
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPKG_CONF_OPTS += --enable-ssl-curl
+else
+OPKG_CONF_OPTS += --disable-ssl-curl
+endif
+else
+OPKG_CONF_OPTS += --disable-curl --disable-ssl-curl
+endif
+
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
 OPKG_CONF_OPTS += --enable-gpg
 OPKG_CONF_ENV += \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
