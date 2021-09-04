Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBBDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:46:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E62CF60EFD
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E62CF60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9441240468;
	Sat,  4 Sep 2021 20:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxAPO3x__m7o; Sat,  4 Sep 2021 20:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D0A40460;
	Sat,  4 Sep 2021 20:46:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD0BA1BF95A
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCB3860772
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UO_SPBIk1g7A for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11AAE605D9
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:46:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9314188487; Sat,  4 Sep 2021 20:44:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:25:56 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 58c73ff9e2aac31cddb2558339af046bfbed6bf2
X-Git-Newrev: eddbbbabc7f41a3e3ff6dd71ccb86a517079a558
X-Patchwork-Hint: ignore
Message-Id: <20210904204445.9314188487@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/jszip: fix
 CVE-2021-23413
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eddbbbabc7f41a3e3ff6dd71ccb86a517079a558
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This affects the package jszip before 3.7.0. Crafting a new zip file
with filenames set to Object prototype values (e.g __proto__, toString,
etc) results in a returned object with a modified prototype instance.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 921830e92d8bc79c444b9c03d9af4242226434e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
