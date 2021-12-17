Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B74D841C41;
	Fri, 17 Dec 2021 19:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBb1LQfFbi2X; Fri, 17 Dec 2021 19:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC9E5417C9;
	Fri, 17 Dec 2021 19:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC221BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A81D61119
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIcwGYRUrPIk for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:12:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E29060EC6
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:12:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o29so2282769wms.2
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BA8pmMSJEPpscnkjasnhmQdSKD+NDrReSyfzdq7M+KM=;
 b=oebIMnQzvtnvIB6FCJSIEzhr6tyBhYSgkGaffuWu/SP00+0WZ0R/EdBcVz6HFuANep
 fo8sfSSdeBlgpdFcDBm96pMxmkrpxOIcmh5yivf8mOtIUE9INHBS1Od4NgBK1DlxdQ31
 uFgCTbJot2rml3R/+NBLr5Z5zQs+BXQVJKJYuyDDaqBO1lHs1OXOiza41tTMgvyyvkc8
 Oehc894TrJFzXvjc9PZRuOB6ptfmcRvN3RYj4m9wWdTByXoA7MxFRb4/lvZ0ndxUvrSI
 s4GeXd6V9yEOEqrKGxrgSzRonpx0Xn5hn5BI2b6OVl/THkL4FwY42zb6d3dWt+BdJzu0
 AZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BA8pmMSJEPpscnkjasnhmQdSKD+NDrReSyfzdq7M+KM=;
 b=HmXxeYTjjIbztuISCguSrDJsjDQumUFCWaqRrjs9mtJUK4HpPvf9PsjQrr2Jk0MyGM
 uQEQlQvI3KMjFW0HR1jBzOmDgvYgWEDF9KTODXmBxPYOt0Zqr8LpmgeMtorgNss9141D
 5B5l9jCCG/ckHPkiePrj3dAgVyginG8gU8vskEw7CU19VzHjVK7ZiTPLoI5tgdGsfzuA
 9+3qKfX8j83RSWal24yAoBwzkxJCiR9rouiNjP3wBmMxXXC40Nfx9vV/ChqeM6Ckd4mb
 ieeU0xJpMM0DcMMCLAp9IJ7Y2L3BqdQsRuk+k90nU8j1XoTVNWdDQ5ytf+cAq7kHrHV2
 5/0Q==
X-Gm-Message-State: AOAM530RRJFU4K1vC+Pvc4C8T56YgW7ouoefsKXNRF9kDI/aUSnPMnva
 GXkoO/KtLqWZ7JS+0nX+I9vAwC7kVMk0vw==
X-Google-Smtp-Source: ABdhPJwTu/qm+akN1YqinqURje4GJXpjRsduA4D+K+9l9VkRqjttb7xdaLBYQFKzfD7b68C+eeyyvw==
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr3892435wmb.174.1639768330393; 
 Fri, 17 Dec 2021 11:12:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id t11sm7803643wrz.97.2021.12.17.11.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:12:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:11:44 +0100
Message-Id: <20211217191144.24775-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmbim: bump to version 1.26.2
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
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.26.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...im-glib-meson.build-fix-static-build.patch | 34 -----------
 ...add-an-option-to-not-build-man-pages.patch | 60 -------------------
 package/libmbim/libmbim.hash                  |  2 +-
 package/libmbim/libmbim.mk                    |  2 +-
 4 files changed, 2 insertions(+), 96 deletions(-)
 delete mode 100644 package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
 delete mode 100644 package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch

diff --git a/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch b/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
deleted file mode 100644
index 6ccad9abf8..0000000000
--- a/package/libmbim/0001-src-libmbim-glib-meson.build-fix-static-build.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ff1f9d7c9bc163de3117383b7cea9cd99585462a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Jul 2021 23:42:35 +0200
-Subject: [PATCH] src/libmbim-glib/meson.build: fix static build
-
-Replace shared_library by library to fix static build failure with
-toolchains that don't support dynamic library
-
-Fixes:
- - http://autobuild.buildroot.org/results/8553211d87a2c41d8b47b51bbb193736fce49714
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/merge_requests/83]
----
- src/libmbim-glib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libmbim-glib/meson.build b/src/libmbim-glib/meson.build
-index e3337db..5de3564 100644
---- a/src/libmbim-glib/meson.build
-+++ b/src/libmbim-glib/meson.build
-@@ -76,7 +76,7 @@ version_header = configure_file(
- 
- symbol_map = join_paths(meson.current_source_dir(), 'symbol.map')
- 
--libmbim_glib = shared_library(
-+libmbim_glib = library(
-   libname,
-   version: mbim_glib_version,
-   sources: version_header,
--- 
-2.30.2
-
diff --git a/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch b/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
deleted file mode 100644
index c91756e9a6..0000000000
--- a/package/libmbim/0002-meson-build-add-an-option-to-not-build-man-pages.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 792af73ea90e9689703ab526dd444fdb1c2f8e40 Mon Sep 17 00:00:00 2001
-From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Date: Thu, 14 Oct 2021 12:25:46 +0200
-Subject: [PATCH] meson.build: add an option to not build man pages.
-
-When cross-compiling, the compiled binaries cannot be run on the build
-machine, unless one defines a helper (e.g. qemu) in the meson
-configuration, which is most of the time undesirable.
-
-If help2man is installed on the build machine, then the build would fail
-because of this, so add an option to disable generating the man pages.
-
-With later versions of meson, it will be possible to automatically
-detect this condition.
-
-[Retrieved (and backported) from:
-https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/commit/792af73ea90e9689703ab526dd444fdb1c2f8e40]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build       | 8 +++++++-
- meson_options.txt | 1 +
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1c5ee2d..59f1727 100644
---- a/meson.build
-+++ b/meson.build
-@@ -184,8 +184,8 @@ if enable_gtk_doc
-   subdir('docs/reference/libmbim-glib')
- endif
- 
--help2man = find_program('help2man', required: false)
--if help2man.found()
-+enable_man = get_option('man')
-+if enable_man
-   subdir('docs/man')
- endif
- 
-@@ -198,6 +203,7 @@ summary({
- output += '    Documentation:         ' + enable_gtk_doc.to_string() + '\n'
- output += '    bash completion:       ' + enable_bash_completion.to_string() + '\n'
- output += '    gobject introspection: ' + enable_gir.to_string() + '\n\n'
-+output += '    man pages:             ' + enable_man.to_string() + '\n\n'
- output += '  System paths\n'
- output += '    prefix:                ' + mbim_prefix + '\n'
- output += '    udev base directory:   ' + mbim_username + '\n\n'
-diff --git a/meson_options.txt b/meson_options.txt
-index 1305957..bfa33ab 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -7,5 +7,6 @@ option('udevdir', type: 'string', value: '', description: 'where udev base direc
- 
- option('introspection', type: 'boolean', value: 'true', description: 'build introspection support')
- option('gtk_doc', type: 'boolean', value: false, description: 'use gtk-doc to build documentation')
-+option('man', type: 'boolean', value: 'true', description: 'build man pages using help2man')
- 
- option('bash_completion', type: 'boolean', value: true, description: 'install bash completion files')
--- 
-GitLab
-
diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 07cfd69163..7ecc99d333 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  63b53db0196dadea673f04524b0683ce40282f25bfd513d398e2a10b992cac01  libmbim-1.26.0.tar.gz
+sha256  c12e61ea462fca40ddba2a8e1e401242d4f13827944369fad27ff70936b1e09d  libmbim-1.26.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 6737afebe8..eba5f0a6e0 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.26.0
+LIBMBIM_VERSION = 1.26.2
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
