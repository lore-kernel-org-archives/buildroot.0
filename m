Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BD1CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77CD4615C6;
	Fri, 29 Aug 2025 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXFVFPZFSvi0; Fri, 29 Aug 2025 10:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C7A615D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C7A615D6;
	Fri, 29 Aug 2025 10:34:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 426ABD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28E8041863
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iFK4LoABtaS for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1510441868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1510441868
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1510441868
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so351848566b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463630; x=1757068430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UaLEUYtlwu5q6kysR8CLnse3KZ/NUtJ6iEi5wbg5Y1E=;
 b=fwS8gW8S63u+KrYpoV8BHvui4Dl/fFzVE1KRqBWOayZEkEctnQClwoVJPSWnYMG4Gy
 LBmlPZKJ7on8CT1o9zoXdwSSGcr7ZsM7+nOCEDF2ET6Evypee7NFkLEKFsBmKYPzXAUh
 /Kk17cu/tC4Kw7M7k2e3z7iW73WNZ+JI1O8DQWjWNljiSfb3tmumht6i/qjC3lIzS7hH
 7sIBZYWxl0HKOWWLu2dLwLTapxcb3/sgwXAeF5b2/i7GWjRISAYf2ViKMKkiUCPAlLru
 gFnfFy3FnfJnWj2O9hewSupoR8JtW7LAWYZ+owj/8hQhKNCG8+qYvVyVvyxNnLp8uT2A
 +xWw==
X-Gm-Message-State: AOJu0YyWomW0yVIru2YPAQ17u1zxEKAYsygByOSefz9EmJF/9REbq91l
 HkyGimWrBFtI72XsAsTFX4B7gdNM/WBSpKYz0KM6SssoLIXk0va5huyCfaYKfsOIZg84s+yCDan
 4VGGLOVE=
X-Gm-Gg: ASbGncuFqhVeTvoMLH+J5WxswPuvjN+lv9wrXfozzyW3RV6LpdzxWf59TXwM9Wlmgdk
 shKYLxoiIaxqT96SPdCs1Vcc3NUVcVh7kgfoSlcwrd5Cp/r/I2j7GpSEz0HM4zcWQ79+Orxo70n
 HTDwMsLhbtBbiCKJYowiiVBacfWNwcINmkJMvCFvt+UdC3ctyHLFudmYja/FpCwJLhv2C8Q8uaN
 PzPUxg+OohnA3kJn4toaYRQMp40cZRmENzsn2abyv5E4DH4qMIlTAeLVF+FpDG+eznakiAwvdQz
 JTtjxNm2EQolVTqmF4lwE7DJ7Jo+6VoTjz6xnCBZvJubBixROzGrD4eptbImbi5LyzBImFjHWAI
 HIY8YcVg70XfAQ0vJj0FiK8Pj6C3lxKBUifQ529VL4WqRkR8BIfI=
X-Google-Smtp-Source: AGHT+IFl9dZaC4A68xJJY+eWMJqijcpMeVbev+RWhdoZ4JeUsF45c02FUOv6ZK49mLoXzpPa0r5nLw==
X-Received: by 2002:a17:907:940e:b0:af9:a162:7fa8 with SMTP id
 a640c23a62f3a-afe2965b632mr2388592266b.50.1756463629817; 
 Fri, 29 Aug 2025 03:33:49 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:49 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:36 +0200
Message-ID: <20250829103340.158873-11-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463630; x=1757068430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaLEUYtlwu5q6kysR8CLnse3KZ/NUtJ6iEi5wbg5Y1E=;
 b=ev2marC15cwYUFEF6KSQAimOQFosHxS8XO71VRWvzWtwvQesEBSqzqhEJ4M8wrP2v6
 BwN3yyRUYKzJNThqMnA/hP+fHCokjZoh3F6KyxCymdkmFINXSGr+ipJF5o9InVtu3Tr3
 3R0JKvZD3jC5lMY+u30J/UDBARFQtvl/CdIoPBZtm57NZ/EaAiZwotZyLtr2vRqjtlho
 JF82s0N+hYgkQ2tdjCEMpvmN7AGcgsOpSpuFBChSY1vz6rOHVNbyxLWTDVTKLcgIiRmL
 haq7y3QF5w5o+w/ElUY452/r4rBPJkiFi34KnB3C4JW0v4ns+Anxy4se+IL/8G8OaoH1
 qpoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ev2marC1
Subject: [Buildroot] [PATCH 11/15] package/openlayers: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Simon Dawson <spdawson@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                   |  6 ++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/openlayers/Config.in       | 11 -----------
 package/openlayers/openlayers.hash |  3 ---
 package/openlayers/openlayers.mk   | 22 ----------------------
 6 files changed, 6 insertions(+), 38 deletions(-)
 delete mode 100644 package/openlayers/Config.in
 delete mode 100644 package/openlayers/openlayers.hash
 delete mode 100644 package/openlayers/openlayers.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bc0f4529d..b802d564f8 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_OPENLAYERS
+	bool "openlayers has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_JSZIP
 	bool "jszip has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6ffc437103..bc8ca29c81 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3184,7 +3184,6 @@ F:	package/starfive-spltool/
 
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
-F:	package/openlayers/
 F:	package/vuejs/
 F:	package/vuejs-router/
 
diff --git a/package/Config.in b/package/Config.in
index c468a3466a..b09288cb44 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1893,7 +1893,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/openlayers/Config.in"
 	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
diff --git a/package/openlayers/Config.in b/package/openlayers/Config.in
deleted file mode 100644
index a7b7f334cf..0000000000
--- a/package/openlayers/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_OPENLAYERS
-	bool "openlayers"
-	help
-	  OpenLayers makes it easy to put a dynamic map in any web
-	  page. It can display map tiles, vector data and markers
-	  loaded from any source. OpenLayers has been developed to
-	  further the use of geographic information of all kinds. It
-	  is completely free, Open Source JavaScript, released under
-	  the 2-clause BSD License (also known as the FreeBSD).
-
-	  https://openlayers.org
diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
deleted file mode 100644
index 50f4dbe849..0000000000
--- a/package/openlayers/openlayers.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  ff847580458b10c85dcb38699733368d67037f855fcb6a5fce46e6412737cf67  v10.5.0-package.zip
-sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
deleted file mode 100644
index e62ea35fd4..0000000000
--- a/package/openlayers/openlayers.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# openlayers
-#
-################################################################################
-
-OPENLAYERS_VERSION = 10.5.0
-OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
-OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
-OPENLAYERS_LICENSE = BSD-2-Clause
-OPENLAYERS_LICENSE_FILES = LICENSE.md
-
-define OPENLAYERS_EXTRACT_CMDS
-	unzip $(OPENLAYERS_DL_DIR)/$(OPENLAYERS_SOURCE) -d $(@D)
-endef
-
-define OPENLAYERS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/ol.css $(TARGET_DIR)/var/www/ol.css
-	$(INSTALL) -D -m 0644 $(@D)/dist/ol.js $(TARGET_DIR)/var/www/ol.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
