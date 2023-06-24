Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B4EEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 08:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9D7606BF;
	Sat, 24 Jun 2023 08:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE9D7606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgwQnWBg-Jhh; Sat, 24 Jun 2023 08:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B016114D;
	Sat, 24 Jun 2023 08:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B016114D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA551BF401
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2966481F67
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 08:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2966481F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ok_ufsmFpQDg for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 08:29:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE9982138
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FE9982138
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 08:29:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33FBFA4C04E3
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 10:29:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33746)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qCyeX-0004nb-2Z
 for buildroot@buildroot.org; Sat, 24 Jun 2023 10:29:53 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 10:29:53 +0200
Message-Id: <20230624082953.2537472-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687595394;
 bh=FoEyo/qgX6Uj/vUP1nSB8CRM9f9a16V1jcQ6KIc7S34=;
 h=From:To:Subject:Date:From;
 b=hlB/gVOAE5L9GrvdhsnvVAtVeowjkk8gs9Q2+9czh38oJyd/IYV79XEAxj5VlooW/
 48wNA0jQeB7rohtjX1aiM7UFvqjJa1S2wXuh/7tQTPGpUpcWJszpIcqXwIqILPocBl
 KormcaFRaHg6x+HHV/Dq4Gy08TBToFRn4llGuuFs1cXukja80Fu5Q2KI5bg3Mg8u7y
 pvrYWaCLQdSHRFNu9INXItTaZV8MvHRHDI4VM5IpeMb1xZTW+7DKJ8IGwb4O1jLvCy
 2iXdCJZifXsuJAt/6Sas5OPXbiZI7Xd3TR2qzgrXn2CRiw290sOsN2LCu58XYM9RRi
 5Betu703uimdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hlB/gVOA
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build error with
 flatbuffers 23.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

caused by bumping flatbuffers to version >= 23.x in commit
3d1ee7d624b71009ff61d4fa5ed860c52eb89b47

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...fer-Remove-forward-declararion-of-Fl.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch

diff --git a/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
new file mode 100644
index 0000000000..87df0e4c9a
--- /dev/null
+++ b/package/kodi/0003-SavestateFlatBuffer-Remove-forward-declararion-of-Fl.patch
@@ -0,0 +1,42 @@
+From 07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Markus=20H=C3=A4rer?= <markus.haerer@gmx.net>
+Date: Sun, 28 May 2023 00:49:40 +0200
+Subject: [PATCH] SavestateFlatBuffer: Remove forward declararion of
+ FlatBufferBuilder
+
+This caused a compiler error with recent faltbuffers because the type changed:
+
+In file included from xbmc/cores/RetroPlayer/savestates/SavestateDatabase.cpp:12:
+xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h:19:7: error: definition of type 'FlatBufferBuilder' conflicts with type alias of the same name
+class FlatBufferBuilder;
+      ^
+/usr/include/flatbuffers/flatbuffer_builder.h:1414:7: note: 'FlatBufferBuilder' declared here
+using FlatBufferBuilder = FlatBufferBuilderImpl<false>;
+      ^
+1 error generated.
+
+(cherry picked from commit 351184d7e4e3edc447d04a297769eb41a477ba68)
+
+Upstream: https://github.com/xbmc/xbmc/commit/07d8c98a0a65e005b85ef70e06eb1b9bbe7f764c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
+index cb93e6bbc2e12..fa42a9bad7034 100644
+--- a/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
++++ b/xbmc/cores/RetroPlayer/savestates/SavestateFlatBuffer.h
+@@ -14,11 +14,6 @@
+ 
+ #include <flatbuffers/flatbuffers.h>
+ 
+-namespace flatbuffers
+-{
+-class FlatBufferBuilder;
+-}
+-
+ namespace KODI
+ {
+ namespace RETRO
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
