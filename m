Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3D4ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C119B60AF1;
	Sun, 30 Oct 2022 22:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C119B60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJO2_Bi8kYKc; Sun, 30 Oct 2022 22:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD5B60AE6;
	Sun, 30 Oct 2022 22:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD5B60AE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 492FE1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25845400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25845400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CC4qE3bh-U4 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19009400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19009400CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0576F876BF; Sun, 30 Oct 2022 22:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 22:34:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ad33ff4d77eee483f54add9ed9e2100d558120f
X-Git-Newrev: 0f7bfc80814e90918b9527cab4cbf6afedd22195
X-Patchwork-Hint: ignore
Message-Id: <20221030220110.0576F876BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skalibs: bump to v2.12.0.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f7bfc80814e90918b9527cab4cbf6afedd22195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

New:
 - New djbunix functions: waitn_posix(), waitn_reap_posix()
 - New unix-transactional.h function: opendir_at.
 - New skalibs/posixplz.h function: munmap_void().
 - random functions now have an early version, to use when randomness is
   required before the generator can be seeded (i.e. in programs running in
   the very early boot).
 - envdir_internal() now has a SKALIBS_ENVDIR_NOCLAMP option allowing
   reading of unlimited-size variables.
 - fd_close() now chooses to adapt to Linux's close() behaviour (closing
   the fd on EINTR) over the HP-UX one (not closing it). Destructors like
   close() being allowed to fail has always been a mistake in the
   specification and a programming nightmare, making it impossible to
   behave correctly on all systems, but apparently standardization efforts
   are on the way and the Linux behaviour seems to be the chosen one.

Removed:
 - libbiguint removed.
 - Obsolete skalibs/environ.h and skalibs/getpeereid.h headers removed.
 - rc4 and md5 functions removed.
 - iobuffer removed. fd_cat() and fd_catn() changed signatures.
 - All signal functions entirely reworked; cruft removed.
 - The unsafe cdb_successor() API has been removed.
 - random_init() and random_finish() removed, as well as random_char().

Renamed APIs and type:
 - random_string() renamed to random_buf().
 - All *_t types renamed without the _t suffix, to preserve POSIX namespace.
 - subgetopt() renamed to lgetopt().
 - skalibs/cdb_make.h renamed to skalibs/cdbmake.h;
   cdbmake functions now return 1 on success and 0 on failure.
 - skalibs/cdb.h redesigned to remove reader state from the cdb structure.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/skalibs/skalibs.hash | 4 ++--
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 48e4028edc..dd202b97fb 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  b780b0ae650dda0c3ec5f8975174998af2d24c2a2e2be669b1bab46e73b1464d  skalibs-2.10.0.3.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  3e228f72f18d88c17f6c4e0a66881d6d3779427b7e7e889f3142b6f26da30285  skalibs-2.12.0.1.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 77db57de96..0ff449a5ba 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.10.0.3
+SKALIBS_VERSION = 2.12.0.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
