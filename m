Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26148C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC9F1408E1;
	Sun, 18 Sep 2022 10:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC9F1408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSW0lTigbMfV; Sun, 18 Sep 2022 10:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3BB6405A9;
	Sun, 18 Sep 2022 10:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3BB6405A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9331BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1764360E25
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1764360E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UChKs_D3q-qo for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:16:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D716160D71
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D716160D71
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:16:48 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso2470896wmr.3
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=u3gDdXeHaZ73dt3YgwIfXoaLOQ3XtnMav2mio/j3yqw=;
 b=IrMbSVXHauQb1kcblOm3idtitJqMhPkF8jxBTrLX2kQUh+E6tFlQKi1L06D+KCwJk+
 EH/+YU3oOLYUmCCMtyw6YoT3s+4TABX7zrnTRAEF4TIbPQD1iDXwKhSukqiwtK3Y+dZf
 Arhj1DMqPTJlEqwUkJeJEQjZ9axZxb2qxMSQOgfxdnmH42CmAe1DNIYZcyGTDOia2OOX
 QkTSvuIwKbPh6VXtv/MUtwZr0hTzYbI4gHUu8hXNWkTjq6lzTBaFEd4t8fjJI17CgKqa
 Wk7vkCAtJZui4kUulFfe8ODQjnJcS+VkIhB2Dlhm8CQNEeiZdInjP3Qy/UzQ3B8eS5+3
 P2Aw==
X-Gm-Message-State: ACrzQf3gLRjxWoistjcO68fNJxDxsBpWaApWRBghiFEe/a1Jr4nqhAip
 28duhbXex7qMqHq9pYHct6m0hkmKtKA=
X-Google-Smtp-Source: AMsMyM7gQc96MO2I64YWi59WN3QqE7Hv+/T+SbWd0zsK0PPH3P2A3hodTOCSNIAnPJQTvrhf9S/7Tg==
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id
 f9-20020a05600c154900b003b48fd70af4mr8699825wmg.100.1663496206475; 
 Sun, 18 Sep 2022 03:16:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 g15-20020a5d488f000000b002205a5de337sm9979799wrq.102.2022.09.18.03.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 03:16:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:16:39 +0200
Message-Id: <20220918101639.174430-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=u3gDdXeHaZ73dt3YgwIfXoaLOQ3XtnMav2mio/j3yqw=;
 b=ULHadbFrk8cY7xke+PvxBG7w94JwDIUMP7VsdDBLa1QstwNlziFThn4mXvSbPLviHM
 paY3jKzc0pBbiP08+lwv/4UQjUXiXhyKsITYqEqzuv809Hm2akFVoLGSaLAZA+xLDI8q
 4fJG6bzzOitVGe27veW4bfEfakVRDkeQOjSY6s4Csbg+7zR6g615mO12T6bbaGokYKKK
 AqoQCmDP7AkclTpnRSL+ezRnyzaAkhV3G8gput94ym/YusSRck3t5bp2MxFhNJftSQWP
 2fk5e+ve1NkuvY63W/iZSk7xo2BXPjyQY6+9z9J0NqzjZDteawfdd3Wf9DqirxqAIJgt
 gA8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ULHadbFr
Subject: [Buildroot] [PATCH 1/1] package/expat: fix CVE-2022-40674
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

libexpat before 2.4.9 has a use-after-free in the doContent function in
xmlparse.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...re-safe-exiting-internalEntityParser.patch | 53 +++++++++++++++++++
 package/expat/expat.mk                        |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch

diff --git a/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch b/package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch
new file mode 100644
index 0000000000..6d2ea516f5
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
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 7bcabf7f4..d73f419cf 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
