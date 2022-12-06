Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B961DC3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 22:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679D740904;
	Tue,  6 Dec 2022 22:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679D740904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQNhWR6frfOn; Tue,  6 Dec 2022 22:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93B9340A82;
	Tue,  6 Dec 2022 22:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B9340A82
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1C631BF39E
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA70460BF4
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 22:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA70460BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AInEOSoJZO0K for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 22:29:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC70960BEF
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC70960BEF
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 22:29:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w15so25572308wrl.9
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 14:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS7Kxe5rDzO773KO9Z4jXka445zGLeIOYe/yhpEf9BQ=;
 b=WdFUoygiW/Nojd8Ua0jCj208tcCHFTPPlhpLNl8xhKN3cKB3PlG7JIQoaAAnddJnZK
 p5s16G9wd3pgrOYOCMp273K0uXCBqSb/q+aY98q/mtRIr8lFoO4hnQ9rHRxwo3DKzv96
 bOVo+l3RJ9TkW61JmJO0XtaD7lK4h7xqT2hpSLKLkZW1eh5dDgeNHlrtiUMw+8LEDm5V
 417FzXCU9o6Yj8BDDbrQdPOFPM86f6dx+WM0nJa9y5fSRjPCYGr2mjbt6aSc2oOocBKr
 ia+YZ/vyOczoVsVtybnlcalSPngDPlWG2ZQCg+NHsFjpad5Dzj1Z0HoOVr4p1TZwh/Dr
 3vMA==
X-Gm-Message-State: ANoB5pmdOgB9r8mNPqyHDGZOT+qDV6SOUU9wpFfynI0IRvvEp+PO8Id2
 6miYHpUbeALpNF7WwbqYsnVUfi0wZW0=
X-Google-Smtp-Source: AA0mqf6e0pQKBPdT+QxzamqFtxE0elK0qvAItYCAJS/olIO8pO/+79TFOgK7cndhNu4YSmFaIH0KtA==
X-Received: by 2002:a05:6000:239:b0:242:423c:4ce9 with SMTP id
 l25-20020a056000023900b00242423c4ce9mr13161369wrz.399.1670365776322; 
 Tue, 06 Dec 2022 14:29:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 t16-20020a5d6910000000b0024217e7aaa7sm17485060wru.50.2022.12.06.14.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 14:29:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Dec 2022 23:29:16 +0100
Message-Id: <20221206222916.1375344-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AS7Kxe5rDzO773KO9Z4jXka445zGLeIOYe/yhpEf9BQ=;
 b=F3NmiDGbF0M1jgWKx6X4rtSHXKWZ2FJVaQALMu2CyqlEUrCSOroLuz+DENnESrgfKQ
 hOQCGcYjxYhgJrPMHgyFN48+krl+osoWi9tEtrcnPLC7yDATjpyMznifx/qv0fRY3ppJ
 2Z7zH0pr5Te86kSzDM8VvraaaVOgMX/lSH5r2h2p21GF+gzWA9ELuAh5Am0MQO86BHBQ
 s7X18feZjn3oycQDoj7BOFxWxDlHwV5v4IYs/RbgkH1phmXQJhxdna4w8B9StelnFfIw
 6Bhgs2qcVQxfOxG9FtukXgjSRnqVm34gLZGl+l6i5T+NdT2NHbr/kHccuzTU04zm5oC1
 JfRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F3NmiDGb
Subject: [Buildroot] [PATCH 1/1] package/proftpd: bump to version 1.3.8
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

http://proftpd.org/docs/NEWS-1.3.8
http://proftpd.org/docs/RELEASE_NOTES-1.3.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tab-fix-build-failure-against-gcc-10.patch | 56 -------------------
 package/proftpd/proftpd.hash                  |  2 +-
 package/proftpd/proftpd.mk                    |  4 +-
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch

diff --git a/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch b/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch
deleted file mode 100644
index 5f4eb66c71..0000000000
--- a/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 9c9623c8a47fb5580dfea1a59296c6d224479504 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Mon, 2 Mar 2020 23:45:22 +0000
-Subject: [PATCH] mod_quotatab: fix build failure against gcc-10
-
-On gcc-10 (and gcc-9 -fno-common) build fails as:
-
-```
-$ ./configure --with-modules=mod_quotatab && make
-...
-ld: modules/module_glue.o:(.data.rel+0x68):
-  undefined reference to `quotatab_file_module'
-collect2: error: ld returned 1 exit status
-make: *** [Makefile:56: proftpd] Error 1
-```
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-
-[Retrieved from:
-https://github.com/proftpd/proftpd/commit/9c9623c8a47fb5580dfea1a59296c6d224479504]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/mod_quotatab.c | 1 +
- contrib/mod_quotatab.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/contrib/mod_quotatab.c b/contrib/mod_quotatab.c
-index 4fa6c1f44..0ee480163 100644
---- a/contrib/mod_quotatab.c
-+++ b/contrib/mod_quotatab.c
-@@ -50,6 +50,7 @@ typedef struct regtab_obj {
- module quotatab_module;
- 
- /* Quota objects for the current session */
-+quota_deltas_t quotatab_deltas;
- static quota_table_t *limit_tab = NULL;
- static quota_limit_t sess_limit;
- 
-diff --git a/contrib/mod_quotatab.h b/contrib/mod_quotatab.h
-index ed30333f5..c818395a0 100644
---- a/contrib/mod_quotatab.h
-+++ b/contrib/mod_quotatab.h
-@@ -188,7 +188,7 @@ typedef struct table_obj {
- #define QUOTATAB_TALLY_SRC      0x0002
- 
- /* Quota objects for the current session. */
--quota_deltas_t quotatab_deltas;
-+extern quota_deltas_t quotatab_deltas;
- 
- /* Function prototypes necessary for quotatab sub-modules */
- int quotatab_log(const char *, ...)
diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 983500bb8e..f950f26b86 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2dbe684034ab592742ebdb778a8a234b70f959efeb30feedee3ea77f26f74fbb  proftpd-1.3.6e.tar.gz
+sha256  f7139e7377a2cb059b8b9b14d76a6df5f440e3181cb15ae890d43bbcae574748  proftpd-1.3.8.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 64c16a84eb..8e7d108c9e 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.6e
-PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
+PROFTPD_VERSION = 1.3.8
+PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
 PROFTPD_CPE_ID_VENDOR = proftpd
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
