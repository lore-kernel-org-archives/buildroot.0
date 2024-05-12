Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE8EC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 17:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3162C606B4;
	Sun, 12 May 2024 17:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwGVxwI5LDJH; Sun, 12 May 2024 17:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424196073E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424196073E;
	Sun, 12 May 2024 17:51:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8233E1BF421
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 17:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DA5B415BB
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 17:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZO5eqfTutBB for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 17:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 087EE41599
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087EE41599
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 087EE41599
 for <buildroot@buildroot.org>; Sun, 12 May 2024 17:51:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20BE7A4C2C73
 for <buildroot@buildroot.org>; Sun, 12 May 2024 19:51:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36714)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6DLx-000000002c2-1TDJ
 for buildroot@buildroot.org; Sun, 12 May 2024 17:51:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 19:51:17 +0200
Message-Id: <20240512175117.2096550-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715536278;
 bh=voKkR4585MfuUe86pDJf6QkGHD+3IARYVNeHXm/tdOw=;
 h=From:To:Subject:Date:From;
 b=Ch8h/jnou4DbROA0uPuK3rNNfqgT3RacIeG1g6/HaG6jm7tmpA8pWJ39p9PHUvOUn
 xyQfco00VNudcpfg1JqOBQ9Y6U2UV7ZwqJy3ejXYtgMO6NK0QY8ogH/h8B+tvX1xG7
 r1cx0hnrwk0BodG1CMlYAXRKoCEHMrOf9RY/ahduy8KgbzTZ6/DBWpbbsMrPnTkTGh
 WXq2nRB35ut+A++IuwPElFFPqEfju3f8hZh3u1gtbb5QpUuSO1cWNJ9sc0a+PcVRFx
 JLF1CkdzaYzifZcAK+A6oQToRiOxEm87S2vy2Yc2ZnLacM9hSKuafIeag5n9vt/GFb
 ucZZVfJUL7L4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Ch8h/jno
Subject: [Buildroot] [PATCH 1/1] package/kodi: Link to libiconv when needed
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

Fixes build error

/home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
build/utils/utils.a(CharsetConverter.cpp.o): undefined reference to symbol 'libiconv_open'
/home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
/home/wbx/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/lib64/libiconv.so.2:
error adding symbols: DSO missing from command line

reported by Waldemar:
http://lists.busybox.net/pipermail/buildroot/2024-May/690952.html

Reproduced and fixed the build error using this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 94cab237dc..301330a574 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -138,6 +138,7 @@ endif
 KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
 
 ifeq ($(BR2_ENABLE_LOCALE),)
+KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-liconv
 KODI_DEPENDENCIES += libiconv
 endif
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
