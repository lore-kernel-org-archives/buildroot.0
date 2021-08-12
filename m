Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E05AC4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A8D61077
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4A8D61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A096880A9D;
	Thu, 12 Aug 2021 21:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIYEQixWcRmO; Thu, 12 Aug 2021 21:55:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F1F80C52;
	Thu, 12 Aug 2021 21:55:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCEFA1BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD0016140A
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddMgC_7aYym2 for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:54:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F13B60586
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:54:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 44DAF8D493; Thu, 12 Aug 2021 21:54:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:54:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca2e12b4fc5215c8e4f261ef9b0b2d5761f9472c
X-Git-Newrev: 921830e92d8bc79c444b9c03d9af4242226434e6
X-Patchwork-Hint: ignore
Message-Id: <20210812215426.44DAF8D493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jszip: fix CVE-2021-23413
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=921830e92d8bc79c444b9c03d9af4242226434e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This affects the package jszip before 3.7.0. Crafting a new zip file
with filenames set to Object prototype values (e.g __proto__, toString,
etc) results in a returned object with a modified prototype instance.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...se-a-null-prototype-object-for-this-files.patch | 56 ++++++++++++++++++++++
 package/jszip/jszip.mk                             |  3 ++
 2 files changed, 59 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
