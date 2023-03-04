Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3529AC678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 10:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C813841B3B;
	Sat,  4 Mar 2023 10:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C813841B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8eFPEvrhZBr3; Sat,  4 Mar 2023 10:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E74B41901;
	Sat,  4 Mar 2023 10:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E74B41901
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1BF61BF831
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 10:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EDF60A61
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 10:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99EDF60A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFjKJHubjXQ0 for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 10:45:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E91A60A6B
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 10:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E91A60A6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1775186034; Sat,  4 Mar 2023 10:45:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 10:05:29 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d05d79bef0028fad766da813b1cdd2603d951e19
X-Git-Newrev: c22b06335127b275e7e8cfd3bac473b2931ea7f8
X-Patchwork-Hint: ignore
Message-Id: <20230304104514.1775186034@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libmdbx: bump
 version to 0.11.14 "Sergey Kapitsa"
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
Content-Type: multipart/mixed; boundary="===============6249291834563468973=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6249291834563468973==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c22b06335127b275e7e8cfd3bac473b2931ea7f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This is stable bugfix release of libmdbx,
in memory of Sergey Kapitsa (Russian physicist and demographer) on his 95th birthday.

It is reasonable to backport this patch to all applicable releases/branches of Buildroot,
at least this release fixes build for sh4 arch.

Release notes for v0.11.14
--------------------------

Fixes:

 - backport: Refined the `__cold`/`__hot` macros to avoid the
   `error: inlining failed in call to ‘always_inline FOO(...)’: target specific option mismatch`
   issue during build using GCC >10.x for SH4 arch.
   Actually this is GCC' SH4-backend bug which triggered by the `__attribute__((__optimize__("Os")))`
   used in conjunction with the `__attribute__((__cold__))`.

 - backport: Fixed `SIGSEGV` or an erroneous call to `free()` in case where
   errors occur when reopening by `mdbx_env_open()` of a previously used
   environment.

 - backport: Fixed `cursor_put_nochecklen()` internals for case when dupsort'ed named subDb
   contains a single key with multiple values (aka duplicates), which are replaced
   with a single value by put-operation with the `MDBX_UPSERT+MDBX_ALLDUPS` flags.
   In this case, the database becomes completely empty, without any pages.
   However exactly this condition was not considered and thus wasn't handled correctly.
   See [issue#8](https://gitflic.ru/project/erthink/libmdbx/issue/8) for more information.

 - backport: Fixed extra assertion inside `override_meta()`, which could
   lead to false-positive failing of the assertion in a debug builds during
   DB recovery and/or auto-rollback.

Minors:

 - backport: Fixed typos.
 - backport: Refined `const` and `noexcept` for few C++ API methods.
 - backport: Resolve false-posirive `used uninitialized` warning from GCC >10.x
   while build for SH4 arch.
 - backport: Fixed insignificant typo of `||` inside `#if` byte-order condition.

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit efdcc850be902de2596412dbf0f142c3f679ce35)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index e3fb309461..b1a2891b91 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  9449fd357119e19902363ab90134d82c9a713b706394c2a1389b5bb4787b5164  libmdbx-amalgamated-0.11.13.tar.xz
+sha256  97b03965b5b61727dc4232c50ccb174c632470a3d24438b3c52315bef6fb4033  libmdbx-amalgamated-0.11.14.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index a139e062f6..5e7995f8c8 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.13
+LIBMDBX_VERSION = 0.11.14
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============6249291834563468973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6249291834563468973==--
