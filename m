Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66207C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 07:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E056D4035D;
	Sun,  6 Feb 2022 07:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vj6FvjK7_l0Y; Sun,  6 Feb 2022 07:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D0540359;
	Sun,  6 Feb 2022 07:40:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 090B01BF3E8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAB634015A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 07:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aBXLKx1iVVXg for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 07:40:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F2B8400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 07:40:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s18so19295788wrv.7
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 23:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vhSgmHvYbwhI8PgoQ8xka8xYIwsbWIqgw19YHOVjCtg=;
 b=HUqqqUyAICEockfOeHqf68h7LpzLk1BwG35YaHAh9E/ou4AXewMjdERkG1zRO7M2bG
 lyIhU5N0TmGg34eSaAn82YUeVF94f1S+Op0A1CVjOI6KmCZy8xt0ceV6X/ajliigqYXq
 2sX4pDXkV5hVxuPaSE4vKsE2p4f+P9owSxOXrwbWeHEjtkGMbv6v9ZHWVV3XvPx9Vwm9
 e2WAbzJA+l0zrxlFa4lwiY2NyIDx3j8yfgo4muwQ/9UpMw2gVAY+4XVVIhbu6YzRAn+x
 hfXsV2X52uzkw+YNTOv93+nz8+jvtOKAdFAZtxVsSpcvRZMgsn7BOKY+y+jSSe7nLC1N
 NYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vhSgmHvYbwhI8PgoQ8xka8xYIwsbWIqgw19YHOVjCtg=;
 b=WzeLzeSV8cfg4ZNevUtUf8+bF/8MY+XVs6v9WqeYtfVX66shn5xH5nWzfZNh0hrd1s
 Ly9BySimwlg3Dy90bwJ/oen4ZCT5HewaooY0iYGs2Gh9BamK7IdEQvQFvsqGJeGtXfhT
 6SWDrxiSKTeNH1NTiQz1EPNju0Qf8yF4oD6iH7zPCQX6xma4abj40gTc0CwpbZsKJ5X5
 7b85yyCBCkhe5TMmFTHXd6vVzDiLyVPMDql3KSMx9S+liAyNH4U6dz4M2mnAHRzzysC2
 r/VdyPaEZwwTXVg2w7mFeTGc46Buu0GDgZ1vOnnCri/y3dyc1V6biH/i+7NS0WtNpRyj
 TaJw==
X-Gm-Message-State: AOAM531LLV2HlhbW77Ky/NA8OQFXbuV2EyLd8VeQSNkeLFiSW4OV5YHM
 MLmIS/SK9x61MZSqkr21FNdTKjPq/ro=
X-Google-Smtp-Source: ABdhPJwJsOQFEv1Mp9jT5+8zuw6DfMAKCgJzilg7eDB5Nm91ksbZQiQce7MojNxNy16grghkDmHCKQ==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr5448832wri.212.1644133220241; 
 Sat, 05 Feb 2022 23:40:20 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id m25sm13406043wml.47.2022.02.05.23.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 23:40:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 08:38:05 +0100
Message-Id: <20220206073805.832602-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: add mysql support
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lighttpd only supports mariadb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 9 +++++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index b9f64a3bc3..aa18c13171 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -61,6 +61,15 @@ config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
 	help
 	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
 
+config BR2_PACKAGE_LIGHTTPD_MYSQL
+	bool "mysql support"
+	depends on BR2_PACKAGE_MARIADB
+	help
+	  Enable mysql support for lighttpd mod_vhostdb_mysql.
+
+comment "mysql support needs mariadb"
+	depends on !BR2_PACKAGE_MARIADB
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 49ab8587f7..595c59cb37 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -19,7 +19,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
 	-Dwith_mbedtls=false \
-	-Dwith_mysql=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
 	-Dwith_pcre=false \
@@ -73,6 +72,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
+LIGHTTPD_DEPENDENCIES += mysql
+LIGHTTPD_CONF_OPTS += -Dwith_mysql=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_mysql=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
