Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C173BC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CECE6110F;
	Tue, 28 Feb 2023 15:59:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CECE6110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlQ-m8xkYpSA; Tue, 28 Feb 2023 15:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79FDF6115B;
	Tue, 28 Feb 2023 15:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79FDF6115B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD8811BF20F
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 840C0418DF
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 840C0418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yoJpnigdv1ac for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EF03418AD
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EF03418AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AFA186D0E; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:47:23 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f5d7c229e43c95309692c33c5830a39cf5e2799a
X-Git-Newrev: f260466243b3a87b11e6af3eb85b767a95f582f3
X-Patchwork-Hint: ignore
Message-Id: <20230228155909.3AFA186D0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/xz: fix
 microblaze compiles
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

commit: https://git.buildroot.net/buildroot/commit/?id=f260466243b3a87b11e6af3eb85b767a95f582f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Patch xz to check if __attribute__((symver ..)) is supported via a
compile check during configure.

Fixes:
  http://autobuild.buildroot.org/results/c0d/c0de72e5a34b379e0c516ad08984bb2c4b0abb5c//

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bed21bb9b462bece7cd1b9741643aa553ced4d35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xz/0001-Detect-symver-attribute-support.patch  | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/xz/0001-Detect-symver-attribute-support.patch b/package/xz/0001-Detect-symver-attribute-support.patch
new file mode 100644
index 0000000000..9ec43ea7a0
--- /dev/null
+++ b/package/xz/0001-Detect-symver-attribute-support.patch
@@ -0,0 +1,61 @@
+From 231add523328ad9e021d8f2b02697b6a11719430 Mon Sep 17 00:00:00 2001
+From: Vincent Fazio <vfazio@gmail.com>
+Date: Tue, 7 Feb 2023 08:51:24 -0600
+Subject: [PATCH] Detect symver attribute support
+
+On non-ELF platforms, such as microblaze, builds will fail when trying
+to add symver information because  __attribute__((symver ..)) is not
+supported even though __has_attribute(__symver__) returns true.
+
+Support for symver needs to be detected via a compile test since
+__has_attribute can report false positives [0].
+
+Add a configure compile check for __attribute__((symver ..)) to ensure
+it is supported and define a variable to advertise support.
+
+[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c1
+
+Upstream: https://github.com/tukaani-project/xz/pull/32
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+---
+ configure.ac                | 9 +++++++++
+ src/liblzma/common/common.h | 2 +-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5ad5589..08c623a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -791,6 +791,15 @@ else
+ 				time with Libtool if neither --with-pic nor
+ 				--without-pic is used). This define must be
+ 				used together with liblzma_linux.map.])
++			OLD_CFLAGS="$CFLAGS"
++			CFLAGS="$CFLAGS -Werror"  # we need -Werror to make sure the attribute is not ignored
++			AC_COMPILE_IFELSE([AC_LANG_SOURCE(
++				[__attribute__ ((symver ("test@TEST"))) void foo(void) { }
++				])],
++				[AC_DEFINE([HAVE_SYMVER_ATTRIBUTE], [1],
++					[Define to 1 if GCC supports the symver attribute])],
++				[])
++			CFLAGS="$OLD_CFLAGS"
+ 			;;
+ 		*)
+ 			enable_symbol_versions=generic
+diff --git a/src/liblzma/common/common.h b/src/liblzma/common/common.h
+index 11fec52..1d2ef9c 100644
+--- a/src/liblzma/common/common.h
++++ b/src/liblzma/common/common.h
+@@ -76,7 +76,7 @@
+ // too (which doesn't support __symver__) so use it to detect if __symver__
+ // is available. This should be far more reliable than looking at compiler
+ // version macros as nowadays especially __GNUC__ is defined by many compilers.
+-#	if lzma_has_attribute(__symver__)
++#	if defined(HAVE_SYMVER_ATTRIBUTE) 
+ #		define LZMA_SYMVER_API(extnamever, type, intname) \
+ 			extern __attribute__((__symver__(extnamever))) \
+ 					LZMA_API(type) intname
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
