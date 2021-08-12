Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978D6C4338F
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:51:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AEE96108C
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 21:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AEE96108C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0470661408;
	Thu, 12 Aug 2021 21:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gi_hjVJ8YAuJ; Thu, 12 Aug 2021 21:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680796140A;
	Thu, 12 Aug 2021 21:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 360E51BF354
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 331FB61408
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 21:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4NdjYtgqDNg for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 21:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85DD26140C
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 21:51:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9B6868D488; Thu, 12 Aug 2021 21:50:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 23:49:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 884a415ccb66c04767ad40d82b713f499a9bb8a7
X-Git-Newrev: 6b04d4f22cf5dbc75042b67859c8d2c8d8bbdc49
X-Patchwork-Hint: ignore
Message-Id: <20210812215058.9B6868D488@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tools: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b04d4f22cf5dbc75042b67859c8d2c8d8bbdc49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since bump to
version 4.3.2 in commit	91aa6efa8588bf7617cc4a640eb55052b524ceb7:

lib/tpm2_eventlog_yaml.c: In function 'yaml_uefi_var_unicodename':
lib/tpm2_eventlog_yaml.c:130:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for(size_t i = 0; i < data->UnicodeNameLength; ++i, tmp += ret) {
     ^
lib/tpm2_eventlog_yaml.c:130:5: note: use option -std=c99 or -std=gnu99 to compile your code
lib/tpm2_eventlog_yaml.c: In function 'yaml_specid_algs':
lib/tpm2_eventlog_yaml.c:335:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (size_t i = 0; i < count; ++i, ++alg) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/018c75cfbb34006c0bca52dcc255ad6f9cc43b77

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-make-build-gnu99.patch          | 30 ++++++++++++++++++++++
 package/tpm2-tools/tpm2-tools.mk                   |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/package/tpm2-tools/0001-configure-make-build-gnu99.patch b/package/tpm2-tools/0001-configure-make-build-gnu99.patch
new file mode 100644
index 0000000000..37ca6c5873
--- /dev/null
+++ b/package/tpm2-tools/0001-configure-make-build-gnu99.patch
@@ -0,0 +1,30 @@
+From 521c3cc506b18c5c84d86e1e90d1daee39849b0c Mon Sep 17 00:00:00 2001
+From: William Roberts <william.c.roberts@intel.com>
+Date: Mon, 8 Feb 2021 11:57:28 -0600
+Subject: [PATCH] configure: make build gnu99
+
+Signed-off-by: William Roberts <william.c.roberts@intel.com>
+
+[Retrieved from:
+https://github.com/tpm2-software/tpm2-tools/commit/521c3cc506b18c5c84d86e1e90d1daee39849b0c
+and updated to set gnu99 instead of c99 as done by
+https://github.com/tpm2-software/tpm2-tools/commit/5d0267428e96989afce406d096994ec5091ee107]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index dc15b5595..25039a0d9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -287,6 +287,9 @@ AC_DEFUN([add_c_flag], [
+ # -D_GNU_SOURCE is required for execvpe() in options.c
+ add_c_flag([-D_GNU_SOURCE], [AC_MSG_ERROR([Cannot enable -D_GNU_SOURCE])])
+ 
++# Enable gnu99 mode, since we use some of these features.
++add_c_flag([-std=gnu99], [AC_MSG_ERROR([Cannot enable -std=gnu99])])
++
+ # Best attempt compiler options that are on newer versions of GCC that
+ # we can't widely enforce without killing other peoples builds.
+ # Works with gcc only. Needs to be disabled on BSD and clang
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 981a89a737..41f5bcf201 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -11,6 +11,8 @@ TPM2_TOOLS_LICENSE_FILES = doc/LICENSE
 TPM2_TOOLS_CPE_ID_VENDOR = tpm2-tools_project
 TPM2_TOOLS_SELINUX_MODULES = tpm2
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf util-linux
+# We're patching configure.ac
+TPM2_TOOLS_AUTORECONF = YES
 
 # -fstack-protector-all and FORTIFY_SOURCE=2 is used by
 # default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
