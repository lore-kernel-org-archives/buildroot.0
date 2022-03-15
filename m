Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F06C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C691081551;
	Tue, 15 Mar 2022 21:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCxZaKyzLWoc; Tue, 15 Mar 2022 21:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB0181390;
	Tue, 15 Mar 2022 21:23:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B4ED1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5950E4056D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFzlp7Kx7Rhk for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF06240571
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DE6128408B; Tue, 15 Mar 2022 21:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc66b940cb8655cb0694e0c6a1c74f1eb9c007c
X-Git-Newrev: 56b49691abf4625d3d5915f3956b02f0fbd2ed4b
X-Patchwork-Hint: ignore
Message-Id: <20220315211222.DE6128408B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{gnupg,
 gnupg2}: use gnupg2 by default
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

commit: https://git.buildroot.net/buildroot/commit/?id=56b49691abf4625d3d5915f3956b02f0fbd2ed4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reverses the logic to select gnupg2 by default, while still
allowing to select gnupg (v1).

Quoting: https://gnupg.org/download/index.html
"""
GnuPG 1.4 is the old, single binary version which still support the
unsafe PGP-2 keys. This branch has no dependencies on the above listed
libraries or the Pinentry. However, it lacks many modern features and
will receive only important updates.
"""

gnupg 1.4 is kept in Buildroot for now, as the package is still
maintained upstream. It might still be useful is some specific cases:
- it has a smaller footprint (compared to v2),
- it has less dependencies (only zlib),
- it has less build dependencies (can build static, no need for
MMU/threads, ...)

Most Linux distributions are now shipping gnupg2 by default. gnupg v1
is now more for legacy/compatibility/specific cases.

There is currently only two packages selecting gnupg in Buildroot:
gpgme and python-gnupg
This commit also reverses the logic for those packages. However, this
means we also need to propagate the dependencies of gnupg2, and still
select gnupg if those dependencies are not met. To simplify this, add a
blind option BR2_PACKAGE_GNUPG2_DEPENDS. Note that due to the
intricacies of Kconfig dependencies, "depends on !BR2_PACKAGE_GNUPG"
must *not* be part of BR2_PACKAGE_GNUPG2_DEPENDS.

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: rework dependency handling to make sure gnupg2 dependencies are
properly propagated]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnupg/Config.in        |  1 -
 package/gnupg2/Config.in       | 14 ++++++++++++--
 package/libgpgme/Config.in     |  4 ++--
 package/python-gnupg/Config.in |  3 ++-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
index 2db46318f1..e92fca709d 100644
--- a/package/gnupg/Config.in
+++ b/package/gnupg/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_GNUPG
 	bool "gnupg"
-	depends on !BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_ZLIB
 	help
 	  GnuPG is the GNU project's complete and free implementation
diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index ef1817ef02..043d53554c 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -2,12 +2,22 @@ comment "gnupg2 needs a toolchain w/ threads and dynamic library support"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_GNUPG2
-	bool "gnupg2"
+# helper to make it easier to select gnupg2 or gnupg; usage:
+# select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG
+# select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS
+
+config BR2_PACKAGE_GNUPG2_DEPENDS
+	bool
+	default y
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
 	depends on BR2_USE_MMU # libassuan, libnpth
 	depends on !BR2_STATIC_LIBS
+
+config BR2_PACKAGE_GNUPG2
+	bool "gnupg2"
+	depends on BR2_PACKAGE_GNUPG2_DEPENDS
+	depends on !BR2_PACKAGE_GNUPG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBGCRYPT
diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
index 4aabd06367..16ce27d0ef 100644
--- a/package/libgpgme/Config.in
+++ b/package/libgpgme/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_LIBGPGME
 	bool "libgpgme"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
 	depends on BR2_USE_MMU # libassuan
-	#gnupg is not needed to build, but at runtime.
-	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
+	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	select BR2_PACKAGE_LIBGPG_ERROR
 	select BR2_PACKAGE_LIBASSUAN
 	help
diff --git a/package/python-gnupg/Config.in b/package/python-gnupg/Config.in
index 038a940778..234792977a 100644
--- a/package/python-gnupg/Config.in
+++ b/package/python-gnupg/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GNUPG
 	bool "python-gnupg"
-	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime
+	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG # runtime
+	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime
 	help
 	  A wrapper for the Gnu Privacy Guard (GPG or GnuPG).
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
