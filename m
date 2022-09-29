Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D0B81A8E;
	Thu, 29 Sep 2022 13:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D0B81A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBVXUEl0-rsm; Thu, 29 Sep 2022 13:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95DB8183D;
	Thu, 29 Sep 2022 13:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95DB8183D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 439BD1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B2E9408AC
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B2E9408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWG7luoI5ISm for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:53:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A4B40275
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A4B40275
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E304E864D1; Thu, 29 Sep 2022 13:53:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 15:51:52 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: c8040bd03a414207fcd419203b75e4f64349bca5
X-Git-Newrev: 173cc40c5ea29cbd4450f57a358d0e84f44b14d7
X-Patchwork-Hint: ignore
Message-Id: <20220929135355.E304E864D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/expat: fix
 CVE-2022-40674
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=173cc40c5ea29cbd4450f57a358d0e84f44b14d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libexpat before 2.4.9 (which is still not released) has a use-after-free
in the doContent function in xmlparse.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d8c044f58438ba49e95dae8734d3ace6683c976a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...mes-are-safe-exiting-internalEntityParser.patch | 53 ++++++++++++++++++++++
 package/expat/expat.mk                             |  3 ++
 2 files changed, 56 insertions(+)

diff --git a/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch b/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
new file mode 100644
index 0000000000..ca86e85115
--- /dev/null
+++ b/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
@@ -0,0 +1,53 @@
+From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
+From: Rhodri James <rhodri@wildebeest.org.uk>
+Date: Wed, 17 Aug 2022 18:26:18 +0100
+Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
+
+It is possible to concoct a situation in which parsing is
+suspended while substituting in an internal entity, so that
+XML_ResumeParser directly uses internalEntityProcessor as
+its processor.  If the subsequent parse includes some unclosed
+tags, this will return without calling storeRawNames to ensure
+that the raw versions of the tag names are stored in memory other
+than the parse buffer itself.  If the parse buffer is then changed
+or reallocated (for example if processing a file line by line),
+badness will ensue.
+
+This patch ensures storeRawNames is always called when needed
+after calling doContent.  The earlier call do doContent does
+not need the same protection; it only deals with entity
+substitution, which cannot leave unbalanced tags, and in any
+case the raw names will be pointing into the stored entity
+value not the parse buffer.
+
+[Retrieved from:
+https://github.com/libexpat/libexpat/commit/4a32da87e931ba54393d465bb77c40b5c33d343b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ expat/lib/xmlparse.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 7bcabf7f4..d73f419cf 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+   {
+     parser->m_processor = contentProcessor;
+     /* see externalEntityContentProcessor vs contentProcessor */
+-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_encoding,
+-                     s, end, nextPtr,
+-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
+-                     XML_ACCOUNT_DIRECT);
++    result = doContent(parser, parser->m_parentParser ? 1 : 0,
++                       parser->m_encoding, s, end, nextPtr,
++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
++                       XML_ACCOUNT_DIRECT);
++    if (result == XML_ERROR_NONE) {
++      if (! storeRawNames(parser))
++        return XML_ERROR_NO_MEMORY;
++    }
++    return result;
+   }
+ }
+ 
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index e89de81da7..61735a5fdb 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -13,6 +13,9 @@ EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
+# 0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
+EXPAT_IGNORE_CVES += CVE-2022-40674
+
 EXPAT_CONF_OPTS = \
 	--without-docbook --without-examples --without-tests --without-xmlwf
 HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
