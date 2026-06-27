Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C2C43458
	for <buildroot@archiver.kernel.org>; Sat, 27 Jun 2026 12:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A6FB607AE;
	Sat, 27 Jun 2026 12:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BfOyngYylvt; Sat, 27 Jun 2026 12:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 893FF607DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782561915;
	bh=FqyxmxU4hNJIl8XWbiOGiAuRUdzgk6njoLO0GGdc2zc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=g+lY0ZHmvHAguQQ/ElfrxKRIpxKy2wSjXS2i52p9E2/t51ZtcS545irB7CypvXCkM
	 mNfJQcViU8LmJhnYcxn8CgMzD2PWW0f/0IRvEcVOGUHgL6LEaYf8EQJRtT04/Jayfe
	 0muNkF22eRsnhghm0njA9mzYU25fTWRAc9OkIPb55sH+NQXAuCfKNlE5vT+7Ta0Nz+
	 tCuJf3GVjcosXnHSjiKfmmXMCJ39L5G93i21plNJAbnjDiM9sGflC5UOaLg0e6fP7i
	 qrUu8FjX2z0kspv6wGNQmJDXpz1GLD0ORllUlvga7gRZDjDHrdH6BwTctRWS52QpYU
	 5M9y6k1sBvPTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 893FF607DE;
	Sat, 27 Jun 2026 12:05:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A5B628A
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 12:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7832740102
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 12:05:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6YQcg0RbduB for <buildroot@buildroot.org>;
 Sat, 27 Jun 2026 12:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B7C34006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B7C34006B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B7C34006B
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 12:05:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvK0R-1xTtwZ2zBp-013JMf; Sat, 27
 Jun 2026 14:05:06 +0200
To: buildroot@buildroot.org
Date: Sat, 27 Jun 2026 14:04:52 +0200
Message-ID: <20260627120452.803450-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3Ma+rKkziwrU0XlF0hj/MZMIDMCWe1a4DurO3r4q8TgC32qXvsA
 L3U9sRSSp8Mre+Rb8RGEA78zohTWQVu0ZhMWIW1yiJpcfsmmxBqD9+O4wMYgouf7DcN3EgZ
 FW8/G8pg4NyPWKHxAUqQIfayeVP3gE2xKLP6QFg/clxn5ysdH9WgTOwKpSBg0/6p1Fy2eoV
 kGVAwf2LyWdRtRtN13MeQ==
UI-OutboundReport: notjunk:1;M01:P0:UGKhCpy9op8=;pMmjkq8XbboE39HxeJizUWV8Oi5
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782561906; x=1783166706; i=fiona.klute@gmx.de;
 bh=mX9awkJBWJjmd1IefgrB06Ez2xpxABoQNe7gCN3DLLA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=cU+ugMYHihGE56ZO6QV8M7uEElJwqLhIUfaakMDkL4l/zBMQQqVzs0W46I+M3tvY
 ONEL079XzZz9vrDx4tTE/hvbc1AxPmMbqwjATL59Ue8gBB8p66TrqjAlhPUiPiOya
 x9hHUFhBfWcgbcYy4+yUMpdhOqtbcfykLwZDHbIUoIpb8k+wm5KoZFlycuA/qRMMr
 4Q4l3Kca0tv6mkVeWAOxOyRZ3Sh5LK5x76RjbOs+NstDrGNDq3mPAOejNrEMSXDHb
 hQAidEXdgzRPv8VU9gfUtd2aBSYWI5WFDup8vPgkg/C8ff3AqP1/PKvZE40kQu8CF
 ImvWKWTLuLellx05aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=cU+ugMYH
Subject: [Buildroot] [PATCH 1/1] package/libglib2: drop unused
 0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 11aa1cfa5af9a77a0a9f726bd38f1b7db659c0bf the patch was accidentally
moved into a versioned directory with the wrong version (2.82.0
instead of 2.82.4) and thus not applied. However, there have been no
issues reported.

The patch description mentions being needed to fix build errors in
package/atk and package/libnice. It was originally added in
b094f88a4d501101bfba9b65491209e6a0fe0397, and amended for libnice in
2c916b400bc608512db790d97df010ca666b6dd2. package/atk was removed in
2c3ca7bea1de76163aeef432412eb14551ed0581, because atk has been merged
into at-spi2-core. Both at-spi2-core and libnice are Meson packages,
as was atk at the time of its removal.

Both current packages build with the following configuration (tested
using utils/test-pkg):

BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_GOBJECT_INTROSPECTION=y
BR2_PACKAGE_LIBNICE=y
BR2_PACKAGE_AT_SPI2_CORE=y

Evidently the patch is no longer needed, presumably because the
correct search path for GIR files is set by other means, and we can
remove it instead of fixing the version number of the patch directory.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I admit it is a bit unsatisfying that it's unclear exactly *what*
fixed that search path. Another bit of evidence I have is that when
working on that libglib2 2.82.x and gobject-introspection 1.82.0
version bump it was primarily for package/python-gobject, which also
uses Meson, so it probably was either that bump or a Meson bump at
some point before.

TestPythonPy3NetworkmanagerGoi (accessing NM using python-gobject)
passes with this patch.

For stable branches it's probably easiest to verify at-spi2-core and
libnice build using test-pkg and the config snippet above.

 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 53 -------------------
 package/libglib2/libglib2-bootstrap/2.82.0    |  1 -
 2 files changed, 54 deletions(-)
 delete mode 100644 package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
 delete mode 120000 package/libglib2/libglib2-bootstrap/2.82.0

diff --git a/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch b/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
deleted file mode 100644
index c6135b15a1..0000000000
--- a/package/libglib2/2.82.0/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 3fcd5f431dee9909b6bcbd9b8b61d4b1fe4b5f92 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Nov 2021 18:01:05 +0100
-Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
-
-Add girdir to gio-2.0.pc and glib-2.0.pc to fix the following build
-failure with atk or libnice:
-
-/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
-Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
-
-Fixes:
- - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
- - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-[Fiona: refresh for glib 2.80.4]
-Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
-Upstream: Never submitted
----
- gio/meson.build  | 1 +
- glib/meson.build | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/gio/meson.build b/gio/meson.build
-index 59c2b0f..5120537 100644
---- a/gio/meson.build
-+++ b/gio/meson.build
-@@ -885,6 +885,7 @@ pkg.generate(libgio,
-   variables : [
-     'schemasdir=' + '${datadir}' / schemas_subdir,
-     'dtdsdir=' + '${datadir}' / dtds_subdir,
-+    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
-     'giomoduledir=' + pkgconfig_giomodulesdir,
-     'gio=' + '${bindir}' / 'gio',
-     'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
-diff --git a/glib/meson.build b/glib/meson.build
-index d2efeba..a69532b 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -447,6 +447,7 @@ pkg.generate(libglib,
-   subdirs : ['glib-2.0'],
-   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
-   variables : [
-+    'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
-     'glib_genmarshal=' + '${bindir}' / 'glib-genmarshal',
-     'gobject_query=' + '${bindir}' / 'gobject-query',
-     'glib_mkenums=' + '${bindir}' / 'glib-mkenums',
--- 
-2.45.2
-
diff --git a/package/libglib2/libglib2-bootstrap/2.82.0 b/package/libglib2/libglib2-bootstrap/2.82.0
deleted file mode 120000
index 28b180f102..0000000000
--- a/package/libglib2/libglib2-bootstrap/2.82.0
+++ /dev/null
@@ -1 +0,0 @@
-../2.82.0
\ No newline at end of file
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
