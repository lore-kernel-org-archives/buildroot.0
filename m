Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F64C79F89
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 830CB606A0;
	Mon,  7 Sep 2026 12:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_A4TgwUZo4z; Mon,  7 Sep 2026 12:03:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9818D60693
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788782585;
	b=BtPtoilL28YbOHiShwFpBhR+LFDAn19PzImViwa8J1on6u9aAJrqKGEFQKE84koq0rT0
	 oyXpCeZyQVDD0OILA7v/+19+bPbBO8GBduv6nH4FGshGaVTSXPcwdY5hoKTwLAK+WgOGV
	 kJf3ZZBtOFK9KcGkvNBI6v1q1CD66Xym5XlbaAG3/pwVFoXx/Zs4qm3bHejsi+AA8EkCn
	 38oyBb1idlEs8NRi0LPuNxXJWBRNpp/xzxQkiriaNpjJXUg/HfkP2hB+4ad7qfwv5je7c
	 Xu7jjdKdl1Y1DKtF4PloWg7U4DgO8nh2VyY6b0VoEgmSF6we5R6hRVLsPAw2frecrPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788782585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=tnLHtkTIiviuUWaWpTUIgpyZ4k1DMJ1M7wXZQwRT2sg=;
	b=qTn4aQxD7CKjyjVu+M92D/QeCvHl68zO5+sR00KOAAYc1ag7eLELZOU+DZDHArzRGlJc
	 izhUJvcImeHR45DHGL1a9rOBxV6jR15x2JttYfgol0NpKhYnd1CCnYee3qvcYyEmNX9cA
	 jNVE4OtRTETqvfFSiKLhSBkAE/Ktc1p5ym5I8SBc/NpMuvu5S9nyGr5c8/FhqhPCGnsn2
	 9Aytt7cRe1eyIFyyMLUs1KIVduika85ZId09aOdLsLpwAU5vYDB4KTXbC0GSaTqH8fvpV
	 MXVyab+eVTMJDBNLDQdGB9bsnVkc/o2a59z/lctkuTOMVJupXWM8Tir6BdZJMnRJChg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788782585;
	bh=tnLHtkTIiviuUWaWpTUIgpyZ4k1DMJ1M7wXZQwRT2sg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dPUbBk5krNJVc65EucGWqEtYl1sZWQ6ZRJ1LLXksIdmBnj6qTjvKuqbDCOJIdKL9d
	 dfCF+crrWy/yGA7qbqeSS2OBPu3+wb8ka9m/RGyCD1XB1H78/zlJasfPUqpWjTngOP
	 qvZRyDqo+di6fHGMoqnQCdQ4uYBVtsfo7vYTZ/0yac1RWOpew0DJx+AX6zW2cunaqa
	 BT5HYNyf63bDvGqr6hRHulAB+7xEV3MHrTLPNIVrnJv11qd5DBGBsEgYm1IKRUQ4fd
	 ri7ezGA51H5A4RYv5tvvGbNPyMmfaAMuVPDaLb20yG+8rEmpNkPkP8GSyVTYtZheTc
	 YLNlqW17aKwcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9818D60693;
	Mon,  7 Sep 2026 12:03:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E362872C
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C918240587
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HjYWGa07AyH for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 12:03:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EF3540557
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788782582;
 b=QYaKUQWtZGFUrOM90bYKhSCtU/KPypjts/OfrRmCkryKjEeR8NkKjoPDMp9j9YNCKU+E
 ctpT0nVl2AmngrEHZbYYZxss/uZ4Jvc7XdeyaoVDkfWMVKAeFI+3vWDcq8DgS2VfAXn0o
 1WbtagAUruTaK8E8Bf5wyynXb/qiRjkNa3zkoJkdLsYonBJ3uU0YauhGL/Nx9GcoPwKoe
 imkDg3ZZ6g4GxA2asvRlV8HB4LaKrnbYIMuaRFlMm//FiaXh5kBDh8Jn+dtZcXFjp4en1
 09AKqByllJlrKPPTBSiha1CfZ6UvOH4ryXgyNkBEHc9MTq7J580FFuKdPxl8MVMUk2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788782582;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=4YuFgQxw2MbocKupx/lGLHfu8jVEcsHDWbJPIVeu350=;
 b=h2etIOPTXwUGz7Ky+JdEXsuGItd+7qEaXM3bS7IMuMiBR1jOFP4D8awNr910dKXd0z0f
 /1Gd+x7zSEHDtMR7dyUDBqh3DvnotXEMM+8mxIHBOcQWaQWoeHbNvSiuI4QnQcWbQXgRa
 7VWPLWpcF3ZBGSGHepKgez+E0P7Te/d0tx09jvTbHPUMcJb2oXNKNpihA0VT4xtkwXeUA
 rB4PRbGbJR36gy+NhJC0WknCvyNk+IBTCMxqoZChuB1egAW8jHGGuyTB8BG28eWaPrgC4
 j5y/fVozhHvd/xYCHOuskFhvfFXF21FN63GS8juzZoyvrlUSCotcFgRDcDtGjeK/crA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oSJCrK9r; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oSJCrK9r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EF3540557
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788782578;
 bh=4YuFgQxw2MbocKupx/lGLHfu8jVEcsHDWbJPIVeu350=;
 h=From:To:Subject:Date:From;
 b=oSJCrK9rBR3Ixc4CBD7oIL8MTcSDxHQQRPvihKxTWVAdU1CrBYg0AKEKxj+dMZdPj
 kyVBZBu3WX0oRlStnBPpF/nKh5Iz1LVgNh/jtqlqlyh0nE/PyqX2UFHCbgK388p74n
 mo4UP2d8LcI0ggR5tSlm03AaFKwwZMGmiwREcmPwN+QXr0y52YaoDyOgRvvjZiPMdP
 PzBpsxULozMmRTwyG2RAX2U05jXMXlcTirEQEWVric1BY5p8Wi3yc7Sf024f5vmsH2
 +FSCP92GstMfVNi0vqNMg/0Sbi6vKJvsBrs3Zumsdsq4S9MZZyHopvF9BM0KO2WSId
 P/CjPXAFSajnQ==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FB82A4C2E1F
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 14:02:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40780)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3Y3u-000000002Ce-0MeE
 for buildroot@buildroot.org; Mon, 07 Sep 2026 12:02:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  7 Sep 2026 14:02:57 +0200
Message-ID: <20260907120257.2988186-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/xmlstarlet: bump version to 1.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream site switched to Github:
https://sourceforge.net/p/xmlstar/feature-requests/50/

Release notes:
https://github.com/xmlstarlet/xmlstarlet/releases/tag/1.7.0

Removed patches which are included in this release.
Instead of patch 0002 a different fix was committed upstream:
https://github.com/xmlstarlet/xmlstarlet/commit/f300cd048d22ed5291f885346c62779b92c4aca4

Switched to pkgconf to detect libxml2/libxslt expect for static builds:
https://github.com/xmlstarlet/xmlstarlet/commit/27063aa63c96541fe6db335aa36e5fa29bc5f0e9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/78c6ce3cd8518fbe0bae82c93e757200bd522f89

 ...1-Fix-build-issues-with-libxml2-2.12.patch | 97 -------------------
 ...0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch | 49 ----------
 package/xmlstarlet/Config.in                  |  2 +-
 package/xmlstarlet/xmlstarlet.hash            |  5 +-
 package/xmlstarlet/xmlstarlet.mk              | 18 ++--
 5 files changed, 9 insertions(+), 162 deletions(-)
 delete mode 100644 package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
 delete mode 100644 package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch

diff --git a/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch b/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
deleted file mode 100644
index 74034dad53..0000000000
--- a/package/xmlstarlet/0001-Fix-build-issues-with-libxml2-2.12.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 702988467d67c3a33255de4c543f56767c64c72e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 23 Dec 2023 21:30:30 +0100
-Subject: [PATCH] Fix build issues with libxml2 2.12
-
-Based on initial work from Bernd Kuhls <bernd@kuhls.net>, improved by
-Yaakov Selkowitz.
-
-Upstream: https://sourceforge.net/p/xmlstar/patches/22/
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/trans.h      | 1 +
- src/xml.c        | 2 +-
- src/xml_edit.c   | 1 +
- src/xml_elem.c   | 2 +-
- src/xml_format.c | 1 +
- src/xmlstar.h    | 2 +-
- 6 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/trans.h b/src/trans.h
-index 016304e..395462c 100644
---- a/src/trans.h
-+++ b/src/trans.h
-@@ -36,6 +36,7 @@ THE SOFTWARE.
- #include <libxml/xinclude.h>
- #include <libxml/parserInternals.h>
- #include <libxml/uri.h>
-+#include <libxml/globals.h>
- 
- #include <libxslt/xslt.h>
- #include <libxslt/xsltInternals.h>
-diff --git a/src/xml.c b/src/xml.c
-index cf47cc2..e6f19c1 100644
---- a/src/xml.c
-+++ b/src/xml.c
-@@ -104,7 +104,7 @@ void reportGenericError(void* ctx, const char * msg, ...) {
- /* by default all errors are reported */
- static ErrorInfo errorInfo = { NULL, NULL, VERBOSE, CONTINUE };
- 
--void reportError(void *ptr, xmlErrorPtr error)
-+void reportError(void *ptr, const xmlError *error)
- {
-     ErrorInfo *errorInfo = (ErrorInfo*) ptr;
-     assert(errorInfo);
-diff --git a/src/xml_edit.c b/src/xml_edit.c
-index e199178..b3da8a4 100644
---- a/src/xml_edit.c
-+++ b/src/xml_edit.c
-@@ -42,6 +42,7 @@ THE SOFTWARE.
- #include <libxml/xpointer.h>
- #include <libxml/parserInternals.h>
- #include <libxml/uri.h>
-+#include <libxml/globals.h>
- #include <libexslt/exslt.h>
- 
- #include "xmlstar.h"
-diff --git a/src/xml_elem.c b/src/xml_elem.c
-index 024e62a..a73038a 100644
---- a/src/xml_elem.c
-+++ b/src/xml_elem.c
-@@ -186,7 +186,7 @@ typedef struct {
-  * put @name into @data->array[@data->offset]
-  */
- static void
--hash_key_put(void *payload, void *data, xmlChar *name)
-+hash_key_put(void *payload, void *data, const xmlChar *name)
- {
-     ArrayDest *dest = data;
-     dest->array[dest->offset++] = name;
-diff --git a/src/xml_format.c b/src/xml_format.c
-index e9da4df..ddd6614 100644
---- a/src/xml_format.c
-+++ b/src/xml_format.c
-@@ -42,6 +42,7 @@ THE SOFTWARE.
- #include <libxml/xpointer.h>
- #include <libxml/parserInternals.h>
- #include <libxml/uri.h>
-+#include <libxml/globals.h>
- 
- #include "xmlstar.h"
- 
-diff --git a/src/xmlstar.h b/src/xmlstar.h
-index 3e1eed3..e8d7177 100644
---- a/src/xmlstar.h
-+++ b/src/xmlstar.h
-@@ -32,7 +32,7 @@ typedef struct _errorInfo {
-     ErrorStop stop;
- } ErrorInfo;
- 
--void reportError(void *ptr, xmlErrorPtr error);
-+void reportError(void *ptr, const xmlError *error);
- void suppressErrors(void);
- 
- typedef struct _gOptions {
--- 
-2.43.0
-
diff --git a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch b/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
deleted file mode 100644
index dd7472301e..0000000000
--- a/package/xmlstarlet/0002-xml_pyx-remove-ATTRIBUTE_UNUSED.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 6b3ca3549abb998947088bdf264d65a0a86684cd Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 12 Oct 2025 18:38:54 +0200
-Subject: [PATCH] xml_pyx: remove ATTRIBUTE_UNUSED
-
-This define was removed in libxml2 2.14.0:
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/208f27f9641a59863ce1f7d4992df77f7eb0ea9d
-
-Upstream: https://sourceforge.net/p/xmlstar/patches/23/
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/xml_pyx.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/xml_pyx.c b/src/xml_pyx.c
-index ab295f1..8adc028 100644
---- a/src/xml_pyx.c
-+++ b/src/xml_pyx.c
-@@ -200,7 +200,7 @@ pyxExternalEntityReferenceHandler(void* userData,
- }
- 
- static void
--pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
-+pyxExternalSubsetHandler(void *ctx, const xmlChar *name,
-                          const xmlChar *ExternalID, const xmlChar *SystemID)
- {
-     fprintf(stdout, "D %s PUBLIC", name); /* TODO: re-check */
-@@ -215,7 +215,7 @@ pyxExternalSubsetHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *name,
- }
- 
- static void
--pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
-+pyxCommentHandler(void *ctx, const xmlChar *value)
- {
-     fprintf(stdout,"C");
-     SanitizeData(value, xmlStrlen(value));
-@@ -223,7 +223,7 @@ pyxCommentHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value)
- }
- 
- static void
--pyxCdataBlockHandler(void *ctx ATTRIBUTE_UNUSED, const xmlChar *value, int len)
-+pyxCdataBlockHandler(void *ctx, const xmlChar *value, int len)
- {
-     fprintf(stdout,"[");
-     SanitizeData(value, len);
--- 
-2.47.3
-
diff --git a/package/xmlstarlet/Config.in b/package/xmlstarlet/Config.in
index 99762b8761..b88c80801a 100644
--- a/package/xmlstarlet/Config.in
+++ b/package/xmlstarlet/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_XMLSTARLET
 	help
 	  Command Line XML Toolkit
 
-	  http://xmlstar.sourceforge.net/
+	  https://xmlstarlet.github.io
diff --git a/package/xmlstarlet/xmlstarlet.hash b/package/xmlstarlet/xmlstarlet.hash
index 4b696bb2a4..f1191857ae 100644
--- a/package/xmlstarlet/xmlstarlet.hash
+++ b/package/xmlstarlet/xmlstarlet.hash
@@ -1,5 +1,4 @@
-# From https://sourceforge.net/projects/xmlstar/files/xmlstarlet/1.6.1/
-sha1  87bb104f546caca71b9540807c5b2738944cb219  xmlstarlet-1.6.1.tar.gz
-md5  f3c5dfa3b1a2ee06cd57c255cc8b70a0  xmlstarlet-1.6.1.tar.gz
+# From https://github.com/xmlstarlet/xmlstarlet/releases/download/1.7.0/xmlstarlet-1.7.0.tar.gz.sha256
+sha256  df4c93458fc6b2ad144d65dccf3ef251349871e0578c5bc59edbfeecf9bf3454  xmlstarlet-1.7.0.tar.gz
 # Locally computed
 sha256  6641cc5b00c1651fa22175f34efd01695e64a348b1ba07048538276f44866862  COPYING
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index b79c3f566d..2a38ae206d 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -4,31 +4,25 @@
 #
 ################################################################################
 
-XMLSTARLET_VERSION = 1.6.1
-XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
+XMLSTARLET_VERSION = 1.7.0
+XMLSTARLET_SITE = https://github.com/xmlstarlet/xmlstarlet/releases/download/$(XMLSTARLET_VERSION)
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING
 
-XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
+XMLSTARLET_DEPENDENCIES += host-pkgconf libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += \
+	--enable-static-libs \
 	--with-libxml-prefix=$(STAGING_DIR)/usr \
 	--with-libxslt-prefix=$(STAGING_DIR)/usr \
 	--with-libiconv-prefix=$(STAGING_DIR)/usr
-
-ifeq ($(BR2_STATIC_LIBS),y)
-XMLSTARLET_CONF_OPTS += --enable-static-libs
-XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0 libexslt`"
 else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
 
-HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
-
-HOST_XMLSTARLET_CONF_OPTS += \
-	--with-libxml-prefix=$(HOST_DIR) \
-	--with-libxslt-prefix=$(HOST_DIR)
+HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
