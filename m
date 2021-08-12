Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE6EC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1064F60FD8
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1064F60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB190426D1;
	Thu, 26 Aug 2021 22:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ny0Q9AJhgY24; Thu, 26 Aug 2021 22:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58876401E9;
	Thu, 26 Aug 2021 22:10:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 598801C1148
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7426426B1
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YYtt0ij-_vxD for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F355A426B2
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 532868DC50; Thu, 26 Aug 2021 22:01:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:54:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ca2e12b4fc5215c8e4f261ef9b0b2d5761f9472c
X-Git-Newrev: 921830e92d8bc79c444b9c03d9af4242226434e6
X-Patchwork-Hint: ignore
Message-Id: <20210826220129.532868DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jszip: fix
 CVE-2021-23413
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
