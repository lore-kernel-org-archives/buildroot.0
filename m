Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411D8C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 21:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC9DF605ED;
	Sun, 12 May 2024 21:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoxejKexTTMO; Sun, 12 May 2024 21:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8AA8605F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8AA8605F9;
	Sun, 12 May 2024 21:08:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83DFF1BF35D
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 21:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7093560618
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 21:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtMGeL-2l5Lz for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 21:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 739AB605ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 739AB605ED
 for <buildroot@buildroot.org>; Sun, 12 May 2024 21:08:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A268870C9; Sun, 12 May 2024 21:08:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 23:06:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31e7ca602686f936a7ca9baa6830f16d9744e429
X-Git-Newrev: f147e3b16a41324a9097ff17b002fd3c445e0f4c
X-Patchwork-Hint: ignore
Message-Id: <20240512210854.6A268870C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: explicitly link to libiconv
 when locales disabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f147e3b16a41324a9097ff17b002fd3c445e0f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr: implement it similarly to KODI_C_FLAGS]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/kodi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 94cab237dc..e941847f77 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -79,6 +79,7 @@ KODI_POST_EXTRACT_HOOKS = KODI_PROVIDE_JAVA_TARBALLS
 
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
+	-DCMAKE_EXE_LINKER_FLAGS="$(KODI_EXTRA_LIBS)" \
 	-DENABLE_APP_AUTONAME=OFF \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
@@ -139,6 +140,7 @@ KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 KODI_DEPENDENCIES += libiconv
+KODI_EXTRA_LIBS += -liconv
 endif
 
 ifeq ($(BR2_arceb)$(BR2_arcle),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
