Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B93C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 21:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 052EF407C8;
	Mon, 21 Sep 2026 21:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2aTHPpZWYA7; Mon, 21 Sep 2026 21:45:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A2A69407CC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790027140;
	b=WpWA8bKnh4td6f3EOYfL40tJNwF0TD/dSPTSFJZPDzox2kBRG16nmjYiMoijT1obuDnS
	 xD94OwrELtu/gPQYYWHgiZp4F25BSvArQTAAEVq4PTfeqCOHy3l0Aft8381b2vudMnkb3
	 fk2+JTSfO8oCK1SN3D6RuCuW5TQaaJsJH61xHXWdEDpRTFr1MJ5cI2aae3VBnbEPA/FJ1
	 PR7cRdLnC3eMTKmSaUvhMYpUaw1aRBoy/lF3pZTck2uNTyKLpMkktVJVI3E4A5yjZ6GuW
	 ccRUTJVj9kUmZEo3v1gI/QmaaFmAFW+Y157wC+BBZx7oH02yY9rBWSNnr3r9f/E9zGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790027140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=q6dXjqU0bq13o9bMtFxR1LtymVedwl1npdACnIqM4Ws=;
	b=Piw4TAQdpbCpv68lD4wvYRHfK03Y0nH6F7EldtnNd18v/yciCAm4gE/udiMU3WL4vNqy
	 x5LZHzhkVtgHQREFZjSR+v3z3Rwux5S4qemMprezf6RGkZ8HWKzRS9VZcLfhvEMs9HwtZ
	 DAqoEPwyPZvB0QmjXJG5y6HYMDfedhfqqfTzYcIMoHseG/j+ax0ItSSZ+Lzvq5LQcdrg3
	 M/P5fuo+cOyq4Wp3PtXZhvW6BRJM4UibTMlTIZo8rIFfyXhxS6fSIsNTYQ99pirkQFHqN
	 E3KEegxxnkxiWhpe9GPJuxI9zofnlSkEmCH3Ka59k+J/mftsvrMiZwvnxUyNOT4Cg1Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790027140;
	bh=q6dXjqU0bq13o9bMtFxR1LtymVedwl1npdACnIqM4Ws=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFIFMZWYP//gdrVegawBzc6wSmsmDdQx4xJjDfC3W07tUvLCK74wSKMFA613nRZh/
	 irZmOY0A+JLnteIVY5WfPNEOkrloO/M42pt/vlUe/6IVq/om5Puxt1A2Gpt/OlvM40
	 HUADDWho8Gy9eFeMqlXPpgwPuaGp0JiVxmIfXl3GdKkWb7nL1ZB1GPSG0+foY/58m/
	 WxkzXVm5XpVqkYm196y1K3u1FD16YOM4MZ4PyfwLg57Rdo40EdoO6mn5Ui1VMarT6o
	 f2s/rmQ1UIx5pXDVAb+b+NIG9Xwof26rBs4Of4vpJFqnGi0pCH83zNUyRvc4fCPgd1
	 6yIK4IJOTR8SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2A69407CC;
	Mon, 21 Sep 2026 21:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 413AF224
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C9A80C95
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 21:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 73cGMwPl3liG for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 21:45:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6DD7780C86
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790027137;
 b=k2GicnESt95NRfGKGTmF3aErJuvdUOHQQpX2zzjOSF89Ns+MZdgqupUeA1i5bIJuyaee
 X3yGLnzFzXLiHgXs9Orq0t/Zl5sEKslImKIyy+mmR9UOtytyY2S7QRavpr2joLgV6uSOv
 8jLsWKVxLKSw1vdIvczto27H1GQm40nGjP5dUE1qTeUXy+6gfJ3aKTqAzMo1kT6CGRvf7
 V9MuaCPJ2XmjMauvfRwrbpfULelMxZ41a7tav1dYsCH6ZQM+iRsY3fIsutAiz7KHnDKVs
 s/N5aIkVAdP5KjeS1sL4hkMAgE01Fs/681kdrdEwnJoUKxrq0bNmJi9UL5ZC9ybdFkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790027137;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=38hMrSfd+qvINkwz1I/jEAo01pSJdugTDb+yGOX/KMI=;
 b=fo90a58brkOshRk4jhbWHxS+pp8g+GMmumNrZryK7MQD6dhE/OnPbWP9BZrn02yO2dwq
 gPzXLxwZEYqiOrAaHN7uLmy/sOEKJJqTRmyL3TtFipDvGSo5eXngi8PLwpOELvCnbMGn8
 myUkwiPBy7QVQYxpAfLUCuVv0RwLHUB2yc0B3ZlccXRaZo8RbqyL1jGroBqBGOnnlcsg2
 zVt3qlpsK52MCIoUbTGZ+/r+rMAZkggRHwdxiAdMFo1YusaxHVdN8PmVvs2xbqoCBhim+
 9JfIpG90fEQWwoNzdSw4L8FXpkRooa8/LDB/vQ5Z9jSFGpjM564l9VMDgZAR+pZ+ubg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PMeOlUXJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PMeOlUXJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DD7780C86
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790027119;
 bh=38hMrSfd+qvINkwz1I/jEAo01pSJdugTDb+yGOX/KMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PMeOlUXJ0nCPW2CjFT9fXhZaN6LqManjGKKPD4Sp0QmmQSNOwM7SMEC9y4w/ncsWI
 hnpIErnuInq5pvivUIII4205v0SdXNVobX0ZUR4xpwzpm4ROZRzn2Mz2rdSOdplzT6
 WNdEiibd1NW4edY4FrpU0iqjX2NDXhOB07LkDsHJLHiQxhKquFh9w4l5jjM6NSwiVB
 KsOJeRIA5P7owI3iu9qL9UYf3uBnA9R20enqwyw+k69as6E9mnyLJOhrSaq/yo6p/t
 d94qFU+5GK03EQleRSFM+4maY++T8DXARL4+LS0uFnpHVEah+5qLST712aYVQRiUTO
 nAt67g5dNcBuw==
X-KAS-Sym: v3:f51bdf72230551df:ZqUfWfh+bMOjEpHfPHR3UZ2ScZEcJUXGAcocY45NRs/fF0r6dbpMWakOSXXF4lfp30limGQldOV/aAp6ygOEGLZy8CUGhrkOWhFyc048C5vNcJcGgAqTNcO8JVFGWlTaZN+QPuUp1TYa4Zkn1tCnBm1+7KDNERFCyANJpGbKek56jDdK1t4P7GOgFlhjcTlFPiPNx/dv1+N8+kOp1h9S46JqaP+fgHcKiJzud+Tt1fMhyNV5sl2SvzYJcbbyBnMGKoGsbO7ktDQVHjAA6lC9q2ANxP2n/S7qYj8Z/WkEv1P+iHFKrWlcVtwhPGMQ+7OS22S/zDIcIRN58NA3qH2ZQw==:qjoq4h6Cx8jJA0y0AuAsjNWNpffLkD+4UJobzNi4aG5cRT9XJrf6xb3WESChGqgwTlP3d1hQ8FnvoP9NyVAqACcs3G0u2H4rfRBuCPYxagCmwiHvjTlHr7W64sDBPxwoVwc88jMkCHtzlc5s66Lx15oHEK6QnCyYmHHcIk//cuecod2/famyeDMxMp1SzNlDlGNRwUJgAlLpqPCbvyEHJN3f8ZvnaumcihIcQx3gfQhAu87tIsphp4HT1H1h0TjfHziONiZDRJ49opHrytSNB1tsU0cXXnUI150A5noP014VPttlIy1pXU/I+G8o2XVr7gaxK7W9Z0fInHbqJH5kDCttkHMlOL4uql4kU5TUXKrkYuvtzG2MZ+qZH7E0H82u2MoEkXKB/BMb1ySSdLgcAU/zCbXcEWLZpL94s9eVCFHlN8Leo1sJH2yRj3isbyimRxeiMlxJEtoQpOrr0I7EksFiVn5db+thfM9NDyQHOmKSHN/NxsRT4uqc1TJ/+LMBkI12540HtfxoJdC7IE6dM1dqVP/bklg+geo6gJ9sI6HPZBVwjsMOgwjTJduVMAc9G89Dxffe/BWM1KBxh2o7PPDNavsgT1ImNFrULuNsNhsFM9
 1nZTuq1ky46g65hJYhn9+/D/xlt68CMYaYiPaJm4ayO6Ut1RGolSuIQ7PoN6KMR6LrjLUnGBCni0KqIK9G
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95B58A4C4047;
 Mon, 21 Sep 2026 23:45:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53096)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8lp9-000000006Qx-0Ogo;
 Mon, 21 Sep 2026 21:45:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 21 Sep 2026 23:45:18 +0200
Message-ID: <20260921214518.3764002-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921214518.3764002-1-bernd@kuhls.net>
References: <20260921214518.3764002-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/flutter-engine: bump version to
 3.44.9
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

This release includes upstream commit
https://github.com/flutter/flutter/commit/5526436a9488419a391a9d9242a068d2569ffadb
which adds a new configure option --no-default-linux-sysroot that
implements the same function our patch 0001 added, the patch is now
superfluous and was removed.

Added new patch 0001 to fix a build error with at-spi2-core.

Rebased patches 0002 & 0003.

Added new patch 0005 to fix build errors with pango >= 1.58.0.

Removed configure option --enable-impeller-3d due to upstream commit
https://github.com/flutter/flutter/commit/2c970ccee18a53c1c6b1b1dd0a05e031bbc962d6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
All Gitlab pipelines
https://gitlab.com/bkuhls/buildroot/-/commits/47e9d779159ea92659def9c2fe93090a64f2018d
failed due to "no space left on device"

 ....h-in-sysroots-to-add-C-linkage-decl.patch | 121 ++++++++++++++++++
 .../0001-disable-pre-canned-sysroot.patch     |  32 -----
 .../0002-remove-explicit-x11-dependency.patch |  22 ++--
 .../0003-fix-toolchain-paths.patch            |  21 ++-
 .../0005-Fix-building-on-Pango-1.58.0.patch   |  33 +++++
 package/flutter-engine/flutter-engine.mk      |   4 +-
 6 files changed, 186 insertions(+), 47 deletions(-)
 create mode 100644 package/flutter-engine/0001-Patch-atkversion.h-in-sysroots-to-add-C-linkage-decl.patch
 delete mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 create mode 100644 package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch

diff --git a/package/flutter-engine/0001-Patch-atkversion.h-in-sysroots-to-add-C-linkage-decl.patch b/package/flutter-engine/0001-Patch-atkversion.h-in-sysroots-to-add-C-linkage-decl.patch
new file mode 100644
index 0000000000..dae8350d0d
--- /dev/null
+++ b/package/flutter-engine/0001-Patch-atkversion.h-in-sysroots-to-add-C-linkage-decl.patch
@@ -0,0 +1,121 @@
+From 644385a0422793fb1b5324fab666289cd7ffc34c Mon Sep 17 00:00:00 2001
+From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
+Date: Tue, 25 Aug 2026 11:18:23 +0200
+Subject: [PATCH] Patch atkversion.h in sysroots to add C linkage
+ declarations
+
+The atkversion.h header in at-spi2-core (Debian Bullseye 2.38 and
+Trixie 2.56.2) lacks G_BEGIN_DECLS/G_END_DECLS, causing link failures
+when included from C++ code. This was fixed upstream in
+https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/219
+but the fix has not yet propagated to all Debian stable releases.
+
+Previously, fl_view_accessible.cc and fl_accessibility_handler_test.cc
+worked around this by wrapping #include <atk/atk.h> in extern "C" { }.
+This breaks on Trixie sysroots where atk.h pulls in headers with C++
+features that cannot be inside an extern "C" block.
+
+This commit:
+- Adds PatchAtkVersionHeader() to install-sysroot.py, which patches
+  atkversion.h after sysroot extraction to add G_BEGIN_DECLS/
+  G_END_DECLS (the same fix as upstream MR 219). Idempotent.
+- Removes the extern "C" workaround from fl_view_accessible.cc and
+  fl_accessibility_handler_test.cc, relying on the patched header
+  for proper C linkage.
+
+Upstream: https://github.com/flutter/flutter/pull/178712
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../linux/sysroot_scripts/install-sysroot.py  | 27 +++++++++++++++++++
+ .../linux/fl_accessibility_handler_test.cc    |  4 ---
+ .../platform/linux/fl_view_accessible.cc      |  4 ---
+ 3 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/engine/src/build/linux/sysroot_scripts/install-sysroot.py b/engine/src/build/linux/sysroot_scripts/install-sysroot.py
+index 2d4cea9342d..5229a09e54e 100755
+--- a/engine/src/build/linux/sysroot_scripts/install-sysroot.py
++++ b/engine/src/build/linux/sysroot_scripts/install-sysroot.py
+@@ -102,6 +102,31 @@ def GetSysrootDict(sysroots_json_path, target_platform, target_arch):
+     if sysroot_key not in sysroots:
+         raise Error("No sysroot for: %s %s" % (target_platform, target_arch))
+     return sysroots[sysroot_key]
++def PatchAtkVersionHeader(sysroot):
++  """Patch atkversion.h in the sysroot to add C linkage declarations.
++
++  The atkversion.h header in at-spi2-core (used by Debian Bullseye and
++  Trixie sysroots) lacks G_BEGIN_DECLS/G_END_DECLS, causing link failures
++  when the header is included from C++ code.  This was fixed upstream in
++  https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/219
++  but the fix has not yet propagated to all Debian stable releases.
++  """
++  for atkversion in glob.glob(
++      os.path.join(sysroot, "usr", "include", "atk-1.0", "atk", "atkversion.h")):
++    with open(atkversion, "r") as f:
++      content = f.read()
++    if "G_BEGIN_DECLS" in content or 'extern "C"' in content:
++      continue  # Already has C linkage declarations
++    # Add G_BEGIN_DECLS after #include <glib.h> and G_END_DECLS
++    # before the final #endif.
++    content = content.replace(
++        "#include <glib.h>\n", "#include <glib.h>\n\nG_BEGIN_DECLS\n", 1)
++    content = content.replace(
++        '#endif /* __ATK_VERSION_H__ */',
++        'G_END_DECLS\n\n#endif /* __ATK_VERSION_H__ */', 1)
++    with open(atkversion, "w") as f:
++      f.write(content)
++
+ def InstallSysroot(sysroots_json_path, target_platform, target_arch):
+     sysroot_dict = GetSysrootDict(sysroots_json_path, target_platform,
+                                   target_arch)
+@@ -120,6 +145,7 @@ def InstallSysroot(sysroots_json_path, target_platform, target_arch):
+             os.path.join(sysroot, ".*_is_first_class_gcs")):
+         with open(stamp) as s:
+             if s.read() == url:
++                PatchAtkVersionHeader(sysroot)
+                 return
+     print("Installing Debian %s %s root image: %s" %
+           (target_platform, target_arch, sysroot))
+@@ -145,6 +171,7 @@ def InstallSysroot(sysroots_json_path, target_platform, target_arch):
+         raise Error("Tarball sha256sum is wrong."
+                     "Expected %s, actual: %s" % (tarball_sha256sum, sha256sum))
+     subprocess.check_call(["tar", "mxf", tarball, "-C", sysroot])
++    PatchAtkVersionHeader(sysroot)
+     os.remove(tarball)
+     with open(stamp, "w") as s:
+         s.write(url)
+diff --git a/engine/src/flutter/shell/platform/linux/fl_accessibility_handler_test.cc b/engine/src/flutter/shell/platform/linux/fl_accessibility_handler_test.cc
+index 8a0a972d2eb..913cc480a15 100644
+--- a/engine/src/flutter/shell/platform/linux/fl_accessibility_handler_test.cc
++++ b/engine/src/flutter/shell/platform/linux/fl_accessibility_handler_test.cc
+@@ -2,11 +2,7 @@
+ // Use of this source code is governed by a BSD-style license that can be
+ // found in the LICENSE file.
+ 
+-// Workaround missing C code compatibility in ATK header.
+-// Fixed in https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/219
+-extern "C" {
+ #include <atk/atk.h>
+-}
+ 
+ #include "flutter/shell/platform/linux/fl_accessibility_handler.h"
+ #include "flutter/shell/platform/linux/fl_binary_messenger_private.h"
+diff --git a/engine/src/flutter/shell/platform/linux/fl_view_accessible.cc b/engine/src/flutter/shell/platform/linux/fl_view_accessible.cc
+index df3a986ab9f..0f1cb1caf80 100644
+--- a/engine/src/flutter/shell/platform/linux/fl_view_accessible.cc
++++ b/engine/src/flutter/shell/platform/linux/fl_view_accessible.cc
+@@ -2,11 +2,7 @@
+ // Use of this source code is governed by a BSD-style license that can be
+ // found in the LICENSE file.
+ 
+-// Workaround missing C code compatibility in ATK header.
+-// Fixed in https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/219
+-extern "C" {
+ #include <atk/atk.h>
+-}
+ 
+ #include "flutter/shell/platform/linux/fl_accessible_node.h"
+ #include "flutter/shell/platform/linux/fl_accessible_text_field.h"
+-- 
+2.47.3
+
diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
deleted file mode 100644
index 2c02fc4948..0000000000
--- a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 2001
-From: Joel Winarske <joel.winarsk@gmail.com>
-Date: Wed, 19 Jul 2023 15:24:22 -0700
-Subject: [PATCH] disable pre-canned sysroot
-
-Override should be enabled if a custom sysroot using --target-sysroot is
-specified. If --target-sysroot is not set, then it should default to the
-pre-canned sysroot.
-
-Upstream: https://github.com/flutter/flutter/issues/123073
-Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- engine/src/build/config/sysroot.gni | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/engine/src/build/config/sysroot.gni b/engine/src/build/config/sysroot.gni
-index 7987e519d..1de694263 100644
---- a/engine/src/build/config/sysroot.gni
-+++ b/engine/src/build/config/sysroot.gni
-@@ -12,7 +12,7 @@ declare_args() {
- 
-   # Whether to use the default sysroot when building for Linux, if an explicit
-   # sysroot isn't set.
--  use_default_linux_sysroot = true
-+  use_default_linux_sysroot = false
- }
- 
- if (current_toolchain == default_toolchain && target_sysroot != "") {
--- 
-2.41.0
-
diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
index 85f6db1c38..5751b898d4 100644
--- a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
+++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
@@ -9,6 +9,8 @@ gtk3 (e.g. wayland.)
 Upstream: https://github.com/flutter/flutter/issues/123073
 Signed-off-by: Joel Winarske <joel.winarske@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[Bernd: rebased for 3.44.9]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  engine/src/flutter/shell/platform/linux/config/BUILD.gn | 4 ----
  1 file changed, 4 deletions(-)
@@ -17,17 +19,17 @@ diff --git a/engine/src/flutter/shell/platform/linux/config/BUILD.gn b/engine/sr
 index da0ac056b..70c7a0ea1 100644
 --- a/engine/src/flutter/shell/platform/linux/config/BUILD.gn
 +++ b/engine/src/flutter/shell/platform/linux/config/BUILD.gn
-@@ -5,10 +5,6 @@
- import("//build/config/linux/pkg_config.gni")
- import("//flutter/shell/platform/glfw/config.gni")
+@@ -7,10 +7,6 @@
  
--pkg_config("x11") {
--  packages = [ "x11" ]
--}
--
- pkg_config("gtk") {
-   packages = [ "gtk+-3.0" ]
- }
+ _pkg_configs = [
+   {
+-    name = "x11"
+-    package = "x11"
+-  },
+-  {
+     name = "gtk"
+     package = "gtk+-3.0"
+   },
 -- 
 2.41.0
 
diff --git a/package/flutter-engine/0003-fix-toolchain-paths.patch b/package/flutter-engine/0003-fix-toolchain-paths.patch
index 93239c039f..d797e15f2f 100644
--- a/package/flutter-engine/0003-fix-toolchain-paths.patch
+++ b/package/flutter-engine/0003-fix-toolchain-paths.patch
@@ -12,6 +12,8 @@ Upstream: https://github.com/flutter/flutter/issues/123073
 
 Signed-off-by: Joel Winarske <joel.winarsk@gmail.com>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+[Bernd: rebased for 3.44.9]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  engine/src/build/toolchain/custom/BUILD.gn | 4 +++++------
  1 file changed, 5 insertions(+), 6 deletions(-)
@@ -20,11 +22,23 @@ diff --git a/engine/src/build/toolchain/custom/BUILD.gn b/engine/src/build/toolc
 index 65b1623..8b3f6f8 100644
 --- a/engine/src/build/toolchain/custom/BUILD.gn
 +++ b/engine/src/build/toolchain/custom/BUILD.gn
-@@ -12,11 +12,11 @@ toolchain("custom") {
+@@ -7,21 +7,17 @@
+ 
+ toolchain("custom") {
+   toolchain_bin = "${custom_toolchain}/bin"
+-  compiler_prefix = ""
+-  if (use_ccache) {
+-    compiler_prefix = "ccache "
+-  }
+ 
+   # We can't do string interpolation ($ in strings) on things with dots in
+   # them. To allow us to use $cc below, for example, we create copies of
    # these values in our scope.
-   cc = "${toolchain_bin}/clang"
-   cxx = "${toolchain_bin}/clang++"
+-  cc = "${compiler_prefix}${toolchain_bin}/clang"
+-  cxx = "${compiler_prefix}${toolchain_bin}/clang++"
 -  ar = "${toolchain_bin}/${custom_target_triple}-ar"
++  cc = "${toolchain_bin}/clang"
++  cxx = "${toolchain_bin}/clang++"
 +  ar = "${toolchain_bin}/llvm-ar"
    ld = "${toolchain_bin}/clang++"
 -  readelf = "${toolchain_bin}/${custom_target_triple}-readelf"
@@ -38,3 +52,4 @@ index 65b1623..8b3f6f8 100644
    sysroot_flags = "--sysroot ${custom_sysroot}"
 -- 
 2.39.2
+
diff --git a/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
new file mode 100644
index 0000000000..9bb475187b
--- /dev/null
+++ b/package/flutter-engine/0005-Fix-building-on-Pango-1.58.0.patch
@@ -0,0 +1,33 @@
+From f1c316430713ae7d526f8abc1621b09958aef281 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 21 Sep 2026 22:06:06 +0200
+Subject: [PATCH] Fix building on Pango 1.58.0
+
+This version added the autoptr macros which we no longer need to define.
+
+Upstream: https://github.com/flutter/flutter/pull/193119
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../flutter/shell/platform/linux/fl_accessible_text_field.cc  | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+index e99b123bbfd..f7955a32f07 100644
+--- a/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
++++ b/engine/src/flutter/shell/platform/linux/fl_accessible_text_field.cc
+@@ -6,7 +6,11 @@
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_standard_message_codec.h"
+ #include "flutter/shell/platform/linux/public/flutter_linux/fl_value.h"
+ 
++// PangoContext g_autoptr macro weren't added until 1.58.0. Add them manually.
++// https://gitlab.gnome.org/GNOME/pango/-/commit/223b147
++#if !PANGO_VERSION_CHECK(1, 58, 0)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(PangoContext, g_object_unref)
++#endif
+ // PangoLayout g_autoptr macro weren't added until 1.49.4. Add them manually.
+ // https://gitlab.gnome.org/GNOME/pango/-/commit/0b84e14
+ #if !PANGO_VERSION_CHECK(1, 49, 4)
+-- 
+2.47.3
+
diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 1fa59a3863..e7ff5e2eef 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -22,7 +22,7 @@
 # There is no hash provided for the source tarball, as the gn binary
 # (used for configuration) relies on the .git directories. As such, a
 # reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.29.2
+FLUTTER_ENGINE_VERSION = 3.44.9
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
@@ -83,6 +83,7 @@ FLUTTER_ENGINE_CONF_OPTS = \
 	--runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \
 	--target-os linux \
 	--target-sysroot $(STAGING_DIR) \
+	--no-default-linux-sysroot \
 	--target-toolchain $(FLUTTER_ENGINE_CLANG_PATH) \
 	--target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)
 
@@ -127,7 +128,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_ENGINE_DEPENDENCIES += libgles
-FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-3d
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLFW),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
