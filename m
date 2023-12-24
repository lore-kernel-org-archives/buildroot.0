Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F0C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F8DB40272;
	Sun, 24 Dec 2023 08:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F8DB40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e428lSRESypT; Sun, 24 Dec 2023 08:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40AD1404AB;
	Sun, 24 Dec 2023 08:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AD1404AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B1851BF359
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53CFA607F1
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53CFA607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuWPsAB0J8Uc for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:15:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E70160792
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E70160792
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDE9EA4C0DA1;
 Sun, 24 Dec 2023 09:15:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52754)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJdg-0001CD-1e;
 Sun, 24 Dec 2023 09:15:12 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:15:12 +0100
Message-Id: <20231224081512.19928-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231224081512.19928-1-bernd@kuhls.net>
References: <20231224081512.19928-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703405712;
 bh=9PDwOGfUbDzm9Rm8qbv6hAQYe8ab35UsrFf733yBIxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v/IY8mp6vQtM/+uixbICACfRojSsKWdmqVf2c8WCEWDnZbfCgrPIgd9be1sWnda/K
 1iLhod/xeogrsMOffBQpeVoxYWeQ8Z4ly6I2h7yQPiu08tlGqjTzceyY3pYgcjEnQl
 +zOVznxC+LUtkZLoUTaymaKh6hoW4Fyl/eiiUiZo8mHX8267LUaD3ZZ7dKEItmLbPN
 a9BT4qE56niNrtuMSGSx1o27kF+7MSIaDOUe3lNSHI+pVFCRY3xX1NFns6YM1+EVfK
 WkwydFZdWRYwMaGuDOc5vhH1nub/8hOrPBH1M3R2DwLTsbej8mMHRoQTmtWu4nD73X
 kvNW/my5Fvd2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=v/IY8mp6
Subject: [Buildroot] [PATCH 3/3] package/php: fix build with libxml2-2.12
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...bxml2-2.12.0-issue-building-from-src.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/php/0007-Fix-GH-12702-libxml2-2.12.0-issue-building-from-src.patch

diff --git a/package/php/0007-Fix-GH-12702-libxml2-2.12.0-issue-building-from-src.patch b/package/php/0007-Fix-GH-12702-libxml2-2.12.0-issue-building-from-src.patch
new file mode 100644
index 0000000000..2f1bce3973
--- /dev/null
+++ b/package/php/0007-Fix-GH-12702-libxml2-2.12.0-issue-building-from-src.patch
@@ -0,0 +1,56 @@
+From 8a95e616b91ac0eeedba90a61e36e652919763f2 Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+nielsdos@users.noreply.github.com>
+Date: Fri, 17 Nov 2023 19:45:40 +0100
+Subject: [PATCH] Fix GH-12702: libxml2 2.12.0 issue building from src
+
+Fixes GH-12702.
+
+Co-authored-by: nono303 <github@nono303.net>
+
+Upstream: https://github.com/php/php-src/commit/8a95e616b91ac0eeedba90a61e36e652919763f2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ NEWS                    | 3 +++
+ ext/dom/document.c      | 1 +
+ ext/libxml/php_libxml.h | 1 +
+ 3 files changed, 5 insertions(+)
+
+diff --git a/NEWS b/NEWS
+index dff47b02fb671..247a124e51293 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,9 @@ PHP                                                                        NEWS
+ - Intl:
+   . Fixed bug GH-12635 (Test bug69398.phpt fails with ICU 74.1). (nielsdos)
+ 
++- LibXML:
++  . Fixed bug GH-12702 (libxml2 2.12.0 issue building from src). (nono303)
++
+ - PCRE:
+   . Fixed bug GH-12628 (The gh11374 test fails on Alpinelinux). (nielsdos)
+ 
+diff --git a/ext/dom/document.c b/ext/dom/document.c
+index 59f00897a69aa..8312d6c59399f 100644
+--- a/ext/dom/document.c
++++ b/ext/dom/document.c
+@@ -23,6 +23,7 @@
+ #if defined(HAVE_LIBXML) && defined(HAVE_DOM)
+ #include "php_dom.h"
+ #include <libxml/SAX.h>
++#include <libxml/xmlsave.h>
+ #ifdef LIBXML_SCHEMAS_ENABLED
+ #include <libxml/relaxng.h>
+ #include <libxml/xmlschemas.h>
+diff --git a/ext/libxml/php_libxml.h b/ext/libxml/php_libxml.h
+index af1cc7d6ac8c5..b484568bb1b0a 100644
+--- a/ext/libxml/php_libxml.h
++++ b/ext/libxml/php_libxml.h
+@@ -35,6 +35,7 @@ extern zend_module_entry libxml_module_entry;
+ 
+ #include "zend_smart_str.h"
+ #include <libxml/tree.h>
++#include <libxml/parser.h>
+ 
+ #define LIBXML_SAVE_NOEMPTYTAG 1<<2
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
