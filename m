Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5620EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F01A819E6;
	Sat, 14 May 2022 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZX6cGpkm2xx; Sat, 14 May 2022 21:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04C77818A7;
	Sat, 14 May 2022 21:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2501BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77F3040488
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMnzQedx-tKw for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C14DC40004
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:52:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4A3F185E04; Sat, 14 May 2022 21:41:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 23:52:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f84945cc10a269810559ee38bb24950cab0cee4
X-Git-Newrev: c6b746e6fcb385eb3ea75250673c3cf6f3743538
X-Patchwork-Hint: ignore
Message-Id: <20220514214138.4A3F185E04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usb_modeswitch: fix installation
 of systemd unit file
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6b746e6fcb385eb3ea75250673c3cf6f3743538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream Makefile failed to detect systemd being present in some (maybe all)
builds, resulting in the unit file not being installed. Without the unit file,
the udev rules in usb_modeswitch-data don't work as expected (no modeswitch is
performed).

This commit adds a patch that modifies the Makefile to include
'$(PREFIX)/bin/systemctl' in the list of paths checked, which makes the
installation phase work as intended. I will also submit this patch upstream.

Signed-off-by: Sol Bekic <s+removethis@s-ol.nu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../usb_modeswitch/0001-fix-systemd-detection.patch    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/usb_modeswitch/0001-fix-systemd-detection.patch b/package/usb_modeswitch/0001-fix-systemd-detection.patch
new file mode 100644
index 0000000000..d0b3e80aeb
--- /dev/null
+++ b/package/usb_modeswitch/0001-fix-systemd-detection.patch
@@ -0,0 +1,18 @@
+Modify the Makefile to include '$(PREFIX)/bin/systemctl' in the list of paths.
+This makes the udev intgeration work as intended when using systemd.
+
+Signed-off-by: Sol Bekic <s+removethis@s-ol.nu>
+
+diff --git a/Makefile b/Makefile
+index 22bd0e0..72321a4 100755
+--- a/Makefile
++++ b/Makefile
+@@ -62,7 +62,7 @@
+	install -D --mode=755 usb_modeswitch_dispatcher $(SBINDIR)/usb_modeswitch_dispatcher
+	install -d $(DESTDIR)/var/lib/usb_modeswitch
+	test -d $(UPSDIR) -a -e /sbin/initctl && install --mode=644 usb-modeswitch-upstart.conf $(UPSDIR) || test 1
+-	test -d $(SYSDIR) -a \( -e /usr/bin/systemctl -o -e /bin/systemctl \) && install --mode=644 usb_modeswitch@.service $(SYSDIR) || test 1
++	test -d $(SYSDIR) -a \( -e /usr/bin/systemctl -o -e /bin/systemctl -o -e $(PREFIX)/bin/systemctl \) && install --mode=644 usb_modeswitch@.service $(SYSDIR) || test 1
+ 
+ install: install-script
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
