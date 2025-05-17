Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DE6C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 21:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9DBC60630;
	Sat, 17 May 2025 21:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04p-1_3wSXau; Sat, 17 May 2025 21:20:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 486A16065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486A16065F;
	Sat, 17 May 2025 21:20:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 033DE201
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F6B581AF5
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cD4KvKba66Xw for <buildroot@buildroot.org>;
 Sat, 17 May 2025 21:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FBAE81BA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FBAE81BA9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:20:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49C8887051; Sat, 17 May 2025 21:20:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 22:58:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf63f1dc1018621417c6b61f9898c212bb520247
X-Git-Newrev: aa017484eaa7410d9cad9e8fd11de2ca613bd288
X-Patchwork-Hint: ignore
Message-Id: <20250517212043.49C8887051@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5webengine: fix no executable
 stack link issue on arm
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6742602157133182166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6742602157133182166==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=aa017484eaa7410d9cad9e8fd11de2ca613bd288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TL;DR; This turns the configure flag -no-feature-webengine-noexecstack
to -feature-webengine-noexecstack to workaround a link issue on ARM
32-bit if chromium requests for an executable stack.

And now, the long story...

The configure flag -no-feature-webengine-noexecstack was introduced with
commit 675cbaf9aa (package/qt5/qt5webengine: bump to version 5.15.8).

That configure flag controls the feature webengine-noexecstack[1][2];
the -no-feature-webengine-noexecstack causes qmake to **NOT** append the
linker flags -Wl,-z,noexecstack[3] to QMAKE_LFLAGS.

It results in the linkage issue below on ARM 32-bit at the creation of
its Qt module, i.e. after qmake has built the chromium third party via
gn:

	ulimit -n 4096 && /home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot @/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/release/QtWebEngineCore_o.rsp -Wl,--start-group @/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/release/QtWebEngineCore_a.rsp -Wl,--end-group -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,-O2 -Wl,--gc-sections --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -Wl,-whole-archive -lqtwebenginecoreapi -Wl,-no-whole-archive -Wl,--no-undefined -Wl,--version-script,QtWebEngineCore.version -Wl,-O1 -Wl,--enable-new-dtags -shared -Wl,-soname,libQt5WebEngineCore.so.5 -o libQt5WebEngineCore.so.5.15.14   -latomic /home/gporta
 y/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Quick.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Gui.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5QmlModels.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebChannel.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Qml.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Network.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Core.so -lpthread -L/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -latomic -lGLESv2 -lpthread -ldl -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4 -levent -lresolv -ljpeg -lopus -lm -lz -lvpx -lpng16 -lwebp -lwebpmux -lwebpdemux -lfreetype -lexpat -lfontcon
 fig -lharfbuzz-subset -lharfbuzz -lsnappy -lxml2 -lxslt -ldbus-1 -L/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/api/release -lGLESv2 -lrt -lpthread -ldl
	/home/gportay/src/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/release/obj/third_party/blink/renderer/platform/heap/asm/asm/SaveRegisters_arm.o: missing .note.GNU-stack section implies executable stack
	/home/gportay/src/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/13.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
	collect2: error: ld returned 1 exit status

The link succeeds if the missing linker flags are appended manually to
the command-line:

	ulimit -n 4096 && /home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-g++ --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot @/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/release/QtWebEngineCore_o.rsp -Wl,--start-group @/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/release/QtWebEngineCore_a.rsp -Wl,--end-group -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,-O2 -Wl,--gc-sections --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -Wl,-O1 -Wl,--enable-new-dtags -Wl,-whole-archive -lqtwebenginecoreapi -Wl,-no-whole-archive -Wl,--no-undefined -Wl,--version-script,QtWebEngineCore.version -Wl,-O1 -Wl,--enable-new-dtags -shared -Wl,-soname,libQt5WebEngineCore.so.5 -o libQt5WebEngineCore.so.5.15.14   -latomic /home/gporta
 y/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Quick.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Gui.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5QmlModels.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebChannel.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Qml.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Network.so /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5Core.so -lpthread -L/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -latomic -lGLESv2 -lpthread -ldl -lrt -lnss3 -lnssutil3 -lsmime3 -lplds4 -lplc4 -lnspr4 -levent -lresolv -ljpeg -lopus -lvpx -lm -lpng16 -lwebp -lwebpmux -lwebpdemux -lfreetype -lexpat -lfontconfig 
 -lharfbuzz-subset -lharfbuzz -lsnappy -lxml2 -lxslt -ldbus-1 -L/home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/api/release -lGLESv2 -lrt -lpthread -ldl -Wl,-z,noexecstack && echo completed
	completed

Note: The configure flag is not forwarded to chromium in any manner; its
scope is limited to the Qt WebEngine module. That configure flag appears
to be a workaround if the does not assemble, compile and link the Elf
object correctly[4][5].

The linker flag -z noexecstack is responsible for marking the object as
not requiring an executable stack by adding the section .note.GNU-stack
in the Elf object.

The file SaveRegisters_arm.S is assembled from the command-line below;
there is no noexecstack flag set:

	/home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -MMD -MF obj/third_party/blink/renderer/platform/heap/asm/asm/SaveRegisters_arm.o.d -DARM=1 -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DCR_SYSROOT_HASH=c2e54f675b83a61301dcdb22e8e7a2b85c01d58c -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Igen -I../../3rdparty/chromium -fPIC -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -std=gnu11 -march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16 -marm -g0 --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -c ../../3rdparty/chromium/third_party/blink/renderer/platform/heap/asm/SaveRegisters_arm.S -o obj/third_party/blink/renderer/platform/heap/as
 m/asm/SaveRegisters_arm.o

The GNU assembler supports the assembler flag -Wa,--{,no}execstack to
require, or not, an executable stack for the object to assemble.

The BUILD.gn does **NOT** set it for the assembler files of the blink
third-party; but it does it for boringssl[6] (see also the project file
CMakeLists.txt[7]).

See below what readelf says if the file is assembled manually with the
flag --noexecstack:

	$ /home/gportay/src/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -MMD -MF obj/third_party/blink/renderer/platform/heap/asm/asm/SaveRegisters_arm.o.d -DARM=1 -DUSE_UDEV -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -DCR_SYSROOT_HASH=c2e54f675b83a61301dcdb22e8e7a2b85c01d58c -DNDEBUG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Igen -I../../3rdparty/chromium -fPIC -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe -pthread -std=gnu11 -march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16 -marm -g0 --sysroot=/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot -c ../../3rdparty/chromium/third_party/blink/renderer/platform/heap/asm/SaveRegisters_arm.S -o obj/third_party/blink/renderer/platform/heap/
 asm/asm/SaveRegisters_arm.o -Wa,--noexecstack

	$ readelf -a /home/gportay/src/buildroot/output/build/qt5webengine-5.15.14/src/core/release/obj/third_party/blink/renderer/platform/heap/asm/asm/SaveRegisters_arm.o
	(...)
	Section Headers:
	  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
	  (...)
	  [ 4] .note.GNU-stack   PROGBITS        00000000 000058 000000 00      0   0  1

The section the linker claims for is now part of the Elf object; and
qmake is now able to link its Qt WebEngine module.

Note: Alternatively, the patching the file SaveRegisters_arm.S to set
explicitly the section in the source file works as well (this reduces
the impact to the very single file causing the link issue):

	#if defined(__linux__) && defined(__ELF__)
	.section .note.GNU-stack,"",%progbits
	#endif

Instead of fixing directly the origin of the issue and setting the
missing assembler flag -Wa,--noexecstack to blink; this works around the
link issue by turning on the feature noexecstack to qtwebengine to force
qmake to link its module using the linker flag -Wl,-z,noexecstack.

[1]: https://github.com/qt/qtwebengine/blob/5.15.14/src/buildtools/configure.json#L353-L357
[2]: https://github.com/qt/qtwebengine/blob/5.15.14/src/buildtools/configure.json#L720-L724
[3]: https://github.com/qt/qtwebengine/blob/5.15.14/src/buildtools/config/linking.pri#L61-L62
[4]: https://github.com/qt/qtwebengine/commit/597359a16a798df3955404200f1fc6833a7425ab
[5]: https://codereview.qt-project.org/c/qt/qtwebengine/+/263545
[6]: https://github.com/qt/qtwebengine-chromium/blob/87-based/chromium/third_party/boringssl/src/util/BUILD.toplevel#L64
[7]: https://github.com/qt/qtwebengine-chromium/blob/87-based/chromium/third_party/boringssl/src/crypto/CMakeLists.txt#L33

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt5/qt5webengine/qt5webengine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 529a83df6c..a97d918cfd 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -88,6 +88,7 @@ QT5WEBENGINE_CONF_OPTS += \
 	-webengine-webp \
 	-feature-build-qtwebengine-core \
 	-feature-webengine-core-support \
+	-feature-webengine-noexecstack \
 	-feature-webengine-system-dbus \
 	-feature-webengine-system-fontconfig \
 	-feature-webengine-system-freetype \
@@ -117,7 +118,6 @@ QT5WEBENGINE_CONF_OPTS += \
 	-no-feature-webengine-developer-build \
 	-no-feature-webengine-full-debug-info \
 	-no-feature-webengine-native-spellchecker \
-	-no-feature-webengine-noexecstack \
 	-no-feature-webengine-system-minizip \
 	-no-feature-webengine-system-gn
 

--===============6742602157133182166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6742602157133182166==--
