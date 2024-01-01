Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD66C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 102D060B29;
	Mon,  1 Jan 2024 20:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102D060B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9b0-_sQYwWL; Mon,  1 Jan 2024 20:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D21060B38;
	Mon,  1 Jan 2024 20:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D21060B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 90A481BF37C
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E49F4011D
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E49F4011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7-3WCi6p6Wj for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D673940104
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D673940104
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD3CC83A55; Mon,  1 Jan 2024 20:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:09:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05392a5eae61c2855bc8d94f5bf9677ebbc5462a
X-Git-Newrev: a6a587b537cd5827d73529da7d71932b3fcf0333
X-Patchwork-Hint: ignore
Message-Id: <20240101201058.BD3CC83A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlpp: fix build with libxml2
 >= 2.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6a587b537cd5827d73529da7d71932b3fcf0333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of libxml2 to version
2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:

../libxml++/nodes/entityreference.cc: In member function 'xmlpp::ustring xmlpp::EntityReference::get_resolved_text() const':
../libxml++/nodes/entityreference.cc:30:35: error: invalid use of incomplete type 'struct _xmlEntity'
   30 |       const xmlChar* pch = cEntity->content;
      |                                   ^~

Fixes:
 - http://autobuild.buildroot.org/results/f3cef04950eeaa744ebe9409561d505606375787

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Make-it-compatible-with-libxml2--2-12-0.patch | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
