Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56398C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 14:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3951408C9;
	Sat, 14 May 2022 14:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0Zgxw_BMM3Z; Sat, 14 May 2022 14:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D94C64055D;
	Sat, 14 May 2022 14:33:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 370F91BF844
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 14:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 253BC4055D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 14:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGIUqOpt0f8T for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 14:33:18 +0000 (UTC)
X-Greylist: delayed 00:05:50 by SQLgrey-1.8.0
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8B2E40509
 for <buildroot@buildroot.org>; Sat, 14 May 2022 14:33:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=s-ol.nu; s=key1;
 t=1652538443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4M9np2UdfaOJkQIwPSeQlcpq/Rc1HWmroJRBhZadnVI=;
 b=Er4XbL0tzkAFYZWJkLNBQU+w+EEBOdFjqMrXWr4PQgUwwxItbonbQ6edOIJTvZkEt1/9+2
 ISNhbXFKeo2WsQ1P3lY2acfBoUgubn6Lwy7z+kiJAe4JTp6FkQeNy9W+55FeWyAc0YkA+g
 ThsMvBK6b1TvaOFLSO2KXBxva576T8D5kyeFHV5wHq8aIL1oAmllhHq3gY+gl9nOPHRvMu
 wMEhoLULBmeHhmQndFZCfxThsakz/E5yZmsygT4Z9ectItAMtmEyAK2bMqMfu8aJL8/Mra
 J/x9ncolhc1iqvn3mWrYBS0CzyUzuEySpwLxMXT2ubaJJKJO//+jIsdxIxYuEw==
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 16:26:59 +0200
Message-Id: <20220514142659.70948-1-s+removethis@s-ol.nu>
In-Reply-To: <20220514131442.GY1597494@scaer>
References: <20220514131442.GY1597494@scaer>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: s-ol.nu
Subject: [Buildroot] [PATCH v2 1/1] package/usb_modeswitch: fix installation
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
From: Sol Bekic via buildroot <buildroot@buildroot.org>
Reply-To: Sol Bekic <s+removethis@s-ol.nu>
Cc: s-ol <s+removethis@s-ol.nu>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: s-ol <s+removethis@s-ol.nu>

The upstream Makefile failed to detect systemd being present in some (maybe all)
builds, resulting in the unit file not being installed. Without the unit file,
the udev rules in usb_modeswitch-data don't work as expected (no modeswitch is
performed).

This commit adds a patch that modifies the Makefile to include
'$(PREFIX)/bin/systemctl' in the list of paths checked, which makes the
installation phase work as intended. I will also submit this patch upstream.

Signed-off-by: Sol Bekic <s+removethis@s-ol.nu>
---
As requested by Yann E. Morin, both this patch and the patch-file it adds
are commented and signed off with my full name.

 .../0001-fix-systemd-detection.patch           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/usb_modeswitch/0001-fix-systemd-detection.patch

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
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
