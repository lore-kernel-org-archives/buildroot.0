Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D20C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 09:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF08140498;
	Wed, 27 Jul 2022 09:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF08140498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ul5kleHRhHQ1; Wed, 27 Jul 2022 09:30:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F24E1404A8;
	Wed, 27 Jul 2022 09:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F24E1404A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3191BF57F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA3DE60B17
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3DE60B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1AVWQTwwAkR for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 09:30:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD5F8607F4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD5F8607F4
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:30:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v17so4417975wrr.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 02:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Q97/qXDW3LnTf1TD45bUSbHVgY6pStm3LpS3K4/ZfY=;
 b=RU8ycliWBBXyUjGw2efY+gBD3QNQWNi2EJAAe4VgHZhuL12TdUEvFVH9Cy+FGTIAJu
 cJte46JnCecGtTB5RZG+qyZvQMobYxqv0cKmbhHF2XWyQJ1gg8NmUGxwVR/s+jbOeGOh
 QcjaGnQHY+O7HLFZ54Q9GvHQ4pBP0FgiLApgBr10/pjlO3XUhfr7IEYOi0boopDwPCW1
 1Ol4zTKklGRlhtrISjkOWXQ0X12iLmWrIgies4bCVO5G84bzbC9jXvLn+QKFfTel2ICY
 qpL/xKP3yuI12WDZT/h4ufTa4FNTwySOYKEKsloj8jUJNXUuchZC08rpSuUH0tXoT/xF
 +g5g==
X-Gm-Message-State: AJIora/KXl8Sij8Br1sVWizKJn2bAHGZVlOXKG3IHjnI/ydpPfvEyqoZ
 80Oi5PP1IQ/SUgtobXVJVL1HCbE8mno=
X-Google-Smtp-Source: AGRyM1sUVhnhJXf8WsJvni0WroacOr/eUM2BB0S2E80CeAb9iKccdU+JtMed2AYy+GUgWaQCdrwATA==
X-Received: by 2002:adf:dc01:0:b0:21e:28ea:5d41 with SMTP id
 t1-20020adfdc01000000b0021e28ea5d41mr13339219wri.440.1658914219398; 
 Wed, 27 Jul 2022 02:30:19 -0700 (PDT)
Received: from kali.home (2a01cb0680494f3e376d079efd3cafb3.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8049:4f3e:376d:79e:fd3c:afb3])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1c2501000000b0039c454067ddsm1750640wml.15.2022.07.27.02.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 02:30:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:29:46 +0200
Message-Id: <20220727092946.987973-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Q97/qXDW3LnTf1TD45bUSbHVgY6pStm3LpS3K4/ZfY=;
 b=jWX/Gi7M0pOJmHTz8Fb98Cuwr7VV3FN75OAKVggDGRDm5N7fthDLuf5xhboqOlAMDg
 ZfOqgxgwnns02A/TzLf+XucNfTVJexJ27gefsvCALY8fhXpyjENDJsXPtTmpQbGdU4rh
 qa/FkQtgCbkkUjkonINGrwpE84qNJ1WH6jCAaZrY+M7nYsm/IeK1saq990shq/1mwdg8
 syUFUpsd2JosAS2SUSMTlshU6mNwovdqy8B3t1RQYyxVReQTT/GIzYjS6eOq0Kh2uhwD
 bgIBccRuXa2+gl4jBAcQjnlI32IbNaR019GV9u7RJ4yzBFkH3IoF+KcMgXT/H4OyEtp6
 4akw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jWX/Gi7M
Subject: [Buildroot] [PATCH 1/1] package/jszip: security bump to version
 3.10.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Santize filenames when files are loaded with loadAsync, to avoid "zip
  slip" attacks. The original filename is available on each zip entry as
  unsafeOriginalName. See the documentation.
- Drop patch (already in version)
- Update hash of license file (dual licensing clarification with
  https://github.com/Stuk/jszip/commit/f81c2d700d8e5fec4ed89fb565e4a266bb4dd26e)
- Update indentation in hash file (two spaces)

https://github.com/Stuk/jszip/blob/v3.10.0/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...null-prototype-object-for-this-files.patch | 56 -------------------
 package/jszip/jszip.hash                      |  4 +-
 package/jszip/jszip.mk                        |  5 +-
 3 files changed, 3 insertions(+), 62 deletions(-)
 delete mode 100644 package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch

diff --git a/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch b/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch
deleted file mode 100644
index 969db5b403..0000000000
--- a/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 22357494f424178cb416cdb7d93b26dd4f824b36 Mon Sep 17 00:00:00 2001
-From: Michael Aquilina <michaelaquilina@gmail.com>
-Date: Mon, 14 Jun 2021 12:28:46 +0100
-Subject: [PATCH] fix: Use a null prototype object for this.files
-
-This approach is taken to prevent overriding object methods that would
-exist on a normal object Object.create({})
-
-[Retrieved from:
-https://github.com/Stuk/jszip/commit/22357494f424178cb416cdb7d93b26dd4f824b36]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/index.js  | 5 ++++-
- lib/object.js | 6 +++---
- 2 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/lib/index.js b/lib/index.js
-index b449877..b4c95ba 100644
---- a/lib/index.js
-+++ b/lib/index.js
-@@ -19,7 +19,10 @@ function JSZip() {
-     //   "folder/" : {...},
-     //   "folder/data.txt" : {...}
-     // }
--    this.files = {};
-+    // NOTE: we use a null prototype because we do not
-+    // want filenames like "toString" coming from a zip file
-+    // to overwrite methods and attributes in a normal Object.
-+    this.files = Object.create(null);
- 
-     this.comment = null;
- 
-diff --git a/lib/object.js b/lib/object.js
-index 1c9d8e8..aec3db7 100644
---- a/lib/object.js
-+++ b/lib/object.js
-@@ -179,16 +179,16 @@ var out = {
-      */
-     forEach: function(cb) {
-         var filename, relativePath, file;
-+        /* jshint ignore:start */
-+        // ignore warning about unwanted properties because this.files is a null prototype object
-         for (filename in this.files) {
--            if (!this.files.hasOwnProperty(filename)) {
--                continue;
--            }
-             file = this.files[filename];
-             relativePath = filename.slice(this.root.length, filename.length);
-             if (relativePath && filename.slice(0, this.root.length) === this.root) { // the file is in the current root
-                 cb(relativePath, file); // TODO reverse the parameters ? need to be clean AND consistent with the filter search fn...
-             }
-         }
-+        /* jshint ignore:end */
-     },
- 
-     /**
diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
index 13a2076ade..d0c56a44ab 100644
--- a/package/jszip/jszip.hash
+++ b/package/jszip/jszip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	e5343decfb781b15c54c0df9ddedd6c8518c800a4667a0a95741c694a4f38d34  jszip-3.2.2.tar.gz
-sha256	14450c78405ad2a2173e25740b56406556779149df9c4c83523a8c63d0686210  LICENSE.markdown
+sha256  aa3033c6bb5357a0b0965c92fbdb6d6abe64676e70ffa7933b63c573ab79ee45  jszip-3.10.0.tar.gz
+sha256  566c953c6090b1218ca6217dd7359d45dde46581968586dc607d59a78af6a9c4  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index a93766be11..3504368675 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-JSZIP_VERSION = 3.2.2
+JSZIP_VERSION = 3.10.0
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
 JSZIP_CPE_ID_VENDOR = jszip_project
 
-# 0001-fix-Use-a-null-prototype-object-for-this-files.patch
-JSZIP_IGNORE_CVES += CVE-2021-23413
-
 define JSZIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
 		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
