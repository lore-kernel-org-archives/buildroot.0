Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB60CC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 881F281E2B;
	Tue,  7 Feb 2023 17:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881F281E2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiiGgEQOmOmu; Tue,  7 Feb 2023 17:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DEF181E2D;
	Tue,  7 Feb 2023 17:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DEF181E2D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5EE91BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DC6D40A68
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DC6D40A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7iCTpSyWn8P for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:03:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D56940120
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D56940120
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:03:09 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 7D0F320C39;
 Tue,  7 Feb 2023 11:03:07 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 11:03:03 -0600
Message-Id: <20230207170303.2508780-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1675789387; bh=ZmWAbyx7GzZVdQQ+zrsi0PL5z4jZFx59cRPv27cIyAE=;
 h=From:To:Cc:Subject:Date:From;
 b=ZIwQfgUvrwXYU9dmXzolzBN0tv+MCx5j/FY1+Kv7yo5h/nUGnPy56MrRCpYG13/jt
 xoMPAP0p3edzHJ2AbCh/cwQrjq3LIFmURtsn+G+ufm0MJjaFtIZJAH8C9WbAuxSK5b
 sUOTqZ3uqgtsC30sCBUXCjaAicuSFaq/jvvIc9CM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=ZIwQfgUv
Subject: [Buildroot] [PATCH 1/1] package/xz: fix microblaze compiles
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
Cc: Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Patch xz to check if __attribute__((symver ..)) is supported via a
compile check during configure.

Fixes:
  http://autobuild.buildroot.org/results/c0d/c0de72e5a34b379e0c516ad08984bb2c4b0abb5c//

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...0001-Detect-symver-attribute-support.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/xz/0001-Detect-symver-attribute-support.patch

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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
