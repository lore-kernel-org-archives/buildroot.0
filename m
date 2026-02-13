Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2EEEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19217403CE;
	Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wiZteOGC6vQj; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26EF741E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011422;
	bh=IfzEPmnjRWOQgUtXcaV+yQbV0NvZ5t6y0NGACsjHBMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HkUR2YK1N6OvttEPZnKCwhePFRqcyJoV27+aiNaVW+7LxPQ0L9vxsKb80YoZGXpOL
	 N88aJTIn6dlDifceDuvUUaC771S+tgA30UNikkz9NzqozMbZLbPi+9Wd3HfrsLBjxI
	 0DSgYId9PzxZ5S29l+Fl3peRRNpkW+LjVWLFAvtc9INK3tz25f3x56nIJ1SeJ2euOV
	 /ao8/SHf8Z8N1+fxOfLABW9cHytRMo2J+ulM+0CSeht9TTpXZZ+hw03E1MZJIM+3um
	 rumZwjpZrS7w+D9Bi1qnua7sK7/sOJAbD51UJELs+XVTBpTXsWPWZIrIebUI1ANDPI
	 FDkCXt8+6iprA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26EF741E4B;
	Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 047A169
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16E18844FD
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7mXqjmQJpmZ for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A61484560
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A61484560
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F4DA83A88; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:31:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 52b7641c62b26724b75375fdcb36e1c4a6d8b580
X-Git-Newrev: eea5fba3d4de8bae1df515c27d37083603ed04d1
X-Patchwork-Hint: ignore
Message-Id: <20260213193529.5F4DA83A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/brltty: fix musl
 build
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eea5fba3d4de8bae1df515c27d37083603ed04d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da/

The build error was not introduced by the recent bump to 6.8. The oldest
build error with the previous brltty version 6.6 used in buildroot dates
back to 2023:
https://autobuild.buildroot.net/results/78a/78a7fe6edfb84c2b15fff32aa475c975ecd5bdbc/

and with brltty 6.4 to 2022:
https://autobuild.buildroot.net/results/a5b/a5b338ce9865fc7afaecd9b671e6a8f290548374/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 06eacc370d643d1c55e5bc49edf9bfa66876f34f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../brltty/0002-check-for-functions-inb-outb.patch | 98 ++++++++++++++++++++++
 package/brltty/brltty.mk                           |  6 +-
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/package/brltty/0002-check-for-functions-inb-outb.patch b/package/brltty/0002-check-for-functions-inb-outb.patch
new file mode 100644
index 0000000000..64f2a2d7a7
--- /dev/null
+++ b/package/brltty/0002-check-for-functions-inb-outb.patch
@@ -0,0 +1,98 @@
+From 876bdd3153c791a51422a43403143ff10acb6e82 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 3 Jan 2026 15:35:48 +0100
+Subject: [PATCH] check for functions inb & outb
+
+Musl C library provides sys/io.h but inb and outb are missing on some
+archs. This patch adds a configure check ported from sane-backends:
+https://github.com/solanoalves/sane-backend/blob/059b97962ecb1b1ab068f524988d16c5b55bbd29/configure.ac#L314
+to fix build errors detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/76d/76d18437241d1281566b76ed1cec2ba99c3532da//build-end.log
+
+./ports_glibc.c: In function 'readPort1':
+./ports_glibc.c:54:10: error: implicit declaration of function 'inb' [-Wimplicit-function-declaration]
+   54 |   return inb(port);
+      |          ^~~
+./ports_glibc.c: In function 'writePort1':
+./ports_glibc.c:63:3: error: implicit declaration of function 'outb' [-Wimplicit-function-declaration]
+   63 |   outb(value, port);
+      |   ^~~~
+
+Upstream: https://github.com/brltty/brltty/commit/85cadac951cda709ce53d49923114595c16a8f16
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Programs/ports_glibc.c |  4 ++--
+ config.h.in            |  3 +++
+ configure.ac           | 19 +++++++++++++++++++
+ 3 files changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/Programs/ports_glibc.c b/Programs/ports_glibc.c
+index 4233f9ea0..4a57f626d 100644
+--- a/Programs/ports_glibc.c
++++ b/Programs/ports_glibc.c
+@@ -50,7 +50,7 @@ disablePorts (unsigned short int base, unsigned short int count) {
+ 
+ unsigned char
+ readPort1 (unsigned short int port) {
+-#ifdef HAVE_SYS_IO_H
++#ifdef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
+   return inb(port);
+ #else /* HAVE_SYS_IO_H */
+   return 0;
+@@ -59,7 +59,7 @@ readPort1 (unsigned short int port) {
+ 
+ void
+ writePort1 (unsigned short int port, unsigned char value) {
+-#ifdef HAVE_SYS_IO_H
++#ifdef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
+   outb(value, port);
+ #endif /* HAVE_SYS_IO_H */
+ }
+diff --git a/config.h.in b/config.h.in
+index 537d3af92..edea70cea 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -331,6 +331,9 @@ extern "C" {
+ /* Define this if the header file sys/io.h exists. */
+ #undef HAVE_SYS_IO_H
+ 
++/* Define to 1 if you have the <sys/io.h> providing inb,outb. */
++#undef BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB
++
+ /* Define this if the header file sys/modem.h exists. */
+ #undef HAVE_SYS_MODEM_H
+ 
+diff --git a/configure.ac b/configure.ac
+index b78d482f6..0a2a70dd0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -961,6 +961,25 @@ AC_CHECK_FUNCS([shmget shm_open])
+ AC_CHECK_FUNCS([getpeereid getpeerucred getzoneid])
+ AC_CHECK_FUNCS([mempcpy wmempcpy])
+ 
++dnl sys/io.h might provide ioperm but not inb,outb (like for
++dnl non i386/x32/x86_64 with musl libc)
++if test "${ac_cv_header_sys_io_h}" = "yes"; then
++  AC_MSG_CHECKING([for inb,outb (provided by sys/io.h)])
++  AC_LINK_IFELSE(
++    [AC_LANG_PROGRAM([[#include <sys/io.h>]],
++      [[inb(0);outb(0,0);]])],
++    [AC_MSG_RESULT([yes])
++      brltty_cv_have_sys_io_h_with_inb_outb="yes"],
++    [AC_MSG_RESULT([no])
++      brltty_cv_have_sys_io_h_with_inb_outb="no"
++      AC_MSG_WARN([sys/io.h does not provide inb,outb (non i386/x32/x86_64 arch?)])])
++  if test "$brltty_cv_have_sys_io_h_with_inb_outb" = "yes"; then
++    AC_DEFINE(BRLTTY_HAVE_SYS_IO_H_WITH_INB_OUTB, 1, [Define to 1 if you have the <sys/io.h> providing inb,outb.])
++  fi
++else
++  brltty_cv_have_sys_io_h_with_inb_outb="no"
++fi
++
+ case "${host_os}"
+ in
+    cygwin*|mingw*)
+-- 
+2.47.3
+
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 22d58ebd00..988e7310cb 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -37,8 +37,10 @@ BRLTTY_CONF_OPTS = \
 	--without-theta
 
 # Autoreconf is needed because we're patching configure.ac in
-# 0001-Fix-linking-error-on-mips64el. However, a plain autoreconf doesn't work,
-# because this package is only autoconf-based.
+# 0001-Fix-linking-error-on-mips64el and
+# 0002-check-for-functions-inb-outb.patch
+# However, a plain autoreconf doesn't work, because this package
+# is only autoconf-based.
 define BRLTTY_AUTOCONF
 	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
