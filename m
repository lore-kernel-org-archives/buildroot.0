Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E857AC43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 23:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFB9411DE;
	Wed,  1 Jul 2026 23:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TglTBpQzkXGW; Wed,  1 Jul 2026 23:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 149D7411CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782947085;
	bh=OI9419T7vHePJhnS7gQYINPjQvSRHJrUYzo6HCpGkDs=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hGIQlFuHslM9EII2xixwbYWTEFe75Fm7xEZ5ae/UPydZ65+QJeHt/c0ku4L1qUXCO
	 Hohn0TAMFC7W0B1GWJXhu5QOEOv7x/eDeo3zhHWqGZMsvF6TaY/7d+/SFgoqXM9jTQ
	 hL2b9Jq8y37qARZnteLok5B7VDDt4miJhsEIH1DnT/ZsyCGF1zbFA82uvFncnKCfox
	 6OtsNxFjFKsUp05DsN+mLYceADXtnI9pVclXfARrmsoUR5X7b33dqcEG0wYSkDiKs8
	 AWMipd6v056rcktiHR9l+ruWA1PTPePi/u81cuZ8Zts+dyKcSPN120h89vAz8YJdBu
	 njTGFAQURRtjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 149D7411CB;
	Wed,  1 Jul 2026 23:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4EE4B5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 23:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61AA782EFC
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 23:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6HxK6M3gnAp for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 23:04:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D16E82EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D16E82EF0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D16E82EF0
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 23:04:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHoRK-1wrjAx3GP0-00Glm8; Thu, 02
 Jul 2026 01:04:37 +0200
To: buildroot@buildroot.org
Date: Thu,  2 Jul 2026 01:04:09 +0200
Message-ID: <20260701230410.2522114-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701230410.2522114-1-fiona.klute@gmx.de>
References: <20260701230410.2522114-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:kMznJpFCHcCOSdDnW9JnjdoiHkk8WXNQ2DSQGUOMep5wtAxTko4
 wQ1dygXamz59s6KfiorhVnoeHrFgZUyGyZ3grny13wR9BB/LgmP4ovU3u3vJ6P/RSNYTAjd
 obSjrJducXT6VuhH0RyYONrSNWiMclRa/U+xJVJfVRPVRThLFC6lYP+dtG6Q9hZjcfPgyKk
 EdCuBFKvYJXokLuw5cLAw==
UI-OutboundReport: notjunk:1;M01:P0:6WqtlvhPPWY=;9UVNC3oUcqNVI8RGXvonkeRgFp6
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782947078; x=1783551878; i=fiona.klute@gmx.de;
 bh=TDB/zBpqBhjgi5F2AIV6a/ICL0y95fkaYOE3KkfqgfI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bOmSuClOBl9/m1w08v9PBM94oFhz48fQllFxHhZOxhwkAQUTE59nyGnvidPgJ0W5
 MeAZ0B9ivU4pZDSgH5g00ZTAXlQyhUyv6mcTYyh8uM1uGKOR1j2PSx1bYHOIEowUi
 ViOyqXRF3+uLm70uP6BukXri0P3MTkmE0r4XwrviRqVw/SApieALLuGLG/rex6PFm
 2ARCy9CqMrc19f2HZM+CMB0GMPa2nMnZyHg5as8cSHsNjC7JlHxScsgxXg//ukh3g
 TrxRDtyjDb11bQ6gU33U4ScRPF1NCsh6t3tSQibxPH7D4Q4Rf6C8tuChaAL4p4jIM
 DZJR7dBGKh8Xqz6XMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bOmSuClO
Subject: [Buildroot] [PATCH 2/2] support/testing: TestApache: use read-only
 rootfs image
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this the test verifies not only that Apache can work in
principle, but also that it works with a read-only rootfs. Because of
the read-only rootfs the test itself cannot write to /root, so store
the test download in /tmp.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/testing/tests/package/test_apache.py | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_apache.py b/support/testing/tests/package/test_apache.py
index f29f4e2524..d44e7927bd 100644
--- a/support/testing/tests/package/test_apache.py
+++ b/support/testing/tests/package/test_apache.py
@@ -1,5 +1,6 @@
 import os
 
+import infra
 import infra.basetest
 
 
@@ -7,17 +8,22 @@ class TestApache(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_APACHE=y
-        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
     def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
+        rootfs = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        infra.img_round_power2(rootfs)
+        self.emulator.boot(arch="armv7",
                            kernel="builtin",
-                           options=["-initrd", cpio_file])
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=squashfs"],
+                           options=["-drive",
+                                    "file={},if=sd,format=raw".format(rootfs)])
         self.emulator.login()
 
         self.assertRunOk("httpd -V")
-        self.assertRunOk("wget http://localhost/index.html")
-        self.assertRunOk("grep -F 'It works!' index.html")
+        self.assertRunOk("wget -O /tmp/index.html http://localhost/index.html")
+        self.assertRunOk("grep -F 'It works!' /tmp/index.html")
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
