Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A182FFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796744298B;
	Fri, 24 Apr 2026 16:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxyEsMLUkkI4; Fri, 24 Apr 2026 16:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98A6F4299A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047969;
	bh=QKrIDulg/ww1zyqMCAz043VgouQ0QqySxvOqCJMdgCE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E/h0qjspC6y0EAw1KW4I7c+Gs3A4Wr1CYq8VmiXDSQUDapBFDx+nzmYbmB0hE1pEF
	 NHmoSBdQeelqjlYehHYi+XqI2ULwbjQkrRVh8pt+1u3d6Xz5meX8dno95yuBfiKG7n
	 JXdzGXH4X1zERc6Wvs8rWwEAeh+6S+6yaEHeEio3ZzEW7dcBdnq5aLCzSwRFIOJqC1
	 ud4ylM2SVDPAz8cDOhM4Mm8niyUJIl+q69CDysehJmMD1f/yWNpbjSVWrPQh0sUbC7
	 c55leTFXYBJk0NK00QqmKmiANQGQ8bQD/4spFsJxITceji89DebXUeVI6+5uIs35LV
	 kaiA1ovLZiEGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A6F4299A;
	Fri, 24 Apr 2026 16:26:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F20824D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F05094295E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Cj3qBo4NBRj for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D3E842958
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D3E842958
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5564F82AE9; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 50ceec630e5478d041ad074613dded110ffbd5ad
X-Git-Newrev: 3493ab358d0012129731a3b3ed2b9490a2084801
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.5564F82AE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wolfssl: fix
 build with libcurl >= 8.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3493ab358d0012129731a3b3ed2b9490a2084801
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

wolfssl requires definition of SIZEOF_LONG_LONG. Commit 3a5e071e4f9
("package/libcurl: security bump to version 8.19.0") removed
SIZEOF_LONG_LONG definitions from libcurl autotools build system,
breaking build with wolfssl.

Fixes:
https://autobuild.buildroot.net/results/baa/baa74a47464ed3e21d0adad64dd0c7c708c9ef85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 50feb8738464448c74a7e51e037716fa6a2f38f3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ..._LIMITS_H-in-options.h-rather-than-config.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
new file mode 100644
index 0000000000..67f9672c2a
--- /dev/null
+++ b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
@@ -0,0 +1,60 @@
+From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
+From: Kareem <kareem@wolfssl.com>
+Date: Fri, 27 Mar 2026 17:01:02 -0700
+Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
+ types.h depends on this definition and config.h isn't consistently available
+ at runtime. Fixes #9936.
+
+Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
+
+[Bernd: rebased for 5.7.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cmake/config.in    | 3 ---
+ cmake/options.h.in | 3 +++
+ configure.ac       | 4 +++-
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/cmake/config.in b/cmake/config.in
+index f2524e41e43..6054b6dbe7b 100644
+--- a/cmake/config.in
++++ b/cmake/config.in
+@@ -19,9 +19,6 @@
+ /* Define to 1 if you have the `gmtime_r' function. */
+ #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
+ 
+-/* Define to 1 if you have the <limits.h> header file. */
+-#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
+-
+ /* Define to 1 if you have the <pcap/pcap.h> header file. */
+ #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
+ 
+diff --git a/cmake/options.h.in b/cmake/options.h.in
+index 985b54241d6..c46ada8045d 100644
+--- a/cmake/options.h.in
++++ b/cmake/options.h.in
+@@ -31,6 +31,9 @@ extern "C" {
+ #endif
+ 
+ #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
++/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
++#undef HAVE_LIMITS_H
++#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
+ #undef _GNU_SOURCE
+ #cmakedefine _GNU_SOURCE
+ #undef _POSIX_THREADS
+diff --git a/configure.ac b/configure.ac
+index bce600f2ecc..c5cf9f320c7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -116,7 +116,9 @@
+     AM_CCASFLAGS="$AM_CCASFLAGS -DWOLFSSL_EXPERIMENTAL_SETTINGS"
+ fi
+ 
+-AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
++AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
++# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
++AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
+ AC_CHECK_LIB([network],[socket])
+ AC_C_BIGENDIAN
+ AC_C___ATOMIC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
