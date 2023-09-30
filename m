Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9EBE77366
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 10:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44EFA60F8F;
	Sat, 30 Sep 2023 10:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44EFA60F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOFX7xZFDw-v; Sat, 30 Sep 2023 10:21:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 104B960F37;
	Sat, 30 Sep 2023 10:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 104B960F37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 705961BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48AC842D4F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 10:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48AC842D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpZ736xtcVMg for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 10:20:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C402842C33
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 10:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C402842C33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD6EC838FF; Sat, 30 Sep 2023 10:20:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 12:19:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c25f1b51eeb988449ad0f1f524283ef5361ee4d
X-Git-Newrev: c77e25c3f113c44d753dec308334e52e4c0bec6c
X-Patchwork-Hint: ignore
Message-Id: <20230930102051.AD6EC838FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-pam: needs gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=c77e25c3f113c44d753dec308334e52e4c0bec6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linux-pam raises the following build failure with gcc 4.8 since bump to
version 1.5.3 in commit f8147e27cdac8f998ec6644a09ce4e8d62b6433c and
https://github.com/linux-pam/linux-pam/commit/8f9816b57e3a475fc2d2cbb106c188b778098f85:

pam_access.c: In function 'pam_sm_authenticate':
pam_access.c:1084:13: error: 'for' loop initial declarations are only allowed in C99 mode
             for (int i = 0; filename_list[i] != NULL; i++) {
             ^

Those build failures could be fixed by adding -std=c99 but then the
build will fails because stdadtomic.h is mandatory since
https://github.com/linux-pam/linux-pam/commit/a35e092e24ee7632346a0e1b4a203c04d4cd2c62

Fixes:
 - http://autobuild.buildroot.org/results/9b2ba987d2c873f4a7caea72707acb655279d16b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-pam/Config.in   |  5 +++--
 package/nodm/Config.in        |  5 +++--
 package/openvmtools/Config.in |  5 +++--
 package/php-pam/Config.in     |  5 +++--
 package/rsh-redone/Config.in  | 11 +++++++----
 package/shadow/Config.in      |  6 ++++--
 6 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 27ba55bd61..b17716f2f7 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_FLEX
 	help
 	  A Security Framework that Provides Authentication for
@@ -11,7 +12,7 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
-comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
+comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/nodm/Config.in b/package/nodm/Config.in
index 2dd6f1e1cf..52fd031b9b 100644
--- a/package/nodm/Config.in
+++ b/package/nodm/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NODM
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LINUX_PAM
 	help
@@ -17,7 +18,7 @@ config BR2_PACKAGE_NODM
 
 	  https://github.com/spanezz/nodm/
 
-comment "nodm needs a toolchain w/ wchar, locale, dynamic library"
+comment "nodm needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_XORG7
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 67855f50e0..066a7a4736 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -32,13 +32,14 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "PAM support needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS
 	bool "resolutionkms support"
diff --git a/package/php-pam/Config.in b/package/php-pam/Config.in
index 70f62a3180..c91fa8b6fe 100644
--- a/package/php-pam/Config.in
+++ b/package/php-pam/Config.in
@@ -4,13 +4,14 @@ config BR2_PACKAGE_PHP_PAM
 	depends on BR2_USE_WCHAR # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  PHP PAM (Pluggable Authentication Modules) integration
 
 	  https://pecl.php.net/package/PAM
 
-comment "php-pam needs a toolchain w/ wchar, locale, dynamic library"
+comment "php-pam needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 53ff2bea7f..fed643def4 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -19,11 +19,13 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
@@ -33,10 +35,11 @@ config BR2_PACKAGE_RSH_REDONE_RSHD
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rshd needs a toolchain w/ wchar, locale, dynamic library"
+comment "rshd needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index e3580c2cf5..e85e5884d2 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -20,14 +20,16 @@ config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
 	depends on BR2_ENABLE_LOCALE  # linux-pam
 	depends on BR2_USE_WCHAR  # linux-pam
 	depends on !BR2_STATIC_LIBS  # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Install the user and group management tools (e.g. groupadd)
 	  with setuid and authenticate the callers via PAM.
 
-comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, locale"
+comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, locale, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_SHADOW_UTMPX
 	bool "utmpx"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
