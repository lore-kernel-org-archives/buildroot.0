Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDD2C71157
	for <buildroot@archiver.kernel.org>; Sat, 21 Jun 2025 12:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A5181E55;
	Sat, 21 Jun 2025 12:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snVl5FV86QpE; Sat, 21 Jun 2025 12:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F1AD81786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F1AD81786;
	Sat, 21 Jun 2025 12:27:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88466E2
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 12:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7272F6064E
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 12:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rLUTFRoITcyb for <buildroot@buildroot.org>;
 Sat, 21 Jun 2025 12:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 39E14605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39E14605DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39E14605DA
 for <buildroot@buildroot.org>; Sat, 21 Jun 2025 12:27:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 80EC1A4C0F72;
 Sat, 21 Jun 2025 14:27:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36734)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uSxJc-000000001r3-2INv;
 Sat, 21 Jun 2025 12:27:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sat, 21 Jun 2025 14:27:24 +0200
Message-Id: <20250621122724.957110-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750508844;
 bh=YdyoGDJDWoAOLV02PVxLr919Iib/8Epz4P/OKE+S6NA=;
 h=From:To:Cc:Subject:Date:From;
 b=yPC6n4XP5sA1LFgP8tDLu5o8Yr8fz0w+7q228yDkEf1Edn3mifVOVsER74NXU+CH7
 QkvFX06ACMS+d2TldGi3n74mpiqtt1/4eFDYmlzyh77mu34/yLI2ckSxgBpgnWRrNp
 bok6zwQ+2mcJGp7DtFCTm8TudqT/M2cVcqQC0WKiz5R9eAeBPlZvppmBgLCrY5FaAD
 AJAgs71Wit4cn59JODvVPIy3v1HoEEn/M4JOD0uC2aE7IiBWgBpdbEOF/HBwD525pZ
 1E/cGbty0oLr7T73lQqnoXUWwm6HIYDnlCzINvVwsSKbfQQu/H9HJDYMmji69s5KHU
 e8gYN+jMZx4vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=yPC6n4XP
Subject: [Buildroot] [PATCH 1/1] package/mpv: remove stale patch
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

Buildroot commit 8f69974c20fbc7dc642be62a0ef3fb2941f5bb35 switched the
buildsystem of mpv from waf to meson but forgot to remove a patch which
fixed a waf-related build error.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                          |  1 -
 package/mpv/0001-fix-powerpc64-altivec.patch | 32 --------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 package/mpv/0001-fix-powerpc64-altivec.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0534465eb3..cb3d3bc33b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -814,7 +814,6 @@ package/mono/0001-Fix-linkage-with-a-system-libatomic_ops-shared-library.patch l
 package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
 package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
-package/mpv/0001-fix-powerpc64-altivec.patch lib_patch.Upstream
 package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
 package/mrouted/S41mrouted NotExecutable
 package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
diff --git a/package/mpv/0001-fix-powerpc64-altivec.patch b/package/mpv/0001-fix-powerpc64-altivec.patch
deleted file mode 100644
index 45983fec8f..0000000000
--- a/package/mpv/0001-fix-powerpc64-altivec.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] Work around bool type redefinition by altivec
-
-On powerpc64le, the SDL header may include altivec.h and this
-(combined with -std=c99) will cause a compile failure due to bool
-being redefined as a vector type.
-
-Adjust the compiler flags to add -std=gnu99 (which is compatible with
-altivec) when using gcc. The generic flag '-std=c99' is left in place for other
-compilers (in the gcc case it is overridden by the (later) gnu flag).
-
-Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
----
- waftools/detections/compiler.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/waftools/detections/compiler.py b/waftools/detections/compiler.py
-index 5bbba87..50836a2 100644
---- a/waftools/detections/compiler.py
-+++ b/waftools/detections/compiler.py
-@@ -43,7 +43,8 @@ def __add_gcc_flags__(ctx):
-                        "-Wno-switch", "-Wparentheses", "-Wpointer-arith",
-                        "-Wno-pointer-sign",
-                        # GCC bug 66425
--                       "-Wno-unused-result"]
-+                       "-Wno-unused-result",
-+                       "-std=gnu99"]
- 
- def __add_clang_flags__(ctx):
-     ctx.env.CFLAGS += ["-Wno-logical-op-parentheses", "-fcolor-diagnostics",
--- 
-2.10.0.297.gf6727b0
-
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
