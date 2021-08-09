Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C20C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 10:00:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D0F61004
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 10:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1D0F61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8531B827DE;
	Mon,  9 Aug 2021 10:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qKkmlyLV2ZNw; Mon,  9 Aug 2021 10:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD61A8277E;
	Mon,  9 Aug 2021 10:00:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 371761BF36F
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 10:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24DD8401E7
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 10:00:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYfxLx1E_RVF for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 10:00:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3F1C4014B
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 10:00:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso2280879wmj.0
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iUyGUBVt+kbQQtDlupuYRDVGffM3CF+gZhQ04M2pk4=;
 b=ZBHxGF26ss0MB3lcImWdiQFh7wvc0czD2SRP9Idlugs+ixWdO7TYKChXOKyxNsBx7E
 55HimVYP4oFlmj2KbwmQJ+8/+tZRPmHCAZ8vCGVDwot4LAyHpd4FveDvmcQ3kQSFxb8M
 j5ha6IJamk2YKBHu306ksWN14Fm0BKLTv4CP++pJyfktRF+BiZ9ni3VnSaLGkCwQQCBq
 XiBmk13tNY6UrlRzq+/dYDVHFgQut8CLm4dyaQpKDvhYZDsUmIOkVrJ1OPahEYpv2QMF
 D9f/QaZSLiZBXlVx9iA2Bnkp4GQTh+l0+NYzSuUApSdhrKjiF40aFVN5+TYiiW9zdaH3
 A/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0iUyGUBVt+kbQQtDlupuYRDVGffM3CF+gZhQ04M2pk4=;
 b=LVhUllDl54JwyWAxMes3hwFY/CKzrQLbsicL/ttT0L5vJVS84v0hzctlOjJB5Oz40q
 XQDK1bpAVaHLWpjyP+1NRfembDIhRAoM/XrDnMM48RvvZHPGkRrbmSOJtwKt6Zti/LtW
 D/87GDPs+SA0tZv1jJ6GOfmOoOnsd3nmAdHxZBY6mvzwM8aiIOjha+SQCO9x8vlrP74j
 vEoMcvzbjVBGNcBhb8LI8YcLXuGT7BttCM32TVUmto1zoEGdRi42jeiMACpL38NJActj
 /TVbQV4reWiXgbP9Ass1493hld6PhSGnrxpxP2Ztm6hrB3+xlDxS15MMnJxfDEVOl7Jk
 zbRw==
X-Gm-Message-State: AOAM531rVQwXXoKvJH+bn+1y2KO+xJWPNKpa6HTDZqKlH8OOv5/vAwVw
 voEqafaBSyTj0pLj1T08erdmDf1XPzL25g==
X-Google-Smtp-Source: ABdhPJznwFkQLRd6uCjhG50u7X5+31Yk+k1CKI8vrKRXCpfL/JUSygpEujO3uzAXGJOflqRAbNlIWw==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr2193780wmc.45.1628503249775;
 Mon, 09 Aug 2021 03:00:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id w18sm20400609wrg.68.2021.08.09.03.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 03:00:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 12:00:37 +0200
Message-Id: <20210809100037.1102402-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jszip: fix CVE-2021-23413
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This affects the package jszip before 3.7.0. Crafting a new zip file
with filenames set to Object prototype values (e.g __proto__, toString,
etc) results in a returned object with a modified prototype instance.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...null-prototype-object-for-this-files.patch | 56 +++++++++++++++++++
 package/jszip/jszip.mk                        |  3 +
 2 files changed, 59 insertions(+)
 create mode 100644 package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch

diff --git a/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch b/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch
new file mode 100644
index 0000000000..969db5b403
--- /dev/null
+++ b/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch
@@ -0,0 +1,56 @@
+From 22357494f424178cb416cdb7d93b26dd4f824b36 Mon Sep 17 00:00:00 2001
+From: Michael Aquilina <michaelaquilina@gmail.com>
+Date: Mon, 14 Jun 2021 12:28:46 +0100
+Subject: [PATCH] fix: Use a null prototype object for this.files
+
+This approach is taken to prevent overriding object methods that would
+exist on a normal object Object.create({})
+
+[Retrieved from:
+https://github.com/Stuk/jszip/commit/22357494f424178cb416cdb7d93b26dd4f824b36]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/index.js  | 5 ++++-
+ lib/object.js | 6 +++---
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/index.js b/lib/index.js
+index b449877..b4c95ba 100644
+--- a/lib/index.js
++++ b/lib/index.js
+@@ -19,7 +19,10 @@ function JSZip() {
+     //   "folder/" : {...},
+     //   "folder/data.txt" : {...}
+     // }
+-    this.files = {};
++    // NOTE: we use a null prototype because we do not
++    // want filenames like "toString" coming from a zip file
++    // to overwrite methods and attributes in a normal Object.
++    this.files = Object.create(null);
+ 
+     this.comment = null;
+ 
+diff --git a/lib/object.js b/lib/object.js
+index 1c9d8e8..aec3db7 100644
+--- a/lib/object.js
++++ b/lib/object.js
+@@ -179,16 +179,16 @@ var out = {
+      */
+     forEach: function(cb) {
+         var filename, relativePath, file;
++        /* jshint ignore:start */
++        // ignore warning about unwanted properties because this.files is a null prototype object
+         for (filename in this.files) {
+-            if (!this.files.hasOwnProperty(filename)) {
+-                continue;
+-            }
+             file = this.files[filename];
+             relativePath = filename.slice(this.root.length, filename.length);
+             if (relativePath && filename.slice(0, this.root.length) === this.root) { // the file is in the current root
+                 cb(relativePath, file); // TODO reverse the parameters ? need to be clean AND consistent with the filter search fn...
+             }
+         }
++        /* jshint ignore:end */
+     },
+ 
+     /**
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index 04bd0a7b34..13ea377169 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -9,6 +9,9 @@ JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
 
+# 0001-fix-Use-a-null-prototype-object-for-this-files.patch
+JSZIP_IGNORE_CVES += CVE-2021-23413
+
 define JSZIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
 		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
