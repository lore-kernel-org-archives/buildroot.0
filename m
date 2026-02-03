Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DFE87859
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 19:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 782B480B12;
	Tue,  3 Feb 2026 19:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U_Nj71wSvoxO; Tue,  3 Feb 2026 19:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7796380B83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770147583;
	bh=clGNatG3CgsQFC0629dsBaFX4dqSHYfrxoaRYWplxIE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e2JnOzNNgmXT6ssRTRmU04Cncw6jSSvjbeKgkm37ETY6IvdHumQLdi7TAlqmb+Py4
	 pzgWtlEQFaPgoHAR+3KwQWfmwey4I2Hx0FxNQ4ZmRk3xeq25CRlLZ87iNiZ4KGm3Q0
	 iMSrMH0tYGn+JAqekj5L5YIpQZlZX2rBY1bsyvzd048ZDFrGctoff0EjxKdyQCpE+N
	 qqEfRSjImguIB351iLSPUVUcAZRNplZufDTdrnLHWO8pkykW4mcN7qCQEy+BC7YNWe
	 X8nkmgBkiHAr4+rDR+bks/la0nklv0NpOZxDHaGkkaQ9jdTZEBhycU+LyufHOe0uBh
	 ThoHnMbAKfr4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7796380B83;
	Tue,  3 Feb 2026 19:39:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4156713D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 19:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCAC7404D5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 19:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGsJc9nu8hzQ for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 19:39:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C85344044D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C85344044D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C85344044D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 19:39:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DA18A4C56AB;
 Tue,  3 Feb 2026 20:39:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35786)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnMFN-000000001P4-3fmY;
 Tue, 03 Feb 2026 19:39:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Tue,  3 Feb 2026 20:39:37 +0100
Message-ID: <20260203193937.2682994-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770147578;
 bh=dxNP2PZOR0mLdl9Krlzq7vv9sOiCNCQY6npnmf2x3Lc=;
 h=From:To:Cc:Subject:Date:From;
 b=Ytk4RGvUOxg+ldZz6gcNhQMov6abZZ+4MzWotDLa/QWzO0dT/vUiA+N4vEwRrVLxb
 sh9iL5yGCOTnkYZOX4et4JzNIKgfAhM+5MrhRmr0yyL1gNmWpPT1MNbnLs90DZvPAp
 VklLkoMdEIakMyl9oT0LsDnBFBWUWZOERBovzA3CYfTwhHp5ljtT9VacpYSWX3BkNB
 QwP3YorPo4dp9GcsmBAE63+2lKWo5jyeC6LJjkuam8abxvlA4VrCyHCMKNjfY53tzW
 efiolauJ900p1bwOoWbcMULP7QbpbY6GJ6mBEclYxSprOLuyA5a/VXilOs4mffImkm
 enx7c8zfdMUBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ytk4RGvU
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix aarch64_be build
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

Buildroot commit 1b8d7e7bedb204b6fb1094a57822a4652206b44a bumped the
package to version 23.2.1 that contains the upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/77826e835243291df664ccf2a7b8405287b72387#e65744354fdd7dd38342b138e59e40767cfcdaa9
which causes build errors on aarch64_be.

The build error was first seen by the autobuilders with mesa3d-23.3.3:
https://autobuild.buildroot.net/results/b62/b62eba2155b080ed02fde774994f2fffc8a6ef51/
according to https://autobuild.buildroot.net/?reason=mesa3d%&arch=aarch64_be

A backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...3_neon.c-only-for-little-endian-arch.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch

diff --git a/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
new file mode 100644
index 0000000000..5e4c89b714
--- /dev/null
+++ b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
@@ -0,0 +1,47 @@
+From c4292cc5af3278b294c2baa5464c9985228205fe Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 3 Feb 2026 20:13:49 +0100
+Subject: [PATCH] blake3: add blake3_neon.c only for little endian archs
+
+Fixes build error on big endian archs:
+
+Build machine cpu family: x86_64
+Build machine cpu: x86_64
+Host machine cpu family: aarch64
+Host machine cpu: cortex-a53
+Target machine cpu family: aarch64
+Target machine cpu: cortex-a53
+[...]
+../src/util/blake3/blake3_neon.c:6:2: error: #error "This implementation only supports little-endian ARM."
+    6 | #error "This implementation only supports little-endian ARM."
+
+as detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/build-end.log
+
+For reference:
+$ grep -i endian output/build/mesa3d-25.3.4/buildroot-build/cross-compilation.conf
+endian = 'big'
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39681
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util/blake3/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/blake3/meson.build b/src/util/blake3/meson.build
+index bd51cfb68c3..767da2c6ec3 100644
+--- a/src/util/blake3/meson.build
++++ b/src/util/blake3/meson.build
+@@ -35,7 +35,7 @@ elif cpu_family == 'x86'
+   # There are no assembly versions for 32-bit x86. Compiling the C versions require a different compilation flag per
+   # file, which is not well supported by Meson. Leave SIMD support out for now.
+   blake3_defs += blake3_x86_no_simd_defs
+-elif cpu_family == 'aarch64'
++elif cpu_family == 'aarch64' and target_machine.endian() == 'little'
+   files_blake3 += ['blake3_neon.c']
+ endif
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
