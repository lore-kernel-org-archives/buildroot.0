Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56405C8303F
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 08:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 265494149E;
	Fri, 29 Aug 2025 08:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5QOXjXITXMi; Fri, 29 Aug 2025 08:51:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 255C64145A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 255C64145A;
	Fri, 29 Aug 2025 08:51:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D6F0D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 042044150B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWFWScFH1ayX for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 08:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 336AB4151B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 336AB4151B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 08:51:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BDB387D07; Fri, 29 Aug 2025 08:51:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 10:47:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba24015307567f9d899861ee12b84e63cd49483c
X-Git-Newrev: ffd00280315e60908d0d317b1dfb4c714590a03e
X-Patchwork-Hint: ignore
Message-Id: <20250829085122.2BDB387D07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: drop !uclibc || headers
 5.1 dependency
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffd00280315e60908d0d317b1dfb4c714590a03e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The following dependency:

  depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

was added by commit d63e207eb869063f82c867658676c2903beb08cb, which
bumped python3 from 3.12.9 to 3.13.2.

The commit message doesn't state it, but this dependency was introduced
because uClibc without time64 support (i.e. with kernel headers < 5.1)
causes a runtime assertion in Python [1]:

OverflowError: timestamp too large to convert to C PyTime_t

The problem is that this dependency has not been propagated to reverse
dependencies, causing this kind of kconfig warnings:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON3
  Depends on [n]: BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && (!BR2_TOOLCHAIN_USES_UCLIBC [=y] || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 [=n])
  Selected by [y]:
  - BR2_PACKAGE_AVOCADO [=y] && BR2_USE_WCHAR [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]
  - BR2_PACKAGE_LIBSIGROKDECODE [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n]
  - BR2_PACKAGE_OPKG_UTILS [=y] && BR2_PACKAGE_BUSYBOX [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n]

However, propagating this dependency to all reverse dependencies of
python3 would be pretty annoying, especially as the dependency is kind
of "clunky". A configuration with uClibc and kernel headers < 5.1 is
such a corner case that it does not merit such complexity.

A later commit will check for this corner case at build time (while
allowing it in the .config). For now, already drop the dependency in
Config.in.

Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

[1] https://gitlab.com/buildroot.org/buildroot/-/issues/95#note_2348479811
---
 package/python3/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 7491067140..cfc08bad86 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -1,6 +1,6 @@
-comment "python3 needs a toolchain w/ wchar, threads, dynamic library, time64 support"
+comment "python3 needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || (!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 && BR2_TOOLCHAIN_USES_UCLIBC)
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_PYTHON3
 	bool "python3"
@@ -9,7 +9,6 @@ config BR2_PACKAGE_PYTHON3
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1  # need time64 support in uclibc
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
 	select BR2_PACKAGE_HOST_PYTHON3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
