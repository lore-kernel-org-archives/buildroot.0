Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E53CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E97F6155A;
	Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCTPW31QYDY7; Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584E461567
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584E461567;
	Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4859CD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8E85840F5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffRx9QabBbDS for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE47284129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE47284129
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE47284129
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb7a7bad8so266699766b.3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463622; x=1757068422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGvRR1amQ9cR7vNM5J2A0sOmbYSUqIYZ7JmfCxnp2kE=;
 b=GMKy81bJMeVNHHl7/CjjWniG/IsAwz0/AeIyglxa2zv6yS3bLn3okFshyc39qWtSS6
 4NZpPoaZ6NpdKSmLZlnbX7KweDU4RClyoqirLSVazs1fvYvp3uOGT6YkLATIbHYgHJJu
 M2yepSSv4k82vSgAS6xfN6IafAbXB7W2bBazGgG37LEhc+0JwRqQCiXONFK01LASc/9u
 bMbQVbSTbCW8SKoRO+oj1GuZyBiSvaqRfcVc9wSlUwArEJg7JdG2ED8uQl63jaq9uJBx
 nNXGIB4ZuIZ1BOJjddqUlhnU3okf7R242PlIEfwY+934lvjsdsXVyRf0zrV4Xb7qSL3A
 HGBw==
X-Gm-Message-State: AOJu0YzJbAMnEgKJkusIwTwJCxw1LgCVHtQS1nLnkpaY4UfTHIe74BI/
 Dn7TEQNIO7vGrPJXj4kEHlpA/SCzC5oFL7OlZFtGCfIchOjVmEXoQXyc4EAdYWWALPSa2i0RfHa
 4CD8QszE=
X-Gm-Gg: ASbGncvGKLVvIW7YpiZYGnFu5j/w3bAIWdTQPZvYChQD/FhY2f+HVJmmXxkSBDgeD6C
 ual5ta4JTiNC8cO74MiAhcuyMZ/lPQt6D3UlN6ndJBf+TB5Ss8VtTfX8+lDF47+pbrVsRstyWzj
 GNcBXi+WxxD0o8VFmrIIgS2+sxQZuzGCHTMRAOreiTXW9RqBZ0CNqkrgq2ogHLN4McjCfSkTjgZ
 mmZBibDpI/JiGJYMwnXceunJY3nEho2GBbkwUxs9F7yzeT/xzaS2gYNI8QpR0Lz/suht96RErYD
 8rONTydT2a0P4Xa6anYt2GxtOOwPf93cu54DoUsO6MWfoQNui52v/wWeGd+7olQqRPA16tndm96
 xhLD/7jXfiOceHd+SfeIPdzeVArTrMSzhGOeXkee8l5d3u8CpVs4f3qdgAYmDQA==
X-Google-Smtp-Source: AGHT+IGftxxL7IzB9MI+mnZPIBIxNzS2cNbqHT0eeWu0ig1IE9N4FyJVaCX3vB3CG6ZWAw+nuAFRLw==
X-Received: by 2002:a17:907:7ba1:b0:afe:de7c:4333 with SMTP id
 a640c23a62f3a-afede7c5564mr585636366b.30.1756463622074; 
 Fri, 29 Aug 2025 03:33:42 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:27 +0200
Message-ID: <20250829103340.158873-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463622; x=1757068422; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGvRR1amQ9cR7vNM5J2A0sOmbYSUqIYZ7JmfCxnp2kE=;
 b=KkPV6H/IOHshgwE5xEYOYRESfQ28uKDMmQ4yn9OYqY63skM6Pu5GoCpp/xZCsL5S8E
 MEC0XncNY6l/kEhr5o6hGe0ODIeaPYaUryhIbp/ES4rnDsYwZnJ8v8Y2fdP/D7xO+5hp
 Aj6eEhishTG/x+YpJ7E9feCGYvrdrayOCKxCR2wrcxwxxz21i8tpwPrPJxvxMnRxYU3w
 DJp7boikNLYziVveTJlbngYipgYNthtEFNS7f1VCtTrQwSYx1cYsyOIE/SKaxHq9OOKN
 5QYP4Dl77XQAm//OxueVUImF2AemOs0HI1k/hMoq9udM0eCEP5rR3kidM6FTMSDNPJC7
 647g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KkPV6H/I
Subject: [Buildroot] [PATCH 02/15] package/bootstrap: remove package
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
 Config.in.legacy                 |  6 ++++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/bootstrap/Config.in      |  7 -------
 package/bootstrap/bootstrap.hash |  3 ---
 package/bootstrap/bootstrap.mk   | 28 ----------------------------
 6 files changed, 6 insertions(+), 40 deletions(-)
 delete mode 100644 package/bootstrap/Config.in
 delete mode 100644 package/bootstrap/bootstrap.hash
 delete mode 100644 package/bootstrap/bootstrap.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 0bedc24dce..c1657af954 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_BOOTSTRAP
+	bool "bootstrap has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_KERNEL_HEADERS_6_15
 	bool "kernel headers version 6.15.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b33dbf8c5e..4cce31cac3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3467,7 +3467,6 @@ F:	package/acl/
 F:	package/attr/
 F:	package/avrdude/
 F:	package/boost/
-F:	package/bootstrap/
 F:	package/cannelloni/
 F:	package/can-utils/
 F:	package/circus/
diff --git a/package/Config.in b/package/Config.in
index 899301078e..a6b4213262 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1891,7 +1891,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/bootstrap/Config.in"
 	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
 	source "package/datatables-buttons/Config.in"
diff --git a/package/bootstrap/Config.in b/package/bootstrap/Config.in
deleted file mode 100644
index 743d8a324a..0000000000
--- a/package/bootstrap/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_BOOTSTRAP
-	bool "bootstrap"
-	help
-	  Bootstrap is the most popular HTML, CSS, and JS framework
-	  for developing responsive, mobile first projects on the web.
-
-	  http://getbootstrap.com
diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
deleted file mode 100644
index a9602f7e49..0000000000
--- a/package/bootstrap/bootstrap.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  888ffd30b7e192381e2f6a948ca04669fdcc2ccc2ba016de00d38c8e30793323  bootstrap-4.3.1-dist.zip
-sha256  35fbb6dc3891aacaf1ffa07abec2344fdbc454aab533a2a03bcf93577eb7837b  css/bootstrap.css
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
deleted file mode 100644
index eba1244ad3..0000000000
--- a/package/bootstrap/bootstrap.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# bootstrap
-#
-################################################################################
-
-BOOTSTRAP_VERSION = 4.3.1
-BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
-BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
-BOOTSTRAP_LICENSE = MIT
-BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
-BOOTSTRAP_CPE_ID_VENDOR = getbootstrap
-
-define BOOTSTRAP_EXTRACT_CMDS
-	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
-	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist/* $(@D)
-endef
-
-define BOOTSTRAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css \
-		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css
-	$(INSTALL) -m 0644 -D $(@D)/css/bootstrap.min.css.map \
-		$(TARGET_DIR)/var/www/bootstrap/css/bootstrap.min.css.map
-	$(INSTALL) -m 0644 -D $(@D)/js/bootstrap.min.js \
-		$(TARGET_DIR)/var/www/bootstrap/js/bootstrap.min.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
