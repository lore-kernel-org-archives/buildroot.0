Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E67C3ABDB
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 15:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C94B6405D8;
	Wed, 18 Sep 2024 15:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2gRxmfgLZMO; Wed, 18 Sep 2024 15:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8F240644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8F240644;
	Wed, 18 Sep 2024 15:11:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF241BF5A5
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 15:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 878AA60A3D
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 15:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nLSd5cE0hVC for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 15:11:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B445608D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B445608D9
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B445608D9
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 15:11:37 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso836631266b.3
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 08:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726672296; x=1727277096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvWNQP5ej6haslVnKo7tgnQ66g/xziSzAIJeorr8B0Q=;
 b=wptNPaonVCKIF3OctERNwoF/8ERvGdLJth5GkoUIIBI7mGbxSnzmywTeEKgTCnXubj
 NWWXpO0NWmYKhO7ezV3aiPiBSXhLSiYJ6cfXlOSFSF5quJ6G7Uh4KbGXahDSHFaQWFkX
 jm7a6WZGv8gd/wMefbl3JLS4vxAIXq4ksahy+Sr6YRSy8330upBIhDty7l/WN5X8VqkP
 FBDLcVz8pKuTWx3D8XuY9Vq46JlaLXi6s5PM0410yPgOLCMDR8yiQrqOia6Qcjw+kIwb
 JevUSI08YZc9LKW8ylb09+er3eG7jU2D5gtgDCqmCBMNJD/gl814SskClUfhL80UbYir
 dEuw==
X-Gm-Message-State: AOJu0YzTdNgIzB0qinNZgqDFGoTXDWsWGah+my6RlhBn8pts147Oqein
 QEJvZLAvRRJ6ajtM96bsiDQpsx+G903hBb5k4POHBd7VhmF8AduyKm1yTmX7Kh5Dgm1ekNFSMrv
 4S5Q=
X-Google-Smtp-Source: AGHT+IFH1nsY4ewJ2KvMA/vZlM/6MsZ8Emj4mzl6kS86nSzkeiT4z0bGc4tS+nCtOFYlVLAEHlJy4g==
X-Received: by 2002:a17:906:f5a9:b0:a8c:d6a3:d049 with SMTP id
 a640c23a62f3a-a90294fea6cmr2382157866b.19.1726672295653; 
 Wed, 18 Sep 2024 08:11:35 -0700 (PDT)
Received: from localhost.localdomain ([193.32.29.227])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109674bsm603589966b.9.2024.09.18.08.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 08:11:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 17:10:43 +0200
Message-ID: <20240918151043.907458-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726672296; x=1727277096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PvWNQP5ej6haslVnKo7tgnQ66g/xziSzAIJeorr8B0Q=;
 b=P+0pqDW+Fj6V8gw2bGFRWLUjQKibVRqJ15h0C2tfB3eOng00fkGOGfy0duRJBT+AbA
 OamvlqUTezRSK9udWvWfQIljbgBXOazO9vd668IDSaUrghCttq7JilI1IdZDRaIY8t8p
 su8UyZmWVpQwthWOORM9+zVsn+M3lQPPA+zpFXjVtyanuVVm2bOnQgzHbVeFuMLAcN8K
 xqN6Xq7IeNsHZXhBj0lG1bp/tLfA8nfJpwIMBI23pS8W4gVcWW4JX2fhN+1nn/0Lndr9
 uCvLNuCJZB3ZaI25eplhRJnwn6txQe+gzOaC2yHIW0wiJ//hQJtQxn75WXpRzYfHF5yN
 S4OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P+0pqDW+
Subject: [Buildroot] [PATCH 1/1] package/popperjs: remove PopperJS package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Joeri Barbarien <joeri.barbarien@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PopperJS project is now called floating-ui and is hosted on
https://github.com/floating-ui/floating-ui this caused legacy
source code archives to be repackaged with difference directory
name which broke the sha256 hash and made the autobuild fail.

Given the package has never been bumped since its introduction the
support for that package should probably be dropped.

Fixes:
  - https://autobuild.buildroot.org/results/ab6/ab62afa6252ad986a900fbfc8b805038edc5d1d6/
  - https://autobuild.buildroot.org/results/d1a/d1a5b56b987aa178b2ca3fa0855a5bd3da896bcb/
  - https://autobuild.buildroot.org/results/962/9629da94be61a906fd113e77f0120cade521a715/
  - ...

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy               |  5 +++++
 package/Config.in              |  1 -
 package/popperjs/Config.in     |  6 ------
 package/popperjs/popperjs.hash |  3 ---
 package/popperjs/popperjs.mk   | 19 -------------------
 5 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 package/popperjs/Config.in
 delete mode 100644 package/popperjs/popperjs.hash
 delete mode 100644 package/popperjs/popperjs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6a1518f439..50d2776113 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,11 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_POPPERJS
+	string "PopperJS has been removed"
+	help
+	  The project has been renamed to floating-ui.
+
 config BR2_PACKAGE_IPMITOOL_PEN_REG_URI
 	string "IANA PEN registry moved to iana-assignment package"
 	help
diff --git a/package/Config.in b/package/Config.in
index 2200f16520..f3fe27a6bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1881,7 +1881,6 @@ endif
 	source "package/json-javascript/Config.in"
 	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
-	source "package/popperjs/Config.in"
 	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
 if BR2_PACKAGE_VUEJS
diff --git a/package/popperjs/Config.in b/package/popperjs/Config.in
deleted file mode 100644
index eae963100e..0000000000
--- a/package/popperjs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_POPPERJS
-	bool "popperjs"
-	help
-	  Popper.js, a JavaScript Tooltip & Popover Positioning Engine.
-
-	  https://popper.js.org
diff --git a/package/popperjs/popperjs.hash b/package/popperjs/popperjs.hash
deleted file mode 100644
index a2388f5b7a..0000000000
--- a/package/popperjs/popperjs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  83eecef51d10826faca2cd5cabb344e0bef6d4127d7e728db9e4d8308b7b15d1  popperjs-1.16.0.tar.gz
-sha256  2961310ed05cd9373a08b8191c071425a7fede0ca5d807ca38fa5f5f61c5b834  LICENSE.md
diff --git a/package/popperjs/popperjs.mk b/package/popperjs/popperjs.mk
deleted file mode 100644
index c5df302eb2..0000000000
--- a/package/popperjs/popperjs.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# popperjs
-#
-################################################################################
-
-POPPERJS_VERSION = 1.16.0
-POPPERJS_SITE = $(call github,popperjs,popper-core,v$(POPPERJS_VERSION))
-POPPERJS_LICENSE = MIT
-POPPERJS_LICENSE_FILES = LICENSE.md
-
-define POPPERJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/umd/popper.min.js \
-		$(TARGET_DIR)/var/www/popperjs/js/popper.min.js
-	$(INSTALL) -m 0644 -D $(@D)/dist/umd/popper-utils.min.js \
-		$(TARGET_DIR)/var/www/popperjs/js/popper-utils.min.js
-endef
-
-$(eval $(generic-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
