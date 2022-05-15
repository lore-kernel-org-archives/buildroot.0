Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B937AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 18:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6300440AEF;
	Sun, 15 May 2022 18:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6Hpgq1MYdNn; Sun, 15 May 2022 18:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 377C840AF0;
	Sun, 15 May 2022 18:19:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 890C51BF963
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF59B4160F
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 18:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mVV13u1_4KX for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 18:18:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2EA041695
 for <buildroot@buildroot.org>; Sun, 15 May 2022 18:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4CE5285E8D; Sun, 15 May 2022 18:07:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 20:17:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 278138a0b55cf448bd39bac2dc5c7e0773b064fa
X-Git-Newrev: c1dcf18c8d227067bea58e12d30324515e29193b
X-Patchwork-Hint: ignore
Message-Id: <20220515180747.4CE5285E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/duktape: can't be built with
 BR2_OPTIMIZE_FAST
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1dcf18c8d227067bea58e12d30324515e29193b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

duktape can't be used with BR2_OPTIMIZE_FAST resulting in the following
build failure in polkit:

In file included from /nvmedata/autobuild/instance-27/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/duktape.h:202,
                 from ../src/polkitbackend/polkitbackendduktapeauthority.c:28:
/nvmedata/autobuild/instance-27/output-1/host/aarch64_be-buildroot-linux-gnu/sysroot/usr/include/duk_config.h:2893:2: error: #error __FAST_MATH__ defined, refusing to compile
 2893 | #error __FAST_MATH__ defined, refusing to compile
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/587485bcfd85dfd974608aa00b9bd0c42a3a61d8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-pk-helper/Config.in | 4 ++++
 package/duktape/Config.in        | 4 ++++
 package/polkit/Config.in         | 4 ++++
 package/systemd/Config.in        | 4 ++++
 package/udisks/Config.in         | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
index 113f433795..756ac49cfa 100644
--- a/package/cups-pk-helper/Config.in
+++ b/package/cups-pk-helper/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CUPS_PK_HELPER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
+	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
 	depends on BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_POLKIT
 	help
@@ -17,3 +18,6 @@ comment "cups-pk-helper support needs a toolchain with threads, wchar, dynamic l
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+comment "cups-pk-helper can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/duktape/Config.in b/package/duktape/Config.in
index 5dad5c3e7c..38f2c48cc0 100644
--- a/package/duktape/Config.in
+++ b/package/duktape/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DUKTAPE
 	bool "duktape"
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_OPTIMIZE_FAST
 	help
 	  Duktape is an embeddable Javascript engine, with a focus on
 	  portability and compact footprint.
@@ -14,3 +15,6 @@ config BR2_PACKAGE_DUKTAPE
 
 comment "duktape needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+
+comment "duktape can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/polkit/Config.in b/package/polkit/Config.in
index 622cbbb90b..ca3323931c 100644
--- a/package/polkit/Config.in
+++ b/package/polkit/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_POLKIT
 	depends on BR2_USE_MMU # libglib2, dbus
 	depends on BR2_USE_WCHAR # libglib2
 	depends on !BR2_STATIC_LIBS # duktape
+	depends on !BR2_OPTIMIZE_FAST # duktape
 	select BR2_PACKAGE_DBUS # runtime
 	select BR2_PACKAGE_DUKTAPE
 	select BR2_PACKAGE_EXPAT
@@ -20,3 +21,6 @@ comment "polkit needs a toolchain with dynamic library, wchar, threads, gcc >= 7
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "polkit can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 00c817172d..d5d88404de 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -359,6 +359,7 @@ config BR2_PACKAGE_SYSTEMD_POLKIT
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS # polkit
 	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
 	select BR2_PACKAGE_POLKIT
 	help
 	  If enabled, systemd is built with polkit support and policy
@@ -372,6 +373,9 @@ comment "polkit support needs a toolchain with threads, wchar, gcc >= 7"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
+comment "polkit support can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
+
 config BR2_PACKAGE_SYSTEMD_PORTABLED
 	bool "enable portable services"
 	help
diff --git a/package/udisks/Config.in b/package/udisks/Config.in
index 82f11ae7de..a3a0f82144 100644
--- a/package/udisks/Config.in
+++ b/package/udisks/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_UDISKS
 	depends on BR2_USE_WCHAR # dbus-glib -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libblockdev -> cryptsetup -> json-c
 	depends on !BR2_STATIC_LIBS # polkit -> duktape
+	depends on !BR2_OPTIMIZE_FAST # polkit -> duktape
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBATASMART
@@ -45,3 +46,6 @@ comment "udisks needs a toolchain with dynamic library, locale, wchar, threads,
 	depends on BR2_STATIC_LIBS || !BR2_ENABLE_LOCALE || \
 		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+
+comment "udisks can't be built with Optimize for fast"
+	depends on BR2_OPTIMIZE_FAST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
