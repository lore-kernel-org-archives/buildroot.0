Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A17D10BF0
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 10:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9102D40643;
	Sat, 26 Oct 2024 10:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3ao3seaLjmY; Sat, 26 Oct 2024 10:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C808405F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C808405F8;
	Sat, 26 Oct 2024 10:48:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DEAEC5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6C5605E1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAPW-DnUr4ab for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 10:48:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06096060E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E06096060E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 10:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7A4B83915; Sat, 26 Oct 2024 10:48:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 12:45:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10d25d98edbc75d47f6a8838d91d39e48b12c895
X-Git-Newrev: 4cf0fd8e9e3f05ec2e2841ef496abb89573d41f8
X-Patchwork-Hint: ignore
Message-Id: <20241026104823.C7A4B83915@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: fix build with uClibc-ng
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4cf0fd8e9e3f05ec2e2841ef496abb89573d41f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling coreutils with uClibc-ng, build is failing with error:

    In file included from lib/mcel.c:3:
    lib/mcel.h: In function 'mcel_scan':
    lib/mcel.h:226:21: error: 'mbstate_t' has no member named '__count'
      226 |   mbstate_t mbs; mbs.__count = 0;
          |                     ^

The problem was reported by Waldemar Brodkorb in:
https://lists.gnu.org/r/bug-gnulib/2024-08/msg00130.html

This commit adds a package patch that modifies mcel_scan to avoid
treating uClibc-ng as if it were glibc, resolving compatibility
issues.

Specifically, uClibc-ng was incorrectly treated like glibc in the code,
which led to incorrect assumptions about the mbstate_t initialization.

Fixes:
- https://autobuild.buildroot.org/results/34f4e23e325a03ab37fd5a0a564780b9e0d631cd/

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
[Julien:
  - slightly reworded the commit log
  - fixed package patch encoding
  - add the Upstream: tag in package patch
  - add the Fixes: link in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-coreutils-mcel-port-to-uClibc-ng.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch b/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
new file mode 100644
index 0000000000..7639509ff2
--- /dev/null
+++ b/package/coreutils/0001-coreutils-mcel-port-to-uClibc-ng.patch
@@ -0,0 +1,35 @@
+From c4e923a98f34fe5f5ec3b49543e90716ec2a45fc Mon Sep 17 00:00:00 2001
+From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
+Date: Tue, 24 Sep 2024 18:08:31 +0200
+Subject: [PATCH] coreutils: mcel: port to uClibc-ng
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Waldemar Brodkorb in:
+https://lists.gnu.org/r/bug-gnulib/2024-08/msg00130.html
+* lib/mcel.h (mcel_scan): Don't treat uClibc-ng like glibc.
+
+Upstream: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=9765bc796b3e6ceaa7a10ba07c9c2f1e272a4249
+Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
+---
+ lib/mcel.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/mcel.h b/lib/mcel.h
+index f6f006c..dca4d08 100644
+--- a/lib/mcel.h
++++ b/lib/mcel.h
+@@ -221,7 +221,8 @@ mcel_scan (char const *p, char const *lim)
+ 
+   /* An initial mbstate_t; initialization optimized for some platforms.
+      For details about these and other platforms, see wchar.in.h.  */
+-#if defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__)
++#if (defined __GLIBC__ && 2 < __GLIBC__ + (2 <= __GLIBC_MINOR__) \
++	&& !defined __UCLIBC__)
+   /* Although only a trivial optimization, it's worth it for GNU.  */
+   mbstate_t mbs; mbs.__count = 0;
+ #elif (defined __FreeBSD__ || defined __DragonFly__ || defined __OpenBSD__ \
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
