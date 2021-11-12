Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480C3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA5E61039
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEA5E61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7761E826C2;
	Fri, 12 Nov 2021 18:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6S_QrwZjwGLd; Fri, 12 Nov 2021 18:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B93826B4;
	Fri, 12 Nov 2021 18:10:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDE091BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDE00404EF
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bo8ZeJdQqcME for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:10:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D286F40503
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:10:07 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id z200so8455832wmc.1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xzKEjuvXTaonw05vhl/abd/n59tZzbsj3UBjBS5ROsk=;
 b=O1xmpbt0l1wc1S6keITt+T0nH/YMu2hW9b+D0qIi50ZDcW99rjN1ngFOMXyGhrlOwy
 Jm/PM9RBhvfKF7wCLS39pyTVqaDAhAyoGBHDLcKLp/oZVCkG4JSf2Uf/A1HdXhLCOLy7
 S93IyZYTVaEGktv9r6ArBTEX3RkinjpOA0Bf8yqIhSvEBNobVQpvvFccdW+H+4VdtJwh
 kO2Ar9Oz7+htLCx3Ro8SBjcJKhBzGnmon+oZOJdg06E6KeM18OTQx1VWFbYphx/RFgGe
 BXkUzraxoiUiyRuLS6BtO/LchtaSz/cCf2BiJo1Uxqehmc4TFENK1Kko+u8rcWUc+rWS
 Jwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xzKEjuvXTaonw05vhl/abd/n59tZzbsj3UBjBS5ROsk=;
 b=omoYmLt6XEvJiwF430n90R2Ph6tYNbsNpsaBSgw9+KG69MGHzwOjEzZ1W2raVkNdnG
 X9KaogaIyN1XxHSEy0p/OBGC9j2ea9++qmDZ7JNx+mbP5a1BL9mPrcoW+qCgxkRa+uj4
 fvqCuO4gUK2YY+Ct7Jo8ieWrujKufeOKBowRS2mOcSUGFpxhGwQxyMm4KMTMx3Az3ow0
 KbiII9KEe0DFBIT9Qx+PNW8GJEAa63iK0KMlH5judsUT0ea7Uxk8JwAx+rwP/mIisBAd
 yDmFkbt6Pbjo4sSdv8FdG2KTFuysiXTh3Z4BX1Omtd3senXFvyNTPHZL5MXKPhwU08EZ
 owiQ==
X-Gm-Message-State: AOAM530vH1OnZWYbZdehhfqSlmRH0IG2xDyKVvtaAbru8M4CR7qJJx0W
 tQc2mYLWszVrKqFp9CwcRKgAZ6fOJuQ=
X-Google-Smtp-Source: ABdhPJzIaW1z7KCP9NlHrvvBykPMqhtWGX5Aghb48LR6FdpxUl+JnRBy3X1Yh0FyluraBY1GaKOA9g==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr36356510wma.83.1636740605723; 
 Fri, 12 Nov 2021 10:10:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id n32sm14279997wms.1.2021.11.12.10.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 10:10:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 19:08:02 +0100
Message-Id: <20211112180802.3610653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglib2: add girdir to glib-2.0.pc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add girdir to glib-2.0.pc to fix the following build failure with atk,
gcr or harfbuzz:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir

This build failure could also be fixed by removing our update of girdir
in gobject-introspection.mk but this will have side effects as gir files
won't be installed in the correct directory. So patch glib-2.0.pc
instead.

Note: autotools-based packages have already been fixed by
https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95

Fixes:
 - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
 - http://autobuild.buildroot.org/results/67a47386019c2a700df348ad6846064e0950e87b
 - http://autobuild.buildroot.org/results/2c6a4470542af574f9407fa5867f0408ec2b4880

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eson.build-add-girdir-to-glib.2.0.pc.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch

diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
new file mode 100644
index 0000000000..7eeecbe336
--- /dev/null
+++ b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
@@ -0,0 +1,33 @@
+From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Nov 2021 18:01:05 +0100
+Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
+
+Add girdir to glib-2.0.pc to fix the following build failure with atk:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
+Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ glib/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/glib/meson.build b/glib/meson.build
+index f78f32969..6c5486699 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -377,6 +377,7 @@ pkg.generate(libglib,
+   subdirs : ['glib-2.0'],
+   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
+   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
+                'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
+                'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
+                'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
