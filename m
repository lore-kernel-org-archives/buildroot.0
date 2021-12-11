Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5227CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F162985065;
	Sat, 11 Dec 2021 20:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKkcXeCqC24u; Sat, 11 Dec 2021 20:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471958505D;
	Sat, 11 Dec 2021 20:55:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 558D21BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34BD48277E
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-YFF0EZmvuz for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD4484F39
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 503F782965; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:46:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7377feafafab33c6223a9e4aa89d249dfb9f3e18
X-Git-Newrev: e13c9ccf436cf13b53bec6933e5be4bb071cfad9
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.503F782965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-pk-helper: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e13c9ccf436cf13b53bec6933e5be4bb071cfad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/cups-pk-helper/Config.in           | 17 +++++++++++++++++
 package/cups-pk-helper/cups-pk-helper.hash |  3 +++
 package/cups-pk-helper/cups-pk-helper.mk   | 14 ++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 87135ae52f..a73e1fb38f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2150,6 +2150,7 @@ menu "Networking applications"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
 	source "package/cups-filters/Config.in"
+	source "package/cups-pk-helper/Config.in"
 	source "package/dante/Config.in"
 	source "package/darkhttpd/Config.in"
 	source "package/dehydrated/Config.in"
diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
new file mode 100644
index 0000000000..63a0d3acd8
--- /dev/null
+++ b/package/cups-pk-helper/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CUPS_PK_HELPER
+	bool "cups-pk-helper"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_PACKAGE_CUPS
+	select BR2_PACKAGE_POLKIT
+	help
+	  cups-pk-helper is a PolicyKit helper to configure cups with
+	  fine-grained privileges.
+
+	  https://wiki.freedesktop.org/www/Software/cups-pk-helper/
+
+comment "cups-pk-helper support needs a toolchain with threads, wchar, gcc >= 7"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cups-pk-helper/cups-pk-helper.hash b/package/cups-pk-helper/cups-pk-helper.hash
new file mode 100644
index 0000000000..18fe789389
--- /dev/null
+++ b/package/cups-pk-helper/cups-pk-helper.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  959af8f2f5a2761e7e498b61c9caf25ae963335031eae9972d999e9a0d97a228  cups-pk-helper-0.2.6.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
new file mode 100644
index 0000000000..c90b94da14
--- /dev/null
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# cups-pk-helper
+#
+################################################################################
+
+CUPS_PK_HELPER_VERSION = 0.2.6
+CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releases
+CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
+CUPS_PK_HELPER_LICENSE = GPL-2.0+
+CUPS_PK_HELPER_LICENSE_FILES = COPYING
+CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
