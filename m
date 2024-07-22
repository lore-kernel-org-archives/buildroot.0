Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1341C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 934AB4026E;
	Mon, 22 Jul 2024 16:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8p6Y0jjoC5n; Mon, 22 Jul 2024 16:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F33D402D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F33D402D1;
	Mon, 22 Jul 2024 16:13:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA76D1BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D35C3401A0
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XejulTLst7UU for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2AD4018F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D2AD4018F
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:13:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F7E8706F; Mon, 22 Jul 2024 16:13:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:12:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0e565d7bf4f44eed90000be8675285b0d9c162b
X-Git-Newrev: 061b5806d13a4bb9c4941e4564c2e681ef36a618
X-Patchwork-Hint: ignore
Message-Id: <20240722161314.75F7E8706F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faifa: bump to latest git commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=061b5806d13a4bb9c4941e4564c2e681ef36a618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- libevent is mandatory since
  https://github.com/ffainelli/faifa/commit/d2339c2a7680e7c87555650e19123e27e1f12031
- This bump will fix the following build failure with gcc >= 14:

  hpav_cfg.c: In function 'pushbutton_request':
  hpav_cfg.c:256:37: error: passing argument 2 of 'send_vendor_pkt' makes pointer from integer without a cast [-Wint-conversion]
    256 |         return send_vendor_pkt(ctx, mac, HPAV_MMTYPE_MS_PB_ENC,
        |                                     ^~~
        |                                     |
        |                                     uint8_t {aka unsigned char}
  hpav_cfg.c:123:64: note: expected 'const uint8_t *' {aka 'const unsigned char *'} but argument is of type 'uint8_t' {aka 'unsigned char'}
    123 | static int send_vendor_pkt(struct context *ctx, const uint8_t *to,
        |                                                 ~~~~~~~~~~~~~~~^~
  hpav_cfg.c: In function 'main':
  hpav_cfg.c:406:48: error: passing argument 2 of 'pushbutton_request' makes integer from pointer without a cast [-Wint-conversion]
    406 |                 ret = pushbutton_request(&ctx, mac);
        |                                                ^~~
        |                                                |
        |                                                uint8_t * {aka unsigned char *}
  hpav_cfg.c:254:60: note: expected 'uint8_t' {aka 'unsigned char'} but argument is of type 'uint8_t *' {aka 'unsigned char *'}
    254 | static int pushbutton_request(struct context *ctx, uint8_t mac)
        |                                                    ~~~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/5a65337366e52c6234d8d154b7e9a0296e02f1dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  3 --
 ...icitly-include-endian.h-for-BYTE_ORDER-ma.patch | 32 ----------------------
 ...do-not-include-linux-if_ether.h-for-musl-.patch | 32 ----------------------
 ...le.in-fix-asbolute-symlink-of-libfaifa.so.patch | 32 ----------------------
 package/faifa/Config.in                            |  1 +
 package/faifa/faifa.hash                           |  2 +-
 package/faifa/faifa.mk                             |  6 ++--
 7 files changed, 5 insertions(+), 103 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e20a747da5..760ae29cfb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -518,9 +518,6 @@ package/exim/0003-Skip-version-check-and-symlink-installation.patch lib_patch.Up
 package/exim/S86exim lib_sysv.Indent lib_sysv.Variables
 package/expect/0001-enable-cross-compilation.patch lib_patch.Upstream
 package/expect/0002-allow-tcl-build-directory.patch lib_patch.Upstream
-package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch lib_patch.Upstream
-package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch lib_patch.Upstream
-package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch lib_patch.Upstream
 package/fail2ban/S60fail2ban Shellcheck lib_sysv.Variables
 package/fakedate/fakedate Shellcheck
 package/falcosecurity-libs/0001-cmake-Permit-setting-GRPC_CPP_PLUGIN.patch lib_patch.Upstream
diff --git a/package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch b/package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch
deleted file mode 100644
index 79da360807..0000000000
--- a/package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From bfe43f4b4f249cee8c77059d7c89ebbc521d4d93 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Mon, 14 Sep 2015 22:25:12 +0200
-Subject: [PATCH] sha2.c: explicitly include endian.h for BYTE_ORDER macro
-
-Fixes a build issue with the musl C library, which doesn't indirectly
-include endian.h from any of the included system headers:
-
-http://autobuild.buildroot.net/results/17b/17bde543db253c008079b04c5e341f804160f59c/build-end.log
-
-Upstream-Status: submitted (https://github.com/ffainelli/faifa/pull/12)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- sha2.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/sha2.c b/sha2.c
-index f2f5132..4c8a72d 100644
---- a/sha2.c
-+++ b/sha2.c
-@@ -40,6 +40,7 @@
- #include <inttypes.h>
- #include <string.h>
- 
-+#include "endian.h"
- #include "sha2.h"
- 
- /*
--- 
-2.1.4
-
diff --git a/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch b/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
deleted file mode 100644
index c5547a5e10..0000000000
--- a/package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 36eed08a3783df6bb8d92d3c80cd47d0660eeb12 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 30 Jan 2016 16:27:37 +0100
-Subject: [PATCH] hpav_cfg.c: do not include linux/if_ether.h for musl
- compatibility
-
-Fixes a build issue with the musl C library
-http://autobuild.buildroot.net/results/dc6/dc6e4d7327d2031ef921cccd814605dec73a0f9c/build-end.log
-
-Patch sent upstream: https://github.com/ffainelli/faifa/pull/13
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- hpav_cfg.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/hpav_cfg.c b/hpav_cfg.c
-index 7cc53af..45d3f0a 100644
---- a/hpav_cfg.c
-+++ b/hpav_cfg.c
-@@ -53,8 +53,6 @@
- #include <arpa/inet.h>
- #include <net/if.h>
- 
--#include <linux/if_ether.h>
--
- #include "homeplug_av.h"
- #include "crypto.h"
- 
--- 
-2.7.0.rc3
-
diff --git a/package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch b/package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch
deleted file mode 100644
index 876d2a60f4..0000000000
--- a/package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d16abf61049947c451a6411a13fc15dda32feb47 Mon Sep 17 00:00:00 2001
-From: Florian Fainelli <f.fainelli@gmail.com>
-Date: Sat, 6 Sep 2014 11:23:02 -0700
-Subject: [PATCH] Makefile.in: fix asbolute symlink of libfaifa.so
-
-Fixes #7
-
-Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
-[Upstream: da2e279fd736d05bcd0ee6e4609c44fece017ba8]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index ba65bee..9dec7ee 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -98,9 +98,9 @@ install: installman strip
- 	$(INSTALL) -m0755 hpav_cfg $(DESTDIR)$(sbindir)
- 	$(INSTALL) -d $(DESTDIR)$(libdir)
- 	$(INSTALL) -m0644 $(LIB_SONAME) $(DESTDIR)$(libdir)
--	ln -sf $(DESTDIR)$(libdir)/$(LIB_SONAME) $(DESTDIR)$(libdir)/$(LIB_SHARED_SO)
- 	$(INSTALL) -d $(DESTDIR)$(includedir)/faifa
- 	cp $(HEADERS) $(DESTDIR)$(includedir)/faifa
-+	cd $(DESTDIR)$(libdir) && ln -sf $(LIB_SONAME) $(LIB_SHARED_SO)
- 
- strip:
- 	$(STRIP) $(APP)
--- 
-2.23.0
-
diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index 486f35d508..202b69bcd2 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FAIFA
 	bool "faifa"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Faifa can configure any Intellon-based Power Line
diff --git a/package/faifa/faifa.hash b/package/faifa/faifa.hash
index 658dae4a71..1b0608b898 100644
--- a/package/faifa/faifa.hash
+++ b/package/faifa/faifa.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  6eada81f3d21f80b5848338b627784981064d728f8e377e5cf973d31640d4489  faifa-0.1.tar.gz
+sha256  bae36f77d02ea25a0f8e2fa3db0b0efe7e5cb7331cf0ea97470036b7f299a5c1  faifa-fb91bf684fd19f03115b8dc76b57bb5a5a4ec05b.tar.gz
 sha256  9b62e4601b2b9cd5719a393e88ed71a8304048862502db765ed9d6ff8cf38c5e  COPYING
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index e5dc157482..1cc7795e0f 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FAIFA_VERSION = 0.1
-FAIFA_SITE = $(call github,ffainelli,faifa,v$(FAIFA_VERSION))
+FAIFA_VERSION = fb91bf684fd19f03115b8dc76b57bb5a5a4ec05b
+FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
 FAIFA_INSTALL_STAGING = YES
-FAIFA_DEPENDENCIES = libpcap host-autoconf
+FAIFA_DEPENDENCIES = libevent libpcap host-autoconf
 FAIFA_LICENSE = BSD-3-Clause
 FAIFA_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
