Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89CCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3BE84217;
	Fri, 29 Aug 2025 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AaogNkmQbPL; Fri, 29 Aug 2025 10:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D90842D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19D90842D3;
	Fri, 29 Aug 2025 10:33:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB466C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B4BF61594
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IIA2QyADzy-v for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0CF19615B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF19615B8
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CF19615B8
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so271776266b.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463629; x=1757068429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Kcsz+CUrRLTUh6oalFD82DObMn42d5Ce3Rj4sWdKW0=;
 b=W3UQozsiU7QafIbgHNsQJqtzatLa6Du8xLvG7un16hBgobjQApNQQog74RJ+FUA0oy
 qsHeQvg3KMfUCIPPXBBLGJqh9kNnJYByugYFRE8zDHxqmWlBerKhOsGgSU68Md+hgupS
 NRcU7LqIeuAIqBOINlaS0uIligF8bbwBNv+X1gVkK3Mc+nTX1e1Yxw1aGuoUt8bEesol
 JnHw1jjnB9o1ogqKoq5md/Q5ufTE/y94p4HsvLq59gAG3TfXepN+NkAaXdZWqyxRMj1J
 msHWwkCIVfM6NZHVe6Q9Tqh+adRnIKH33zlw3xbbi0Dem4OOU+5cb+k29EYMnODGYF0E
 p3aw==
X-Gm-Message-State: AOJu0Yyav5l+4K4HjLYc4gXI7xaFHNKzf56XHdoBqGxrDHm9CkdiuXeT
 MMkSVzAaP5gGxba6BgcIP46xKrw3FHzzXgr4i5mvn/bQA+tYfuwPL4ng4asWTZ+Dum5/HWf2Y26
 tes/Y6Vk=
X-Gm-Gg: ASbGnctCcYROoqPOG28RgEPUhrlugbIUCGk2I9YCSKth735VBeiAGfZnSd/2ZY7PUMx
 29VV1vq5x+BlUv0ldcDry7XmYTytavs2auNq+9AAj7XoFQyd/khAJVHOnCyudtFIcUdVpfDY/5A
 DCmM5rKl3IAIxWodvovhflmYs7tXo1/YdZGhNn93rSZGx5hyv7rHGnS3Ti0nnxzWRvQklokpctI
 djXJIy3sjTzYZZ3uVY8LriMJIOXo35uOO7yG9fhcikPNMU/+ijEwby/hUXudfLQsaWqRW4Js8RS
 O59VJkhQHUyv1DXKp9aZ429BJ4dq0+xspm2n7bB+Sid9iHYAcBqae0mMKSA5L9IUNIENW4CoDWk
 r7UR3+nMqL047wYZUyoZU8ApyQGMKnqhTUElE/VotpCWIE0WU2eHmY/VIU1YVz+LRR8xNLKxD
X-Google-Smtp-Source: AGHT+IEBlMpnB2Az/nNoavNmPzlNFSM8LK/jYgve6Dey4LyKs8qhDDpelUBleFLYV/QXEU30Uh020A==
X-Received: by 2002:a17:907:9629:b0:afe:bf2a:12d1 with SMTP id
 a640c23a62f3a-afebf2a14e6mr934557166b.58.1756463628794; 
 Fri, 29 Aug 2025 03:33:48 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:35 +0200
Message-ID: <20250829103340.158873-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463629; x=1757068429; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Kcsz+CUrRLTUh6oalFD82DObMn42d5Ce3Rj4sWdKW0=;
 b=eI+iptKbDFINHTsmqDP4rHNoi15Wj2OBk3Zkx6rA9GMqcjny9fU1v897Hi8PjKbfAr
 L1AjMTJm6rDNrQEfA0nedVwLnST53L62seiZeDw3iGjv/myKQzcqKiFvDuF+XStz6XEk
 1dYLT+ty2J8WtsBA80Qxfh5pz5NEwTx3vY7KsWgnCYMhaSNdi6uqU93gNW7yUtZ/2Vde
 t20HA6bLSQcrzPE09SWxkqkSokzRX30TiqA5RJFOe4zx3n01YXpg+N0TlKZE1Ydfnkkz
 Q9jClNcgK794XCDQxvD+ZE1Dmv4nOYRGuDLpTVkebuc8Fjnasuf5Yz8LgStPVn8+hdPx
 ytDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eI+iptKb
Subject: [Buildroot] [PATCH 10/15] package/jszip: remove package
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
 Config.in.legacy         |  6 ++++++
 package/Config.in        |  1 -
 package/jszip/Config.in  |  7 -------
 package/jszip/jszip.hash |  3 ---
 package/jszip/jszip.mk   | 18 ------------------
 5 files changed, 6 insertions(+), 29 deletions(-)
 delete mode 100644 package/jszip/Config.in
 delete mode 100644 package/jszip/jszip.hash
 delete mode 100644 package/jszip/jszip.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index fca1b84e7a..4bc0f4529d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_JSZIP
+	bool "jszip has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_JSON_JAVASCRIPT
 	bool "json-javascript has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5d779e66d5..c468a3466a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1893,7 +1893,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/vis-network/Config.in"
 	source "package/vuejs/Config.in"
diff --git a/package/jszip/Config.in b/package/jszip/Config.in
deleted file mode 100644
index 455891ab12..0000000000
--- a/package/jszip/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_JSZIP
-	bool "jszip"
-	help
-	  JSZip is a javascript library for creating, reading and
-	  editing .zip files, with a lovely and simple API.
-
-	  https://stuk.github.io/jszip
diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
deleted file mode 100644
index e90e9cc68b..0000000000
--- a/package/jszip/jszip.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  e873e5d0d8549c78c0eafcab8fba40f4a1e27c5a9d48f4a6b2eb122470d0d88c  jszip-3.10.1.tar.gz
-sha256  566c953c6090b1218ca6217dd7359d45dde46581968586dc607d59a78af6a9c4  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
deleted file mode 100644
index f038263a77..0000000000
--- a/package/jszip/jszip.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# jszip
-#
-################################################################################
-
-JSZIP_VERSION = 3.10.1
-JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
-JSZIP_LICENSE = MIT or GPL-3.0
-JSZIP_LICENSE_FILES = LICENSE.markdown
-JSZIP_CPE_ID_VALID = YES
-
-define JSZIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
-		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
