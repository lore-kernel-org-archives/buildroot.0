Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4D4C52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534D660900;
	Wed,  7 Aug 2024 14:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQDGx7yO8qKp; Wed,  7 Aug 2024 14:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D996070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7D996070A;
	Wed,  7 Aug 2024 14:34:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78F221BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66659401BD
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhByl8-as_HX for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CDB440198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CDB440198
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CDB440198
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ef23d04541so20837931fa.2
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041276; x=1723646076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IGVByoHk41i3neiBFZUdJP8RTZdh8TIUSuwMI61ybqc=;
 b=oc9ysuGMx6C+UJJyXV8pP8NVNFgC2svJmVBEUp9Qmv4M7EBPzh3XrccIeBbNSAhC3N
 VJxMj+FIvsKVgYVHIWR5xZ5LdJMO6CqQH1kZHMkIVVD+Pl/FdmuvllQfUJqy/LhyYp/e
 Pe/Bs2MJc/lFfe8dZ4NK44LeTd0uzIFJ4cPhhRMc56ew2J8K597vQweO0osFsJBP3iaU
 UTC4gY721xA78b6WtM4JAUt48JHMUst+yzknYNtuSZUzgOuo8G5el1lbifFKt8GBcU/O
 qw0Z4csjcweFEst03DL6PvFpy0gzrN3SOOJ31Y+kXTdTRCUpY0s1Gfu7iNJoztHedOQT
 wuSQ==
X-Gm-Message-State: AOJu0Yx13nH9ZLUbkIF/B92kbJ+4kPEDDXwRRn9H2RO817SD+FsrHIL9
 pSJ3rRynVGvp/jOhE21yGPCVgMtq9AeyEAP0VM8Zkx1nbCRcLA606L9IHg==
X-Google-Smtp-Source: AGHT+IEjii7tFZj07OghJDb1CGsTyeRzEGRRpPmey38Cw/RzduDJkSHeMoJ0+9iv4av3oJwWOus8LA==
X-Received: by 2002:a2e:8609:0:b0:2ec:55b5:ed45 with SMTP id
 38308e7fff4ca-2f15aac36d2mr122602691fa.24.1723041275776; 
 Wed, 07 Aug 2024 07:34:35 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:34 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:08 +0200
Message-Id: <20240807143318.439619-9-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041276; x=1723646076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGVByoHk41i3neiBFZUdJP8RTZdh8TIUSuwMI61ybqc=;
 b=a3589piV5XLdoviRFCVmZ+BMnwD1xvNWFeLC9LROPaJ3uiPQsDTRbGrsfDKTnv33EI
 uj0ZKEmeIDSNwVP4ArOnNF0YAZDWIW0QXwSqafnWDAqxYKjBG4KB4kOCIK/ledXV27jx
 3aVJaIXmS1pPr1BHUJ7r2iaFp0Y6zSywtBkO53VdJh65Ihm45dI4+Ex9HjBH6Z+YLNON
 NDpsIiDqnmWZZJeXMGCPxuS1TND9dSgW34pdp5P/SKFGi2r372JzGzn79tnKX4uIGDJq
 2vDg60OAVlXxm7ta1KJhXXH3kPRvjem378kCdPC62mIBc2MBvj42ZPnqxP3UMn2sYaGK
 D01g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a3589piV
Subject: [Buildroot] [PATCH 08/18] package/erlang-fast-yaml: renamed from
 erlang-p1-yaml
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

and bump version to 1.0.37. The upstream project has been renamed from
p1_yaml to fast_yaml. Use the same name so packages that depends on it,
find its content in the fast_yaml/ directory.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  2 +-
 package/ejabberd/Config.in                    |  2 +-
 package/ejabberd/ejabberd.mk                  |  2 +-
 .../Config.in                                 |  6 +++---
 .../erlang-fast-yaml.hash}                    |  2 +-
 package/erlang-fast-yaml/erlang-fast-yaml.mk  | 20 +++++++++++++++++++
 package/erlang-p1-yaml/erlang-p1-yaml.mk      | 20 -------------------
 package/erlang-p1-yconf/Config.in             |  2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk    |  2 +-
 10 files changed, 30 insertions(+), 30 deletions(-)
 rename package/{erlang-p1-yaml => erlang-fast-yaml}/Config.in (51%)
 rename package/{erlang-p1-yaml/erlang-p1-yaml.hash => erlang-fast-yaml/erlang-fast-yaml.hash} (50%)
 create mode 100644 package/erlang-fast-yaml/erlang-fast-yaml.mk
 delete mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8318fb5cb4..3ecdb4a93c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1657,6 +1657,7 @@ F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
 F:	package/erlang-fast-xml/
+F:	package/erlang-fast-yaml/
 F:	package/erlang-goldrush/
 F:	package/erlang-idna/
 F:	package/erlang-jiffy/
@@ -1671,7 +1672,6 @@ F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
-F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
diff --git a/package/Config.in b/package/Config.in
index 27902475cb..c2b361309e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-fast-xml/Config.in"
+	source "package/erlang-fast-yaml/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
@@ -688,7 +689,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
-	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 	source "package/erlang-stun/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index e631e665d1..f46e40035d 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
 	select BR2_PACKAGE_ERLANG_FAST_XML
+	select BR2_PACKAGE_ERLANG_FAST_YAML
 	select BR2_PACKAGE_ERLANG_IDNA # runtime
 	select BR2_PACKAGE_ERLANG_JIFFY # runtime
 	select BR2_PACKAGE_ERLANG_JOSE # runtime
@@ -17,7 +18,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_ERLANG_STUN
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 3824f2a530..58b544fb84 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -12,7 +12,7 @@ EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-stun erlang-p1-tls \
-	erlang-p1-utils erlang-fast-xml erlang-xmpp erlang-p1-yaml \
+	erlang-p1-utils erlang-fast-xml erlang-xmpp erlang-fast-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-xmpp
 
 # 0001-Makefile.in-do-not-download-or-compile-dependencies.patch
diff --git a/package/erlang-p1-yaml/Config.in b/package/erlang-fast-yaml/Config.in
similarity index 51%
rename from package/erlang-p1-yaml/Config.in
rename to package/erlang-fast-yaml/Config.in
index 2ab78d1296..8c9d47f044 100644
--- a/package/erlang-p1-yaml/Config.in
+++ b/package/erlang-fast-yaml/Config.in
@@ -1,8 +1,8 @@
-config BR2_PACKAGE_ERLANG_P1_YAML
-	bool "erlang-p1-yaml"
+config BR2_PACKAGE_ERLANG_FAST_YAML
+	bool "erlang-fast-yaml"
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Erlang wrapper for libyaml C library
 
-	  https://github.com/processone/p1_yaml
+	  https://github.com/processone/fast_yaml
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-fast-yaml/erlang-fast-yaml.hash
similarity index 50%
rename from package/erlang-p1-yaml/erlang-p1-yaml.hash
rename to package/erlang-fast-yaml/erlang-fast-yaml.hash
index 0138f82047..863781725d 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-p1-yaml-1.0.36.tar.gz
+sha256  a8d632d97282cfdf54a0172df59d8641f37de690dd886d0b2e4ef0d4ff876077  erlang-fast-yaml-1.0.37.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.mk b/package/erlang-fast-yaml/erlang-fast-yaml.mk
new file mode 100644
index 0000000000..675dba0839
--- /dev/null
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# erlang-fast-yaml
+#
+################################################################################
+
+ERLANG_FAST_YAML_VERSION = 1.0.37
+ERLANG_FAST_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_FAST_YAML_VERSION))
+ERLANG_FAST_YAML_LICENSE = Apache-2.0
+ERLANG_FAST_YAML_LICENSE_FILES = LICENSE.txt
+ERLANG_FAST_YAML_DEPENDENCIES = libyaml erlang-p1-utils
+
+define ERLANG_FAST_YAML_REMOVE_PATHS
+	$(SED) "s/ -I\/usr\/local\/include//" $(@D)/rebar.config
+	$(SED) "s/ -L\/usr\/local\/lib//" $(@D)/rebar.config
+endef
+
+ERLANG_FAST_YAML_POST_PATCH_HOOKS = ERLANG_FAST_YAML_REMOVE_PATHS
+
+$(eval $(rebar-package))
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
deleted file mode 100644
index 17f4910ee1..0000000000
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# erlang-p1-yaml
-#
-################################################################################
-
-ERLANG_P1_YAML_VERSION = 1.0.36
-ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
-ERLANG_P1_YAML_LICENSE = Apache-2.0
-ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_YAML_DEPENDENCIES = libyaml erlang-p1-utils
-
-define ERLANG_P1_YAML_REMOVE_PATHS
-	$(SED) "s/ -I\/usr\/local\/include//" $(@D)/rebar.config
-	$(SED) "s/ -L\/usr\/local\/lib//" $(@D)/rebar.config
-endef
-
-ERLANG_P1_YAML_POST_PATCH_HOOKS = ERLANG_P1_YAML_REMOVE_PATHS
-
-$(eval $(rebar-package))
diff --git a/package/erlang-p1-yconf/Config.in b/package/erlang-p1-yconf/Config.in
index 3777ebbe14..987b511878 100644
--- a/package/erlang-p1-yconf/Config.in
+++ b/package/erlang-p1-yconf/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_ERLANG_P1_YCONF
 	bool "erlang-p1-yconf"
-	select BR2_PACKAGE_ERLANG_P1_YAML
+	select BR2_PACKAGE_ERLANG_FAST_YAML
 	help
 	  YAML configuration processor.
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index 81f7462884..bc72f282a9 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -8,6 +8,6 @@ ERLANG_P1_YCONF_VERSION = 1.0.15
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
-ERLANG_P1_YCONF_DEPENDENCIES = erlang-p1-yaml
+ERLANG_P1_YCONF_DEPENDENCIES = erlang-fast-yaml
 
 $(eval $(rebar-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
