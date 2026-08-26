Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CA7C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 22:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A15A80D32;
	Wed, 26 Aug 2026 22:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPKL5b9nmgDd; Wed, 26 Aug 2026 22:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787781989;
	bh=m2ORnWzH82cioxe1OSKCY2k1RCCX3uHGY8WKbeBOqP8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KO59uOiGs48ZaO31UA3YjNegn3FSPDNlFnJ2pfxW/RJtSK8F1wm/wlICtceB6YGXM
	 OFIPqZEdQCHCQVKcCgkmqUeRs1EPji2V7JHQWAR/i4agXL0qeZPry8Z7UoliDakCgW
	 qwJOlW1JGjvoBU95cj5vu7qFu6bYg0H09K+WhdAHFR81xPdX4mhAVIeDlPnQkfcRRU
	 aC+g8E+EEfbSx7tIdhV/UoU471PfS+HpUMvvqDm+T0BtdlNtxAzJZwRQH/Ysm7Vs0S
	 vCD12BoqbctvvkwW/MSGj0HORdsmWpheFJg0+0WjqhoTXZ8swQ/X44p1asdSC25D/S
	 qVj9RXCajv5Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9684880AEF;
	Wed, 26 Aug 2026 22:06:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C337323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9978E80AEF
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 22:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxJL3vPlZXMK for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 22:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cgwHukXY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 149EC80AE8
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 22:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1787781968;
 bh=CkeEFwQ0twHiUu1BpjtsZkPT5IZMdjSmPxVe1ROwmAo=;
 h=From:To:Cc:Subject:Date:From;
 b=cgwHukXY1rKXF+IiDoDk/S2RNDnzdbj1tRyARaDQKSTyG18mLbPeD/n4hE1wRpfdn
 j1bN+unZ5A25PVjGs/wVtnFznAmqZajekkDSC0GE8aKJrZq2m4pq3fQIN4yP4OBEoL
 BeNsFz+h0K26GHRiJ5mr0noPdG92Iqcc9qncO7G6z94bY05EOp/08PCRMd/50sQAl6
 irgwdbeQkvpSpKJo4QhG4d+74h1gp3TyysFofhxzZT4+AEbh8qhlGtEBWDRVhW5WBi
 XeiheMFFYaAt4ZwS+OzNQZqB3baMhAdruSXwxfhKOySFMlrZjkZBHo0838AJFBCIwQ
 z0Nk0QDxaDdgg==
Received: from fli4l.lan.fli4l (p54a1b1e0.dip0.t-ipconnect.de [84.161.177.224])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B387A4C337C;
 Thu, 27 Aug 2026 00:06:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38690)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wzLl2-000000000T5-16bJ;
 Wed, 26 Aug 2026 22:06:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 27 Aug 2026 00:06:06 +0200
Message-ID: <20260826220607.585905-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 1/2] package/mesa3d: i915 Gallium driver
 needs llvm
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
v2: no changes, added to new series

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
