Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88884C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 10:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E246383AD9;
	Sat, 29 Jul 2023 10:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E246383AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1H-_A1RpRWXQ; Sat, 29 Jul 2023 10:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27533838C9;
	Sat, 29 Jul 2023 10:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27533838C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AE2B1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 10:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7489C838F0
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 10:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7489C838F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBXKpbqNGfLq for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 10:30:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E056C838B2
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 10:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E056C838B2
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 461E8A4C0367;
 Sat, 29 Jul 2023 12:30:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35868)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPhDK-0003O6-2R;
 Sat, 29 Jul 2023 12:30:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 12:30:22 +0200
Message-Id: <20230729103022.378621-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690626623;
 bh=gpT1U4LiAXom1OTzLouE2lIfZHz/AcPuaVUsRKTN344=;
 h=From:To:Cc:Subject:Date:From;
 b=PISsbrwP+MCX/haMA1Zh3aQA6GlIgRFN7Tv3sBDhEf29AyF7jji4aVWkOgq+LSCnd
 fuDTRQEkyzERUox35+5sGY9y1xJH0utxo1NvXL9dqTmAVomv1JpqLuIjaCxBAu7LCf
 mjt9FwpsYcF9FLjlazDm222Kbm5nuBYRw2WFeeMNUW6xN7BjucYG5Ty0mibIu7qFqd
 VATuqru+gdUt6H3kF/RUS8ZmeU3RwmeSoEXOOl3qCI31PJqeMeDU+2V97j5nX95cTX
 pQvQj8E/bNlIg4igAtpQRu67NnRWMmfTLQcL+PSSWCuuzwipeFhe0dy1itEcOv4NRy
 MLyzHYGf+J/dQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=PISsbrwP
Subject: [Buildroot] [PATCH 1/1] package/cairo: fix pthread detection
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

Cairo's link check for pthreads support "must complete without warnings
or errors to stderr":
https://cgit.freedesktop.org/cairo/tree/build/aclocal.cairo.m4?h=1.16.0#n83
https://cgit.freedesktop.org/cairo/tree/build/configure.ac.pthread?h=1.16.0#n137

The pthread check fails with this defconfig

checking for cairo's pthread feature...
checking whether cairo's pthread feature could be enabled... no (can't link with -lpthread or -pthread)

due a warning thrown by ld:

/home/bernd/buildroot/output/per-package/cairo/host/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
 warning: /home/bernd/buildroot/br4/output/per-package/cairo/host/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/crtendS.o:
 missing .note.GNU-stack section implies executable stack

/home/bernd/buildroot/output/per-package/cairo/host/bin/../lib/gcc/xtensa-buildroot-linux-uclibc/12.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
 NOTE: This behaviour is deprecated and will be removed in a future version of the linker

These linker warnings were introduced by binutils 2.39:
https://www.redhat.com/en/blog/linkers-warnings-about-executable-stacks-and-segments

Silence them by adding "-Wl,-z,noexecstack" to fix cairo's pthread check

Meanwhile upstream removed autoconf support on the master branch:
https://cgit.freedesktop.org/cairo/commit/?id=efe303d9db6e24d5786c15252327811338bc9b0a
so no need to notify them.

Fixes:
http://autobuild.buildroot.net/results/408/408a900ac01dbce145aff302c75f9f4e147f5672/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cairo/cairo.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7bc8f92deb..3e1a7956f7 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -19,7 +19,9 @@ CAIRO_IGNORE_CVES += CVE-2019-6462
 # 0004-Fix-mask-usage-in-image-compositor.patch
 CAIRO_IGNORE_CVES += CVE-2020-35492
 
-CAIRO_CONF_ENV = LIBS="$(CAIRO_LIBS)"
+CAIRO_CONF_ENV = \
+	LIBS="$(CAIRO_LIBS)" \
+	LDFLAGS="$(TARGET_LDFLAGS) -Wl,-z,noexecstack"
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
