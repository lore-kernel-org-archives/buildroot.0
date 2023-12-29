Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4308DC46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA244419DC;
	Fri, 29 Dec 2023 22:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA244419DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFs3AECCnaoE; Fri, 29 Dec 2023 22:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C683841740;
	Fri, 29 Dec 2023 22:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C683841740
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE291BF317
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 22:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 262D640310
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 22:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262D640310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7plr48Oa4vT for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 22:04:40 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1726640293
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 22:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1726640293
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5a9cb423so39157505e9.2
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 14:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703887477; x=1704492277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ny1FJPQQRovqkxxwxSzb8zg4vhN3GYcYVbv75ktmYEQ=;
 b=FQ0ubkeK61QV87roj21ZUB9I3BD+gTv4oRPMl23aHVbVWPZpHdj+7f9h4GgxPdl9w6
 gzEbUydXEPLcPiDrtwp9BW9+VyClt14czbGUlXlOEbbOp2ZxH/FsrrxTk1ubzqxLNMkC
 +/OuTVhbJJCgJ8MPuSVPoqHWvG9jjEsoiGqZgChjjSdgCs+FMLiYqWJz+/I6zmrCoEmO
 cuWSGq6Jt+jjTI8m+TMyQD+RPm073ip71cgFFeZsnRb+tUVJr3oqJ1xuHj7dHUIsMOdA
 UZ51Avf7j2CW91c0SQ2H4cfkDCBC7JtF9ROsSOf4RGNVNIYPmWDPcpgvVAl9y9YiYjQn
 osOA==
X-Gm-Message-State: AOJu0YzO+zpX7c8B0xV6ZOGV9/qeZ+n5uepvZU+LDb3SNug850dOHijs
 bt21rr+LaXtQobI0VLxtZy4QT3qgkPw=
X-Google-Smtp-Source: AGHT+IFGKkxEPFcXjVHkSm1MV2Ps3VT4g9W/MHpCgPNgl3IeZRDbe8Q+Q7rjDV/Uhpn7vxM+CSNh5g==
X-Received: by 2002:a05:600c:5490:b0:40d:5eb0:ddaa with SMTP id
 iv16-20020a05600c549000b0040d5eb0ddaamr2391526wmb.61.1703887477134; 
 Fri, 29 Dec 2023 14:04:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b2-20020a5d4b82000000b003367ff4aadasm19955740wrt.31.2023.12.29.14.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:04:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 23:04:27 +0100
Message-ID: <20231229220427.47110-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703887477; x=1704492277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ny1FJPQQRovqkxxwxSzb8zg4vhN3GYcYVbv75ktmYEQ=;
 b=JyievSUl3ror3CdymehKUBQFDRD2KTTCOxGgN29+/sc1u7dX7MR9AWq05PrCeQb6FU
 x/QBd4wrqStdrsfbCelvBs3xluoC+DYprf/QBXNsnCHwv1pX02bfcjIg9GyGYR3uTqyO
 OeQzxfpVXUlAt5YKAu7LX9WdlPid+vowe8eby1PgPIk5PVbPaTQakzsmgbP4oSM1VGmx
 b7HBpK/Lvayo8JdmLzGS5PvwCqOUOa6u059P+OU+MlXlpKyEX/5PKncbeRJKmezTr1LP
 z50H+XHehA2/rZHb/GuqmivkiCzmVhZXro3Cq2DVN3qLvS6ez/FWhKt3vytANkiQtBiK
 aP0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JyievSUl
Subject: [Buildroot] [PATCH 1/1] package/libiio: fix build with libxml2 >=
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...l-Fix-compatibility-with-libxml-2-12.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libiio/0001-xml-Fix-compatibility-with-libxml-2-12.patch

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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
