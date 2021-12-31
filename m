Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809BBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 15:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C67408A0;
	Fri, 31 Dec 2021 15:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlEmaZJlKOAa; Fri, 31 Dec 2021 15:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3818E40893;
	Fri, 31 Dec 2021 15:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9350A1BF5DE
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 15:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ECA681A5F
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 15:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQpVFEC887Ba for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 15:12:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DDC081A5C
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 15:12:58 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A74B831E0240; Fri, 31 Dec 2021 16:12:52 +0100 (CET)
Date: Fri, 31 Dec 2021 16:12:52 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Yc8d9Fv5ku17m5IP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Subject: [Buildroot] [PATCH] package/ruby: update to 3.1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All patches are upstream. Tested with qemu-system-arm/qemu-system-sparc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...0001-fix-default-coroutine-selection.patch | 21 --------------
 package/ruby/0002-Needs-AC_PROG_CC.patch      | 28 -------------------
 package/ruby/ruby.hash                        |  4 +--
 package/ruby/ruby.mk                          |  8 ++----
 4 files changed, 5 insertions(+), 56 deletions(-)
 delete mode 100644 package/ruby/0001-fix-default-coroutine-selection.patch
 delete mode 100644 package/ruby/0002-Needs-AC_PROG_CC.patch

diff --git a/package/ruby/0001-fix-default-coroutine-selection.patch b/package/ruby/0001-fix-default-coroutine-selection.patch
deleted file mode 100644
index ea84aa9bc6..0000000000
--- a/package/ruby/0001-fix-default-coroutine-selection.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-fixed default coroutine selection for musl/uclibc
-
-https://github.com/ruby/ruby/pull/3567/commits/b570e7de87aaad8c903176d835e8124127f627b3
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur ruby-3.0.0.orig/configure.ac ruby-3.0.0/configure.ac
---- ruby-3.0.0.orig/configure.ac	2020-12-25 04:33:01.000000000 +0100
-+++ ruby-3.0.0/configure.ac	2021-02-22 13:00:53.990314464 +0100
-@@ -2441,7 +2441,10 @@
-             rb_cv_coroutine=copy
-         ],
-         [
--            rb_cv_coroutine=ucontext
-+        AC_CHECK_FUNCS([getcontext swapcontext makecontext],
-+               [rb_cv_coroutine=ucontext],
-+               [rb_cv_coroutine=copy; break]
-+	       )
-         ]
-     )
-     AC_MSG_RESULT(${rb_cv_coroutine})
diff --git a/package/ruby/0002-Needs-AC_PROG_CC.patch b/package/ruby/0002-Needs-AC_PROG_CC.patch
deleted file mode 100644
index 647358be70..0000000000
--- a/package/ruby/0002-Needs-AC_PROG_CC.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6 Mon Sep 17 00:00:00 2001
-From: Nobuyoshi Nakada <nobu@ruby-lang.org>
-Date: Thu, 30 Sep 2021 18:24:37 +0900
-Subject: [PATCH] Needs `AC_PROG_CC`
-
-Although `AC_PROG_CC_C99` has been obsolete, `AC_PROG_CC` is not
-and the latter is necessary not to make C++ compiler mandatory.
-
-[Retrieved from:
-https://github.com/ruby/ruby/commit/912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b24a8f59b0d2..c7059ee1ecf4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -218,7 +218,7 @@ rb_test_CXXFLAGS=${CXXFLAGS+yes}
- # BSD's ports and MacPorts prefix GNU binutils with 'g'
- 
- dnl Seems necessarily in order to add -std=gnu99 option for gcc 4.9.
--m4_version_prereq([2.70], [], [AC_PROG_CC_C99])
-+m4_version_prereq([2.70], [AC_PROG_CC], [AC_PROG_CC_C99])
- 
- AC_PROG_CXX
- AC_PROG_CPP
diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index 1208461cd0..93708a4d7d 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2021/11/24/ruby-3-0-3-released/
-sha512  bb9ea426278d5a7ac46595296f03b82d43df8b7db41045cdf85611e05e26c703c53f700494cd7cf5d4c27fa953bdc5c144317d7720812db0a6e3b6f4bc4d2e00  ruby-3.0.3.tar.xz
+# https://www.ruby-lang.org/en/news/2021/12/25/ruby-3-1-0-released/
+sha512  a2bb6b5e62d5fa06dd9c30cf84ddcb2c27cb87fbaaffd2309a44391a6b110e1dde6b7b0d8c659b56387ee3c9b4264003f3532d5a374123a7c187ebba9293f320  ruby-3.1.0.tar.xz
 # License files, Locally calculated
 sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 7966450fd1..0bb4391e33 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-RUBY_VERSION_MAJOR = 3.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
-RUBY_VERSION_EXT = 3.0.0
+RUBY_VERSION_MAJOR = 3.1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).0
+RUBY_VERSION_EXT = 3.1.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
@@ -20,8 +20,6 @@ HOST_RUBY_CONF_OPTS = \
 RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 RUBY_CPE_ID_VENDOR = ruby-lang
-# 0001-fix-default-coroutine-selection.patch
-RUBY_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 RUBY_CONF_ENV += LIBS=-latomic
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
