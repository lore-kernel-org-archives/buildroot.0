Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7268CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3050A60C26;
	Thu, 30 Dec 2021 22:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNFgJCruqy6r; Thu, 30 Dec 2021 22:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8099C60C24;
	Thu, 30 Dec 2021 22:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 298FA1C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1988B410A9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNstTD-8f9sH for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:41:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DFCF410A7
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:41:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8782F8104E; Thu, 30 Dec 2021 22:35:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:38:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52bba69dc930033e702201e691267f14b802980b
X-Git-Newrev: eea8ba446c10701a273432552108d80fb2224ef4
X-Patchwork-Hint: ignore
Message-Id: <20211230223532.8782F8104E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libexecinfo: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=eea8ba446c10701a273432552108d80fb2224ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides execinfo.h for non-glibc toolchains.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                    |  1 +
 package/libexecinfo/Config.in        |  7 +++++++
 package/libexecinfo/libexecinfo.hash |  3 +++
 package/libexecinfo/libexecinfo.mk   | 30 ++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 59bf5caff7..ce12e5f3c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1964,6 +1964,7 @@ menu "Other"
 	source "package/libev/Config.in"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
+	source "package/libexecinfo/Config.in"
 	source "package/libffi/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libgeos/Config.in"
diff --git a/package/libexecinfo/Config.in b/package/libexecinfo/Config.in
new file mode 100644
index 0000000000..473a4f7181
--- /dev/null
+++ b/package/libexecinfo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBEXECINFO
+	bool "libexecinfo"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Library for inspecting program's backtrace
+
+	  https://github.com/mikroskeem/libexecinfo
diff --git a/package/libexecinfo/libexecinfo.hash b/package/libexecinfo/libexecinfo.hash
new file mode 100644
index 0000000000..4719b7699e
--- /dev/null
+++ b/package/libexecinfo/libexecinfo.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  0462304192fab38c39a376594db1c8bdab4ebda2736bf54f01715917f430611e  libexecinfo-1.1-3.tar.gz
+sha256  46fbc8e6849a164c4ba8fd5875748bde302bf3cd713622af0e51b4e10344f516  execinfo.h
diff --git a/package/libexecinfo/libexecinfo.mk b/package/libexecinfo/libexecinfo.mk
new file mode 100644
index 0000000000..85f4fd8c10
--- /dev/null
+++ b/package/libexecinfo/libexecinfo.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# libexecinfo
+#
+################################################################################
+
+LIBEXECINFO_VERSION = 1.1-3
+LIBEXECINFO_SITE = $(call github,mikroskeem,libexecinfo,$(LIBEXECINFO_VERSION))
+LIBEXECINFO_LICENSE = BSD-2-Clause
+LIBEXECINFO_LICENSE_FILES = execinfo.h
+LIBEXECINFO_INSTALL_STAGING = YES
+
+define LIBEXECINFO_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		EXECINFO_CFLAGS="$(TARGET_CFLAGS) -c"
+endef
+
+define LIBEXECINFO_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		EXECINFO_CFLAGS="$(TARGET_CFLAGS) -c" \
+		DESTDIR="$(STAGING_DIR)" PREFIX=/usr install
+endef
+
+define LIBEXECINFO_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		EXECINFO_CFLAGS="$(TARGET_CFLAGS) -c" \
+		DESTDIR="$(TARGET_DIR)" PREFIX=/usr install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
