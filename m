Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5470AD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A193403DF;
	Tue, 13 Jan 2026 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4j727mbCl0Jn; Tue, 13 Jan 2026 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B59840813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333285;
	bh=EGIX7yhS6v696pVnNyvkb0W0bUltjEbLeJkwybyKSGw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XKtQc3m8z1iv3QIJkCugFzVphWdGDldsfNvxZGiTzW+Jue/afDz7M9fVMovfXacwJ
	 dUj9iS5UHYSw7ICw9JTBIGfPYmxQmjpgKWlOC1vu/iYB1WvPeqoreOGL+ydCqHRAez
	 efD3bOxddtWytqmEkfjUVkyrTawYj51gfgeyQ18FbCKjA+QRlH2s1xZR+zbtvhaG1c
	 qCiiYsg6ssi6QuWPpSzFwlBjlUyDKsBKci/EVjzfW0j8h3p50cyeK3uJTqGRKV+aM5
	 uEXbJy4njOwV9994Sc8QujDBk+776Z6MW4rXe6ugab8TiJQZhUNhPnuOKkHmvUSt+U
	 kKKG3TTkoSD5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B59840813;
	Tue, 13 Jan 2026 19:41:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 139FB2CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21385406E1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YDv5TqZzbpyi for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC44406DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AC44406DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6964880840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:03:12 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 279b5fd4c05d906402fe8f603992cf7487e42e97
X-Git-Newrev: cc96e9214a2af1b26b45469e663d9fadea446f1b
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.6964880840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/fio: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc96e9214a2af1b26b45469e663d9fadea446f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit 215133c0fc2819f059fbb35071ab2e0987f5107d bumped fio from
3.38 to 3.41. Upstream commit
https://github.com/axboe/fio/commit/4175f4dbec5d1d9e5e0490026e98b1806188e098
was added to fio 3.40 including FALLOC_FL_ZERO_RANGE which causes build
errors.

Added upstream commit which not only fixes musl builds but also uclibc.

Fixes:
musl: https://autobuild.buildroot.net/results/8e9/8e946c7104be0295a9a2b946fe4a82bba0e28db8/
uclibc: https://autobuild.buildroot.net/results/ece/ece6ff1b20fa3482a88ffb3a6167b2bba9b06101/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8ba59c12e9190772bfbf25374fe6a66611b43a79)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fio/0001-fix-musl-builds.patch | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/fio/0001-fix-musl-builds.patch b/package/fio/0001-fix-musl-builds.patch
new file mode 100644
index 0000000000..16c3d3836d
--- /dev/null
+++ b/package/fio/0001-fix-musl-builds.patch
@@ -0,0 +1,38 @@
+From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
+From: Arthur Gautier <arthur.gautier@arista.com>
+Date: Sat, 13 Dec 2025 20:07:11 -0800
+Subject: [PATCH] fix musl builds
+
+This commit fixes the build on musl which fails with the following
+error:
+```
+oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
+oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
+      |                                     ^~~~~~~~~~~~~~~~~~~~
+oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
+make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
+make: *** Waiting for unfinished jobs....
+```
+
+Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
+
+Upstream: https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ oslib/linux-blkzoned.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
+index 78e25fca91..c45ef623de 100644
+--- a/oslib/linux-blkzoned.c
++++ b/oslib/linux-blkzoned.c
+@@ -25,6 +25,7 @@
+ #ifndef BLKFINISHZONE
+ #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
+ #endif
++#include <linux/falloc.h>
+ 
+ /*
+  * If the uapi headers installed on the system lacks zone capacity support,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
