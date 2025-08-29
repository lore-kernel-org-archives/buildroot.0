Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C45DCA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2596841E0;
	Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsbJ8mJRy1-V; Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F61841D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F61841D9;
	Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 142F6D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 020D084129
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4c6Gbm3UM7Xw for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78BA884151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78BA884151
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78BA884151
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb73394b4so279393966b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463623; x=1757068423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXNYbCpWW1QyqBJNv9/8W8K23g2MSS1uYja48i+9KOs=;
 b=r/sU7diNYit/6BaOuKo8/taax0TRMta4QMcUgYCaYNedUKwgIhX/7FYXG876q5i9UI
 zrUY50edRowmfRE8w9cp3srmnSemngT7GOBvkgDcOauUUlPJ3uwW6Vz4vLqxrX7M1DaM
 75xL9CZNyzVVSbr9IMDqjru+R+TV13e8PDz0jeLccCMiqfjsgCbSnH6zZ/sXcjVEIowv
 fNOgXJOlTacF2pO4XFh/9hxrEouA1ntjLxoKfeq3Nr/J/3vYbZgxxFGsZ7CxGsGQ00Zv
 xLEafpgQSDKt5sXGsmvqrG1CEg+YsjE+/zqjgL4RLSKmEdotVFLcltq03gAnzKHtObFX
 yrtQ==
X-Gm-Message-State: AOJu0YwRp4tb60x7E/EwxXrUo3YEgYgujXCqQG8bnn+InpNixyuzGs10
 sVpvSNMwnADuSvQpYI2cgfGZHGhlxeqtfXS88ipauS+Ej9x//uHgzf+AZKagjcCekm/0GZThkIV
 gmcnW9cs=
X-Gm-Gg: ASbGncsNm9ZanrmrfI/sshXPef8fOWDZX2GLtnkX2TjqF3O3BPPoLoI4GhaW/Yma+Fo
 etfyOIlqknQrk0qCRbfkA5D1XDBk6T3JnjGuz1kSNRJGtLvTX+ZAdN+FtUj0G/KIzpawBVJkQOp
 m/UuIuFV5qg+jnkSTUdXL1aYwXgdu1csktZ45Ga7o64M+66nPsw2PTmohgMWZzHVJsJMgBN5MyD
 2sxULVJtGdNPI6/SvkfKZw2dvMgX0UiUEVqq3MyLdUL5L/81gDB+2QmddVLviijpRmvXix+IaRK
 iCIvZRnhW6vENTnRlveHR+tPYBJbVlLJEKxw1x3lxMIjJ3rk6ivJ1cQETUg+L5bqhcsYOBRCDbn
 HADz5mTLwEixVmAY/JBy6dERKakHOCIbEJQbvJ31T058ij+JFx/jOXDmeYp+tVQ==
X-Google-Smtp-Source: AGHT+IH2SpsJ0Fz98GYME6m437lcPP+o5A5y7Gkp2tiaPsLYUalMYA/Yh8KgHaVHnt/lZa2jw/lEbg==
X-Received: by 2002:a17:907:3d90:b0:afe:c6a0:ba0 with SMTP id
 a640c23a62f3a-afec6a014fcmr958959766b.11.1756463623292; 
 Fri, 29 Aug 2025 03:33:43 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:28 +0200
Message-ID: <20250829103340.158873-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463623; x=1757068423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXNYbCpWW1QyqBJNv9/8W8K23g2MSS1uYja48i+9KOs=;
 b=WgkieyCjr1SF3yPlYAtsebp3m1rpqj9+Mynr4FLwM3daU1QACULbvkO6ddXBqHEjM+
 gEQZDwmXsAt/hHyzihrDbeY9bjRbe2RgMe6BJ7n/hjuovym3dkcw4en9oEGqNWO3LOTr
 iTHb9RtxF5qJlJ7390CIB9CRjdByxDRMp6FsXRFpO6QCD5OLY0GCK0lTembcIq/G/902
 0QbQmLVpqnYuLH3wc2q+XUcfhNUzrwqTJqd0aHLix1ex13Qkhm6ZKmUPD7xSw38/cYyB
 ePBxfcvqkRJJk+H6AkaNoBQAK20Imi+2qP7hnZZUzlH1ez1TmTGWYR7iA60PR00ZU/GV
 aLhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WgkieyCj
Subject: [Buildroot] [PATCH 03/15] package/chartjs: remove package
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
 Config.in.legacy             |  6 ++++++
 package/Config.in            |  1 -
 package/chartjs/Config.in    |  7 -------
 package/chartjs/chartjs.hash |  3 ---
 package/chartjs/chartjs.mk   | 20 --------------------
 5 files changed, 6 insertions(+), 31 deletions(-)
 delete mode 100644 package/chartjs/Config.in
 delete mode 100644 package/chartjs/chartjs.hash
 delete mode 100644 package/chartjs/chartjs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c1657af954..4ef14019ca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_CHARTJS
+	bool "chartjs has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_BOOTSTRAP
 	bool "bootstrap has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a6b4213262..0fb7d5c24c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1891,7 +1891,6 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
-	source "package/chartjs/Config.in"
 	source "package/datatables/Config.in"
 	source "package/datatables-buttons/Config.in"
 	source "package/datatables-fixedcolumns/Config.in"
diff --git a/package/chartjs/Config.in b/package/chartjs/Config.in
deleted file mode 100644
index 73cc9b7750..0000000000
--- a/package/chartjs/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_CHARTJS
-	bool "chartjs"
-	help
-	  Chart.js, a simple yet flexible JavaScript charting library
-	  for designers & developers
-
-	  https://www.chartjs.org/
diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
deleted file mode 100644
index 0f97d0a4a2..0000000000
--- a/package/chartjs/chartjs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  chart.js-3.9.1.tgz
-sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
deleted file mode 100644
index 5ed4b3d9c3..0000000000
--- a/package/chartjs/chartjs.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# chartjs
-#
-################################################################################
-
-CHARTJS_VERSION = 3.9.1
-CHARTJS_SITE = https://registry.npmjs.org/chart.js/-
-CHARTJS_SOURCE = chart.js-$(CHARTJS_VERSION).tgz
-CHARTJS_LICENSE = MIT
-CHARTJS_LICENSE_FILES = LICENSE.md
-CHARTJS_CPE_ID_VENDOR = chartjs
-CHARTJS_CPE_ID_PRODUCT = chart.js
-
-define CHARTJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/chart.min.js \
-		$(TARGET_DIR)/var/www/chartjs/js/Chart.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
