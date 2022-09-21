Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896CDECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF266108B;
	Wed, 21 Sep 2022 21:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DF266108B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8B8nrahO7KDM; Wed, 21 Sep 2022 21:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D6F861087;
	Wed, 21 Sep 2022 21:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D6F861087
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD7A1BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43C8141825
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43C8141825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RZDhaOk1I7m for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F1C417D7
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9F1C417D7
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:07:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bq9so12197712wrb.4
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 14:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rJ6o/Cq7obsIxn508JJr13/0x7PmLhMYnmfYMSU4NQU=;
 b=PqbMZqVnPsoi7sd8lUTCd3hFwM4AGTPSQkwxmoQMH0Pd+/rRomJqXU5EKyBGaVZz+I
 n8rYAJ3I+ZO+mULOfu6uAzeXZ0B9srZqHrX70ei6AXWwD7U/jeUZUzQf1LY99SJznnrG
 V6E9rwssjM9WWKEWX7hmByaoAYCSWsb5RQxVx6vOgc6G5byD2Fvie16ttSBV61y/LBmr
 DwkM9DWNpeaElDkLaieBJt1J0nirG+ZTiSgp5F45QHc97z3rFDXrLh1tr9BEfUsPwubJ
 4x+RNEvt8M1s4dhpGByqxHztZ7H+DsyKHl78mVmieKA88Dj3o0ORji9/+tJBx9Me9nQX
 Z90g==
X-Gm-Message-State: ACrzQf00Yy+qmv9q18RNxa1DlW17rzqW/UBpzUkWDujdB+iDtILeMMy1
 eue820H/k4isi3JHErc5PDxgAPpkC1A=
X-Google-Smtp-Source: AMsMyM7Zp+EdG89YEqFDM4fR0Zr/z37sBcisAY9M+jBBsW6yP5Q4Y7x/NpB4sZRFArFy8CFkCpoSyQ==
X-Received: by 2002:a05:6000:1a8d:b0:228:acb0:e7be with SMTP id
 f13-20020a0560001a8d00b00228acb0e7bemr44468wry.680.1663794457478; 
 Wed, 21 Sep 2022 14:07:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c4a0900b003b33de17577sm3558754wmp.13.2022.09.21.14.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 14:07:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 23:07:33 +0200
Message-Id: <20220921210733.21853-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=rJ6o/Cq7obsIxn508JJr13/0x7PmLhMYnmfYMSU4NQU=;
 b=bJ7wphdltpctQSUTwk4oS56VM+1HtLWpU+tBxJP1/a/A4g5UtH9POqtZpXfv+lyeii
 fIl4tohI3Ig8lcTuea+Yc5IhpfxhYFCIqNRXElTZyursGV8Je9rYNWoHaGjXrjAptHkW
 QGdxcSFJT3yYh9uWYvmcHVzrm5zGGTftRxatBlaYvqogx1ruHQONl6/NEA0l1+xyjtpQ
 PMur1rpIzvaX/7G3BKaazk5NlTgy86Oi1d+VAkneCSHEhxxAmoOd8yv8kPxBjyt/gwqK
 l7eid6MvrLdyXOWDcblLWUaEcdIC6E7qaOjIy2zZjQUOGrJEYy/tM5RYd7eyMYBMwKZ2
 dRgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bJ7wphdl
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.4.9
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

- Drop patch (akready in version)
- Update hash of COPYING (year updated with
  https://github.com/libexpat/libexpat/commit/39b2e99355039626438d48a4eca6aacba2b44d5e)

https://blog.hartwork.org/posts/expat-2-4-9-released
https://github.com/libexpat/libexpat/blob/R_2_4_9/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re-safe-exiting-internalEntityParser.patch | 53 -------------------
 package/expat/expat.hash                      | 10 ++--
 package/expat/expat.mk                        |  5 +-
 3 files changed, 6 insertions(+), 62 deletions(-)
 delete mode 100644 package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch

diff --git a/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch b/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
deleted file mode 100644
index ca86e85115..0000000000
--- a/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
-From: Rhodri James <rhodri@wildebeest.org.uk>
-Date: Wed, 17 Aug 2022 18:26:18 +0100
-Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
-
-It is possible to concoct a situation in which parsing is
-suspended while substituting in an internal entity, so that
-XML_ResumeParser directly uses internalEntityProcessor as
-its processor.  If the subsequent parse includes some unclosed
-tags, this will return without calling storeRawNames to ensure
-that the raw versions of the tag names are stored in memory other
-than the parse buffer itself.  If the parse buffer is then changed
-or reallocated (for example if processing a file line by line),
-badness will ensue.
-
-This patch ensures storeRawNames is always called when needed
-after calling doContent.  The earlier call do doContent does
-not need the same protection; it only deals with entity
-substitution, which cannot leave unbalanced tags, and in any
-case the raw names will be pointing into the stored entity
-value not the parse buffer.
-
-[Retrieved from:
-https://github.com/libexpat/libexpat/commit/4a32da87e931ba54393d465bb77c40b5c33d343b]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- expat/lib/xmlparse.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/lib/xmlparse.c b/lib/xmlparse.c
-index 7bcabf7f4..d73f419cf 100644
---- a/lib/xmlparse.c
-+++ b/lib/xmlparse.c
-@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
-   {
-     parser->m_processor = contentProcessor;
-     /* see externalEntityContentProcessor vs contentProcessor */
--    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_encoding,
--                     s, end, nextPtr,
--                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
--                     XML_ACCOUNT_DIRECT);
-+    result = doContent(parser, parser->m_parentParser ? 1 : 0,
-+                       parser->m_encoding, s, end, nextPtr,
-+                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
-+                       XML_ACCOUNT_DIRECT);
-+    if (result == XML_ERROR_NONE) {
-+      if (! storeRawNames(parser))
-+        return XML_ERROR_NO_MEMORY;
-+    }
-+    return result;
-   }
- }
- 
diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index b8e7aa27f1..15e64a4dc8 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.8/
-md5  0584a7318a4c007f7ec94778799d72fe  expat-2.4.8.tar.xz
-sha1  e30345a20d0cc29a0c307eb3703e7a9bb62afa90  expat-2.4.8.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.9/
+md5  8d7fcf7d02d08bf79d9ae5c21cc72c03  expat-2.4.9.tar.xz
+sha1  be91118bc495ce49b04a3fd0f27df2fb5a843e9b  expat-2.4.9.tar.xz
 
 # Locally calculated
-sha256  f79b8f904b749e3e0d20afeadecf8249c55b2e32d4ebb089ae378df479dcaf25  expat-2.4.8.tar.xz
-sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
+sha256  6e8c0728fe5c7cd3f93a6acce43046c5e4736c7b4b68e032e9350daa0efc0354  expat-2.4.9.tar.xz
+sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 61735a5fdb..59854d0ee8 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.8
+EXPAT_VERSION = 2.4.9
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
@@ -13,9 +13,6 @@ EXPAT_LICENSE_FILES = COPYING
 EXPAT_CPE_ID_VENDOR = libexpat_project
 EXPAT_CPE_ID_PRODUCT = libexpat
 
-# 0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
-EXPAT_IGNORE_CVES += CVE-2022-40674
-
 EXPAT_CONF_OPTS = \
 	--without-docbook --without-examples --without-tests --without-xmlwf
 HOST_EXPAT_CONF_OPTS = --without-docbook --without-examples --without-tests
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
