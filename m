Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC78C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C50A660C03;
	Sat, 12 Feb 2022 20:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COFfdZQWn7nL; Sat, 12 Feb 2022 20:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01DA360A82;
	Sat, 12 Feb 2022 20:39:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF9B1BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EC054022A
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxxe2mwhqE0B for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8109540201
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D1A8381D55; Sat, 12 Feb 2022 20:31:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:38:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b41b54be07711c10ad13ce157be272ed1cf402e
X-Git-Newrev: af0ea7d0372445fb315e739190fd98ecaf37c607
X-Patchwork-Hint: ignore
Message-Id: <20220212203150.D1A8381D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5base: fix uclibc/musl compile
 with libexecinfo enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=af0ea7d0372445fb315e739190fd98ecaf37c607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- depend and link against libexecinfo if enabled to fix linking failure
  in case execinfo.h is detected for qlogging:

  qt5base-5.15.2/src/corelib/global/qlogging.cpp:110 - __has_include(<execinfo.h>)

- libexecinfo already depends on !BR2_TOOLCHAIN_USES_GLIBC

- rename plain QT5BASE_CONFIGURE_ARCH_CONFIG to QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC

Fixes:

  - http://autobuild.buildroot.net/results/e7c685744b1f1bebb7fec9835bda534a72b7b7c2

  .../riscv64-buildroot-linux-musl/bin/ld: .../build/qt5base-5.15.2/src/corelib/global/qlogging.cpp:1398: undefined reference to `backtrace_symbols'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/qt5base.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d8a0bf1d16..ef38d03253 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -235,6 +235,14 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
 
+# see qt5base-5.15.2/src/corelib/global/qlogging.cpp:110 - __has_include(<execinfo.h>)
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+QT5BASE_DEPENDENCIES += libexecinfo
+define QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO
+	printf '!host_build { \n LIBS += -lexecinfo\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 QT5BASE_CONFIGURE_OPTS += -libinput
 QT5BASE_DEPENDENCIES += libinput
@@ -283,7 +291,7 @@ endif
 QT5BASE_ARCH_CONFIG_FILE = $(@D)/mkspecs/devices/linux-buildroot-g++/arch.conf
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
-define QT5BASE_CONFIGURE_ARCH_CONFIG
+define QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC
 	printf '!host_build { \n LIBS += -latomic\n }' >$(QT5BASE_ARCH_CONFIG_FILE)
 endef
 endif
@@ -306,7 +314,8 @@ define QT5BASE_CONFIGURE_CMDS
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
 	touch $(QT5BASE_ARCH_CONFIG_FILE)
-	$(QT5BASE_CONFIGURE_ARCH_CONFIG)
+	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBATOMIC)
+	$(QT5BASE_CONFIGURE_ARCH_CONFIG_LIBEXECINFO)
 	$(QT5BASE_CONFIGURE_HOSTCC)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
