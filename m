Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAE7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:09:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77AD260187
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77AD260187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57EF3607BC;
	Tue,  3 Aug 2021 22:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUQTaOqgCq0U; Tue,  3 Aug 2021 22:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D89A60664;
	Tue,  3 Aug 2021 22:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A18D1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C0A340568
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeMkraDW_rQQ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DFC440500
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 87A4B8B43E; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 15:25:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 95b722eaa8da303f1eb26f494159f308add11b4d
X-Git-Newrev: 4a3639bad01a08b7bbb4ccb3090099a01799f321
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.87A4B8B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: test_glxinfo
 load X11 modules in the right order
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4a3639bad01a08b7bbb4ccb3090099a01799f321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From [1]
"Xorg does not implement real dynamic linking and requires that its
modules get loaded in the right order."

From /var/log/Xorg.0.0.log:
 (II) LoadModule: "modesetting"
 (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
 (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1255661899

[1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_glxinfo.py                 |  4 +++-
 .../rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf        | 11 +++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_glxinfo.py b/support/testing/tests/package/test_glxinfo.py
index 44ac92347a..3417e48612 100644
--- a/support/testing/tests/package/test_glxinfo.py
+++ b/support/testing/tests/package/test_glxinfo.py
@@ -32,7 +32,9 @@ class TestGlxinfo(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
         BR2_TARGET_ROOTFS_EXT2=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(
+          infra.filepath("tests/package/test_glxinfo/rootfs-overlay"))
 
     def wait_for_xserver(self):
         # xserver takes some time to start up
diff --git a/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf b/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
new file mode 100644
index 0000000000..c693c213f5
--- /dev/null
+++ b/support/testing/tests/package/test_glxinfo/rootfs-overlay/etc/X11/xorg.conf.d/01-modules.conf
@@ -0,0 +1,11 @@
+
+# Xorg does not implement real dynamic linking and requires that its
+# modules get loaded in the right order.
+# https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
+Section "Module"
+   Load "vgahw"
+   Load "fb"
+   Load "shadowfb"
+   Load "shadow"
+   Load "glamoregl"
+EndSection
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
