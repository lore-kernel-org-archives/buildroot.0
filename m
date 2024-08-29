Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AAFC83F32
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 14:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C8B419AA;
	Thu, 29 Aug 2024 14:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKR-gfhg604M; Thu, 29 Aug 2024 14:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5603B419AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5603B419AE;
	Thu, 29 Aug 2024 14:50:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9201BF31A
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59DC980F29
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 14:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yeqyk0WItuIj for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 14:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D354E80F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D354E80F05
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D354E80F05
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 14:50:09 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37196229343so524300f8f.0
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 07:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724943007; x=1725547807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=18QjYO0flBae0wWrzbIoAaj0AIKad4iDcU9IQV0yaOw=;
 b=dt4pej7uUyEYDkVAmtyzgjc6AmGGITsdB881kif6zlWr9fvOUlWV7PEBxvxwiHUKFM
 SJBsCstmOkV+AS21mR/68dTWctLWJnxz9ngu+JnNjWieclyuFNHMUhIZun6UEmtrDM2n
 0AxYM5qFhdx0mjlstedrEjS3aprZhicaxBNwn/20UwR9fzb93XngdHNzNG261ajbMCsy
 A3z6kWBbK6+0CfpmShp0wRLOjSyjdX2fOu3TON2Uzb9GD87QPdaOeKBJJD8O0/6EpCRN
 SFILZC2lcz+LXxLLZOgg9FpQ39jenmmJCr5p+eUGkp1uFJ54ojIlKc8vtOaBW618jEve
 s1GA==
X-Gm-Message-State: AOJu0YzJOwHRelWIlBlqT7UNJfWlMkJCb9ZHKTBARPl8YnIYOxuvRRLW
 7+nmlxxi5l7z2a7aHXyCytOzG0kWHH1i6zM5kdXHtAuf76BlxbjXYM1Dqw==
X-Google-Smtp-Source: AGHT+IF8lRyHD8Ql7p/R698UFAeG0YRBqBaUabfxf7pSKUWdta7ihpvQQj+aLp0z2v5iERnkQiv50Q==
X-Received: by 2002:adf:8bd1:0:b0:362:8ec2:53d6 with SMTP id
 ffacd0b85a97d-3749b5948fdmr2093552f8f.61.1724943007358; 
 Thu, 29 Aug 2024 07:50:07 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:284b:b9b9:cca0:be3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee9c48csm1619241f8f.51.2024.08.29.07.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 07:50:07 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 16:49:19 +0200
Message-Id: <20240829144940.209964-4-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144940.209964-1-johan.oudinet@gmail.com>
References: <20240829144940.209964-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724943007; x=1725547807; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18QjYO0flBae0wWrzbIoAaj0AIKad4iDcU9IQV0yaOw=;
 b=i7/mUEDf98wwl2AIsiej88P8HgpQ1Vj1+19Tc5Y58SV6eSf5BgDxQj8mBJJc8Kv+It
 GsgrqHoY0Y1ZutFS/OAueAm58J3niAYKuEpK68vH2RaRnOqzyJzlBgA2adxYrE/8knzM
 wL64H3TUR1JOh5t9Fh5H2/ifKW0bbVZuGxpKCw/k+3UQi3W1Jbq65qTazIvgkkjZPIAd
 hFJMMzAcn69pK59LoGxY5mizbPGyLF/E1vhziJCSRvJo+rPW7V44HhIQe+FpD7yH3Z/v
 4dhrmgSjgbvqbLox/Q9Ij5IjWSPfAe1AgEWZxjON0WUY+ZdTyXgmgvAYyLjBBvnhVAJi
 yqWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i7/mUEDf
Subject: [Buildroot] [PATCH v2 03/23] package/erlang-fast-xml: renamed from
 erlang-p1-xml
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

This package has been renamed to avoid patching other packages that
expect to find its content in a fast_xml/ directory. Remove the
corresponding patch from the erlang-p1-xmpp package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 Config.in.legacy                               |  7 +++++++
 DEVELOPERS                                     |  2 +-
 package/Config.in                              |  2 +-
 package/ejabberd/Config.in                     |  2 +-
 package/ejabberd/ejabberd.mk                   |  2 +-
 package/erlang-fast-xml/Config.in              |  8 ++++++++
 .../erlang-fast-xml.hash}                      |  2 +-
 package/erlang-fast-xml/erlang-fast-xml.mk     | 18 ++++++++++++++++++
 package/erlang-p1-xml/Config.in                |  8 --------
 package/erlang-p1-xml/erlang-p1-xml.mk         | 18 ------------------
 package/erlang-p1-xmpp/0001-fix-includes.patch | 16 ----------------
 package/erlang-p1-xmpp/Config.in               |  2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk       |  6 +++---
 13 files changed, 42 insertions(+), 51 deletions(-)
 create mode 100644 package/erlang-fast-xml/Config.in
 rename package/{erlang-p1-xml/erlang-p1-xml.hash => erlang-fast-xml/erlang-fast-xml.hash} (81%)
 create mode 100644 package/erlang-fast-xml/erlang-fast-xml.mk
 delete mode 100644 package/erlang-p1-xml/Config.in
 delete mode 100644 package/erlang-p1-xml/erlang-p1-xml.mk
 delete mode 100644 package/erlang-p1-xmpp/0001-fix-includes.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 6964520231..658d88d90d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_ERLANG_P1_XML
+	bool "erlang-p1-xml has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ERLANG_FAST_XML
+	help
+	  The erlang-p1-xml package has been renamed to erlang-fast-xml.
+
 config BR2_PACKAGE_ERLANG_P1_STUN
 	bool "erlang-p1-stun has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6025d62ebd..1c70ae2050 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1648,6 +1648,7 @@ N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
+F:	package/erlang-fast-xml/
 F:	package/erlang-goldrush/
 F:	package/erlang-idna/
 F:	package/erlang-jiffy/
@@ -1662,7 +1663,6 @@ F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
-F:	package/erlang-p1-xml/
 F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
diff --git a/package/Config.in b/package/Config.in
index 1d8df4a977..e5ee9aeacc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
+	source "package/erlang-fast-xml/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
@@ -685,7 +686,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
-	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-xmpp/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index fb35a87306..295b0e7744 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_PACKAGE_ERLANG
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
+	select BR2_PACKAGE_ERLANG_FAST_XML
 	select BR2_PACKAGE_ERLANG_IDNA # runtime
 	select BR2_PACKAGE_ERLANG_JIFFY # runtime
 	select BR2_PACKAGE_ERLANG_JOSE # runtime
@@ -16,7 +17,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_XMPP
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 1df8145496..e49560d3a7 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -12,7 +12,7 @@ EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-stun erlang-p1-tls \
-	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
+	erlang-p1-utils erlang-fast-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
 # 0001-Makefile.in-do-not-download-or-compile-dependencies.patch
diff --git a/package/erlang-fast-xml/Config.in b/package/erlang-fast-xml/Config.in
new file mode 100644
index 0000000000..04d6634fe8
--- /dev/null
+++ b/package/erlang-fast-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_FAST_XML
+	bool "erlang-fast-xml"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_EXPAT
+	help
+	  XML utilities for Erlang
+
+	  https://github.com/processone/fast_xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-fast-xml/erlang-fast-xml.hash
similarity index 81%
rename from package/erlang-p1-xml/erlang-p1-xml.hash
rename to package/erlang-fast-xml/erlang-fast-xml.hash
index 379ca7ef88..6592e282d6 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-fast-xml/erlang-fast-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-p1-xml-1.1.49.tar.gz
+sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-fast-xml-1.1.49.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-xml/erlang-fast-xml.mk b/package/erlang-fast-xml/erlang-fast-xml.mk
new file mode 100644
index 0000000000..c2b6205914
--- /dev/null
+++ b/package/erlang-fast-xml/erlang-fast-xml.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# erlang-fast-xml
+#
+################################################################################
+
+ERLANG_FAST_XML_VERSION = 1.1.49
+ERLANG_FAST_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_FAST_XML_VERSION))
+ERLANG_FAST_XML_LICENSE = Apache-2.0
+ERLANG_FAST_XML_LICENSE_FILES = LICENSE.txt
+ERLANG_FAST_XML_DEPENDENCIES = expat erlang-p1-utils
+HOST_ERLANG_FAST_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
+ERLANG_FAST_XML_INSTALL_STAGING = YES
+
+ERLANG_FAST_XML_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
diff --git a/package/erlang-p1-xml/Config.in b/package/erlang-p1-xml/Config.in
deleted file mode 100644
index 504501d912..0000000000
--- a/package/erlang-p1-xml/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_ERLANG_P1_XML
-	bool "erlang-p1-xml"
-	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_EXPAT
-	help
-	  XML utilities for Erlang
-
-	  https://github.com/processone/xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
deleted file mode 100644
index eee2c74c03..0000000000
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# erlang-p1-xml
-#
-################################################################################
-
-ERLANG_P1_XML_VERSION = 1.1.49
-ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
-ERLANG_P1_XML_LICENSE = Apache-2.0
-ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
-HOST_ERLANG_P1_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
-ERLANG_P1_XML_INSTALL_STAGING = YES
-
-ERLANG_P1_XML_USE_AUTOCONF = YES
-
-$(eval $(rebar-package))
-$(eval $(host-rebar-package))
diff --git a/package/erlang-p1-xmpp/0001-fix-includes.patch b/package/erlang-p1-xmpp/0001-fix-includes.patch
deleted file mode 100644
index f02037fdc1..0000000000
--- a/package/erlang-p1-xmpp/0001-fix-includes.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Without this patch, rebar fails to find include file fxml.hrl.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/include/xmpp.hrl b/include/xmpp.hrl
-index afa5f61..678858e 100644
---- a/include/xmpp.hrl
-+++ b/include/xmpp.hrl
-@@ -25,7 +25,7 @@
- -include("ns.hrl").
- -include("jid.hrl").
- -include("xmpp_codec.hrl").
---include_lib("fast_xml/include/fxml.hrl").
-+-include_lib("p1_xml/include/fxml.hrl").
-
- -type stanza() :: iq() | presence() | message().
diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index c67dc832b7..9cd1a75198 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -4,8 +4,8 @@ comment "erlang-p1-xmpp needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
+	select BR2_PACKAGE_ERLANG_FAST_XML
 	select BR2_PACKAGE_ERLANG_IDNA
-	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index 2deb25b315..f8ec0b9823 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -9,9 +9,9 @@ ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XMPP_INSTALL_STAGING = YES
-ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
-	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
-HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-p1-xml
+ERLANG_P1_XMPP_DEPENDENCIES = erlang-fast-xml erlang-p1-stringprep \
+	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-fast-xml
+HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-fast-xml
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
