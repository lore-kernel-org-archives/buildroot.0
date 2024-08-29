Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D550C83F2D
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B00A41A64;
	Thu, 29 Aug 2024 14:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPccOCY6Yfne; Thu, 29 Aug 2024 14:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AF2041A6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AF2041A6A;
	Thu, 29 Aug 2024 14:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39CE71BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34ACE4040F
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUsVC3U2E3Bq for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8CD4740132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD4740132
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CD4740132
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so6804185e9.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943034; x=1725547834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FoqKEwi6L9w0hPJ8hRQaQmaZ9S01k/XvYAF/ttqXq4c=;
 b=XNiaOnX1QN/DM8DjLzGwyu4LK7DnTGX7DY/ihTm8QgSggi3u3Ufz4w/et8Mk3cXYY2
 t4yU2KQiQLSFHh9HutVw7a5NGQmV60rijXHj5OgXNRKGO88PWu5pn+t4eB3AbB9g1++P
 74Xu5avxyPpCBUiLT3we1d4dri57uno/0h3wr13cII3kdfPatFhJSS+aMaKl2Isq67eW
 8x4jdrOnschs2b2WMYPp1XUyedGkrSkkf/KBPhGp/4du1RT/UW+1X8SZe4w0ij39/G+a
 gagsBGgkNZ6LVvr57+pUxskfQk2eDZeUItnxAJ4VrZTkCym6tUYsOT0evvchKSLbeFuY
 c60w==
X-Gm-Message-State: AOJu0YzFDKI2LVJeN2k2xmSM/TaZjiE72417WvPQ9k7SfLFkVfHm3YA0
 cSv1IWHqW8dHDH0+6hZ/CDmV+WnbbI4W5gYljS9uWQuw6AS4/Gox647q2A==
X-Google-Smtp-Source: AGHT+IGyuDsa3yeJPfEuIKJmzgLPCYj+csalRtOcFNws8ioHVknRL2H92uOkLU2ni6mjTI0o2gGBew==
X-Received: by 2002:a05:600c:4512:b0:428:18d9:9963 with SMTP id
 5b1f17b1804b1-42bb01c1c22mr25426845e9.22.1724943034156; 
 Thu, 29 Aug 2024 07:50:34 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:33 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:27 +0200
Message-Id: <20240829144940.209964-12-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943034; x=1725547834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FoqKEwi6L9w0hPJ8hRQaQmaZ9S01k/XvYAF/ttqXq4c=;
 b=nsS5+x21McyPr8rEW7DScxtl0Oee/zWmrInoxBN0lHudOKwDeEw/u7xSxuLUOp2R4l
 5eIcA6rwm03f3YY505Ny2H0Z2DB3RqbWF+oic2QChxp04Uxst2gy0xcHCFH8T8Plc2z6
 mQ+K8VIkcCY98MjijQnVjYbKds0uoQYR4mTo4TlpsAVaM5g1XA+3nKi9J/3tVtRFvChx
 YVdyV4BXXU4elgrUN/+UEl7XRc0K9ALds20NTmIchnBZxYiYzubfL/KtatAow2FVRd29
 oKrgWiHJCYKVASO1hX6LlNUKDp1WaoWsr6Aq2etwGk+Zts8ZObsu5+p3aq8A/ZtcQeGU
 E+OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nsS5+x21
Subject: [Buildroot] [PATCH v2 11/23] package/erlang-fast-yaml: renamed from
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

The upstream project has been renamed from p1_yaml to fast_yaml. Use the
same name so packages that depends on it, find its content in the
fast_yaml/ directory.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 Config.in.legacy                              |  8 ++++++++
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
 11 files changed, 38 insertions(+), 30 deletions(-)
 rename package/{erlang-p1-yaml => erlang-fast-yaml}/Config.in (51%)
 rename package/{erlang-p1-yaml/erlang-p1-yaml.hash => erlang-fast-yaml/erlang-fast-yaml.hash} (80%)
 create mode 100644 package/erlang-fast-yaml/erlang-fast-yaml.mk
 delete mode 100644 package/erlang-p1-yaml/erlang-p1-yaml.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 810e5810f7..32769e7f3c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_ERLANG_P1_YAML
+	bool "erlang-p1-yaml has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ERLANG_FAST_YAML
+	help
+	  The erlang-p1-yaml package has been renamed to
+	  erlang-fast-yaml.
+
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 388ec2f44e..0192a6e8c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1649,6 +1649,7 @@ F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
 F:	package/erlang-fast-xml/
+F:	package/erlang-fast-yaml/
 F:	package/erlang-goldrush/
 F:	package/erlang-idna/
 F:	package/erlang-jiffy/
@@ -1663,7 +1664,6 @@ F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
-F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
diff --git a/package/Config.in b/package/Config.in
index 56a7f13820..9cbad3f5fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -672,6 +672,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-fast-xml/Config.in"
+	source "package/erlang-fast-yaml/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
@@ -686,7 +687,6 @@ menu "Erlang libraries/modules"
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
similarity index 80%
rename from package/erlang-p1-yaml/erlang-p1-yaml.hash
rename to package/erlang-fast-yaml/erlang-fast-yaml.hash
index 0138f82047..da2ccf13c9 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-p1-yaml-1.0.36.tar.gz
+sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-fast-yaml-1.0.36.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.mk b/package/erlang-fast-yaml/erlang-fast-yaml.mk
new file mode 100644
index 0000000000..861706b547
--- /dev/null
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# erlang-fast-yaml
+#
+################################################################################
+
+ERLANG_FAST_YAML_VERSION = 1.0.36
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
