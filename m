Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7284CC5AC80
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 08:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0A160678;
	Sun,  9 Aug 2026 08:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITqYDHPq2AQs; Sun,  9 Aug 2026 08:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3D86060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786263377;
	bh=5JFUk1Z3mGA6Se65y08EQKZHgSbt/K5nSGmv9oKyla0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m7gHX7NYjkLRvlG+2wHGEPBmhzVmC2iCvOXWMSZd/Ury1OdtSKHertMgnVssh9Xyp
	 TizzJHDwYKLhfZFAqDatPydCCUS7h3Nf3VMdecj7EoJsvkLmdZcFzs61fWXGhMHsXg
	 SuH0W8205U0WbcVs5+wbgIO1JIQD1vkHkFAprRQT+2RsAy7r1wYmg4oOY7vfG2rnuC
	 JzKTh95sJwYnodY8JKpcyADQp0/P9AyaGSnGr+jne2F9W1Id3jN5zSJzzNI1Gwt8Pc
	 VxKdbq863YVB1agsbH/F11Bf4KfbzUrronJfYHI7Jxiz9PpU99EhIWA2C2c/WOL5Vc
	 80uVxgNQlFq+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3D86060A;
	Sun,  9 Aug 2026 08:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 413C710E
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EDB140527
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-q3eHvFrRcE for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 08:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F7D340514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F7D340514
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F7D340514
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 08:16:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bda.dip0.t-ipconnect.de [91.58.11.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65722A4C2D5C;
 Sun,  9 Aug 2026 10:16:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32930)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsyhW-0000000068v-16jI;
 Sun, 09 Aug 2026 08:16:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sun,  9 Aug 2026 10:16:09 +0200
Message-ID: <20260809081610.497596-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786263370;
 bh=xvmzKuL82y1q4xzG1HoyPTwycWhbrOYOxaOZEpZJ0eg=;
 h=From:To:Cc:Subject:Date:From;
 b=dBsL68ZpLDwmh/rl2zqFASey6J6ttrYgPkEYKxJVWk0NUePtT5TSSbyTiQRpybQGy
 zMKtg0Votlgl+u3LtuYT0Tt/xsrcWymLzbzHu1FBvo69o77oLh8Q6eXXvzsMOdpqMI
 pyYoX6tTwrTPogzqE2z6ClcXXfVCvicUv9+Po3l7+Y6/J7IkYgiiLqtwC7QWz97AWl
 XElLJUGVFc7ZrrfutuelDZlDjShZNsi8z6l9M4CaqmX7MsQiTjKNWGX6yMWL/VxNdP
 Ba2ZMMps71NLp6FWCt1DHwhtHomk34LgWKj05b+3CA0TVLZNRI4YSmYNaAk+ZP9+rU
 JpRI3JouH2T+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dBsL68Zp
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: i915 Gallium driver needs
 llvm
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 3e296a151195f9d32dbfd62d6c75d08b822be6dd bumped the
package to 25.3.0 which includes upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b8b38d38b1c14b60de0324ac2f98ff7f1f4cc3c5
that enforces llvm for the i915 gallium driver causing configure errors
in buildroot:

../output-1/build/mesa3d-26.1.6/meson.build:241:3: ERROR: Feature llvm
cannot be disabled: i915 Gallium driver requires LLVM for vertex shaders

Please note that
https://gitlab.freedesktop.org/mesa/mesa/-/commit/4235c39a9a8378f1e2dc0899dd4c3c941f27b887
later removed the llvm dependency for the r300 driver introduced by the
commit mentioned above so we only need to add the dependency to the i915
driver.
The configure option draw-use-llvm is disabled by default when llvm is
not available:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/37c7d19e46a4863c120186a99ac0344c2dd31260

Fixes:
https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..b78b6267d0 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -158,11 +158,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 	bool "Gallium i915 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
 	  Support for i915-based Intel GPUs.
 
+comment "i915 driver needs llvm"
+	depends on !BR2_PACKAGE_MESA3D_LLVM
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_PACKAGE_MESA3D_LLVM
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
