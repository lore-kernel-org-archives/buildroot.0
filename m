Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F71C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 17:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D4540111;
	Thu, 28 Dec 2023 17:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D4540111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cd6hm9JdrBb6; Thu, 28 Dec 2023 17:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A35840260;
	Thu, 28 Dec 2023 17:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A35840260
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9884A1BF2FA
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 17:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70FCD60EDF
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 17:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70FCD60EDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqj9YVdNLYEh for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 17:20:37 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0959760EC6
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 17:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0959760EC6
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so5782848f8f.2
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 09:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703784034; x=1704388834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odR+h/VyxDfYedY0mfep/DMxQsWZ9d1OGsmkUTESRpg=;
 b=UlDg64q9Yea9/w/QG2l9XOqZcTzQLxAv5brSPEgjVUfuohTBCHJTXLApCIYFk2t9OC
 mQbXJZ+1lQsNtJVQfdnturA4sbmHKStRzfHLi8idAbeBIAgqous1Q7yMFH/1dvCv58WP
 58K22KLj4/5oD/tDKi1mueOMjtkgEw1m00lPxcwo6depUBkswfh1u0c7qpUzQeGjjztP
 zJ+i3eBsY7FJGrbx7h6f+apkKjrIkA+8D1nCMloBI5zUw1+OMCcCG1ejq6aPjL2lz7Si
 5mcaGFq7lVnG0olKvN/jP5tjDWwRdB3+8o7keOPtOQwzbBfFn0uZQ1LTm5ESqZFs8H98
 +ZAw==
X-Gm-Message-State: AOJu0YxmvqWUqoLPSGOoVo0FiVuaKzskvA366haJj+SJIm8xIbMrWU95
 nx1RS4+znv9T26CLBN8TCot7YPiWsro=
X-Google-Smtp-Source: AGHT+IF/cLZt/2hy5Pc4aNeEWccrbr8aiREbcv6HfyccEgCi48Dk8ccO8AsaDjSoX9qwhSiaGqYjWw==
X-Received: by 2002:a05:6000:10c8:b0:336:8940:c4d8 with SMTP id
 b8-20020a05600010c800b003368940c4d8mr6568244wrx.5.1703784033967; 
 Thu, 28 Dec 2023 09:20:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d45c7000000b00336c6b77584sm8480483wrs.91.2023.12.28.09.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 09:20:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 18:20:31 +0100
Message-ID: <20231228172031.29164-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703784034; x=1704388834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=odR+h/VyxDfYedY0mfep/DMxQsWZ9d1OGsmkUTESRpg=;
 b=FugRUah3z3N0BCfQYhk7zxOuTO/9Ci7a6OmB/o47NNhVxNeHDPCLTNWCUdhfpTayWE
 A0Im1QtIPUlOaYBEIEO3Jy3ObkdpIBuK6pyNn3yUHXRHA+svxSHndB4vSibn6yStMHJJ
 nWGWOwKgNTXVTqB4Zco1sWKLoixUx61GP9jl7brD99WQKErwLyd+FgqF487ICs0sr6C6
 u6j6SnXpvGyCePfG7QJ0QaX/QJbJ/ZPP9WN6PWEEGDYfay+M8XEcmuHJs1U55Ok+l0wv
 dFlThKJDml2zNXA/wOdnJIDnMUwzW3GpJvIk30T+VqxP4AYF910W43MO6z9RrmoqqFWe
 JvvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FugRUah3
Subject: [Buildroot] [PATCH 1/1] package/libxmlpp: fix build with libxml2 >=
 2.12
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

Fix the following build failure raised since bump of libxml2 to version
2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:

../libxml++/nodes/entityreference.cc: In member function 'xmlpp::ustring xmlpp::EntityReference::get_resolved_text() const':
../libxml++/nodes/entityreference.cc:30:35: error: invalid use of incomplete type 'struct _xmlEntity'
   30 |       const xmlChar* pch = cEntity->content;
      |                                   ^~

Fixes:
 - http://autobuild.buildroot.org/results/f3cef04950eeaa744ebe9409561d505606375787

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-it-compatible-with-libxml2--2-12-0.patch | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch

diff --git a/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch b/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch
new file mode 100644
index 0000000000..b9100b4966
--- /dev/null
+++ b/package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch
@@ -0,0 +1,145 @@
+From 49471812d57adfb22dcce3cbea1a8956658731b9 Mon Sep 17 00:00:00 2001
+From: Kjell Ahlstedt <kjellahlstedt@gmail.com>
+Date: Sat, 18 Nov 2023 18:34:07 +0100
+Subject: [PATCH] Make it compatible with libxml2 >= 2.12.0
+
+* libxml++/document.cc:
+* libxml++/dtd.cc:
+* libxml++/nodes/entitydeclaration.cc:
+* libxml++/nodes/entityreference.cc:
+* libxml++/validators/relaxngvalidator.cc: Modify #include directives.
+* libxml++/keepblanks.cc: Ignore deprecation of xmlKeepBlanksDefault().
+* tests/saxparser_chunk_parsing_inconsistent_state/main.cc:
+Accept that MySaxParser::on_start_document() can be called before
+MySaxParser::on_error().
+
+Upstream: https://github.com/libxmlplusplus/libxmlplusplus/commit/49471812d57adfb22dcce3cbea1a8956658731b9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libxml++/document.cc                                   |  1 +
+ libxml++/dtd.cc                                        |  2 +-
+ libxml++/keepblanks.cc                                 |  5 ++++-
+ libxml++/nodes/entitydeclaration.cc                    |  2 +-
+ libxml++/nodes/entityreference.cc                      |  2 +-
+ libxml++/validators/relaxngvalidator.cc                |  1 +
+ .../saxparser_chunk_parsing_inconsistent_state/main.cc | 10 +++++++++-
+ 7 files changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/libxml++/document.cc b/libxml++/document.cc
+index da0a8f5..d5476c6 100644
+--- a/libxml++/document.cc
++++ b/libxml++/document.cc
+@@ -16,6 +16,7 @@
+ 
+ #include <libxml/tree.h>
+ #include <libxml/xinclude.h>
++#include <libxml/xmlsave.h>
+ #include <libxml/parser.h> // XML_PARSE_NOXINCNODE, XML_PARSE_NOBASEFIX
+ 
+ #include <iostream>
+diff --git a/libxml++/dtd.cc b/libxml++/dtd.cc
+index 238b3a0..8014c07 100644
+--- a/libxml++/dtd.cc
++++ b/libxml++/dtd.cc
+@@ -8,7 +8,7 @@
+ #include <libxml++/exceptions/parse_error.h>
+ #include <libxml++/io/istreamparserinputbuffer.h>
+ 
+-#include <libxml/tree.h>
++#include <libxml/parser.h>
+ 
+ #include <sstream>
+ 
+diff --git a/libxml++/keepblanks.cc b/libxml++/keepblanks.cc
+index 4228b8d..56b00cf 100644
+--- a/libxml++/keepblanks.cc
++++ b/libxml++/keepblanks.cc
+@@ -5,8 +5,11 @@
+  * included with libxml++ as the file COPYING.
+  */
+ 
+-#include <libxml++/keepblanks.h>
++// xmlKeepBlanksDefault() is deprecated since libxml2 2.12.0.
++// Ignore deprecations here.
++#define XML_DEPRECATED
+ 
++#include <libxml++/keepblanks.h>
+ #include <libxml/globals.h>
+ 
+ namespace xmlpp
+diff --git a/libxml++/nodes/entitydeclaration.cc b/libxml++/nodes/entitydeclaration.cc
+index 0a6390e..d5bfa75 100644
+--- a/libxml++/nodes/entitydeclaration.cc
++++ b/libxml++/nodes/entitydeclaration.cc
+@@ -5,7 +5,7 @@
+  */
+ 
+ #include <libxml++/nodes/entitydeclaration.h>
+-#include <libxml/tree.h>
++#include <libxml/entities.h>
+ 
+ namespace xmlpp
+ {
+diff --git a/libxml++/nodes/entityreference.cc b/libxml++/nodes/entityreference.cc
+index 19b1b22..278a126 100644
+--- a/libxml++/nodes/entityreference.cc
++++ b/libxml++/nodes/entityreference.cc
+@@ -6,7 +6,7 @@
+ 
+ #include <libxml++/nodes/entityreference.h>
+ 
+-#include <libxml/tree.h>
++#include <libxml/entities.h>
+ 
+ namespace xmlpp
+ {
+diff --git a/libxml++/validators/relaxngvalidator.cc b/libxml++/validators/relaxngvalidator.cc
+index 9bb10c2..68a814c 100644
+--- a/libxml++/validators/relaxngvalidator.cc
++++ b/libxml++/validators/relaxngvalidator.cc
+@@ -22,6 +22,7 @@
+ #include "libxml++/parsers/domparser.h"
+ #include "libxml++/relaxngschema.h"
+ 
++#include <libxml/tree.h>
+ #include <libxml/relaxng.h>
+ 
+ namespace xmlpp
+diff --git a/tests/saxparser_chunk_parsing_inconsistent_state/main.cc b/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
+index 07cc3ef..53f55b3 100644
+--- a/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
++++ b/tests/saxparser_chunk_parsing_inconsistent_state/main.cc
+@@ -24,10 +24,14 @@
+ 
+ class MySaxParser : public xmlpp::SaxParser
+ {
++public:
++  bool throw_on_start_doc = true;
++
+ protected:
+   void on_start_document() override
+   {
+-    throw std::runtime_error("some custom runtime exception");
++    if (throw_on_start_doc)
++      throw std::runtime_error("some custom runtime exception");
+   }
+   void on_error(const xmlpp::ustring& /* text */) override
+   {
+@@ -43,6 +47,9 @@ int main()
+     bool exceptionThrown = false;
+     try
+     {
++      // Depending on the libxml2 version, MySaxParser::on_start_document()
++      // may or may not be called before MySaxParser::on_error().
++      parser.throw_on_start_doc = false;
+       parser.parse_chunk("<?");
+       parser.finish_chunk_parsing();
+     }
+@@ -61,6 +68,7 @@ int main()
+     exceptionThrown = false;
+     try
+     {
++      parser.throw_on_start_doc = true;
+       std::stringstream ss("<root></root>");
+       parser.parse_stream(ss);
+     }
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
