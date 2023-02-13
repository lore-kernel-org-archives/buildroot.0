Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C05CC636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46848409E9;
	Mon, 13 Feb 2023 18:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46848409E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQzLQro8vlzP; Mon, 13 Feb 2023 18:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD32409D5;
	Mon, 13 Feb 2023 18:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD32409D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 835B31BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1C76104B
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1C76104B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzmZ-q9qSDYZ for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:16:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE4576102A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4576102A
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:16:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id z13so9307300wmp.2
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:16:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYUAz5CQPldglSuS4GAkAZeGxxfAr2Om3IpN2MPCT64=;
 b=aNaL6nmRloGPq86YdfwJh6b6+wu5ZKIRWIbhF4XKS7hpImMngioMKXA6k7QbLwtW+9
 40eJBd8AWO2NpnyGOAxTtuY5i6BMhhRowvSe6MkFrOeL6jSXmAgECrZHA2W3I74EhPTE
 7CmeEUIgrKQHWmKUUWwYpDagwiLeXuE8AR07EVGPIxzkjlzVM/37/BC8c04vxlOy8s/7
 wVpAXGdOcxT1oToW6nAOBTdfhH/9VwhrIPKgy70jxf/6vejl0gTbCcnaLoUej0TN2B7D
 4vJ4g9wbT0Ko0Ydyv7Ixvquw9vKSS42gGvRrE9YUNo5Fpdzd8WD0uxUfpZhVsmZfeJwM
 xs9g==
X-Gm-Message-State: AO0yUKWuWDRV3NzR4Jir7ZDFHFquQF8GW1bTq+nXazW1EcBiJWWNHfb2
 OKciNSo30R5CqhGWifkc10D2ObIcIM8=
X-Google-Smtp-Source: AK7set8OqFrKt1ijTXU/lm6Hbj2ZxzT7/C0aaQ0bf3e6z06DrBAazYzhewZXTKKDnFC8lwAqX4fEwA==
X-Received: by 2002:a05:600c:43d2:b0:3da:f5d1:c677 with SMTP id
 f18-20020a05600c43d200b003daf5d1c677mr19715461wmn.35.1676312187897; 
 Mon, 13 Feb 2023 10:16:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003daf681d05dsm15711767wms.26.2023.02.13.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:16:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:15:23 +0100
Message-Id: <20230213181523.910359-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gYUAz5CQPldglSuS4GAkAZeGxxfAr2Om3IpN2MPCT64=;
 b=Bgm3Pf0urKCb28W3/Xg53hoJZR17HKgfCP5A7oi3UkNm+jex1DkLzrDsh72hedRGSj
 nxgg0twZL4m9k5TK3bsRZwva6TgxcsDOs73n4dz475c1iL8GXCaWq9bTJSyyNB6uJ38g
 HxPCRsEcQuiQ6gRGW9EIp5UMNHh06IHNs7YuLapiFy0m0gIB3QiaMW3Dyz88b1mw7jBP
 pBk0HduzQW40i/9QF/ZXiTe2ZFWZzCaQuPHris3deTdmUWD3M6PfKNnqi2tfe27V+Umy
 7ctCB+nAz+1wRJmv54Ky6X3B3nOLUTXXfmeAZWoy3inLRy62bDOc3wFtmQCuphw0BS95
 Qx4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Bgm3Pf0u
Subject: [Buildroot] [PATCH 1/1] package/zabbix: bump to version 6.2.7
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- host-pkgconf is now mandatory
- switch to pcre2 which is supported since version 6.0.0 and
  https://github.com/zabbix/zabbix/commit/18917f919a68abc863a5c79ba88c0cb156255fdc
- Update hash of README (links updated with
  https://github.com/zabbix/zabbix/commit/067f5f873fb18ae7b22c5eaef40f0898b98edeb5
  https://github.com/zabbix/zabbix/commit/499dbc81b987513233d579610335b8938f1ae91d)

https://github.com/zabbix/zabbix/blob/6.2.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zabbix/Config.in   | 2 +-
 package/zabbix/zabbix.hash | 4 ++--
 package/zabbix/zabbix.mk   | 7 +++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 0f7a0b0003..377c0ff692 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ZABBIX
 	bool "zabbix"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Zabbix is an enterprise-class open source distributed
 	  monitoring solution. Zabbix is free of cost. Zabbix is
diff --git a/package/zabbix/zabbix.hash b/package/zabbix/zabbix.hash
index 42cc0bda57..bb6127e5ec 100644
--- a/package/zabbix/zabbix.hash
+++ b/package/zabbix/zabbix.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  19686628df76e8d5ef7c2ed2975b258c7ca3ec7d151b1bb59d7e132f9fc7c941  zabbix-5.4.9.tar.gz
-sha256  10d68ec3abacc29222c07748fc5e5cb9474fd7cd9ccdde1b92ff941ded946b78  README
+sha256  6d423810667b948ed22052d9aa84a035e2d4b92cbe8efdb669cac529806b722d  zabbix-6.2.7.tar.gz
+sha256  f8fc3fd12521b60d53d8c5d48a883eb3c9c5ddec9de986a273e1b77f69d811db  README
 sha256  444fe54aecc95ac0f3314289c300afc73b3946a4dc9fbd7e022709b3e0924dd0  COPYING
diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index e00d693ba5..db9efed78b 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZABBIX_VERSION_MAJOR = 5.4
-ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).9
+ZABBIX_VERSION_MAJOR = 6.2
+ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).7
 ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
 ZABBIX_LICENSE = GPL-2.0+
 ZABBIX_LICENSE_FILES = README COPYING
@@ -13,9 +13,8 @@ ZABBIX_CPE_ID_VENDOR = zabbix
 # We're patching m4/netsnmp.m4
 ZABBIX_AUTORECONF = YES
 
-ZABBIX_DEPENDENCIES = pcre
+ZABBIX_DEPENDENCIES = host-pkgconf pcre2
 ZABBIX_CONF_OPTS = \
-	--with-libpcre=$(STAGING_DIR)/usr/bin/ \
 	--without-sqlite3 \
 	--enable-agent \
 	--disable-agent2 \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
