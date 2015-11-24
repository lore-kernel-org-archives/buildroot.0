From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 24 Nov 2015 22:22:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/audiofile: add patch to fix static
	linking issue
Message-ID: <1448400166-4487-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static linking userspace programs such as MPD against libaudiofile fails if
FLAC is available, because libaudiofile is linked against FLAC, but this isn't
expressed in the pkg-config file:

[..]
arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::reset2()':
FLAC.cpp:(.text+0x58): undefined reference to `FLAC__stream_decoder_seek_absolute'
/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::sync2()':
FLAC.cpp:(.text+0x88): undefined reference to `FLAC__stream_encoder_finish'
/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::~FLACDecoder()':
FLAC.cpp:(.text+0xc4): undefined reference to `FLAC__stream_decoder_delete'
/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::~FLACEncoder()':
FLAC.cpp:(.text+0x164): undefined reference to `FLAC__stream_encoder_delete'
/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::runPull()':
[..]

The Libs.private field is specifically designed for such usage:

From pkg-config documentation:

  Libs.private:

    This line should list any private libraries in use.  Private
    libraries are libraries which are not exposed through your
    library, but are needed in the case of static linking.

Therefore, this patch adds a reference to FLAC as well as to lcov in the
Libs.private field of the pkg-config file.

Patch status: Pending
https://github.com/mpruett/audiofile/pull/26

Fixes:
http://autobuild.buildroot.net/results/e95/e959e703a8db81032da27bece295c121e53d830d/
http://autobuild.buildroot.net/results/10b/10bd00209f098e8782016355cb2f46d1d3e7d3a3/
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Fix-pkg-config-for-static-linking.patch   | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/audiofile/0001-Fix-pkg-config-for-static-linking.patch

diff --git a/package/audiofile/0001-Fix-pkg-config-for-static-linking.patch b/package/audiofile/0001-Fix-pkg-config-for-static-linking.patch
new file mode 100644
index 0000000..54757ab
--- /dev/null
+++ b/package/audiofile/0001-Fix-pkg-config-for-static-linking.patch
@@ -0,0 +1,56 @@
+From 2abf7d2e5c533bf4d7407c2c8057a329cd49a3cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 24 Nov 2015 21:57:27 +0100
+Subject: [PATCH 1/1] Fix pkg-config for static linking
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Static linking userspace programs such as MPD against libaudiofile fails if
+FLAC is available, because libaudiofile is linked against FLAC, but this isn't
+expressed in the pkg-config file:
+
+[..]
+arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::reset2()':
+FLAC.cpp:(.text+0x58): undefined reference to `FLAC__stream_decoder_seek_absolute'
+/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::sync2()':
+FLAC.cpp:(.text+0x88): undefined reference to `FLAC__stream_encoder_finish'
+/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::~FLACDecoder()':
+FLAC.cpp:(.text+0xc4): undefined reference to `FLAC__stream_decoder_delete'
+/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::~FLACEncoder()':
+FLAC.cpp:(.text+0x164): undefined reference to `FLAC__stream_encoder_delete'
+/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::runPull()':
+[..]
+
+The Libs.private field is specifically designed for such usage:
+
+From pkg-config documentation:
+
+  Libs.private:
+
+     This line should list any private libraries in use.  Private
+     libraries are libraries which are not exposed through your
+     library, but are needed in the case of static linking.
+
+Therefore, this patch adds a reference to FLAC as well as to lcov in the
+Libs.private field of the pkg-config file.
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ audiofile.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/audiofile.pc.in b/audiofile.pc.in
+index ad5956a..d6055ef 100644
+--- a/audiofile.pc.in
++++ b/audiofile.pc.in
+@@ -8,5 +8,5 @@ Description: audiofile
+ Requires:
+ Version: @VERSION@
+ Libs: -L${libdir} -laudiofile
+-Libs.private: -lm
++Libs.private: @FLAC_LIBS@ @COVERAGE_LIBS@ -lm
+ Cflags: -I${includedir}
+-- 
+2.6.2
+
-- 
2.6.2
