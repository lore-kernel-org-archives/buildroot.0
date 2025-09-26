Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4262DCAC5B9
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 10:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB45960E34;
	Fri, 26 Sep 2025 10:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2I8lGG5cLbsF; Fri, 26 Sep 2025 10:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FAB61734
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07FAB61734;
	Fri, 26 Sep 2025 10:51:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C591312D
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB8CE400A4
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbOsnVe_e9SZ for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 10:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C3164034A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3164034A
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C3164034A
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:51:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso4044641a12.0
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 03:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758883888; x=1759488688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8HftYJyl6SnAC+jBJASenMFnH1vXleiOQ8/nGQdal/k=;
 b=AfhJy0BdA//nf0kRJTLrGWxHK4NiSco2SJhFOxQz4eWI7HaTEcPjQ9SvIq3LofNa09
 IF52b22b39QmD8nCxolAvipAYfUpK/SEjuf/uf3Fxj2AvK5LAFqc4xN1XVlqHaUQFML7
 VEMUus5eugVXPlvNU9Y3RcdWaqZez/vvx4hAojlpvPPVl3kb1cCRO5pE4bMsEBsk3ABK
 7qV+ZybyZc4pN5g41x7SXHRPBq5QeWfQO8GWqDw8LJZgLHU7emB3gwGy64UAArNV9AJx
 koTvcxyd3KyIVMXTjhH4D54JlW72dPI86vfgk9voYEOY7WlbDsALMYgraSX8UWF71nOn
 bmVA==
X-Gm-Message-State: AOJu0Yx44quEuXGvmcdK6ytnmwGGrsM22q3YlZRHECHcs9bIfjEpbg46
 n+bC6M8nmCnJwR1wXcwQ8Wb3Em92UK5RJCBsA9hpQexbEQ/MobdBz1EtcTB2dA==
X-Gm-Gg: ASbGnctmIoCQ8rWfr0clrd3tNSskf+iyW+spBP2YEGGK9eb+wwRPgZqMgsvwtEo0XVl
 Fj9wp2VB+A5OjNgYDPWk4BWvRVAt1cgtLIe9FXdXVDnVbAMr8AtgRitOI3G59hJQj90hwpHk0sF
 BghmbnSrlxYxUdCgO2LChJQ/bZOrHdUaFoW1qxMKlA9PHVPOoLoFCTarkX3EGqZgXuMUBAw14YB
 RDxGFZMKmTqhIkOeqIMyUNWQxDRtU6+EfwcCCk2mLHTqw7LcxRldiIaWLrKJjm3OFYy3bBo0BXX
 w3dj9aCIlv7Q4O70C5rgvYHd9ntu7cTy4i73HsX0/k9+CH0Ku9Tk+WXlyVVl3r8RR4g6vyBiBTM
 5fEfQTW8N6rUcnT4xhKOg8Os3S6NJcz81OK10zBtfF1NxNYfEQ0fhlG+CAHh9jowZacbga1nED2
 VSOVXNqDpOGrFNI75ZMOS0hee3
X-Google-Smtp-Source: AGHT+IFXtSN+Z3y3+cW0UGToDFJBz2QRXLOssu8aZuqGWdQt46wxCVGCjZ2JN4WSbOQvfEAARRqG+Q==
X-Received: by 2002:aa7:c048:0:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-6349fa78a8cmr4958040a12.18.1758883887654; 
 Fri, 26 Sep 2025 03:51:27 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634c065a67csm466382a12.36.2025.09.26.03.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 03:51:27 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 12:51:20 +0200
Message-Id: <20250926105120.631224-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1758883888; x=1759488688; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8HftYJyl6SnAC+jBJASenMFnH1vXleiOQ8/nGQdal/k=;
 b=S2viCXylwDJKmD44oKZePCB1qkJ5dHhezBy+Ana81jcrQTfvjWWHrsjt+YZUTINVIo
 NzDwOZ4Uzd4ngWx5Uj6b8FG0ubPl0DMNFm784ewmdhh8f5xUYd1H8glt67PtxqrCLfh8
 uVJpYxW3/Wfo8AFJNWRT/pWrIM1VboHNHY28NXNP6rsYwxX6/bbxjfg04ZKPW4xY/aI1
 xBkyXN4qyx1vOxiQ2bIfw7ESiRfp0t+RBkvoKLdnPZBv09YqZPJ0wzd+rbjGObCnCib5
 +ECc2Met0xQKirLSOiJrsVEHhd9bnIWl+6GbiZGdgIp4No65HR0O+ztYUp/dlKJSJrlq
 Y7Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S2viCXyl
Subject: [Buildroot] [PATCH] package/libxmlrpc: bump to version 1.67.00
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://xmlrpc-c.sourceforge.io/change.html

Since version 1.65, Libxml2 was made the default XML parser. Hence,
if libxml2 package is not selected, disable libxml2 support
explicitly.

Remove already upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-Fix-boolean-definitions.patch        | 25 -------------------
 package/libxmlrpc/libxmlrpc.hash              |  2 +-
 package/libxmlrpc/libxmlrpc.mk                | 10 ++++++--
 3 files changed, 9 insertions(+), 28 deletions(-)
 delete mode 100644 package/libxmlrpc/0001-Fix-boolean-definitions.patch

diff --git a/package/libxmlrpc/0001-Fix-boolean-definitions.patch b/package/libxmlrpc/0001-Fix-boolean-definitions.patch
deleted file mode 100644
index 0fdfdf7f03..0000000000
--- a/package/libxmlrpc/0001-Fix-boolean-definitions.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: lib/util/include/bool.h
-===================================================================
-Don't define boolean macros for C23 standard as they are implemented
-as keywords.
-
-Upstream: https://sourceforge.net/p/xmlrpc-c/code/3318/
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-
-diff --git a/lib/util/include/bool.h b/lib/util/include/bool.h
---- a/lib/util/include/bool.h	(revision 3316)
-+++ b/lib/util/include/bool.h	(working copy)
-@@ -5,7 +5,11 @@
-    collision.
- */
- 
--#ifndef __cplusplus
-+#ifdef __cplusplus
-+/* bool has always been part of the C++ language */
-+#elif __STDC_VERSION__ >= 202311L
-+/* bool is part of the C23 standard */
-+#else
- /* At least the GNU compiler defines __bool_true_false_are_defined */
- #ifndef __bool_true_false_are_defined
- #define __bool_true_false_are_defined
diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index b9167ca5a0..00cef19b77 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7265be1a181e57106707b5278daf64b2a717b8a2a9e6ec8992d8c8084e64eaa2  libxmlrpc-r3176-svn5.tar.gz
+sha256  4a071da3204132585a40313e17e01699d428e0fc9b58d30fcd7e538037254668  libxmlrpc-r3335-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index dd09fa8f53..283914ca81 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# 1.60.01 (code/advanced@r3176)
-LIBXMLRPC_VERSION = r3176
+# 1.67.00 (code/advanced@r3335)
+LIBXMLRPC_VERSION = r3335
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
@@ -47,6 +47,12 @@ else
 LIBXMLRPC_CONF_OPTS += --disable-abyss-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBXMLRPC_DEPENDENCIES += libxml2
+else
+LIBXMLRPC_CONF_OPTS += --disable-libxml2-backend
+endif
+
 LIBXMLRPC_MAKE_OPTS += $(LIBXMLRPC_STATIC_OPTS)
 LIBXMLRPC_INSTALL_STAGING_OPTS = $(LIBXMLRPC_STATIC_OPTS) \
 	DESTDIR=$(STAGING_DIR) install
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
