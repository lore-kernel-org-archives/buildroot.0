Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E471C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 556D0404CF;
	Sun, 29 May 2022 08:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujPCbslYVvHV; Sun, 29 May 2022 08:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B7C0400E4;
	Sun, 29 May 2022 08:35:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6290E1BF969
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5161A61104
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Ww4YzwIAqEo for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE40A60E8D
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:35:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4C8BD8643D; Sun, 29 May 2022 08:24:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 10:19:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c4d5b7b6c78002dddc51fd99dd0a9c0b24b3e77b
X-Git-Newrev: 4c6381a91bbc3b426df8136d3ed2e8e89ec12036
X-Patchwork-Hint: ignore
Message-Id: <20220529082411.4C8BD8643D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/usb_modeswitch:
 fix installation of systemd unit file
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

commit: https://git.buildroot.net/buildroot/commit/?id=4c6381a91bbc3b426df8136d3ed2e8e89ec12036
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The upstream Makefile failed to detect systemd being present in some (maybe all)
builds, resulting in the unit file not being installed. Without the unit file,
the udev rules in usb_modeswitch-data don't work as expected (no modeswitch is
performed).

This commit adds a patch that modifies the Makefile to include
'$(PREFIX)/bin/systemctl' in the list of paths checked, which makes the
installation phase work as intended. I will also submit this patch upstream.

Signed-off-by: Sol Bekic <s+removethis@s-ol.nu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c6b746e6fcb385eb3ea75250673c3cf6f3743538)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
