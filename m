Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552BCCA0FFF
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 247AE8412C;
	Fri, 29 Aug 2025 10:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRWR7eOzTVOT; Fri, 29 Aug 2025 10:33:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13FE842C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13FE842C3;
	Fri, 29 Aug 2025 10:33:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11ED16C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03C0541866
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRL3DRNOUA10 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BADA141863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADA141863
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BADA141863
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso276889866b.0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463627; x=1757068427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+0Nth2wbvNa2E5AytmPdBtjWzALUqpQnZ3dIhxRblc=;
 b=kL4jkH+dCtfNupWnHCmxABucflftANdJAwoIXS+zOc6AgD1HQwC2VYMxLxh9GU+n0x
 5Be0WCHCdQ/folxQ1+jAB5lc0hqCSwP+m7O13T+9j2FrpV0t/JT5MRA85yDGuuyhWk+u
 ZNb1/MlOmmbrBLo+nV9CaC27VytPbIcbBy+wMONylsqnaIOwThaKEFODYJrjtI1g0B1o
 QSgcmiKefe9+oKoZHTLKqCeYM8Z905vxcVB6f1FZH6JgKq0yW4j0tgTWepNr89qxAhhi
 ayZ4eX2A4YgRytQjgokLyrDkD4dRRMKFOIqR0OpbV6/wfcAEv14JYO2BSuPDykNmr5IY
 kjwQ==
X-Gm-Message-State: AOJu0Yy0d3OyAuW+I4g6KxZeU8P3Z/hdYgPYLnxbJIXYj/8KUWLCOWJF
 5DAOVobrLytYDEUID/LNAW2z0x+GpkC8tU8J+8Zw0Q3+WFMm95+GuEfSAjmLU+FdhftUCfbk/NS
 Z7EBNOug=
X-Gm-Gg: ASbGnctgG1BKm+G0PrIzUcP7fdsjOM4RX4lLNv/T4ZzFe9hYlauCEMNF9aQGGNLUuqI
 BhBeVaK3D75HtO4aQnXc7E2t+DMSU7xmyDttvOxIG1T7sRXXrTu7dw+frLBggRyy0rjLraf0714
 tUJSNpxh4TyjBbZ+peDBPpbTX05+Fk2fgGtCcjlAmlKiIS2URYHnHmPkeXRfAVHrt6aT6u9wsCK
 nPrd/ssG6oxs7LHLrg7XqMPrY76yZ84fCj5YI9fRzP0WRMH/7sBJghFuu/ZQv+tfIO6s6fJTwtc
 M4f+whFUz2O2ZI5kfwLQDrnmfFDXsKk6XpIhq68eE2hZ6CFJziZKK5an6+wzcRCJJK/b++LUBYV
 Y67ZzmyNbeKdxDT/mntYCA57Jmm4Kv5yFiZRTq95Ri+4uzQ9KqTU=
X-Google-Smtp-Source: AGHT+IFM/rm202e85jHp9YaeKFvnXLRxpQ2ckEV5Fjc9jYmS6KVZlEBz7+5P1QpyDcSCOGsdjm6epA==
X-Received: by 2002:a17:907:2d23:b0:afe:b7c3:df29 with SMTP id
 a640c23a62f3a-afeb7c4a718mr973937166b.8.1756463626523; 
 Fri, 29 Aug 2025 03:33:46 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:32 +0200
Message-ID: <20250829103340.158873-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829103340.158873-1-thomas.perale@mind.be>
References: <20250829103340.158873-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463627; x=1757068427; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+0Nth2wbvNa2E5AytmPdBtjWzALUqpQnZ3dIhxRblc=;
 b=byMTrJRx0GCf7rdXD82xZC5CBvoUGSEtN5HtEIucDy/sks0h/cOXcouUoAmKDFMgYX
 JUmlALb1+YwVgNh8Ht4ptW9yriZ+m4xURSZcUcq/+D/nEBS23AO51jL4+e9yxXkZ3kE7
 08O30LGmrL4NV1iyuRjucTCKyrJrVXxB6lKsc19RYEio6KvaUp/Gw77PIhekWNTOl64a
 Vy55wLBsMZoCudwfOVlJYGIAXMqBToHs4PahmBNmVvb54cbfCYJStwYcgJbfOPYapSbt
 FtVFiC5z817A/OI4681EAdD5T7cA35IRcUKq+2Oscb2CFSN3ryJSUBxMorcBK82zKJZo
 lbvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=byMTrJRx
Subject: [Buildroot] [PATCH 07/15] package/forge: remove package
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
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/forge/Config.in  |  7 -------
 package/forge/forge.hash |  3 ---
 package/forge/forge.mk   | 24 ------------------------
 6 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 package/forge/Config.in
 delete mode 100644 package/forge/forge.hash
 delete mode 100644 package/forge/forge.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 729193f4c5..1c6b9abdd9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_FORGE
+	bool "forge has been removed"
+	select BR2_LEGACY
+	help
+	  JS libraries are no longer part of Buildroot packages.
+
 config BR2_PACKAGE_FLOT_TIME
 	bool "flot-time has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 4cce31cac3..80171a5e70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1705,7 +1705,6 @@ F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
 F:	package/erlang-xmpp/
-F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
 F:	package/vuejs/
diff --git a/package/Config.in b/package/Config.in
index 2a86c81edc..40d2a9ef6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1892,7 +1892,6 @@ endmenu
 
 menu "Javascript"
 	source "package/duktape/Config.in"
-	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
 menu "External jQuery plugins"
diff --git a/package/forge/Config.in b/package/forge/Config.in
deleted file mode 100644
index 86d4832101..0000000000
--- a/package/forge/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_FORGE
-	bool "forge"
-	help
-	  A native implementation of TLS (and various other
-	  cryptographic tools) in JavaScript.
-
-	  https://github.com/digitalbazaar/forge
diff --git a/package/forge/forge.hash b/package/forge/forge.hash
deleted file mode 100644
index 36e92be743..0000000000
--- a/package/forge/forge.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  77de03720cd00fafdbcda47e3e995a1f548f2e9028d11a98b0d9bef37ec2ad85  node-forge-1.3.1.tgz
-sha256  f63ff0e4e239244aa79280da2dd4811a0469e5e201caf5cbc0d97c3a1dff8e82  LICENSE
diff --git a/package/forge/forge.mk b/package/forge/forge.mk
deleted file mode 100644
index 0b81295a15..0000000000
--- a/package/forge/forge.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# forge
-#
-################################################################################
-
-FORGE_VERSION = 1.3.1
-FORGE_SITE = https://registry.npmjs.org/node-forge/-
-FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
-FORGE_LICENSE = BSD-3-Clause, GPL-2.0, vendored dependencies licenses probably not listed
-FORGE_LICENSE_FILES = LICENSE
-FORGE_CPE_ID_VENDOR = digitalbazaar
-
-# Install .min.js as .js
-define FORGE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/forge.all.min.js \
-		$(TARGET_DIR)/var/www/forge.all.js
-	$(INSTALL) -m 644 -D $(@D)/dist/forge.min.js \
-		$(TARGET_DIR)/var/www/forge.js
-	$(INSTALL) -m 644 -D $(@D)/dist/prime.worker.min.js \
-		$(TARGET_DIR)/var/www/prime.worker.js
-endef
-
-$(eval $(generic-package))
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
