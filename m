Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B0C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B510605FB;
	Fri,  1 Mar 2024 08:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAUFemEHwicg; Fri,  1 Mar 2024 08:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF964607B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF964607B2;
	Fri,  1 Mar 2024 08:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CED01BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1206381499
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-PbQp9Tfws9 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEC2281448
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEC2281448
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C989287E78; Fri,  1 Mar 2024 08:35:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:32:59 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 6bd6ceb54047dc177be01efc4545077e6487f199
X-Git-Newrev: b87863caa530021b798e3610243b832327a8300a
X-Patchwork-Hint: ignore
Message-Id: <20240301083511.C989287E78@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/util-linux:
 propagate linux-pam dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=b87863caa530021b798e3610243b832327a8300a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit c77e25c3f113 (package/linux-pam: needs gcc >= 4.9) forgot to
propagate that new dependency to the util-linux runuser and su, yielding
unmet dependencies warnings (unfortunately, not errors), such as:

    $ KCONFIG_SEED=0x8AE589A3 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
      Depends on [n]: BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
      Selected by [y]:
      - BR2_PACKAGE_UTIL_LINUX_RUNUSER [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]
      - BR2_PACKAGE_UTIL_LINUX_SU [=y] && BR2_PACKAGE_UTIL_LINUX [=y] && BR2_ENABLE_LOCALE [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && !BR2_TOOLCHAIN_USES_MUSL [=n] && BR2_USE_MMU [=y]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20ee36e0b096185853835aea848b86a7fccd238b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index be87494b35..73fa11380e 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -88,13 +88,15 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Change login shell, real user name and information
 
-comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library"
+comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
@@ -196,13 +198,16 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Begin a session on the system
 
-comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
@@ -343,15 +348,18 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID (does not need
 	  to ask for a password, because it may be executed by the root
 	  user only)
 
-comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
@@ -380,13 +388,16 @@ config BR2_PACKAGE_UTIL_LINUX_SU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID
 
-comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS \
+		|| BR2_TOOLCHAIN_USES_MUSL \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
