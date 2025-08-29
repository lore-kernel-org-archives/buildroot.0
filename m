Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C4CCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 014EC842D3;
	Fri, 29 Aug 2025 10:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gj0InLvAWBjc; Fri, 29 Aug 2025 10:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B10AF841D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B10AF841D9;
	Fri, 29 Aug 2025 10:33:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF6D36C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C560141559
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3Apm7FhZWcI for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E56041261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E56041261
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E56041261
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:46 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afee6037847so280990566b.1
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463624; x=1757068424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nip1KlWUZN/ahcKZlUZzjbzx40b0l3P2UOmJHU4XJDY=;
 b=U0yIYVpShqw8UKd/dj2BiBR0TN0WmBDBOZQod/mflwWnk1uyP/AK8++FQPOmbffCFo
 dA+QHMMasnbDiz59kI0FYn0G2tMyjfwnCBFzUiG/0x/qp8uLLFJ0DLRRIlUG8Z1etudc
 niasuWQEVZD31WzlQCX6GMdj3jDsHN/R1PzMi28O1xxOzWqbIrsPgxxhteoxMrlzLFVq
 66yy+05olQuvElTEjSPABrC40kk9DJsL0OOCGU5elHHO0EKv0wYRH3oIbKyvZ2uVA4s4
 2B6xBLRxd1rEjnsFzkVkJ2sy3QnhyShJ9vpWoEhbYDKUTphoR6FPxXZAxhlzt6as3Yko
 VWVw==
X-Gm-Message-State: AOJu0YwNq+aqDV7gKr+xnGo1jpc/TSCj85buARGrVXVxjL+s3KjfFQOg
 Lf8ptL0JNlZST04e03Bl1JbwycOe5iTBpMVAq6gU4fwIThA7sYbVqFbxA8JkSwj0zM6jmSrwCE9
 y9cnYq5o=
X-Gm-Gg: ASbGncvU0KJi6+hguX3M4T/lOm9FLoXe4KxUVGOPNqzm3YKf9ZWK949Wx3c/Q19g3k+
 C5HU3CWLzgFo1DWnTrsGChRbksnO4lYvysrdahIvoqiH727VpS7laMwZ9qk7a2ZCqvpEub3wRo8
 BG+6KggtEC+AoGnWO37SIWGevBpJhhICrU88mFul/8e4C7hQyS6tyrIUNu042MnrI8MP7Yg1CTk
 J89YlT/tZVCAsUYhrvtMUWodWFZLCEYNnu/qalkwenyAaXkdsV786ahhV2hLrqt0dQsbJ9JrzPI
 MOPYzyw/gO1wsXt/RKJ+CbULlNrwMeJJlfGpuKZP2L6LMjN2KisQbMekCmUd7bLD/sPveymW11r
 63aj1GxI51xWAoZnb9AY6HRdYOev3+Y+hTSJfZDaTlSIPwTJ0uroaNf0sxGtzng==
X-Google-Smtp-Source: AGHT+IEh5zksuF1Q9tnb6UMopPcmscZ2uBLB6Bn0b3ECFJbJD+Py9ySAuIkoscHFb/pe27fFNue3nA==
X-Received: by 2002:a17:906:6a16:b0:afe:9172:b8bd with SMTP id
 a640c23a62f3a-afe9172bc98mr1361400766b.50.1756463624210; 
 Fri, 29 Aug 2025 03:33:44 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:29 +0200
Message-ID: <20250829103340.158873-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463624; x=1757068424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nip1KlWUZN/ahcKZlUZzjbzx40b0l3P2UOmJHU4XJDY=;
 b=ev9RhJzAAPPLRhn5ivvvlM4Vg/Gco9OsgegacFhZhVur9wo8hZHZE89I5NCDCFWATl
 a6ka/KsXzWI10nqryOEcXwGxEzIaN0tGZYKsrVdk976OJZr4zwSucOV+P1/w2wEH+M28
 eaycoAartgIO8qmFzPYRkaa03ZAfJEAnUo/X8wV39XmlnqgUkKGY7DMRejV9hvCfRwfg
 pMsDfoJPtdEGVZtsN9jHti3m9xbN6bOrpdQfNP18+Pcf6mnBVkgk6EJ0lTVh/t3UbKmF
 AW5wK1gIjgy3JvB71svD4S/CvpNrcv++Z1v9EGIKPwPaW2cAUJhgRI5IgjplCFmLA6Eg
 1Ddw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ev9RhJzA
Subject: [Buildroot] [PATCH 04/15]  package/datatables{, -buttons,
 -fixedcolumns, -responsive}: remove package
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
 Config.in.legacy                              | 24 ++++++++++++++++++
 package/Config.in                             |  4 ---
 package/datatables-buttons/Config.in          | 12 ---------
 .../datatables-buttons.hash                   |  3 ---
 .../datatables-buttons/datatables-buttons.mk  | 25 -------------------
 package/datatables-fixedcolumns/Config.in     | 10 --------
 .../datatables-fixedcolumns.hash              |  3 ---
 .../datatables-fixedcolumns.mk                | 25 -------------------
 package/datatables-responsive/Config.in       | 12 ---------
 .../datatables-responsive.hash                |  3 ---
 .../datatables-responsive.mk                  | 25 -------------------
 package/datatables/Config.in                  |  7 ------
 package/datatables/datatables.hash            |  3 ---
 package/datatables/datatables.mk              | 25 -------------------
 14 files changed, 24 insertions(+), 157 deletions(-)
 delete mode 100644 package/datatables-buttons/Config.in
 delete mode 100644 package/datatables-buttons/datatables-buttons.hash
 delete mode 100644 package/datatables-buttons/datatables-buttons.mk
 delete mode 100644 package/datatables-fixedcolumns/Config.in
 delete mode 100644 package/datatables-fixedcolumns/datatables-fixedcolumns.hash
 delete mode 100644 package/datatables-fixedcolumns/datatables-fixedcolumns.mk
 delete mode 100644 package/datatables-responsive/Config.in
 delete mode 100644 package/datatables-responsive/datatables-responsive.hash
 delete mode 100644 package/datatables-responsive/datatables-responsive.mk
 delete mode 100644 package/datatables/Config.in
 delete mode 100644 package/datatables/datatables.hash
 delete mode 100644 package/datatables/datatables.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 4ef14019ca..c64b986a15 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,30 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_DATATABLES_RESPONSIVE
+	bool "datatables-responsive has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_DATATABLES_FIXEDCOLUMNS
+	bool "datatables-fixedcolumns has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_DATATABLES_BUTTONS
+	bool "datatables-buttons has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
+config BR2_PACKAGE_DATATABLES
+	bool "datatables has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_CHARTJS
 	bool "chartjs has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0fb7d5c24c..f0b11d2f18 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1891,10 +1891,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/datatables/Config.in"
-	source "package/datatables-buttons/Config.in"
-	source "package/datatables-fixedcolumns/Config.in"
-	source "package/datatables-responsive/Config.in"
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
diff --git a/package/datatables-buttons/Config.in b/package/datatables-buttons/Config.in
deleted file mode 100644
index 515038ebe5..0000000000
--- a/package/datatables-buttons/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_DATATABLES_BUTTONS
-	bool "datatables-buttons"
-	depends on BR2_PACKAGE_DATATABLES
-	select BR2_PACKAGE_JSZIP
-	help
-	  The Buttons library for DataTables provides a framework with
-	  common options and API that can be used with DataTables, but
-	  is also very extensible, recognising that you will likely want
-	  to use buttons which perform an action unique to your
-	  applications.
-
-	  https://datatables.net/extensions/buttons
diff --git a/package/datatables-buttons/datatables-buttons.hash b/package/datatables-buttons/datatables-buttons.hash
deleted file mode 100644
index fdbbe5faf0..0000000000
--- a/package/datatables-buttons/datatables-buttons.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  427632c0245f488328edab83b53294545744c8de621a5eaa9dd3d257d7ed7775  Buttons-1.6.1.zip
-sha256  21fa7cbc3c00bcad1e0f3417d465e702bd470d7dc446a6deff80c8fc5eda9148  License.txt
diff --git a/package/datatables-buttons/datatables-buttons.mk b/package/datatables-buttons/datatables-buttons.mk
deleted file mode 100644
index a08be05869..0000000000
--- a/package/datatables-buttons/datatables-buttons.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables-buttons
-#
-################################################################################
-
-DATATABLES_BUTTONS_VERSION = 1.6.1
-DATATABLES_BUTTONS_SITE = https://datatables.net/releases
-DATATABLES_BUTTONS_SOURCE = Buttons-$(DATATABLES_BUTTONS_VERSION).zip
-DATATABLES_BUTTONS_LICENSE = MIT
-DATATABLES_BUTTONS_LICENSE_FILES = License.txt
-
-define DATATABLES_BUTTONS_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_BUTTONS_DL_DIR)/$(DATATABLES_BUTTONS_SOURCE) -d $(@D)
-	mv $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)/* $(@D)
-	rmdir $(@D)/Buttons-$(DATATABLES_BUTTONS_VERSION)
-endef
-
-define DATATABLES_BUTTONS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-buttons/css $(TARGET_DIR)/var/www/datatables-buttons/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/css $(@D)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-buttons/js $(@D)/js/*.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/datatables-fixedcolumns/Config.in b/package/datatables-fixedcolumns/Config.in
deleted file mode 100644
index 4d2e5ea06f..0000000000
--- a/package/datatables-fixedcolumns/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_DATATABLES_FIXEDCOLUMNS
-	bool "datatables-fixedcolumns"
-	depends on BR2_PACKAGE_DATATABLES
-	help
-	  When making use of DataTables' x-axis scrolling feature
-	  (scrollX), you may wish to fix the left or right most columns
-	  in place. This extension for DataTables provides exactly this
-	  option.
-
-	  https://datatables.net/extensions/fixedcolumns
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash b/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
deleted file mode 100644
index 7bd5697dbe..0000000000
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  53a7b20ea9dbb6498137cb7260bde8605989ec578e4b71787f5ebc4ef9910bd9  FixedColumns-3.3.0.zip
-sha256  e8e92f97216f9ea00cb2735b933a91ec8e3869bed37b6d63a90f76f41508f2de  License.txt
diff --git a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk b/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
deleted file mode 100644
index 33174e106f..0000000000
--- a/package/datatables-fixedcolumns/datatables-fixedcolumns.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables-fixedcolumns
-#
-################################################################################
-
-DATATABLES_FIXEDCOLUMNS_VERSION = 3.3.0
-DATATABLES_FIXEDCOLUMNS_SITE = https://datatables.net/releases
-DATATABLES_FIXEDCOLUMNS_SOURCE = FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION).zip
-DATATABLES_FIXEDCOLUMNS_LICENSE = MIT
-DATATABLES_FIXEDCOLUMNS_LICENSE_FILES = License.txt
-
-define DATATABLES_FIXEDCOLUMNS_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_FIXEDCOLUMNS_DL_DIR)/$(DATATABLES_FIXEDCOLUMNS_SOURCE) -d $(@D)
-	mv $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)/* $(@D)
-	rmdir $(@D)/FixedColumns-$(DATATABLES_FIXEDCOLUMNS_VERSION)
-endef
-
-define DATATABLES_FIXEDCOLUMNS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(TARGET_DIR)/var/www/datatables-fixedcolumns/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/css $(@D)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-fixedcolumns/js $(@D)/js/*.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/datatables-responsive/Config.in b/package/datatables-responsive/Config.in
deleted file mode 100644
index 085824af40..0000000000
--- a/package/datatables-responsive/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_DATATABLES_RESPONSIVE
-	bool "datatables-responsive"
-	depends on BR2_PACKAGE_DATATABLES
-	help
-	  In the modern world of responsive web design tables can often
-	  cause a particular problem for designers due to their row
-	  based layout.  Responsive is an extension for DataTables that
-	  resolves that problem by optimising the table's layout for
-	  different screen sizes through the dynamic insertion and
-	  removal of columns from the table.
-
-	  https://datatables.net/extensions/responsive
diff --git a/package/datatables-responsive/datatables-responsive.hash b/package/datatables-responsive/datatables-responsive.hash
deleted file mode 100644
index df133f040c..0000000000
--- a/package/datatables-responsive/datatables-responsive.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  47caf3b753dd2c537b8834816eaf38c4df214cb4e6a97144e0de4cf82ad24d02  Responsive-2.2.3.zip
-sha256  da4e1020ae97c095a14d7830c1a8a793e080c062e22d749ecd3fc3c075673dbf  License.txt
diff --git a/package/datatables-responsive/datatables-responsive.mk b/package/datatables-responsive/datatables-responsive.mk
deleted file mode 100644
index 2809a52280..0000000000
--- a/package/datatables-responsive/datatables-responsive.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables-responsive
-#
-################################################################################
-
-DATATABLES_RESPONSIVE_VERSION = 2.2.3
-DATATABLES_RESPONSIVE_SITE = https://datatables.net/releases
-DATATABLES_RESPONSIVE_SOURCE = Responsive-$(DATATABLES_RESPONSIVE_VERSION).zip
-DATATABLES_RESPONSIVE_LICENSE = MIT
-DATATABLES_RESPONSIVE_LICENSE_FILES = License.txt
-
-define DATATABLES_RESPONSIVE_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_RESPONSIVE_DL_DIR)/$(DATATABLES_RESPONSIVE_SOURCE) -d $(@D)
-	mv $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)/* $(@D)
-	rmdir $(@D)/Responsive-$(DATATABLES_RESPONSIVE_VERSION)
-endef
-
-define DATATABLES_RESPONSIVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables-responsive/css $(TARGET_DIR)/var/www/datatables-responsive/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/css $(@D)/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables-responsive/js $(@D)/js/*.min.js
-endef
-
-$(eval $(generic-package))
diff --git a/package/datatables/Config.in b/package/datatables/Config.in
deleted file mode 100644
index 89009712d8..0000000000
--- a/package/datatables/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_DATATABLES
-	bool "datatables"
-	help
-	  Javascript library providing advanced interaction controls
-	  for your HTML tables.
-
-	  https://datatables.net
diff --git a/package/datatables/datatables.hash b/package/datatables/datatables.hash
deleted file mode 100644
index bb31fcac3d..0000000000
--- a/package/datatables/datatables.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  e2c79dd9d02caa04130ce888061bc922e18561e72e842ba0cb657d1812d9f1bf  DataTables-1.10.20.zip
-sha256  c6a873f21550ed804f76013c36e14225704c1aa551fdb870e0c626eb91c19247  license.txt
diff --git a/package/datatables/datatables.mk b/package/datatables/datatables.mk
deleted file mode 100644
index c20cdf1254..0000000000
--- a/package/datatables/datatables.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# datatables
-#
-################################################################################
-
-DATATABLES_VERSION = 1.10.20
-DATATABLES_SITE = https://datatables.net/releases
-DATATABLES_SOURCE = DataTables-$(DATATABLES_VERSION).zip
-DATATABLES_LICENSE = MIT
-DATATABLES_LICENSE_FILES = license.txt
-
-define DATATABLES_EXTRACT_CMDS
-	$(UNZIP) $(DATATABLES_DL_DIR)/$(DATATABLES_SOURCE) -d $(@D)
-	mv $(@D)/DataTables-$(DATATABLES_VERSION)/* $(@D)
-	rmdir $(@D)/DataTables-$(DATATABLES_VERSION)
-endef
-
-define DATATABLES_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables/css $(TARGET_DIR)/var/www/datatables/js
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/css $(@D)/media/css/*.min.css
-	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/js $(@D)/media/js/*.min.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
