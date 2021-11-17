Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617A3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0D060D62;
	Mon,  6 Dec 2021 18:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14dU3hwRf0Y1; Mon,  6 Dec 2021 18:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6394260619;
	Mon,  6 Dec 2021 18:24:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B17C81BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38B6060D60
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqUhEnfT7tv9 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42FEB60D70
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D33C381468; Mon,  6 Dec 2021 18:07:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 21:48:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6170020898ca154f9a8c83bf9068207ae958594b
X-Git-Newrev: c1723424b8189730087006fc879fdae0cc123ca1
X-Patchwork-Hint: ignore
Message-Id: <20211206180739.D33C381468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p7zip: add 7za support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c1723424b8189730087006fc879fdae0cc123ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 7za stand-alone executable as 7zr is a "light-version" of 7za that
only handles 7z archives and cannot handle encrypted archives.

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14266

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/p7zip/Config.in | 22 ++++++++++++++++++++++
 package/p7zip/p7zip.mk  | 11 +++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
index badfb9b9e8..3b30fd71cc 100644
--- a/package/p7zip/Config.in
+++ b/package/p7zip/Config.in
@@ -12,6 +12,28 @@ config BR2_PACKAGE_P7ZIP
 
 	  http://sourceforge.net/projects/p7zip
 
+if BR2_PACKAGE_P7ZIP
+
+choice
+	prompt "p7zip binary"
+	default BR2_PACKAGE_P7ZIP_7ZR
+
+config BR2_PACKAGE_P7ZIP_7ZA
+	bool "7za"
+	help
+	  Stand-alone executable that handles fewer archive formats
+	  than 7z
+
+config BR2_PACKAGE_P7ZIP_7ZR
+	bool "7zr"
+	help
+	  Stand-alone executable which is a "light-version" of 7za that
+	  only handles 7z archives and cannot handle encrypted archives
+
+endchoice
+
+endif
+
 comment "p7zip needs a toolchain w/ threads, wchar, C++"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index f94b55ecd2..b6c5adae26 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -10,6 +10,12 @@ P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
 P7ZIP_CPE_ID_VENDOR = 7-zip
 
+ifeq ($(BR2_PACKAGE_P7ZIP_7ZA),y)
+P7ZIP_TARGET = 7za
+else
+P7ZIP_TARGET = 7zr
+endif
+
 # p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
 # CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
 # and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
@@ -17,11 +23,12 @@ define P7ZIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ALLFLAGS_C="$(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CXX)" ALLFLAGS_CPP="$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-		-C $(@D) 7zr
+		-C $(@D) $(P7ZIP_TARGET)
 endef
 
 define P7ZIP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/7zr $(TARGET_DIR)/usr/bin/7zr
+	$(INSTALL) -D -m 0755 $(@D)/bin/$(P7ZIP_TARGET) \
+		$(TARGET_DIR)/usr/bin/$(P7ZIP_TARGET)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
