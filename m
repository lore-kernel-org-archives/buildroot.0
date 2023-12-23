Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D20C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8FD8217D;
	Sat, 23 Dec 2023 21:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E8FD8217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f6SO9oSfyjrw; Sat, 23 Dec 2023 21:22:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A902821DD;
	Sat, 23 Dec 2023 21:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A902821DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11E6F1BF406
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E63E460EA6
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 21:21:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E63E460EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rIvpcRzueqq for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 21:21:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0FF460E08
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 21:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0FF460E08
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBB478255F; Sat, 23 Dec 2023 21:21:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 21:34:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dae30d7d15896eaf8f9d7a8e2d4f86e67545577
X-Git-Newrev: 180f119b756258d47461f1e4e70bfd581024de1a
X-Patchwork-Hint: ignore
Message-Id: <20231223212146.DBB478255F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xmlstarlet: fix build with
 libxml2-2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=180f119b756258d47461f1e4e70bfd581024de1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: improved with a more complete patch provided by upstream
developer.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-issues-with-libxml2-2.12.patch  | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch b/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
new file mode 100644
index 0000000000..74034dad53
--- /dev/null
+++ b/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
@@ -0,0 +1,97 @@
+From 702988467d67c3a33255de4c543f56767c64c72e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sat, 23 Dec 2023 21:30:30 +0100
+Subject: [PATCH] Fix build issues with libxml2 2.12
+
+Based on initial work from Bernd Kuhls <bernd@kuhls.net>, improved by
+Yaakov Selkowitz.
+
+Upstream: https://sourceforge.net/p/xmlstar/patches/22/
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/trans.h      | 1 +
+ src/xml.c        | 2 +-
+ src/xml_edit.c   | 1 +
+ src/xml_elem.c   | 2 +-
+ src/xml_format.c | 1 +
+ src/xmlstar.h    | 2 +-
+ 6 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/trans.h b/src/trans.h
+index 016304e..395462c 100644
+--- a/src/trans.h
++++ b/src/trans.h
+@@ -36,6 +36,7 @@ THE SOFTWARE.
+ #include <libxml/xinclude.h>
+ #include <libxml/parserInternals.h>
+ #include <libxml/uri.h>
++#include <libxml/globals.h>
+ 
+ #include <libxslt/xslt.h>
+ #include <libxslt/xsltInternals.h>
+diff --git a/src/xml.c b/src/xml.c
+index cf47cc2..e6f19c1 100644
+--- a/src/xml.c
++++ b/src/xml.c
+@@ -104,7 +104,7 @@ void reportGenericError(void* ctx, const char * msg, ...) {
+ /* by default all errors are reported */
+ static ErrorInfo errorInfo = { NULL, NULL, VERBOSE, CONTINUE };
+ 
+-void reportError(void *ptr, xmlErrorPtr error)
++void reportError(void *ptr, const xmlError *error)
+ {
+     ErrorInfo *errorInfo = (ErrorInfo*) ptr;
+     assert(errorInfo);
+diff --git a/src/xml_edit.c b/src/xml_edit.c
+index e199178..b3da8a4 100644
+--- a/src/xml_edit.c
++++ b/src/xml_edit.c
+@@ -42,6 +42,7 @@ THE SOFTWARE.
+ #include <libxml/xpointer.h>
+ #include <libxml/parserInternals.h>
+ #include <libxml/uri.h>
++#include <libxml/globals.h>
+ #include <libexslt/exslt.h>
+ 
+ #include "xmlstar.h"
+diff --git a/src/xml_elem.c b/src/xml_elem.c
+index 024e62a..a73038a 100644
+--- a/src/xml_elem.c
++++ b/src/xml_elem.c
+@@ -186,7 +186,7 @@ typedef struct {
+  * put @name into @data->array[@data->offset]
+  */
+ static void
+-hash_key_put(void *payload, void *data, xmlChar *name)
++hash_key_put(void *payload, void *data, const xmlChar *name)
+ {
+     ArrayDest *dest = data;
+     dest->array[dest->offset++] = name;
+diff --git a/src/xml_format.c b/src/xml_format.c
+index e9da4df..ddd6614 100644
+--- a/src/xml_format.c
++++ b/src/xml_format.c
+@@ -42,6 +42,7 @@ THE SOFTWARE.
+ #include <libxml/xpointer.h>
+ #include <libxml/parserInternals.h>
+ #include <libxml/uri.h>
++#include <libxml/globals.h>
+ 
+ #include "xmlstar.h"
+ 
+diff --git a/src/xmlstar.h b/src/xmlstar.h
+index 3e1eed3..e8d7177 100644
+--- a/src/xmlstar.h
++++ b/src/xmlstar.h
+@@ -32,7 +32,7 @@ typedef struct _errorInfo {
+     ErrorStop stop;
+ } ErrorInfo;
+ 
+-void reportError(void *ptr, xmlErrorPtr error);
++void reportError(void *ptr, const xmlError *error);
+ void suppressErrors(void);
+ 
+ typedef struct _gOptions {
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
