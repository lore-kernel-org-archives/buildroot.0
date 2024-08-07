Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3FCC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3ADF6088E;
	Wed,  7 Aug 2024 14:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5D57WoumnxSW; Wed,  7 Aug 2024 14:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A764E608A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A764E608A1;
	Wed,  7 Aug 2024 14:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4061BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BCF981204
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcGqpZwtU_l1 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 056A280B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 056A280B7D
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 056A280B7D
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:06 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ef32fea28dso20556861fa.2
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041244; x=1723646044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jT9V9kU2m+CpVKMr/Y8R68DH3EDU2NLIaayBJJxO/I=;
 b=XvInAfXcpzOxOJF0DBN1jB45iL6OLDX9G7Hqjb6BOOL+P0g42kmPZK3rAeMGOmGWHa
 RyBLE04am+z1yem2kTxSPBW4Q0/Kb61XS1Q2wtFrT4Rtrw+YUfAukw+eeKQRm/+aMs/F
 aHSvoNVcRO4Y4OaskKGa1WVUHgpAXrisfnd8KAP55ylS8JBn1LUV01XFKFo5muvbu8Do
 ls7Ohq1SNCEx8SdxfNbR2+5f0skXuQPabS44E1m+XWYsmhLF0tvUzETOx/br6+2A+b5G
 cK/RBlYDBsUOlxrIVqviMrojV934+r7GN2XRnyySxNZG0FUCwRCTfbIXMyafZ9a7djhm
 O81A==
X-Gm-Message-State: AOJu0Yzvtf6CSgLghcD1CYfXgcP7z6fD6V/1THu/TPyJ+ldFVJuMpEeR
 ewrGXi43xzo4WvoG4Sr5chu6AOJmLRK7tNjEteJtKAIWXtOYHUom9VjLiw==
X-Google-Smtp-Source: AGHT+IFD3HO4ubiyaYrMnSOf/wHuu0e66hfdOx3z/kpQBWFcDQvX4zEXIMJYnSzIFjKT5jrS7NqnEg==
X-Received: by 2002:a05:651c:228:b0:2ef:2d58:2de5 with SMTP id
 38308e7fff4ca-2f15aa87167mr117007911fa.11.1723041243869; 
 Wed, 07 Aug 2024 07:34:03 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:03 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:01 +0200
Message-Id: <20240807143318.439619-2-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041244; x=1723646044; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/jT9V9kU2m+CpVKMr/Y8R68DH3EDU2NLIaayBJJxO/I=;
 b=lmb/rwNy/vRCZPoQkPTURtqu+rL4zdmptLJvXDwVXNsGmW3bdQSIprEqsZGQmgUQd7
 YDfqzN947O+FlMDFHBX93Rhqub/B78eHmDXB4QjUiZl/KjrI6zvDqNrEn5jHKce8Z302
 H6PoXRyRSN9mvy0SUHro/eUTtlgz1tUiq+ObBRslc1ESTq0AaLHFSoDlnkPiAE63+fZS
 oy7+oyX1PYqIfHq97tmLacZZ6hiILxbAbGn0ZfE+FowdfaNaNtZCTJqABlASqlpGvXjU
 ON5c71cqyI7WlSN4zlxVICb/eP0q1DRrjyuTKZSll6e6Q1P0XUPeubte13QF0YiUj/0L
 K5YQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lmb/rwNy
Subject: [Buildroot] [PATCH 01/18] package/erlang-stun: renamed from
 erlang-p1-stun
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

and bump version to 1.2.14. This package is renamed to avoid having to
fix other packages that expect to find its content inside a stun/
directory instead of p1_stun/. Thus, remove the corresponding patch
from the erlang-p1-sip package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 DEVELOPERS                                    |  2 +-
 package/Config.in                             |  2 +-
 package/ejabberd/Config.in                    |  2 +-
 package/ejabberd/ejabberd.mk                  |  2 +-
 .../erlang-p1-sip/0001-correct-include.patch  | 31 -------------------
 package/erlang-p1-sip/Config.in               |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      | 14 ---------
 .../{erlang-p1-stun => erlang-stun}/Config.in |  4 +--
 .../erlang-stun.hash}                         |  2 +-
 package/erlang-stun/erlang-stun.mk            | 14 +++++++++
 11 files changed, 23 insertions(+), 54 deletions(-)
 delete mode 100644 package/erlang-p1-sip/0001-correct-include.patch
 delete mode 100644 package/erlang-p1-stun/erlang-p1-stun.mk
 rename package/{erlang-p1-stun => erlang-stun}/Config.in (71%)
 rename package/{erlang-p1-stun/erlang-p1-stun.hash => erlang-stun/erlang-stun.hash} (51%)
 create mode 100644 package/erlang-stun/erlang-stun.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c472aa4c53..abd36c0c59 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1668,7 +1668,6 @@ F:	package/erlang-p1-oauth2/
 F:	package/erlang-p1-pkix/
 F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
-F:	package/erlang-p1-stun/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
 F:	package/erlang-p1-xml/
@@ -1676,6 +1675,7 @@ F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
+F:	package/erlang-stun/
 F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
diff --git a/package/Config.in b/package/Config.in
index 0472ec2daf..7dc4f99ec2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -685,7 +685,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-pkix/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
-	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
@@ -693,6 +692,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
+	source "package/erlang-stun/Config.in"
 endmenu
 endif
 	source "package/execline/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index e24c7fee6b..fb35a87306 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_PKIX # runtime
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
-	select BR2_PACKAGE_ERLANG_P1_STUN
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_ERLANG_P1_XML
@@ -22,6 +21,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
+	select BR2_PACKAGE_ERLANG_STUN
 	select BR2_PACKAGE_GETENT
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 574f9492e8..1df8145496 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -11,7 +11,7 @@ EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
-	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
+	erlang-p1-stringprep erlang-stun erlang-p1-tls \
 	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
diff --git a/package/erlang-p1-sip/0001-correct-include.patch b/package/erlang-p1-sip/0001-correct-include.patch
deleted file mode 100644
index 90d68b5184..0000000000
--- a/package/erlang-p1-sip/0001-correct-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5ad4f871df7cbbc973708cb7380c3410b20bde1c Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Tue, 1 Dec 2020 23:07:51 +0100
-Subject: [PATCH] correct include
-
-This part of the code was moved into it's own project and was packaged
-separately by me. To make the build process work, this small fix is
-necessary.
-
-Author: Philipp Huebner <debalance@debian.org>
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- src/esip_socket.erl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/esip_socket.erl b/src/esip_socket.erl
-index 4154faa..db5fa92 100644
---- a/src/esip_socket.erl
-+++ b/src/esip_socket.erl
-@@ -37,7 +37,7 @@
- 
- -include("esip.hrl").
- -include("esip_lib.hrl").
---include_lib("stun/include/stun.hrl").
-+-include_lib("p1_stun/include/stun.hrl").
- 
- -define(TCP_SEND_TIMEOUT, 15000).
- -define(CONNECT_TIMEOUT, 20000).
--- 
-2.28.0
-
diff --git a/package/erlang-p1-sip/Config.in b/package/erlang-p1-sip/Config.in
index 70cf819a37..74494d3c94 100644
--- a/package/erlang-p1-sip/Config.in
+++ b/package/erlang-p1-sip/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_ERLANG_P1_SIP
 	bool "erlang-p1-sip"
-	select BR2_PACKAGE_ERLANG_P1_STUN
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_ERLANG_STUN
 	help
 	  SIP library for Erlang
 
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 61f728cb1b..45c70e8899 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -8,7 +8,7 @@ ERLANG_P1_SIP_VERSION = 1.0.49
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
+ERLANG_P1_SIP_DEPENDENCIES = erlang-stun erlang-p1-tls erlang-p1-utils
 ERLANG_P1_SIP_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
deleted file mode 100644
index 7438bd2186..0000000000
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# erlang-p1-stun
-#
-################################################################################
-
-ERLANG_P1_STUN_VERSION = 1.2.7
-ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
-ERLANG_P1_STUN_LICENSE = Apache-2.0
-ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
-ERLANG_P1_STUN_INSTALL_STAGING = YES
-
-$(eval $(rebar-package))
diff --git a/package/erlang-p1-stun/Config.in b/package/erlang-stun/Config.in
similarity index 71%
rename from package/erlang-p1-stun/Config.in
rename to package/erlang-stun/Config.in
index 70cdd91599..dcf3817a2d 100644
--- a/package/erlang-p1-stun/Config.in
+++ b/package/erlang-stun/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_ERLANG_P1_STUN
-	bool "erlang-p1-stun"
+config BR2_PACKAGE_ERLANG_STUN
+	bool "erlang-stun"
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	help
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-stun/erlang-stun.hash
similarity index 51%
rename from package/erlang-p1-stun/erlang-p1-stun.hash
rename to package/erlang-stun/erlang-stun.hash
index 49e1963ff0..c248e89ea8 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-stun/erlang-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-p1-stun-1.2.7.tar.gz
+sha256  110b06572c6208fdeaa60c32cd549e6798f0a719d51bef97608c2aaa61151c11  erlang-stun-1.2.14.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-stun/erlang-stun.mk b/package/erlang-stun/erlang-stun.mk
new file mode 100644
index 0000000000..abfb1c3853
--- /dev/null
+++ b/package/erlang-stun/erlang-stun.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-stun
+#
+################################################################################
+
+ERLANG_STUN_VERSION = 1.2.14
+ERLANG_STUN_SITE = $(call github,processone,stun,$(ERLANG_STUN_VERSION))
+ERLANG_STUN_LICENSE = Apache-2.0
+ERLANG_STUN_LICENSE_FILES = LICENSE.txt
+ERLANG_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
+ERLANG_STUN_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
