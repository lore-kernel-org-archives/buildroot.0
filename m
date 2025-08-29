Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BAACA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C8C615B4;
	Fri, 29 Aug 2025 10:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYBIO5YIoxIK; Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B80F8615AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B80F8615AF;
	Fri, 29 Aug 2025 10:33:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92CD6D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 774F26159D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pxtLcwLW7XP for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A2C7615B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A2C7615B1
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A2C7615B1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7a8dd3dso225115366b.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463628; x=1757068428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inUfd7E7v/Wh2tekHavStggdwB0Q4oLp1IZDFQHXjgE=;
 b=jqs+ZCp9gyAqsXnYfMnEUHkqojXa5hEsLt264v85FaIa4CCYLzHKrX0FihZcdHMF4i
 GEBefFWC0mb9QnXqzoNEPDmxkbFRlgqLwpZalPWCx+Bs5zSPZdibqT0LB/9MUFbuAV/J
 3Ri7gnVCsEPjZggbLhnNXTS5yGmvLvA1Pofr1Lliui8qIGTRmmJFUwhWl2TtVEzOnwii
 26T5Fm8k2PctjuYWGUZ39Jk2FAE995M1ByPpm252wexK3QEQZrbzCc57FuJzkaaGHgfI
 7mpqb4OKoYNeny+6KXXgkVzQLYYfH9B+QalHvauhdeK+LwiZhlDBzIRxgr490609w4W8
 jGgw==
X-Gm-Message-State: AOJu0YwwslpID4OnPBfShJiXpnq8Fj3KKaF3By+TtZc3C8ZTUSJklu75
 SJ7LyQlByd1pHmkdL6Rxb6LslILEH6newzSBCupwQK0jEwCajWCCTazLOobxUOLPX9dBK80hPl9
 1K6n9wdA=
X-Gm-Gg: ASbGncv3I7Tb27v47k5DqPy8o14IWcriqtY2mZGzDyStYwAYr39BWL3hCeUahUXO0qQ
 TAaEHxN6apKU8BMMUjwBhDOlYppZvsMgig6PT0HBtpG4Fn6uoOldL6SWrekXgUeUYLrNBMxN1S8
 7iQi3h9VFhPuDT6TOcB4xAoanNioT1Tf/zqfbYFkeWlNZk+B42SKvDQys8N/VsMwABd2yc9CIhg
 d+JUpxhT/75LBhY8dHmXhvdC2z0IKPW9V9vG9nZoO5N9wtQ/rQZ40CqdOmi9U2T7q1Xj1dffxj9
 aqS4H77ynl+SGoPjCkfQMtLLR7Cu9YdGeHTYMHY2l79iyAAE8YNgD//VRnnEMo4mqAJMa/+jMBp
 qShDvsuArbSW/K0yX97l3Lao70ELBx9GFtfzgO8gXefQ7y0r9ze80Fqv+03rSHA==
X-Google-Smtp-Source: AGHT+IHFl9YsiKVf0eMHEUmVeAJnlcthPJHkvgDTFoZN20HBEHk+kjpiGiFt91ktGe3htasdg1y8Wg==
X-Received: by 2002:a17:907:728c:b0:afe:d62a:f038 with SMTP id
 a640c23a62f3a-afed62af616mr576532066b.8.1756463628022; 
 Fri, 29 Aug 2025 03:33:48 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:34 +0200
Message-ID: <20250829103340.158873-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463628; x=1757068428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inUfd7E7v/Wh2tekHavStggdwB0Q4oLp1IZDFQHXjgE=;
 b=YYONfhmzj+M+wQv39TUJQRG41zCOxNL9U+cO2IcUNm8OoSfxVSqli4+6fIPVtVY+OF
 egEYpxcmPzd6eNFh2jA0rRgipwvPl0uWh+t6tT3lINdT79WPXCoqXvnr9fo35j8fYhH3
 XiuJ5UXv8XZRbVNiC8QJUXWrEFdyI68bpFAZq/jiYhFcj++tfWZbEXwTSdqlK3i10919
 +AwwEnCp5uRd2ztIMugRpF4ATQRmxd3g0VcMh1xeO0xcMX7qKgSVlhlA5iDojrN2WTJp
 4SU/z/f4+NjiP1/Aow37lkCK73YORYnjPZlpjeAEyc5TbatheskxqCWNFcIzrSpS7MWO
 ciyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YYONfhmz
Subject: [Buildroot] [PATCH 09/15] package/json-javascript: remove package
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
 Config.in.legacy                             |  6 ++++++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/json-javascript/Config.in            |  6 ------
 package/json-javascript/json-javascript.hash |  3 ---
 package/json-javascript/json-javascript.mk   | 16 ----------------
 6 files changed, 6 insertions(+), 27 deletions(-)
 delete mode 100644 package/json-javascript/Config.in
 delete mode 100644 package/json-javascript/json-javascript.hash
 delete mode 100644 package/json-javascript/json-javascript.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ead8e942da..fca1b84e7a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_JSON_JAVASCRIPT
+	bool "json-javascript has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_JQUERY_VALIDATION
 	bool "jquery-validation has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 60cb2fe051..6ffc437103 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3056,7 +3056,6 @@ F:	package/czmq/
 F:	package/filemq/
 F:	package/googlefontdirectory/
 F:	package/jansson/
-F:	package/json-javascript/
 F:	package/lcdapi/
 F:	package/libfreefare/
 F:	package/libjson/
diff --git a/package/Config.in b/package/Config.in
index 4c560dff1f..5d779e66d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1893,7 +1893,6 @@ endmenu
 menu "Javascript"
 	source "package/duktape/Config.in"
 	source "package/jsmin/Config.in"
-	source "package/json-javascript/Config.in"
 	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/vis-network/Config.in"
diff --git a/package/json-javascript/Config.in b/package/json-javascript/Config.in
deleted file mode 100644
index 501c54f3d1..0000000000
--- a/package/json-javascript/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_JSON_JAVASCRIPT
-	bool "json-javascript"
-	help
-	  JSON in JavaScript
-
-	  https://github.com/douglascrockford/JSON-js/
diff --git a/package/json-javascript/json-javascript.hash b/package/json-javascript/json-javascript.hash
deleted file mode 100644
index 9522fee9ea..0000000000
--- a/package/json-javascript/json-javascript.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  1a9dd4429e4bb4929dcb438f9591a3625bc8cc161f840b5f843d8b1d2c8dcfe5  json-javascript-3d7767b6b1f3da363c625ff54e63bbf20e9e83ac.tar.gz
-sha256  925947d3d711c4441a9db20f51215fbf5c119d2a3b51cadb2c9031907d8014b5  json2.js
diff --git a/package/json-javascript/json-javascript.mk b/package/json-javascript/json-javascript.mk
deleted file mode 100644
index c15b5319b3..0000000000
--- a/package/json-javascript/json-javascript.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# json-javascript
-#
-################################################################################
-
-JSON_JAVASCRIPT_VERSION = 3d7767b6b1f3da363c625ff54e63bbf20e9e83ac
-JSON_JAVASCRIPT_SITE = $(call github,douglascrockford,JSON-js,$(JSON_JAVASCRIPT_VERSION))
-JSON_JAVASCRIPT_LICENSE = Public Domain
-JSON_JAVASCRIPT_LICENSE_FILES = json2.js
-
-define JSON_JAVASCRIPT_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/json2.js $(TARGET_DIR)/var/www/json2.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
