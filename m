Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A100E95A8E
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E577E8188B;
	Sun,  8 Oct 2023 21:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E577E8188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2qnNNicy45o; Sun,  8 Oct 2023 21:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD4881831;
	Sun,  8 Oct 2023 21:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD4881831
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2F851BF2C8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74EB3817FF
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74EB3817FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHc5Lc7t44yd for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 21:26:49 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32560817A9
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32560817A9
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40651a726acso35825495e9.1
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 14:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696800407; x=1697405207;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JZD0H+8Eldow8G4pEYiMVX6ayNuD07cItnbzevX876Y=;
 b=PJQVwsN1UaKsvwCFURczhfdawl7OuM4aSIs+p9QsuaNSlbub74OS6yWPWXFT87SDtl
 t8NW4rOxU5/aaVPp3babfubtzn/Oob9zd2mCBH1qg3+WdKu2l7a0iotiJ6BRzvsN4Nsy
 oMTQmhPVrI4Wf+3XJpWTjF1BEOzDh0bomQlqg5NlBTXuKu37IiVfW+qMwiCnoZqh27X1
 4qIlUOYrTJ09EIgLb1G5ZRLx350uT9YzdKdY3pD5zVyt8t65UL6yBsDpvYA+3FSxet4S
 1s0RYgJW33L8vFMLGneUMUXNFiSFH+/Yzcd5dbH205uKbbzuT9h3SpYF3KWMCuca6YqM
 OVaA==
X-Gm-Message-State: AOJu0YyF46a23nWg8BzB7KCaxlYzjwEyeHEOk5pZsDT2/IBZtZJJdaw2
 ACEYvO4pLreG5Im9B97umqeT/PRWfhU=
X-Google-Smtp-Source: AGHT+IE08gAxzkAI8pa/VsieduHIR3sbfw1pg0x1OBabpDpxeZKJNS4VXxOcMQq/QThTp8pL8TpFBw==
X-Received: by 2002:a05:600c:2189:b0:402:bcac:5773 with SMTP id
 e9-20020a05600c218900b00402bcac5773mr12651346wme.38.1696800406324; 
 Sun, 08 Oct 2023 14:26:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l25-20020a1c7919000000b00405c7591b09sm9374402wme.35.2023.10.08.14.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 14:26:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Oct 2023 23:26:43 +0200
Message-Id: <20231008212643.67946-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696800407; x=1697405207; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JZD0H+8Eldow8G4pEYiMVX6ayNuD07cItnbzevX876Y=;
 b=DWjuptFf/1fasDuXtyzKzDmehwkkmrWFUkTeyFzdWeU53omtWUz1C5p/Ds9dKE2VBr
 R8y1/EdHmW8GBnfuCkUVsLhK0wM4ImOgkHG6Ts1or3940/OlvpRr3hyoC7Aex8XYacnW
 mvbLwxNaBKJ5JpHqWWO8+WtCypch6/WmpLEhgb7Uuqcba0v1GW3chGsbrRRGGGTu1aCD
 IuY7gZ8Epybkhn+/SK+ngMVcui4PJt7khu6wckSnBsbxp9SQvUhs0fP2CltXpu8paJcu
 OYrTNF0V+4t6uUziRhuidVzr2yPXLQpN3MnK0turM7uC9pjuGQF3167eRT7/S/KFR52C
 Tw3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DWjuptFf
Subject: [Buildroot] [PATCH 1/1] package/libebml: bump to version 1.4.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- C++14 is required since
  https://github.com/Matroska-Org/libebml/commit/4159caf84c18f64137e6cdb5f15c5e76d0bb0976

https://github.com/Matroska-Org/libebml/blob/release-1.4.4/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...-header-files-for-std-numeric_limits.patch | 40 -------------------
 package/libebml/Config.in                     |  6 ++-
 package/libebml/libebml.hash                  |  2 +-
 package/libebml/libebml.mk                    |  2 +-
 package/libmatroska/Config.in                 |  6 ++-
 6 files changed, 10 insertions(+), 47 deletions(-)
 delete mode 100644 package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0e8e5921ce..21a1009a1b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -650,7 +650,6 @@ package/libdnet/0001-python-makefile.patch Upstream
 package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch Upstream
 package/libdvbcsa/0001-altivec-powerpc64.patch Upstream
 package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch Upstream
-package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch Upstream
 package/libedit/0001-check-bsd-functions-in-libbsd.patch Upstream
 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch Upstream
 package/libfcgi/0001-link-against-math.patch Upstream
diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
deleted file mode 100644
index c7e789c02e..0000000000
--- a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
-From: Moritz Bunkus <mo@bunkus.online>
-Date: Sat, 27 Feb 2021 20:36:52 +0100
-Subject: [PATCH] include appropriate header files for std::numeric_limits
-
-Fixes #80.
-
-[Retrieved (and updated to remove ChangeLog update) from:
-https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog                 | 4 ++++
- src/EbmlString.cpp        | 1 +
- src/EbmlUnicodeString.cpp | 1 +
- 3 files changed, 6 insertions(+)
-
-diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
-index 27e55fd..4c05fcf 100644
---- a/src/EbmlString.cpp
-+++ b/src/EbmlString.cpp
-@@ -34,6 +34,7 @@
-   \author Steve Lhomme     <robux4 @ users.sf.net>
- */
- #include <cassert>
-+#include <limits>
- 
- #include "ebml/EbmlString.h"
- 
-diff --git a/src/EbmlUnicodeString.cpp b/src/EbmlUnicodeString.cpp
-index 496a16a..99fc073 100644
---- a/src/EbmlUnicodeString.cpp
-+++ b/src/EbmlUnicodeString.cpp
-@@ -36,6 +36,7 @@
- */
- 
- #include <cassert>
-+#include <limits>
- 
- #include "ebml/EbmlUnicodeString.h"
- 
diff --git a/package/libebml/Config.in b/package/libebml/Config.in
index a00b894358..b770154af7 100644
--- a/package/libebml/Config.in
+++ b/package/libebml/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_LIBEBML
 	bool "libebml"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  Access library for the EBML (Extensible Binary Meta
 	  Language, a binary derivative of XML) format.
 
 	  http://matroska.org
 
-comment "libebml needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "libebml needs a toolchain w/ C++, wchar, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index 32ca1e3dd3..c83fde32ab 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41c7237ce05828fb220f62086018b080af4db4bb142f31bec0022c925889b9f2  libebml-1.4.2.tar.xz
+sha256  82dc5f83356cc9340aee76ed7512210b3a4edf5f346bc9c2c7044f55052687a7  libebml-1.4.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 056cf888e1..c85638c03e 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.4.2
+LIBEBML_VERSION = 1.4.4
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
index ec0e8415d7..b2e4354df5 100644
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMATROSKA
 	bool "libmatroska"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libebml
 	select BR2_PACKAGE_LIBEBML
 	help
 	  Extensible open standard audio/video container format access
@@ -9,5 +10,6 @@ config BR2_PACKAGE_LIBMATROSKA
 
 	  http://matroska.org
 
-comment "libmatroska needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "libmatroska needs a toolchain w/ C++, wchar, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
