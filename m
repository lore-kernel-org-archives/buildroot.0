Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0E1C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D71607A5;
	Tue, 23 Jul 2024 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKndKpv4Qguy; Tue, 23 Jul 2024 21:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3830860890
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3830860890;
	Tue, 23 Jul 2024 21:05:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 031C11BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E23FE605C8
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4B90yjOV5D7 for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED435600C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED435600C7
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:05:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3C2873E3; Tue, 23 Jul 2024 21:05:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:04:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 213c5c0191be022671aa726902dd7dfef5899c6e
X-Git-Newrev: a73ef093f7b40297d69c6813c44fd4626883632e
X-Patchwork-Hint: ignore
Message-Id: <20240723210543.DA3C2873E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: needs ucontext
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a73ef093f7b40297d69c6813c44fd4626883632e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdex needs ucontext since its addition in commit
70319b47f646f74f407ed3355baf5b581a10518a:

/home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: src/libdex-1.a.p/dex-fiber.c.o: in function `dex_fiber_context_init':
/home/autobuild/autobuild/instance-11/output-1/build/libdex-0.6.1/build/../src/dex-fiber-context-private.h:131:(.text+0x30c): undefined reference to `getcontext'

[...]

In file included from ../src/dex-fiber-private.h:34,
                 from ../src/dex-scheduler.c:25:
../src/dex-fiber-context-private.h: In function '_dex_fiber_context_makecontext':
../src/dex-fiber-context-private.h:108:3: error: implicit declaration of function 'makecontext' [-Werror=implicit-function-declaration]
  108 |   makecontext (ucontext,
      |   ^~~~~~~~~~~

Fixes: 70319b47f646f74f407ed3355baf5b581a10518a
 - http://autobuild.buildroot.org/results/5f23b0e41f2957b0562c5d168f35e42f13bdad0b
 - http://autobuild.buildroot.org/results/67d958e9a8e1dfb147ac7be4fcb74fcafbbce987

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdex/Config.in | 10 ++++++++--
 package/libdex/libdex.mk |  5 +++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/package/libdex/Config.in b/package/libdex/Config.in
index f10bdac46f..5f94a79b73 100644
--- a/package/libdex/Config.in
+++ b/package/libdex/Config.in
@@ -3,7 +3,11 @@ config BR2_PACKAGE_LIBDEX
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2, gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBUCONTEXT if \
+		BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS && !BR2_TOOLCHAIN_HAS_UCONTEXT
 	help
 	  Dex provides Future-based programming for GLib-based
 	  applications. It both integrates with and brings new
@@ -12,6 +16,8 @@ config BR2_PACKAGE_LIBDEX
 
 	  https://gitlab.gnome.org/GNOME/libdex
 
-comment "libdex needs a toolchain w/ wchar, threads"
+comment "libdex needs a toolchain w/ wchar, threads, ucontext"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!(BR2_TOOLCHAIN_HAS_UCONTEXT || \
+			BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS)
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 7c652a0409..360b389255 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -22,6 +22,11 @@ LIBDEX_CONF_OPTS = \
 	-Deventfd=enabled \
 	-Dintrospection=disabled
 
+ifeq ($(BR2_PACKAGE_LIBUCONTEXT),y)
+LIBDEX_DEPENDENCIES += libucontext
+LIBDEX_LDFLAGS += $(TARGET_LDFLAGS) -lucontext
+endif
+
 ifeq ($(BR2_PACKAGE_LIBURING),y)
 LIBDEX_CONF_OPTS += -Dliburing=enabled
 LIBDEX_DEPENDENCIES += liburing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
