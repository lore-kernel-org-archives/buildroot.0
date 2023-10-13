Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D3DCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 10:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07AE261518;
	Fri, 13 Oct 2023 10:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07AE261518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQ8xLHUbNzE8; Fri, 13 Oct 2023 10:25:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5C361726;
	Fri, 13 Oct 2023 10:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D5C361726
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 966761BF997
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D27C415BE
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 10:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D27C415BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9no4wzpDpnO for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 10:24:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3276841532
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 10:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3276841532
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EF22846D5; Fri, 13 Oct 2023 10:24:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 12:21:51 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: bd682063d04cf77b0e430c215fad23d8b6e323ba
X-Git-Newrev: e785e38dcc0d717f9f265a4aba8ad29b0a3d3c1b
X-Patchwork-Hint: ignore
Message-Id: <20231013102431.1EF22846D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/rockchip-mali:
 fix hash of generated archive
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

commit: https://git.buildroot.net/buildroot/commit/?id=e785e38dcc0d717f9f265a4aba8ad29b0a3d3c1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The "official" repository we used to reference disapeared quite some
time ago, so in commit 8c25838b53e6 (package/rockchip-mali: fix build
failure due to missing URL) we switched to using a mirror.

The tarballs generated on the Github side have a top-level directory
that is named "repo-name-HASH", so when we switched to a repository
named "libmali" to one named "mirrors", the content of the generated
tarball changed, even though the content of the files did not.

We can't just change the hash to the new value, or that would conflict
with the copy on s.b.o and older versions of Buildroot.

So, we drop one char from the commit hash, which eans the tarball name
changes, and thus we can calculate a new hash for that tarball, and
there will be no conflict with any existing tarball on s.b.o.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7f2de3da7e1a5af4e2773ff6bb9e528159be7d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rockchip-mali/rockchip-mali.hash |  2 +-
 package/rockchip-mali/rockchip-mali.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/rockchip-mali/rockchip-mali.hash b/package/rockchip-mali/rockchip-mali.hash
index 446bf9ac65..b19937fa07 100644
--- a/package/rockchip-mali/rockchip-mali.hash
+++ b/package/rockchip-mali/rockchip-mali.hash
@@ -1,2 +1,2 @@
-sha256  ee440d859e9d7dfdf29b9a00c7a633337913c407be567d3651c29c12eb75fd9c  rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427.tar.gz
+sha256  1a291bbd75f317ee9205eb356aed617ac269db166ad6528a1734361cc08f8f7c  rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e6042.tar.gz
 sha256  a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/rockchip-mali/rockchip-mali.mk b/package/rockchip-mali/rockchip-mali.mk
index 5c8e554346..125b1c61fd 100644
--- a/package/rockchip-mali/rockchip-mali.mk
+++ b/package/rockchip-mali/rockchip-mali.mk
@@ -4,7 +4,15 @@
 #
 ################################################################################
 
-ROCKCHIP_MALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
+# Full sha1 is 721653b5b3b525a4f80d15aa7e2f9df7b7e60427, but we use the
+# "mirrors" repository, which names the top-level directory "mirrors-VERSION"
+# while the original was the "libmali" repository which named the top-level
+# directory "libmali-VERSION". Hence the content changes, and thus the hash
+# changes.
+# To avoid conflict with the old tarball on s.b.o. used by older versions of
+# Buildroot, we can't use the same filename for the generated archive, so we
+# drop the last char in the commit hash.
+ROCKCHIP_MALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e6042
 ROCKCHIP_MALI_SITE = $(call github,JeffyCN,mirrors,$(ROCKCHIP_MALI_VERSION))
 ROCKCHIP_MALI_LICENSE = Proprietary
 ROCKCHIP_MALI_LICENSE_FILES = END_USER_LICENCE_AGREEMENT.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
