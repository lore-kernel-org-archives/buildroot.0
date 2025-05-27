Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C256C5B555
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C9756167D;
	Wed,  4 Jun 2025 17:20:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h2aqpVR5WFY; Wed,  4 Jun 2025 17:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11F6E616F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11F6E616F1;
	Wed,  4 Jun 2025 17:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFEB31A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8540A41C58
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zFTvK95wusY for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E82A41C5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E82A41C5C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B92D878DD; Wed,  4 Jun 2025 17:20:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:25:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6af9a17a5ade1fff21703ac376b611a52ddb14b3
X-Git-Newrev: acae273134d0d2a9fba3ffc6b29fd106a7537d98
X-Patchwork-Hint: ignore
Message-Id: <20250604172010.7B92D878DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt5/qt5webengine:
 use bundled jpeg-turbo for chromium
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1316331709175617458=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1316331709175617458==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=acae273134d0d2a9fba3ffc6b29fd106a7537d98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The configure flag -feature-webengine-system-jpeg[1] checks if a jpeg
library is in the sysroot.

It compiles a test file linked against the symbols jpeg_crop_scanline()
and jpeg_skip_scanlines()[2] that are specific to jpep-turbo.

As a consequence, the configure scripts fails if the libjpeg is selected
as the jpeg variant as the symbols mentionend above are not part of the
jpeg library installed in the sysroots.

	ERROR: Feature 'webengine-system-jpeg' was enabled, but the pre-condition 'config.unix && features.system-jpeg && libs.webengine-jpeglib' failed.

Additionally, see the log below, extracted from config.log:

        > /home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -mtune=arm1176jzf-s -march=armv6 --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -w -fPIC  -I. -I/home/gportay/src/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o main.o main.cpp
        > main.cpp: In function ‘int main(int, char**)’:
        > main.cpp:12:5: error: ‘jpeg_crop_scanline’ was not declared in this scope; did you mean ‘jpeg_write_scanlines’?
        >    12 |     jpeg_crop_scanline(nullptr, &dummy, &dummy);
        >       |     ^~~~~~~~~~~~~~~~~~
        >       |     jpeg_write_scanlines
        > main.cpp:13:5: error: ‘jpeg_skip_scanlines’ was not declared in this scope; did you mean ‘jpeg_write_scanlines’?
        >    13 |     jpeg_skip_scanlines(nullptr, dummy);
        >       |     ^~~~~~~~~~~~~~~~~~~
        >       |     jpeg_write_scanlines
        > make[1]: *** [Makefile:334: main.o] Error 1
        > make[1]: Leaving directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'

We could build some complicated logic to make sure what qt5webengine is
only used with jpeg-turbo. However, Chromium bundles jpeg-turbo[3][4]
and uses it if not using the system jpeg library or qt-jpeg[5]. It is
simpler to just always use that version instead of the system jpeg
library.

This sets the configure option -nofeature-webengine-system-jpeg and
removes jpeg from the dependencies.

Note that host-libjpeg and qt-jpeg (and therefore, system libjpeg or
jpeg-turbo) are still needed for the Qt integration layer, even if
chromium uses the bundled jpeg-turbo.

[1]: https://github.com/qt/qtwebengine/blob/v5.15.14-lts/src/buildtools/configure.json#L609-L613
[2]: https://github.com/qt/qtwebengine/blob/v5.15.14-lts/src/buildtools/configure.json#L95-L116
[3]: https://github.com/qt/qtwebengine-chromium/tree/18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e/chromium/third_party/libjpeg_turbo
[4]: https://github.com/qt/qtwebengine-chromium/blob/18c9261dc5b8aa57a0bdd5b62ce6f648cca1ef5e/chromium/third_party/libjpeg.gni
[5]: https://github.com/qt/qtwebengine/blob/v5.15.14-lts/src/buildtools/configure.json#L614-618

Fixes:

	looking for library webengine-jpeglib
	Trying source 0 (type pkgConfig) of library webengine-jpeglib ...
	+ PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/pkg-config --exists --silence-errors libjpeg
	+ PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/pkg-config --modversion libjpeg
	> 9.6.0
	+ PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/pkg-config --libs-only-L libjpeg
	> -L/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
	+ PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/pkg-config --libs-only-l libjpeg
	> -ljpeg
	+ PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/pkg-config --cflags libjpeg
	> -I/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include
	+ cd /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib && PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/qmake "CONFIG -= qt debug_and_release app_bundle lib_bundle" "CONFIG += shared warn_off console single_arch" -early "CONFIG += cross_compile" 'QMAKE_USE += webengine-jpeglib' 'QMAKE_LIBS_WEBENGINE_JPEGLIB = -L/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -ljpeg' /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib
	+ cd /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib && MAKEFLAGS= make
	> make[1]: Entering directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'
	> /home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -mtune=arm1176jzf-s -march=armv6 --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -w -fPIC  -I. -I/home/gportay/src/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o main.o main.cpp
	> main.cpp: In function ‘int main(int, char**)’:
	> main.cpp:12:5: error: ‘jpeg_crop_scanline’ was not declared in this scope; did you mean ‘jpeg_write_scanlines’?
	>    12 |     jpeg_crop_scanline(nullptr, &dummy, &dummy);
	>       |     ^~~~~~~~~~~~~~~~~~
	>       |     jpeg_write_scanlines
	> main.cpp:13:5: error: ‘jpeg_skip_scanlines’ was not declared in this scope; did you mean ‘jpeg_write_scanlines’?
	>    13 |     jpeg_skip_scanlines(nullptr, dummy);
	>       |     ^~~~~~~~~~~~~~~~~~~
	>       |     jpeg_write_scanlines
	> make[1]: *** [Makefile:334: main.o] Error 1
	> make[1]: Leaving directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'
	 => source failed verification.
	Trying source 1 (type inline) of library webengine-jpeglib ...
	+ cd /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib && PKG_CONFIG_SYSROOT_DIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot PKG_CONFIG_LIBDIR=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig /home/gportay/src/buildroot/output/host/bin/qmake "CONFIG -= qt debug_and_release app_bundle lib_bundle" "CONFIG += shared warn_off console single_arch" -early "CONFIG += cross_compile" 'QMAKE_USE += webengine-jpeglib' 'QMAKE_LIBS_WEBENGINE_JPEGLIB = -ljpeg' /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib
	+ cd /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib && MAKEFLAGS= make clean && MAKEFLAGS= make
	> make[1]: Entering directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'
	> rm -f main.o
	> rm -f *~ core *.core
	> make[1]: Leaving directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'
	> make[1]: Entering directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'
	> /home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g0 -D_FORTIFY_SOURCE=1 -mtune=arm1176jzf-s -march=armv6 --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -w -fPIC  -I. -I/home/gportay/src/buildroot/output/host/mkspecs/devices/linux-buildroot-g++ -o main.o main.cpp
	> main.cpp: In function ‘int main(int, char**)’:
	> main.cpp:12:5: error: ‘jpeg_crop_scanline’ was not declared in this scope; did you mean ‘jpeg_write_scanlines’?
	>    12 |     jpeg_crop_scanline(nullptr, &dummy, &dummy);
	>       |     ^~~~~~~~~~~~~~~~~~
	>       |     jpeg_write_scanlines
	> main.cpp:13:5: error: ‘jpeg_skip_scanlines’ was not declared in this scope; did you mean ‘jpeg_write_scanlines’?
	>    13 |     jpeg_skip_scanlines(nullptr, dummy);
	>       |     ^~~~~~~~~~~~~~~~~~~
	>       |     jpeg_write_scanlines
	> make[1]: *** [Makefile:334: main.o] Error 1
	> make[1]: Leaving directory '/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/config.tests/webengine-jpeglib'
	 => source failed verification.
	test config.qtwebengine_buildtools.libraries.webengine-jpeglib FAILED

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
[Arnout: always use the bundled jpeg-turbo]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 3271ce10f2b00dd548a78537346f523ffab8abc4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt5/qt5webengine/qt5webengine.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 6b656a7536..00df7e1ede 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -71,7 +71,6 @@ QT5WEBENGINE_DEPENDENCIES += \
 	host-webp \
 	host-zlib \
 	freetype \
-	jpeg \
 	lcms2 \
 	libevent \
 	libnss \
@@ -96,7 +95,6 @@ QT5WEBENGINE_CONF_OPTS += \
 	-feature-webengine-system-glib \
 	-feature-webengine-system-glibc \
 	-feature-webengine-system-harfbuzz \
-	-feature-webengine-system-jpeg \
 	-feature-webengine-system-khr \
 	-feature-webengine-system-lcms2 \
 	-feature-webengine-system-libevent \
@@ -119,6 +117,7 @@ QT5WEBENGINE_CONF_OPTS += \
 	-no-feature-webengine-developer-build \
 	-no-feature-webengine-full-debug-info \
 	-no-feature-webengine-native-spellchecker \
+	-no-feature-webengine-system-jpeg \
 	-no-feature-webengine-system-minizip \
 	-no-feature-webengine-system-gn
 

--===============1316331709175617458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1316331709175617458==--
