Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5C0EB3632
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 21:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ED5483BB0;
	Mon,  2 Mar 2026 21:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrQ8trSA49As; Mon,  2 Mar 2026 21:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C0983B94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772485242;
	bh=Os3pjjKHLSS8c8UGRg0UGjebvdVMAwKRvAqfLRYDFkY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JBHCAIYic+QA7dhhNFmn+hhbNRp60Tzn1UqrnlTHRYTXHPGCya6L2LFCqUhP2uC6J
	 53a6qUe/fwQUp9Ptp99XFnau9PMr4Escb5MP8Gn+JxPOKYrLCeMjvBp6BJul/Ci3u+
	 IqB4pkcYklzD2eAuwy3A6u053MIS0wuXsLet47pzPLjL9JTtbb5jY8VFuJZ+5EfC4X
	 7LMzScJdoK2VxupKZFc8RULnVJX/FRgHltMWbrG5qzXQ6Ajb/xkaTc9o074YO+P1ZW
	 m7gS8A8Rbh484WiP94WpU0VvHvKaeki++BFgxP28qa3F9lAk7OuWjQbRQzNUOViV6O
	 fNH9dB1vRAsdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78C0983B94;
	Mon,  2 Mar 2026 21:00:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96FC2231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88BA383B94
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id beP8BuJxaoe3 for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 21:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65D8B83B78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D8B83B78
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65D8B83B78
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:00:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a037c.dip0.t-ipconnect.de [91.58.3.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6027A4C337E;
 Mon,  2 Mar 2026 22:00:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41472)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxANZ-000000006VS-2lVg;
 Mon, 02 Mar 2026 21:00:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Mar 2026 22:00:36 +0100
Message-ID: <20260302210037.1931571-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772485237;
 bh=jly9f8HaGZhile+ag4gM0j0+0xRmiE8Up3k3vTTj/W4=;
 h=From:To:Cc:Subject:Date:From;
 b=Z+oLQ8h9Vfn/CAHJXRn+Z7A9EW2v0RZ4LaqMY9O4+Gyli0A4Cn2Bo/tJsZZ0oxJa5
 eu9ZIgySugTqJTcCLaVkScdP5laHopRpG6ukubsS5aLvpZkmE2a07jqOxbgtNAPkzp
 2HmEmgmjsxrJwSWcQsP/N2lRV9kl1EmwtJjCT6wSZ3dbQM+T3bYCelHhLQa+SUG793
 vwjSXLChEtrjGzyiN7o6mLqznGS+Yln8SsH7tUyu9MQ8X+dojy3L6APfqEK0m5aiKJ
 olvEmyIZrjfUqceKMUuokwSOetlm6MPyKA3MJyZOdORBnpEu1SthIUrVB8akRy0B08
 4rrN52qqujkmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Z+oLQ8h9
Subject: [Buildroot] [PATCH/next 1/2] package/gnu-efi: bump version to 4.0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/ncroxon/gnu-efi/releases/tag/4.0.1
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.2
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.3
https://github.com/ncroxon/gnu-efi/releases/tag/4.0.4

Removed patch due to upstream commit
https://github.com/ncroxon/gnu-efi/commit/f3ececb9eba2ad3104b6d39bd33e579091fce888
which contains a different fix.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...n-t-override-ARCH-when-cross-compili.patch | 32 -------------------
 package/gnu-efi/gnu-efi.hash                  |  2 +-
 package/gnu-efi/gnu-efi.mk                    |  2 +-
 4 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 695e0d50c6..cd89e917c5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -405,7 +405,6 @@ package/gerbera/S99gerbera lib_sysv.Indent
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch lib_patch.Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.Upstream
-package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
 package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
diff --git a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch b/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
deleted file mode 100644
index cbba80b00a..0000000000
--- a/package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 893a75202407e8ff3d75b217813a5df87da7c807 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Jan 2019 21:07:11 +0100
-Subject: [PATCH] Make.defaults: don't override ARCH when cross-compiling
-
-Don't override the user-provided ARCH when cross-compiling otherwise
-ARCH won't be correct for armv5, aarch64 and x86_64
-
-Fixes:
- - http://autobuild.buildroot.org/results/2dfc0e10da25a8382a43557420d7dc3444c02dbb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Make.defaults | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Make.defaults b/Make.defaults
-index 1347aca..bb21874 100755
---- a/Make.defaults
-+++ b/Make.defaults
-@@ -99,7 +99,7 @@ ARCH          ?= $(shell $(HOSTCC) -dumpmachine | cut -f1 -d- | sed -e s,i[34567
- 
- # Get ARCH from the compiler if cross compiling 
- ifneq ($(CROSS_COMPILE),)
--  override ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
-+  ARCH := $(shell $(CC) -dumpmachine | cut -f1 -d-| sed -e s,i[3456789]86,ia32, -e 's,armv[67].*,arm,' )
- endif
- 
- # FreeBSD (and possibly others) reports amd64 instead of x86_64
--- 
-2.47.1
-
diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 5a2f47cfae..d0bcb49514 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a2e5dfd25e7fc0cd2027d75dc2517b4c74d94f801ff4784eca557ac1b9835899  gnu-efi-4.0.0.tar.gz
+sha256  40b61e842a4efcbf80f3e53b2f220c044e8cfe46eb4dd6396c83b751240b1c0d  gnu-efi-4.0.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  licenses/LICENSE.efilib
 sha256  7aa278b6f1a2125d0a0c596fa537caca5a41e7b03f7d2dd0489905f65ffdb984  licenses/LICENSE.edk2
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 268e5350cf..aa2744ae1a 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 4.0.0
+GNU_EFI_VERSION = 4.0.4
 GNU_EFI_SITE = $(call github,ncroxon,gnu-efi,$(GNU_EFI_VERSION))
 GNU_EFI_INSTALL_STAGING = YES
 GNU_EFI_LICENSE = BSD-3-Clause and/or GPL-2.0+ (gnuefi), BSD-3-Clause (efilib), BSD-2-Clause-Patent (EDK2 routines)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
