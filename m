Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A344AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 12:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3373E415AC;
	Sat, 14 May 2022 12:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFK-CxQ1QfRN; Sat, 14 May 2022 12:49:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A5E4155A;
	Sat, 14 May 2022 12:49:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9161BF831
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 12:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B4104155A
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 12:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYXDC9ZznVHu for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 12:49:17 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA23F41484
 for <buildroot@buildroot.org>; Sat, 14 May 2022 12:49:17 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=s-ol.nu; s=key1;
 t=1652532129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KftPu/8Mat7gsT1/tPnrkjLja6Hq03zcJOAA9f2LSXE=;
 b=GhUNcLQYsp/gvjg65+PewRK4lHtfTJs7jNy/ETOnQ2ZAsECCuQP99HHVloOe1tVm8mnIgP
 XgGfGKrYU61SYkaxvluwAFVTZG5dpHQq5rangpmhApOi90KdOndJ6/p52kWh9hWP8Blecc
 gJ9bVYrQr071XqII+Z/nYbJzDhzSfDUK0Y9jJQVwdND4/XupXRfvTJvIKYgDvBhHDi5A48
 gCArc6B5+uWpNI4xtOKNL/fwz3BXVUSzIlWn0XoLJEu7OS4rTtBrgBy9OQuQ5kCefDJQut
 47mAw/kZlT8gBRkhhbG8urQxJldTztoxu4ojoyivIMZeMA/g+zOftGJj23wymg==
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 14:42:08 +0200
Message-Id: <20220514124208.44912-1-s+removethis@s-ol.nu>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: s-ol.nu
Subject: [Buildroot] [PATCH 1/1] package/usb_modeswitch: fix installation of
 systemd unit file
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
From: s-ol via buildroot <buildroot@buildroot.org>
Reply-To: s-ol <s+removethis@s-ol.nu>
Cc: s-ol <s+removethis@s-ol.nu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream Makefile failed to detect systemd being present in some (maybe all)
builds, resulting in the unit file not being installed. Without the unit file,
the udev rules in usb_modeswitch-data don't work as expected (no modeswitch is
performed).

This commit adds a patch that modifies the Makefile to include
'$(PREFIX)/bin/systemctl' in the list of paths checked, which makes the
installation phase work as intended. I will also submit this patch upstream.

Signed-off-by: s-ol <s+removethis@s-ol.nu>
---
 .../usb_modeswitch/0001-fix-systemd-detection.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/usb_modeswitch/0001-fix-systemd-detection.patch

diff --git a/package/usb_modeswitch/0001-fix-systemd-detection.patch b/package/usb_modeswitch/0001-fix-systemd-detection.patch
new file mode 100644
index 0000000000..6d02c648eb
--- /dev/null
+++ b/package/usb_modeswitch/0001-fix-systemd-detection.patch
@@ -0,0 +1,13 @@
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
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
