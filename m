Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2870DCDB482
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 14:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95B2160E24;
	Wed, 18 Oct 2023 14:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95B2160E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOO6-SEEEGlf; Wed, 18 Oct 2023 14:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF08E60EFD;
	Wed, 18 Oct 2023 14:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF08E60EFD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A92C81BF5B5
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 14:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8326D60EFD
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 14:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8326D60EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ha9RQ9Bncbr8 for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 14:19:14 +0000 (UTC)
X-Greylist: delayed 432 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Oct 2023 14:19:14 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE66C60E24
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE66C60E24
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 14:19:14 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 7EAB920266;
 Wed, 18 Oct 2023 09:12:01 -0500 (CDT)
From: Vincent Fazio <vfazio@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Oct 2023 09:11:55 -0500
Message-Id: <20231018141155.533944-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU tar 1.35 includes a breaking change [0] that changes the tar header
created for each regular file even for "stable" formats like pax (which
we use in support/download/helpers::mk_tar_gz).

Previously, normal files had the devmajor/devminor fields of the header
filled with ASCII zero (0x30). These fields are now null which also
affects the checksum value in the header as well.

  $ diff <(head -n 100 xxd.1.34.output) <(head -n 100 xxd.1.35.output)
  10c10
  < 00000090: 3037 3500 3031 3531 3637 0020 3000 0000  075.015167. 0...
  ---
  > 00000090: 3037 3500 3031 3337 3237 0020 3000 0000  075.013727. 0...
  21,22c21,22
  < 00000140: 0000 0000 0000 0000 0030 3030 3030 3030  .........0000000
  < 00000150: 0030 3030 3030 3030 0000 0000 0000 0000  .0000000........
  ---
  > 00000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
  > 00000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................

This has the consequence of causing hash mismatches for any tarball
created with a version prior to 1.35.

Instead of reverting back to a host specific version (see 37a909cacf)
and adding a cap to the maximal tar version (see ec50e407be), just
establish that 1.35+ should be used going forward.

This change requires an updated BR_FMT_VERSION for both git and svn.

[0] https://git.savannah.gnu.org/cgit/tar.git/commit/?id=738de9ecdec45ebfeb999628742373b5f8253bd0

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
This patch should be coordinated with other patches [1] that update the
BR_FMT_VERSION revision for git or svn as all of the tarball hashes will
need to be regenerated tree-wide.

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=373742
---
 package/pkg-download.mk                |  4 ++--
 support/dependencies/check-host-tar.sh | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index e5cd83d859..d33eb2d811 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -20,8 +20,8 @@ export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
 # download backend:
-BR_FMT_VERSION_git = -br1
-BR_FMT_VERSION_svn = -br3
+BR_FMT_VERSION_git = -br2
+BR_FMT_VERSION_svn = -br4
 
 DL_WRAPPER = support/download/dl-wrapper
 
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index b7d607a47a..d56d0242a9 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -27,11 +27,13 @@ if [ -n "${version_bsd}" ] ; then
     exit 1
 fi
 
-# Minimal version = 1.27 (previous versions do not correctly unpack archives
-# containing hard-links if the --strip-components option is used or create
-# different gnu long link headers for path elements > 100 characters).
+# Minimal version = 1.35
+# GNU tar upstream commit 738de9ecd introduced a "breaking" change that
+# affects tarballs regardless of mode (pax/ustar/v7) such that tarballs
+# generated with 1.35 will not hash to the same value as those generated
+# by previous versions of tar.
 major_min=1
-minor_min=27
+minor_min=35
 
 if [ $major -lt $major_min ]; then
 	# echo nothing: no suitable tar found
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
