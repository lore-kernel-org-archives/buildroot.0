Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE67ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 12:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E9674032A;
	Fri, 23 Sep 2022 12:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E9674032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltnTxZS3Adlo; Fri, 23 Sep 2022 12:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3311410A1;
	Fri, 23 Sep 2022 12:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3311410A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68A1E1BF349
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4DFF813FC
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 12:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DFF813FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxrwHsRWr8js for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 12:17:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5144813B8
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 12:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5144813B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A08E785ED2; Fri, 23 Sep 2022 12:17:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 14:16:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5649d5afdf4180de0170b627bf3eaa484513b51
X-Git-Newrev: 246ad6b4e1cda76bb86543c0b5411fe6de069db8
X-Patchwork-Hint: ignore
Message-Id: <20220923121734.A08E785ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-utils: fix build without
 libdrm
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

commit: https://git.buildroot.net/buildroot/commit/?id=246ad6b4e1cda76bb86543c0b5411fe6de069db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch fixing build without libdrm.

Fixes:
 - http://autobuild.buildroot.net/results/a13/a13e5bc4893a2057097aad268152212858c8e966

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...001-wayland-info-Fix-build-without-libdrm.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
new file mode 100644
index 0000000000..2d4591f785
--- /dev/null
+++ b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
@@ -0,0 +1,46 @@
+From 3657a11d45f133776b50c716d99f37965eb07ed1 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 14 Sep 2022 09:07:10 +0200
+Subject: [PATCH] wayland-info: Fix build without libdrm
+
+wayland-info can optionally use libdrm to provide a description of the
+dmabuf format modifiers.
+
+When not using libdrm however, the build fails because "dev_t" is not
+defined.
+
+The definition of "dev_t" comes from <sys/types.h> which is included
+from <libdrm.h>, which is not included without libdrm support, hence the
+build failure.
+
+Simply include <sys/types.h> unconditionally to make sure "dev_t" is
+defined regardless of libdrm support, to fix the build failure.
+
+Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
+Reviewed-by: Simon Ser <contact@emersion.fr>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
+(cherry picked from commit baa65ba9f62e6a05c32b9202b524158a21f24245)
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+3657a11d45f133776b50c716d99f37965eb07ed1]
+---
+ wayland-info/wayland-info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
+index 53cd04b..98ff205 100644
+--- a/wayland-info/wayland-info.c
++++ b/wayland-info/wayland-info.c
+@@ -34,6 +34,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
++#include <sys/types.h>
+ 
+ #include <wayland-client.h>
+ #if HAVE_HUMAN_FORMAT_MODIFIER
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
