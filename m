Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9551FCC05A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E19783DDF;
	Fri,  6 Mar 2026 18:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMPrSkRluWsr; Fri,  6 Mar 2026 18:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E2183DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822445;
	bh=lD7pnuTsrJXP0wt8ZvaTyZfhGBnjzl3wycwrw4kF7V0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KOtaQVb1WEFCI8TvLxLnclIL0J2NOg8fxdf5A3DcRxHEg+a3xW72JaNbP/vZPV+8Q
	 eugzYN1gXIwDihJo3ZsPD8YT4vCbJa1kPNDhuoaglgZcIX5KcZz01UfmUKOEKKsq3h
	 6J4ZPDOoydl0+tTRi1os2GiBFzj2YKImPpfRIElZ9sVIfKIi5Xo4ojojRUNLajQPzo
	 t0vCsVuIeRba2ZVNQHyxx1qTWDnPG9S5yDV/L+u9CM2jXPzxpdz1XMtsbildGXWkXx
	 k0h1AZ/aWDiL8xBV+ytI2c/DD4gfXRmacPZ1P+BxJtkMRXYllA+EDXaWHLkt96563N
	 k73XSf/43Oy1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E2183DD6;
	Fri,  6 Mar 2026 18:40:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F7925B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C76661398
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz7Utzh0lvMY for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FC361397
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85FC361397
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 784F0867A2; Fri,  6 Mar 2026 18:40:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 19:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 876e987099c4e1bbd5710fa75e4187469f8969dc
X-Git-Newrev: eb5086ae7abb3e4127bceb156363939273645044
X-Patchwork-Hint: ignore
Message-Id: <20260306184030.784F0867A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: fix build with glibc 2.43
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eb5086ae7abb3e4127bceb156363939273645044
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

sntp/crypto.c includes sntp/config.h, then sntp/crypto.h which includes
ntp_stdlib.h which in turn includes l_stdlib.h that contains

  #ifndef HAVE_MEMCHR
  extern void *memchr(const void *s, int c, size_t n);
  #endif

and breaks the build with glibc 2.43.

sntp/config.h does not contain any information about memchr() while the
top-level config.h does but this top-level config.h is not included
because sntp/Makefile lacks -I$(top_builddir) so sntp/config.h gets
included which does not define HAVE_MEMCHR although glibc does provide
memchr() but sntp/configure lacks a check for memchr().

This was not a problem with previous glibc versions but due to recent
C23 changes in glibc the ntp build is now broken.

To fix the problem we add a configure check for memchr() to
sntp/configure so HAVE_MEMCHR gets defined in sntp/config.h.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ntp/0007-memchr.patch | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/ntp/0007-memchr.patch b/package/ntp/0007-memchr.patch
new file mode 100644
index 0000000000..a9c21042be
--- /dev/null
+++ b/package/ntp/0007-memchr.patch
@@ -0,0 +1,42 @@
+Fix build with glibc 2.43
+
+sntp/crypto.c includes sntp/config.h, then sntp/crypto.h which includes
+ntp_stdlib.h which in turn includes l_stdlib.h that contains
+
+  #ifndef HAVE_MEMCHR
+  extern void *memchr(const void *s, int c, size_t n);
+  #endif
+
+and breaks the build with glibc 2.43:
+
+./../include/l_stdlib.h:225:14: error: expected identifier or '(' before '_Generic'
+  225 | extern void *memchr(const void *s, int c, size_t n);
+
+sntp/config.h does not contain any information about memchr() while the
+top-level config.h does but this top-level config.h is not included
+because sntp/Makefile lacks -I$(top_builddir) so sntp/config.h gets
+included which does not define HAVE_MEMCHR although glibc does provide
+memchr() but sntp/configure lacks a check for memchr().
+
+This was not a problem with previous glibc versions but due to recent
+C23 changes in glibc the ntp build is now broken.
+
+To fix the problem we add a configure check for memchr() to
+sntp/configure so HAVE_MEMCHR gets defined in sntp/config.h.
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=4015
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uNr ntp-4.2.8p18/sntp/m4/ntp_libntp.m4 ntp-4.2.8p18/sntp/m4/ntp_libntp.m4
+--- ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2024-05-07 13:21:13.000000000 +0200
++++ ntp-4.2.8p18/sntp/m4/ntp_libntp.m4	2026-02-19 21:50:37.291724180 +0100
+@@ -77,7 +77,7 @@
+     ;;
+ esac
+ 
+-AC_CHECK_FUNCS([getclock stime timegm strlcpy strlcat])
++AC_CHECK_FUNCS([getclock memchr stime timegm strlcpy strlcat])
+ 
+ # Bug 2713
+ LDADD_LIBUTIL=
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
