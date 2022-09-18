Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B58C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8B641734;
	Sun, 18 Sep 2022 10:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D8B641734
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZEwkBvxouFj; Sun, 18 Sep 2022 10:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032FF4167C;
	Sun, 18 Sep 2022 10:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032FF4167C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDC21BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 794F04167C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794F04167C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G90X07_doXkQ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:23:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FE8341619
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FE8341619
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:23:27 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so2437522wmr.1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 03:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/rKqXhRl4BVOF+ePcJF6TPTTUlA2RBrnVCyi2ylMS7Q=;
 b=TF099U2vXdSodKCUED4NF2nOeMDW/fO5bmI7rfD7t3YYTRiFCjLZLgc4OrJp2pbAg6
 yOBbyWwAxp+5Zmq5HJGMMD5fk5unYgI8d39+IaInA0uaOutkWZ9g3+d/Z/ZqL68b8GcK
 92p5SJUd9+eh0xl/F7HUkwgUygY8tv0rvCjFIgNVaJJaXzhH1EtWE/TTfbGn99jRiu2A
 Mt7mcJLQAt+6PriaJSpM9T/1wFJxSPRWsgCgZt/fGgVZ3IXKKyiSNZ5TJInHmtygwgUq
 mIlXirCWPs6CiRP6meMbBDl42jwstp003G16OFucFtr8SE9yxa/EYWh+ClODv2CMu/gO
 S1Gw==
X-Gm-Message-State: ACrzQf0Eq5ZoxaTU7MzFk1yLptKetOoUa6D6MZ7Uibc3vbPSntR3z2Tn
 +MnGNxJsKaxp+VRY1QNAntG4wUOAJXo=
X-Google-Smtp-Source: AMsMyM7IqN0lemjIbvVQXKUYcM3x7kURCfm1jwbh40KMKdWO63M5D4l5/X14h5BsPDlKHUbXt8/VBQ==
X-Received: by 2002:a1c:4c18:0:b0:3b4:9b1d:5501 with SMTP id
 z24-20020a1c4c18000000b003b49b1d5501mr8788679wmf.13.1663496605171; 
 Sun, 18 Sep 2022 03:23:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay17-20020a5d6f11000000b0022865038308sm2121046wrb.93.2022.09.18.03.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 03:23:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 12:23:14 +0200
Message-Id: <20220918102314.177485-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/rKqXhRl4BVOF+ePcJF6TPTTUlA2RBrnVCyi2ylMS7Q=;
 b=T5CZgro6BMPaGz29XFIqd4lBWwHjNn/0OxurHWHaDJ+hoShO9X2LU+qhp845RMsx5l
 5Rp1bvsuAI7iNwbjiDYUanR/xtP82qcuC1dNuitYwFCX77O1OryOZG0z6oVZMpI0mp+q
 kacVt94QMo7EzMXgbORAJM3240Ro9rRPFqp5y05Jl06GHglofDD+xmAivI0bfeZY8MwT
 JZRaspryaESQfFp+M1cKNXqZNYntTiL5qw3j6L2PijtU9Q3CZw5TXiuvS37RUZxQ1dYb
 B2DruPBE6KC+waOpEhzj3TQTblmnJsBaSg2DCyANd4kmssXdAjEp0/tol5pGaz/3SArD
 UeOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T5CZgro6
Subject: [Buildroot] [PATCH v2,1/1] package/expat: fix CVE-2022-40674
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
Changes v1 -> v2:
 - Fix path in patch

 ...re-safe-exiting-internalEntityParser.patch | 53 +++++++++++++++++++
 package/expat/expat.mk                        |  3 ++
 2 files changed, 56 insertions(+)
 create mode 100644 package/expat/0001-Ensure-raw-tagnames-are-safe-exiting-internalEntityParser.patch

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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
