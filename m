Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEF3C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE7E60E83;
	Mon,  1 Jan 2024 20:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EE7E60E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sCu2lBtB68Lt; Mon,  1 Jan 2024 20:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB51960E22;
	Mon,  1 Jan 2024 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB51960E22
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8075B1BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 651A1401CA
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 651A1401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUTaiU1MYMuM for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:36:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2607340104
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2607340104
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CEB383A81; Mon,  1 Jan 2024 20:36:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:34:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7738907cc62f3aa166411353cfe22ebaf32007e7
X-Git-Newrev: a92c0efb9f37e6c8d5eae19fbce38d1a49cf44a5
X-Patchwork-Hint: ignore
Message-Id: <20240101203607.0CEB383A81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: fix build with libxml2 >=
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a92c0efb9f37e6c8d5eae19fbce38d1a49cf44a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of libxml2 to version
2.12.1 in commit d8ac52108c12f0fcc9641b63e7922009270f96c6:

/home/buildroot/autobuild/instance-1/output-1/build/libiio-0.25/xml.c: In function 'xml_create_context':
/home/buildroot/autobuild/instance-1/output-1/build/libiio-0.25/xml.c:481:15: warning: implicit declaration of function 'xmlReadFile' [-Wimplicit-function-declaration]
  481 |         doc = xmlReadFile(xml_file, NULL, XML_PARSE_DTDVALID);
      |               ^~~~~~~~~~~
/home/buildroot/autobuild/instance-1/output-1/build/libiio-0.25/xml.c:481:43: error: 'XML_PARSE_DTDVALID' undeclared (first use in this function); did you mean 'XML_DOC_DTDVALID'?
  481 |         doc = xmlReadFile(xml_file, NULL, XML_PARSE_DTDVALID);
      |                                           ^~~~~~~~~~~~~~~~~~
      |                                           XML_DOC_DTDVALID

Fixes:
 - http://autobuild.buildroot.org/results/f97c2db33e07a02699e4650caf97de5f3c475eb8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-xml-Fix-compatibility-with-libxml-2-12.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch b/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch
new file mode 100644
index 0000000000..56c272aad3
--- /dev/null
+++ b/package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch
@@ -0,0 +1,33 @@
+From b1170cacff24cdfd3858edc2285c51cadef11488 Mon Sep 17 00:00:00 2001
+From: Jan Tojnar <jtojnar@gmail.com>
+Date: Sun, 10 Dec 2023 21:52:05 +0100
+Subject: [PATCH] xml: Fix compatibility with libxml 2.12
+
+libxml 2.12.0 reorganized includes, resulting in the following no longer being in scope:
+
+- XML_PARSE_DTDVALID
+- xmlReadMemory
+- xmlReadFile
+- xmlCleanupParser
+
+Signed-off-by: Jan Tojnar <jtojnar@gmail.com>
+(cherry picked from commit bb688d04294dda45e68dfaf13e3bc1187841e52a)
+
+Upstream: https://github.com/analogdevicesinc/libiio/commit/b1170cacff24cdfd3858edc2285c51cadef11488
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ xml.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xml.c b/xml.c
+index 33f026103..3eaed92b3 100644
+--- a/xml.c
++++ b/xml.c
+@@ -10,6 +10,7 @@
+ #include "iio-private.h"
+ 
+ #include <errno.h>
++#include <libxml/parser.h>
+ #include <libxml/tree.h>
+ #include <string.h>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
