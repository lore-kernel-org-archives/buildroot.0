Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99640CDB482
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 16:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ED474059D;
	Thu, 12 Oct 2023 16:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ED474059D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GL2m4QcJbcWu; Thu, 12 Oct 2023 16:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 152DE40B4C;
	Thu, 12 Oct 2023 16:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 152DE40B4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8461BF990
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 564D060B77
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 16:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 564D060B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCyhGiD54hle for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 16:41:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3310360B55
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 16:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3310360B55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2079C84624; Thu, 12 Oct 2023 16:41:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 18:41:08 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 52369b5b7a2098594457d2f020f0ac5723e2b95e
X-Git-Newrev: 339c49c24134404f5da3d17e8e7a6a03302f158b
X-Patchwork-Hint: ignore
Message-Id: <20231012164159.2079C84624@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/linux-pam: needs
 gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=339c49c24134404f5da3d17e8e7a6a03302f158b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit c77e25c3f113c44d753dec308334e52e4c0bec6c)
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
