Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50977C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB8584A3B;
	Fri, 28 Feb 2025 17:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXTK1jXMybqc; Fri, 28 Feb 2025 17:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0B685EEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0B685EEA;
	Fri, 28 Feb 2025 17:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14CCC68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9CB44A4D4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gnbq-d_IxUi for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B49147036
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B49147036
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93F5986143; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Feb 2025 00:10:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 939244b828f69af5c52963a0cbde155d8ead2099
X-Git-Newrev: 296744b0f4be307ad4a58b1bb0054e22c6a3b15e
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.93F5986143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/sqlite: bump
 version to 3.49.0"
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

commit: https://git.buildroot.net/buildroot/commit/?id=296744b0f4be307ad4a58b1bb0054e22c6a3b15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

sqlite 3.49.0 has changed its buildsystem, causing a lot of breakage
along the lines.

Although a few fixes have already been applied (and reverted in the
previous commits), there are remaining pain-points that are not trivial
to fix in a timely manner :

  - the buildsystem forces an rpath to /usr/lib, and it is not obvious
    how to prevent that (excepyt with patching),

  - there is an optional dependency to zlib that is not accounted for,
    neither in the target nor in the host variants; this causes issues
    when the build host has libz-devel (or similar) already installed,
    in whicxh case sqlite detets it and links with it; as it is missing
    an rpath to $(HOST_DIR)/lib, this causesw a build failure when
    another package pulls in zlib. See:
    https://autobuild.buildroot.org/results/1a81cb7c88a41a03767a1a201ee0628468f60766/build-end.log
    https://lore.kernel.org/buildroot/20250219195112.GA2631528@pevik/T/#mb7c7ac63902ed55623a5adf5d1db4a3f60db9fef

Fixing the second issue would seem easy enough, but zlib could depend on
ccache (when that is enabled), and ccqche depends on sqlite, so that
would be a circular dependency. And there is no option in sqlite's
configure script to forcefully disable use of zlib...

A revert is the quickest solution to unbreak for the time being, as the
next release is nearing due date. Another bump can be attempted later,
that addresses all the remaining issues.

This reverts commit db85638cea3414ca0293cbbb2352e5b0b63a2579.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Scott Fan <fancp2007@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index ddec2637b8..5b933fba8f 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4d8bfa0b55e36951f6e5a9fb8c99f3b58990ab785c57b4f84f37d163a0672759  sqlite-autoconf-3490000.tar.gz
+sha256  ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5  sqlite-autoconf-3480000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a23f6e1d66..c8f12a427a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.49.0
-SQLITE_TAR_VERSION = 3490000
+SQLITE_VERSION = 3.48.0
+SQLITE_TAR_VERSION = 3480000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
