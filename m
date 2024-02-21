Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C294C54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 22:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E2181EFF;
	Wed, 21 Feb 2024 22:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TnAl-jJW34M; Wed, 21 Feb 2024 22:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892A681F01
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892A681F01;
	Wed, 21 Feb 2024 22:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93B481BF47A
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 22:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8045440017
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 22:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwkhKVHt07wS for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 22:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A5D2415AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A5D2415AD
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A5D2415AD
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 22:46:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d7afd1ee0so801715f8f.2
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 14:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708555581; x=1709160381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6o5MUwXCnlTMjmbpFlm2PVWrHqVEl0QzC5He4gqNE04=;
 b=lT+Ox7MK6e1L+5+nOJTiasOJwdYlkVru7JY44SwFKAzi/sCJ/lu18wd0obhjC0OprY
 vAoLsM1OH4cq6egn9IGr60tr0m0dvOxII3Rp8y3ZM4imeSNKN+LAwQD5+U0TftNpz0Pt
 RlZqi+tGyG14LifbWY2g8+XF8d3YCrbGviNrhXzIeWVkAV6kyrs9pvRReIwP11RxmQEh
 BnOB7CgntLa1GxY+VhZ5Sc3NbYawvnTgMbCskLYXw8K+viYYXZGl9Wz/Rhu+hlND1nV/
 +HxzJ4v6Exn0Ihnnem6kXH1JXhTxi1AFN4+fqu3KicurzICHFQnnivkKHgBGhIDhkE1/
 Y0uA==
X-Gm-Message-State: AOJu0YxOzo0b4mpUpoX2BA3xUqdbdJmzyfDglkOL3lTmWeXbCdsBKtwD
 ZcyWTeBW02TRidbfSs0/rWZA6nn9U4R6QyK/fuYeXi1h8yY7zbIdb2wKwAQp
X-Google-Smtp-Source: AGHT+IE+FJDXOg904NkmsilGlUwZWjgZCuFX2d0mT3G8zGF3+cqBIWtRHDhfqeXeiyR/D2/k65iPWw==
X-Received: by 2002:a05:6000:2ca:b0:33d:579e:f462 with SMTP id
 o10-20020a05600002ca00b0033d579ef462mr6452475wry.36.1708555580802; 
 Wed, 21 Feb 2024 14:46:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u11-20020a056000038b00b0033d7dd27d97sm3254101wrf.45.2024.02.21.14.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 14:46:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 23:46:17 +0100
Message-ID: <20240221224617.1672544-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708555581; x=1709160381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6o5MUwXCnlTMjmbpFlm2PVWrHqVEl0QzC5He4gqNE04=;
 b=KZVmSnynG+JvlhKO4rAxXwvR3Lxno0pnD4wUB1gCoT7qpnHN6rbveJTGILAwMv3NKf
 /P3HvQBUqXjeeDHBLr3N8RsNBVL/tdl0LY6hE1+tx5bwxr176TRT9R9UxxuCOMc8TgWg
 Jinu+pOc8NT4r+ummQ9I9pVgaf/bw6l40JreYSTsBdQmvcQKE6MlMc+r4+H8ZdcRHHSL
 uI0kwGXKihDkPVg6lQOuHppmvyitR9TJjScBQ4hsKwgzMx/y+G/pt9SFJZqm673e6UbP
 ni1hJupGYlmO+UzK6fAZRrscLMic8AxpvQwTZYb2sk0DVuQ+Xf/9Qwzd6eOB4LZ2HDgI
 kuuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KZVmSnyn
Subject: [Buildroot] [PATCH 1/1] package/libxmlpp: bump to version 5.2.0
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

Drop patch (already in version)

https://github.com/libxmlplusplus/libxmlplusplus/blob/5.2.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-it-compatible-with-libxml2--2-12-0.patch | 145 ------------------
 package/libxmlpp/libxmlpp.hash                |   4 +-
 package/libxmlpp/libxmlpp.mk                  |   4 +-
 3 files changed, 4 insertions(+), 149 deletions(-)
 delete mode 100644 package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch

diff --git a/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch b/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch
deleted file mode 100644
index b9100b4966..0000000000
--- a/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 49471812d57adfb22dcce3cbea1a8956658731b9 Mon Sep 17 00:00:00 2001
-From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
-Date: Sat, 18 Nov 2023 18:34:07 +0100
-Subject: [PATCH] Make it compatible with libxml2 >= 2.12.0
-
-* libxml++/document.cc:
-* libxml++/dtd.cc:
-* libxml++/nodes/entitydeclaration.cc:
-* libxml++/nodes/entityreference.cc:
-* libxml++/validators/relaxngvalidator.cc: Modify #include directives.
-* libxml++/keepblanks.cc: Ignore deprecation of xmlKeepBlanksDefault().
-* tests/saxparser_chunk_parsing_inconsistent_state/main.cc:
-Accept that MySaxParser::on_start_document() can be called before
-MySaxParser::on_error().
-
-Upstream: https://github.com/libxmlplusplus/libxmlplusplus/commit/49471812d57adfb22dcce3cbea1a8956658731b9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libxml++/document.cc                                   |  1 +
- libxml++/dtd.cc                                        |  2 +-
- libxml++/keepblanks.cc                                 |  5 ++++-
- libxml++/nodes/entitydeclaration.cc                    |  2 +-
- libxml++/nodes/entityreference.cc                      |  2 +-
- libxml++/validators/relaxngvalidator.cc                |  1 +
- .../saxparser_chunk_parsing_inconsistent_state/main.cc | 10 +++++++++-
- 7 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/libxml++/document.cc b/libxml++/document.cc
-index da0a8f5..d5476c6 100644
---- a/libxml++/document.cc
-+++ b/libxml++/document.cc
-@@ -16,6 +16,7 @@
- 
- #include <libxml/tree.h>
- #include <libxml/xinclude.h>
-+#include <libxml/xmlsave.h>
- #include <libxml/parser.h> // XML_PARSE_NOXINCNODE, XML_PARSE_NOBASEFIX
- 
- #include <iostream>
-diff --git a/libxml++/dtd.cc b/libxml++/dtd.cc
-index 238b3a0..8014c07 100644
---- a/libxml++/dtd.cc
-+++ b/libxml++/dtd.cc
-@@ -8,7 +8,7 @@
- #include <libxml++/exceptions/parse_error.h>
- #include <libxml++/io/istreamparserinputbuffer.h>
- 
--#include <libxml/tree.h>
-+#include <libxml/parser.h>
- 
- #include <sstream>
- 
-diff --git a/libxml++/keepblanks.cc b/libxml++/keepblanks.cc
-index 4228b8d..56b00cf 100644
---- a/libxml++/keepblanks.cc
-+++ b/libxml++/keepblanks.cc
-@@ -5,8 +5,11 @@
-  * included with libxml++ as the file COPYING.
-  */
- 
--#include <libxml++/keepblanks.h>
-+// xmlKeepBlanksDefault() is deprecated since libxml2 2.12.0.
-+// Ignore deprecations here.
-+#define XML_DEPRECATED
- 
-+#include <libxml++/keepblanks.h>
- #include <libxml/globals.h>
- 
- namespace xmlpp
-diff --git a/libxml++/nodes/entitydeclaration.cc b/libxml++/nodes/entitydeclaration.cc
-index 0a6390e..d5bfa75 100644
---- a/libxml++/nodes/entitydeclaration.cc
-+++ b/libxml++/nodes/entitydeclaration.cc
-@@ -5,7 +5,7 @@
-  */
- 
- #include <libxml++/nodes/entitydeclaration.h>
--#include <libxml/tree.h>
-+#include <libxml/entities.h>
- 
- namespace xmlpp
- {
-diff --git a/libxml++/nodes/entityreference.cc b/libxml++/nodes/entityreference.cc
-index 19b1b22..278a126 100644
---- a/libxml++/nodes/entityreference.cc
-+++ b/libxml++/nodes/entityreference.cc
-@@ -6,7 +6,7 @@
- 
- #include <libxml++/nodes/entityreference.h>
- 
--#include <libxml/tree.h>
-+#include <libxml/entities.h>
- 
- namespace xmlpp
- {
-diff --git a/libxml++/validators/relaxngvalidator.cc b/libxml++/validators/relaxngvalidator.cc
-index 9bb10c2..68a814c 100644
---- a/libxml++/validators/relaxngvalidator.cc
-+++ b/libxml++/validators/relaxngvalidator.cc
-@@ -22,6 +22,7 @@
- #include "libxml++/parsers/domparser.h"
- #include "libxml++/relaxngschema.h"
- 
-+#include <libxml/tree.h>
- #include <libxml/relaxng.h>
- 
- namespace xmlpp
-diff --git a/tests/saxparser_chunk_parsing_inconsistent_state/main.cc b/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
-index 07cc3ef..53f55b3 100644
---- a/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
-+++ b/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
-@@ -24,10 +24,14 @@
- 
- class MySaxParser : public xmlpp::SaxParser
- {
-+public:
-+  bool throw_on_start_doc = true;
-+
- protected:
-   void on_start_document() override
-   {
--    throw std::runtime_error("some custom runtime exception");
-+    if (throw_on_start_doc)
-+      throw std::runtime_error("some custom runtime exception");
-   }
-   void on_error(const xmlpp::ustring& /* text */) override
-   {
-@@ -43,6 +47,9 @@ int main()
-     bool exceptionThrown = false;
-     try
-     {
-+      // Depending on the libxml2 version, MySaxParser::on_start_document()
-+      // may or may not be called before MySaxParser::on_error().
-+      parser.throw_on_start_doc = false;
-       parser.parse_chunk("<?");
-       parser.finish_chunk_parsing();
-     }
-@@ -61,6 +68,7 @@ int main()
-     exceptionThrown = false;
-     try
-     {
-+      parser.throw_on_start_doc = true;
-       std::stringstream ss("<root></root>");
-       parser.parse_stream(ss);
-     }
diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 1c1342a105..84084b1e35 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libxml++/5.0/libxml++-5.0.2.sha256sum
-sha256  7c17cc3e5a2214314dee5a1354f4b436f266ded6185232a0534f352a76240d5a  libxml++-5.0.2.tar.xz
+# From https://download.gnome.org/sources/libxml++/5.2/libxml++-5.2.0.sha256sum
+sha256  e41b8eae55210511585ae638615f00db7f982c0edea94699865f582daf03b44f  libxml++-5.2.0.tar.xz
 
 # Hash for license file
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index dacd5c1eae..e8fbb75b61 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXMLPP_VERSION_MAJOR = 5.0
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
+LIBXMLPP_VERSION_MAJOR = 5.2
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).0
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
