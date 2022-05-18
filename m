Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDFCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 07:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0736040223;
	Wed, 18 May 2022 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tERlapof20Bo; Wed, 18 May 2022 07:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73D4D40CAF;
	Wed, 18 May 2022 07:19:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E57F1BF9AD
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 07:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEDC9402B1
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 07:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BISLGKqYxDt3 for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 07:19:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3895F40CAF
 for <buildroot@buildroot.org>; Wed, 18 May 2022 07:19:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F0A9985FC7; Wed, 18 May 2022 07:08:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 09:18:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feda018834aa59d8b9398604f9c91e08de87943f
X-Git-Newrev: a03d82b1b9a117b0303f75f90066bc6eeaa8f58d
X-Patchwork-Hint: ignore
Message-Id: <20220518070828.F0A9985FC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: bump to version 0.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a03d82b1b9a117b0303f75f90066bc6eeaa8f58d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version now allows to disable building tests, which allows dropping
the patch "0001-meson-add-tests-option.patch", and contains a few minor
fixes. Release notes can be found at:

  https://github.com/containers/bubblewrap/releases/tag/v0.6.2

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../bubblewrap/0001-meson-add-tests-option.patch   | 54 ----------------------
 package/bubblewrap/bubblewrap.hash                 |  4 +-
 package/bubblewrap/bubblewrap.mk                   |  2 +-
 3 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/package/bubblewrap/0001-meson-add-tests-option.patch b/package/bubblewrap/0001-meson-add-tests-option.patch
deleted file mode 100644
index 32836f925d..0000000000
--- a/package/bubblewrap/0001-meson-add-tests-option.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 34ea0ad841d6f9167db391c08e6cd51471fed6be Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 Apr 2022 11:27:06 +0200
-Subject: [PATCH] meson: add tests option
-
-Allow the user to disable tests, for example to avoid the following
-build failure on mips32:
-
-FAILED: tests/try-syscall.p/try-syscall.c.o
-/home/autobuild/autobuild/instance-11/output-1/host/bin/mipsel-buildroot-linux-musl-gcc -Itests/try-syscall.p -Itests -I../tests -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -O3 -D_GNU_SOURCE -Werror=shadow -Werror=empty-body -Werror=strict-prototypes -Werror=missing-prototypes -Werror=implicit-function-declaration -Werror=pointer-arith -Werror=init-self -Werror=missing-declarations -Werror=return-type -Werror=overflow -Werror=int-conversion -Werror=incompatible-pointer-types -Werror=misleading-indentation -Werror=missing-include-dirs -Werror=aggregate-return -Werror=switch-default -Wswitch-enum -Wno-sign-compare -Wno-error=sign-compare -Wno-missing-field-initializers -Wno-error=missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O1 -g0 -MD -MQ tests/try-syscall.p/try-syscall.c.o -MF tests/try-syscall.p/try-syscall.c.o.d -o tests/try-syscall.p/try-syscall.c.o -c ../tests/try-syscall.c
-../tests/try-syscall.c:34:5: error: #error "Unknown MIPS ABI"
-   34 | #   error "Unknown MIPS ABI"
-      |     ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cf0365354fc8c16e5871d561daae0fa5039d0bee
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/containers/bubblewrap/commit/34ea0ad841d6f9167db391c08e6cd51471fed6be]
----
- meson.build       | 4 +++-
- meson_options.txt | 6 ++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 5b63aa64..9277ac4e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -152,4 +152,6 @@ if not meson.is_subproject()
-   subdir('completions')
- endif
- 
--subdir('tests')
-+if get_option('tests')
-+  subdir('tests')
-+endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 2fa3a8c3..a136a3c3 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -38,6 +38,12 @@ option(
-   description : 'enable optional SELINUX support',
-   value : 'auto',
- )
-+option(
-+  'tests',
-+  type : 'boolean',
-+  description : 'build tests',
-+  value : 'true',
-+)
- option(
-   'zsh_completion',
-   type : 'feature',
diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index c3bf4d8212..98fafc3679 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.6.1
-sha256  9609c7dc162bc68abc29abfab566934fdca37520a15ed01b675adcf3a4303282  bubblewrap-0.6.1.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.6.2
+sha256  8a0ec802d1b3e956c5bb0a40a81c9ce0b055a31bf30a8efa547433603b8af20b  bubblewrap-0.6.2.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 81456e9e0d..91864d2b76 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.6.1
+BUBBLEWRAP_VERSION = 0.6.2
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
