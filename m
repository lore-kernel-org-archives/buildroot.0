From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 21:27:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/audiofile: drop package
Message-ID: <20210207202718.3154069-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The audiofile package is affected by multiple CVEs and is not maintained
anymore (no release since 2013):

  https://nvd.nist.gov/vuln/search/results?form_type=Advanced&results_type=overview&seach_type=all&query=cpe:2.3:a:audio_file_library_project:audio_file_library:0.3.6:*:*:*:*:*:*:*

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              |  16 ++
 package/Config.in                             |   1 -
 ...01-Fix-pkg-config-for-static-linking.patch |  56 -----
 .../0002-cast-to-unsigned-gcc6.patch          |  28 ---
 ...ays-check-the-number-of-coefficients.patch |  36 ----
 ...ues-to-fix-index-overflow-in-IMA.cpp.patch |  39 ----
 ...multiplication-overflow-in-sfconvert.patch |  72 -------
 ...ail-when-error-occurs-in-parseFormat.patch |  42 ----
 ...lication-overflow-in-MSADPCM-decodeS.patch | 122 -----------
 package/audiofile/0008-CVE-2015-7747.patch    | 161 ---------------
 ...9-Fix-static-linking-with-libsndfile.patch | 193 ------------------
 package/audiofile/Config.in                   |  11 -
 package/audiofile/audiofile.hash              |   4 -
 package/audiofile/audiofile.mk                |  41 ----
 package/mpd/Config.in                         |   7 -
 package/mpd/mpd.mk                            |  11 +-
 16 files changed, 19 insertions(+), 821 deletions(-)
 delete mode 100644 package/audiofile/0001-Fix-pkg-config-for-static-linking.patch
 delete mode 100644 package/audiofile/0002-cast-to-unsigned-gcc6.patch
 delete mode 100644 package/audiofile/0003-Always-check-the-number-of-coefficients.patch
 delete mode 100644 package/audiofile/0004-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
 delete mode 100644 package/audiofile/0005-Check-for-multiplication-overflow-in-sfconvert.patch
 delete mode 100644 package/audiofile/0006-Actually-fail-when-error-occurs-in-parseFormat.patch
 delete mode 100644 package/audiofile/0007-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
 delete mode 100644 package/audiofile/0008-CVE-2015-7747.patch
 delete mode 100644 package/audiofile/0009-Fix-static-linking-with-libsndfile.patch
 delete mode 100644 package/audiofile/Config.in
 delete mode 100644 package/audiofile/audiofile.hash
 delete mode 100644 package/audiofile/audiofile.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6d46132960..9deb67b31f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,22 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_MPD_AUDIOFILE
+	bool "mpd audiofile support removed"
+	select BR2_LEGACY
+	help
+	  The audiofile support was removed from mpd as audiofile is
+	  affected by multiple CVEs and is not maintained anymore (no
+	  release since 2013).
+
+config BR2_PACKAGE_AUDIOFILE
+	bool "audiofile package removed"
+	select BR2_LEGACY
+	help
+	  The audiofile package was removed as it is affected by
+	  multiple CVEs and is not maintained anymore (no release since
+	  2013).
+
 config BR2_BINUTILS_VERSION_2_33_X
 	bool "binutils 2.33.x has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index c3f10122fb..5304ab141c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1281,7 +1281,6 @@ menu "Audio/Sound"
 	source "package/alsa-lib/Config.in"
 	source "package/alure/Config.in"
 	source "package/aubio/Config.in"
-	source "package/audiofile/Config.in"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
diff --git a/package/audiofile/0001-Fix-pkg-config-for-static-linking.patch b/package/audiofile/0001-Fix-pkg-config-for-static-linking.patch
deleted file mode 100644
index 54757abbd5..0000000000
--- a/package/audiofile/0001-Fix-pkg-config-for-static-linking.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2abf7d2e5c533bf4d7407c2c8057a329cd49a3cd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 24 Nov 2015 21:57:27 +0100
-Subject: [PATCH 1/1] Fix pkg-config for static linking
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Static linking userspace programs such as MPD against libaudiofile fails if
-FLAC is available, because libaudiofile is linked against FLAC, but this isn't
-expressed in the pkg-config file:
-
-[..]
-arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::reset2()':
-FLAC.cpp:(.text+0x58): undefined reference to `FLAC__stream_decoder_seek_absolute'
-/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::sync2()':
-FLAC.cpp:(.text+0x88): undefined reference to `FLAC__stream_encoder_finish'
-/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::~FLACDecoder()':
-FLAC.cpp:(.text+0xc4): undefined reference to `FLAC__stream_decoder_delete'
-/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACEncoder::~FLACEncoder()':
-FLAC.cpp:(.text+0x164): undefined reference to `FLAC__stream_encoder_delete'
-/home/buildroot/build/instance-1/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libaudiofile.a(FLAC.o): In function `FLACDecoder::runPull()':
-[..]
-
-The Libs.private field is specifically designed for such usage:
-
-From pkg-config documentation:
-
-  Libs.private:
-
-     This line should list any private libraries in use.  Private
-     libraries are libraries which are not exposed through your
-     library, but are needed in the case of static linking.
-
-Therefore, this patch adds a reference to FLAC as well as to lcov in the
-Libs.private field of the pkg-config file.
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- audiofile.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/audiofile.pc.in b/audiofile.pc.in
-index ad5956a..d6055ef 100644
---- a/audiofile.pc.in
-+++ b/audiofile.pc.in
-@@ -8,5 +8,5 @@ Description: audiofile
- Requires:
- Version: @VERSION@
- Libs: -L${libdir} -laudiofile
--Libs.private: -lm
-+Libs.private: @FLAC_LIBS@ @COVERAGE_LIBS@ -lm
- Cflags: -I${includedir}
--- 
-2.6.2
-
diff --git a/package/audiofile/0002-cast-to-unsigned-gcc6.patch b/package/audiofile/0002-cast-to-unsigned-gcc6.patch
deleted file mode 100644
index 01baeb5e63..0000000000
--- a/package/audiofile/0002-cast-to-unsigned-gcc6.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 28cfdbbcb96a69087c3d21faf69b5eae7bcf6d69 Mon Sep 17 00:00:00 2001
-From: Hodorgasm <nsane457@gmail.com>
-Date: Wed, 11 May 2016 21:42:07 -0400
-Subject: [PATCH] Cast to unsigned while left bit-shifting
-
-GCC-6 now treats the left bitwise-shift of a negative integer as nonconformant so explicitly cast to an unsigned int while bit-shifting.
-
-Downloaded from upstream PR:
-https://github.com/mpruett/audiofile/pull/28
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libaudiofile/modules/SimpleModule.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libaudiofile/modules/SimpleModule.h b/libaudiofile/modules/SimpleModule.h
-index 03c6c69..4014fb2 100644
---- a/libaudiofile/modules/SimpleModule.h
-+++ b/libaudiofile/modules/SimpleModule.h
-@@ -123,7 +123,7 @@ struct signConverter
- 	typedef typename IntTypes<Format>::UnsignedType UnsignedType;
- 
- 	static const int kScaleBits = (Format + 1) * CHAR_BIT - 1;
--	static const int kMinSignedValue = -1 << kScaleBits;
-+	static const int kMinSignedValue = static_cast<signed>(static_cast<unsigned>(-1) << kScaleBits);;
- 
- 	struct signedToUnsigned : public std::unary_function<SignedType, UnsignedType>
- 	{
diff --git a/package/audiofile/0003-Always-check-the-number-of-coefficients.patch b/package/audiofile/0003-Always-check-the-number-of-coefficients.patch
deleted file mode 100644
index 5c99c3cd7e..0000000000
--- a/package/audiofile/0003-Always-check-the-number-of-coefficients.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0 Mon Sep 17 00:00:00 2001
-From: Antonio Larrosa <larrosa@kde.org>
-Date: Mon, 6 Mar 2017 12:51:22 +0100
-Subject: [PATCH] Always check the number of coefficients
-
-When building the library with NDEBUG, asserts are eliminated
-so it's better to always check that the number of coefficients
-is inside the array range.
-
-This fixes the 00191-audiofile-indexoob issue in #41
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libaudiofile/WAVE.cpp | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
-index 0e81cf7..61f9541 100644
---- a/libaudiofile/WAVE.cpp
-+++ b/libaudiofile/WAVE.cpp
-@@ -281,6 +281,12 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
- 
- 			/* numCoefficients should be at least 7. */
- 			assert(numCoefficients >= 7 && numCoefficients <= 255);
-+			if (numCoefficients < 7 || numCoefficients > 255)
-+			{
-+				_af_error(AF_BAD_HEADER,
-+						"Bad number of coefficients");
-+				return AF_FAIL;
-+			}
- 
- 			m_msadpcmNumCoefficients = numCoefficients;
- 
--- 
-2.11.0
-
diff --git a/package/audiofile/0004-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch b/package/audiofile/0004-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
deleted file mode 100644
index 21f899a46f..0000000000
--- a/package/audiofile/0004-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 25eb00ce913452c2e614548d7df93070bf0d066f Mon Sep 17 00:00:00 2001
-From: Antonio Larrosa <larrosa@kde.org>
-Date: Mon, 6 Mar 2017 18:02:31 +0100
-Subject: [PATCH] clamp index values to fix index overflow in IMA.cpp
-
-This fixes #33
-(also reported at https://bugzilla.opensuse.org/show_bug.cgi?id=1026981
-and https://blogs.gentoo.org/ago/2017/02/20/audiofile-global-buffer-overflow-in-decodesample-ima-cpp/)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libaudiofile/modules/IMA.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libaudiofile/modules/IMA.cpp b/libaudiofile/modules/IMA.cpp
-index 7476d44..df4aad6 100644
---- a/libaudiofile/modules/IMA.cpp
-+++ b/libaudiofile/modules/IMA.cpp
-@@ -169,7 +169,7 @@ int IMA::decodeBlockWAVE(const uint8_t *encoded, int16_t *decoded)
- 		if (encoded[1] & 0x80)
- 			m_adpcmState[c].previousValue -= 0x10000;
- 
--		m_adpcmState[c].index = encoded[2];
-+		m_adpcmState[c].index = clamp(encoded[2], 0, 88);
- 
- 		*decoded++ = m_adpcmState[c].previousValue;
- 
-@@ -210,7 +210,7 @@ int IMA::decodeBlockQT(const uint8_t *encoded, int16_t *decoded)
- 			predictor -= 0x10000;
- 
- 		state.previousValue = clamp(predictor, MIN_INT16, MAX_INT16);
--		state.index = encoded[1] & 0x7f;
-+		state.index = clamp(encoded[1] & 0x7f, 0, 88);
- 		encoded += 2;
- 
- 		for (int n=0; n<m_framesPerPacket; n+=2)
--- 
-2.11.0
-
diff --git a/package/audiofile/0005-Check-for-multiplication-overflow-in-sfconvert.patch b/package/audiofile/0005-Check-for-multiplication-overflow-in-sfconvert.patch
deleted file mode 100644
index c72619030b..0000000000
--- a/package/audiofile/0005-Check-for-multiplication-overflow-in-sfconvert.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 7d65f89defb092b63bcbc5d98349fb222ca73b3c Mon Sep 17 00:00:00 2001
-From: Antonio Larrosa <larrosa@kde.org>
-Date: Mon, 6 Mar 2017 13:54:52 +0100
-Subject: [PATCH] Check for multiplication overflow in sfconvert
-
-Checks that a multiplication doesn't overflow when
-calculating the buffer size, and if it overflows,
-reduce the buffer size instead of failing.
-
-This fixes the 00192-audiofile-signintoverflow-sfconvert case
-in #41
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- sfcommands/sfconvert.c | 34 ++++++++++++++++++++++++++++++++--
- 1 file changed, 32 insertions(+), 2 deletions(-)
-
-diff --git a/sfcommands/sfconvert.c b/sfcommands/sfconvert.c
-index 80a1bc4..970a3e4 100644
---- a/sfcommands/sfconvert.c
-+++ b/sfcommands/sfconvert.c
-@@ -45,6 +45,33 @@ void printusage (void);
- void usageerror (void);
- bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid);
- 
-+int firstBitSet(int x)
-+{
-+        int position=0;
-+        while (x!=0)
-+        {
-+                x>>=1;
-+                ++position;
-+        }
-+        return position;
-+}
-+
-+#ifndef __has_builtin
-+#define __has_builtin(x) 0
-+#endif
-+
-+int multiplyCheckOverflow(int a, int b, int *result)
-+{
-+#if (defined __GNUC__ && __GNUC__ >= 5) || ( __clang__ && __has_builtin(__builtin_mul_overflow))
-+	return __builtin_mul_overflow(a, b, result);
-+#else
-+	if (firstBitSet(a)+firstBitSet(b)>31) // int is signed, so we can't use 32 bits
-+		return true;
-+	*result = a * b;
-+	return false;
-+#endif
-+}
-+
- int main (int argc, char **argv)
- {
- 	if (argc == 2)
-@@ -323,8 +350,11 @@ bool copyaudiodata (AFfilehandle infile, AFfilehandle outfile, int trackid)
- {
- 	int frameSize = afGetVirtualFrameSize(infile, trackid, 1);
- 
--	const int kBufferFrameCount = 65536;
--	void *buffer = malloc(kBufferFrameCount * frameSize);
-+	int kBufferFrameCount = 65536;
-+	int bufferSize;
-+	while (multiplyCheckOverflow(kBufferFrameCount, frameSize, &bufferSize))
-+		kBufferFrameCount /= 2;
-+	void *buffer = malloc(bufferSize);
- 
- 	AFframecount totalFrames = afGetFrameCount(infile, AF_DEFAULT_TRACK);
- 	AFframecount totalFramesWritten = 0;
--- 
-2.11.0
-
diff --git a/package/audiofile/0006-Actually-fail-when-error-occurs-in-parseFormat.patch b/package/audiofile/0006-Actually-fail-when-error-occurs-in-parseFormat.patch
deleted file mode 100644
index 0c6be2a2c5..0000000000
--- a/package/audiofile/0006-Actually-fail-when-error-occurs-in-parseFormat.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a2e9eab8ea87c4ffc494d839ebb4ea145eb9f2e6 Mon Sep 17 00:00:00 2001
-From: Antonio Larrosa <larrosa@kde.org>
-Date: Mon, 6 Mar 2017 18:59:26 +0100
-Subject: [PATCH] Actually fail when error occurs in parseFormat
-
-When there's an unsupported number of bits per sample or an invalid
-number of samples per block, don't only print an error message using
-the error handler, but actually stop parsing the file.
-
-This fixes #35 (also reported at
-https://bugzilla.opensuse.org/show_bug.cgi?id=1026983 and
-https://blogs.gentoo.org/ago/2017/02/20/audiofile-heap-based-buffer-overflow-in-imadecodeblockwave-ima-cpp/
-)
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libaudiofile/WAVE.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libaudiofile/WAVE.cpp b/libaudiofile/WAVE.cpp
-index 0e81cf7..d762249 100644
---- a/libaudiofile/WAVE.cpp
-+++ b/libaudiofile/WAVE.cpp
-@@ -326,6 +326,7 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
- 			{
- 				_af_error(AF_BAD_NOT_IMPLEMENTED,
- 					"IMA ADPCM compression supports only 4 bits per sample");
-+				return AF_FAIL;
- 			}
- 
- 			int bytesPerBlock = (samplesPerBlock + 14) / 8 * 4 * channelCount;
-@@ -333,6 +334,7 @@ status WAVEFile::parseFormat(const Tag &id, uint32_t size)
- 			{
- 				_af_error(AF_BAD_CODEC_CONFIG,
- 					"Invalid samples per block for IMA ADPCM compression");
-+				return AF_FAIL;
- 			}
- 
- 			track->f.sampleWidth = 16;
--- 
-2.11.0
-
diff --git a/package/audiofile/0007-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch b/package/audiofile/0007-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
deleted file mode 100644
index 5411f13bb0..0000000000
--- a/package/audiofile/0007-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From beacc44eb8cdf6d58717ec1a5103c5141f1b37f9 Mon Sep 17 00:00:00 2001
-From: Antonio Larrosa <larrosa@kde.org>
-Date: Mon, 6 Mar 2017 13:43:53 +0100
-Subject: [PATCH] Check for multiplication overflow in MSADPCM decodeSample
-
-Check for multiplication overflow (using __builtin_mul_overflow
-if available) in MSADPCM.cpp decodeSample and return an empty
-decoded block if an error occurs.
-
-This fixes the 00193-audiofile-signintoverflow-MSADPCM case of #41
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- libaudiofile/modules/BlockCodec.cpp |  5 ++--
- libaudiofile/modules/MSADPCM.cpp    | 47 +++++++++++++++++++++++++++++++++----
- 2 files changed, 46 insertions(+), 6 deletions(-)
-
-diff --git a/libaudiofile/modules/BlockCodec.cpp b/libaudiofile/modules/BlockCodec.cpp
-index 45925e8..4731be1 100644
---- a/libaudiofile/modules/BlockCodec.cpp
-+++ b/libaudiofile/modules/BlockCodec.cpp
-@@ -52,8 +52,9 @@ void BlockCodec::runPull()
- 	// Decompress into m_outChunk.
- 	for (int i=0; i<blocksRead; i++)
- 	{
--		decodeBlock(static_cast<const uint8_t *>(m_inChunk->buffer) + i * m_bytesPerPacket,
--			static_cast<int16_t *>(m_outChunk->buffer) + i * m_framesPerPacket * m_track->f.channelCount);
-+		if (decodeBlock(static_cast<const uint8_t *>(m_inChunk->buffer) + i * m_bytesPerPacket,
-+			static_cast<int16_t *>(m_outChunk->buffer) + i * m_framesPerPacket * m_track->f.channelCount)==0)
-+			break;
- 
- 		framesRead += m_framesPerPacket;
- 	}
-diff --git a/libaudiofile/modules/MSADPCM.cpp b/libaudiofile/modules/MSADPCM.cpp
-index 8ea3c85..ef9c38c 100644
---- a/libaudiofile/modules/MSADPCM.cpp
-+++ b/libaudiofile/modules/MSADPCM.cpp
-@@ -101,24 +101,60 @@ static const int16_t adaptationTable[] =
- 	768, 614, 512, 409, 307, 230, 230, 230
- };
- 
-+int firstBitSet(int x)
-+{
-+        int position=0;
-+        while (x!=0)
-+        {
-+                x>>=1;
-+                ++position;
-+        }
-+        return position;
-+}
-+
-+#ifndef __has_builtin
-+#define __has_builtin(x) 0
-+#endif
-+
-+int multiplyCheckOverflow(int a, int b, int *result)
-+{
-+#if (defined __GNUC__ && __GNUC__ >= 5) || ( __clang__ && __has_builtin(__builtin_mul_overflow))
-+	return __builtin_mul_overflow(a, b, result);
-+#else
-+	if (firstBitSet(a)+firstBitSet(b)>31) // int is signed, so we can't use 32 bits
-+		return true;
-+	*result = a * b;
-+	return false;
-+#endif
-+}
-+
-+
- // Compute a linear PCM value from the given differential coded value.
- static int16_t decodeSample(ms_adpcm_state &state,
--	uint8_t code, const int16_t *coefficient)
-+	uint8_t code, const int16_t *coefficient, bool *ok=NULL)
- {
- 	int linearSample = (state.sample1 * coefficient[0] +
- 		state.sample2 * coefficient[1]) >> 8;
-+	int delta;
- 
- 	linearSample += ((code & 0x08) ? (code - 0x10) : code) * state.delta;
- 
- 	linearSample = clamp(linearSample, MIN_INT16, MAX_INT16);
- 
--	int delta = (state.delta * adaptationTable[code]) >> 8;
-+	if (multiplyCheckOverflow(state.delta, adaptationTable[code], &delta))
-+	{
-+                if (ok) *ok=false;
-+		_af_error(AF_BAD_COMPRESSION, "Error decoding sample");
-+		return 0;
-+	}
-+	delta >>= 8;
- 	if (delta < 16)
- 		delta = 16;
- 
- 	state.delta = delta;
- 	state.sample2 = state.sample1;
- 	state.sample1 = linearSample;
-+	if (ok) *ok=true;
- 
- 	return static_cast<int16_t>(linearSample);
- }
-@@ -212,13 +248,16 @@ int MSADPCM::decodeBlock(const uint8_t *encoded, int16_t *decoded)
- 	{
- 		uint8_t code;
- 		int16_t newSample;
-+		bool ok;
- 
- 		code = *encoded >> 4;
--		newSample = decodeSample(*state[0], code, coefficient[0]);
-+		newSample = decodeSample(*state[0], code, coefficient[0], &ok);
-+		if (!ok) return 0;
- 		*decoded++ = newSample;
- 
- 		code = *encoded & 0x0f;
--		newSample = decodeSample(*state[1], code, coefficient[1]);
-+		newSample = decodeSample(*state[1], code, coefficient[1], &ok);
-+		if (!ok) return 0;
- 		*decoded++ = newSample;
- 
- 		encoded++;
--- 
-2.11.0
-
diff --git a/package/audiofile/0008-CVE-2015-7747.patch b/package/audiofile/0008-CVE-2015-7747.patch
deleted file mode 100644
index 13256123c4..0000000000
--- a/package/audiofile/0008-CVE-2015-7747.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-Description: fix buffer overflow when changing both sample format and
- number of channels
-Origin: https://github.com/mpruett/audiofile/pull/25
-Bug-Ubuntu: https://bugs.launchpad.net/ubuntu/+source/audiofile/+bug/1502721
-Bug-Debian: https://bugs.debian.org/801102
-
-Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/audiofile/files/audiofile-0.3.6-CVE-2015-7747.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/libaudiofile/modules/ModuleState.cpp
-+++ b/libaudiofile/modules/ModuleState.cpp
-@@ -402,7 +402,7 @@ status ModuleState::arrange(AFfilehandle
- 		addModule(new Transform(outfc, in.pcm, out.pcm));
- 
- 	if (in.channelCount != out.channelCount)
--		addModule(new ApplyChannelMatrix(infc, isReading,
-+		addModule(new ApplyChannelMatrix(outfc, isReading,
- 			in.channelCount, out.channelCount,
- 			in.pcm.minClip, in.pcm.maxClip,
- 			track->channelMatrix));
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -26,6 +26,7 @@ TESTS = \
- 	VirtualFile \
- 	floatto24 \
- 	query2 \
-+	sixteen-stereo-to-eight-mono \
- 	sixteen-to-eight \
- 	testchannelmatrix \
- 	testdouble \
-@@ -139,6 +140,7 @@ printmarkers_SOURCES = printmarkers.c
- printmarkers_LDADD = $(LIBAUDIOFILE) -lm
- 
- sixteen_to_eight_SOURCES = sixteen-to-eight.c TestUtilities.cpp TestUtilities.h
-+sixteen_stereo_to_eight_mono_SOURCES = sixteen-stereo-to-eight-mono.c TestUtilities.cpp TestUtilities.h
- 
- testchannelmatrix_SOURCES = testchannelmatrix.c TestUtilities.cpp TestUtilities.h
- 
---- /dev/null
-+++ b/test/sixteen-stereo-to-eight-mono.c
-@@ -0,0 +1,118 @@
-+/*
-+	Audio File Library
-+
-+	Copyright 2000, Silicon Graphics, Inc.
-+
-+	This program is free software; you can redistribute it and/or modify
-+	it under the terms of the GNU General Public License as published by
-+	the Free Software Foundation; either version 2 of the License, or
-+	(at your option) any later version.
-+
-+	This program is distributed in the hope that it will be useful,
-+	but WITHOUT ANY WARRANTY; without even the implied warranty of
-+	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+	GNU General Public License for more details.
-+
-+	You should have received a copy of the GNU General Public License along
-+	with this program; if not, write to the Free Software Foundation, Inc.,
-+	51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+*/
-+
-+/*
-+	sixteen-stereo-to-eight-mono.c
-+
-+	This program tests the conversion from 2-channel 16-bit integers to
-+	1-channel 8-bit	integers.
-+*/
-+
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
-+#include <stdint.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <unistd.h>
-+#include <limits.h>
-+
-+#include <audiofile.h>
-+
-+#include "TestUtilities.h"
-+
-+int main (int argc, char **argv)
-+{
-+	AFfilehandle file;
-+	AFfilesetup setup;
-+	int16_t frames16[] = {14298, 392, 3923, -683, 958, -1921};
-+	int8_t frames8[] = {28, 6, -2};
-+	int i, frameCount = 3;
-+	int8_t byte;
-+	AFframecount result;
-+
-+	setup = afNewFileSetup();
-+
-+	afInitFileFormat(setup, AF_FILE_WAVE);
-+
-+	afInitSampleFormat(setup, AF_DEFAULT_TRACK, AF_SAMPFMT_TWOSCOMP, 16);
-+	afInitChannels(setup, AF_DEFAULT_TRACK, 2);
-+
-+	char *testFileName;
-+	if (!createTemporaryFile("sixteen-to-eight", &testFileName))
-+	{
-+		fprintf(stderr, "Could not create temporary file.\n");
-+		exit(EXIT_FAILURE);
-+	}
-+
-+	file = afOpenFile(testFileName, "w", setup);
-+	if (file == AF_NULL_FILEHANDLE)
-+	{
-+		fprintf(stderr, "could not open file for writing\n");
-+		exit(EXIT_FAILURE);
-+	}
-+
-+	afFreeFileSetup(setup);
-+
-+	afWriteFrames(file, AF_DEFAULT_TRACK, frames16, frameCount);
-+
-+	afCloseFile(file);
-+
-+	file = afOpenFile(testFileName, "r", AF_NULL_FILESETUP);
-+	if (file == AF_NULL_FILEHANDLE)
-+	{
-+		fprintf(stderr, "could not open file for reading\n");
-+		exit(EXIT_FAILURE);
-+	}
-+
-+	afSetVirtualSampleFormat(file, AF_DEFAULT_TRACK, AF_SAMPFMT_TWOSCOMP, 8);
-+	afSetVirtualChannels(file, AF_DEFAULT_TRACK, 1);
-+
-+	for (i=0; i<frameCount; i++)
-+	{
-+		/* Read one frame. */
-+		result = afReadFrames(file, AF_DEFAULT_TRACK, &byte, 1);
-+
-+		if (result != 1)
-+			break;
-+
-+		/* Compare the byte read with its precalculated value. */
-+		if (memcmp(&byte, &frames8[i], 1) != 0)
-+		{
-+			printf("error\n");
-+			printf("expected %d, got %d\n", frames8[i], byte);
-+			exit(EXIT_FAILURE);
-+		}
-+		else
-+		{
-+#ifdef DEBUG
-+			printf("got what was expected: %d\n", byte);
-+#endif
-+		}
-+	}
-+
-+	afCloseFile(file);
-+	unlink(testFileName);
-+	free(testFileName);
-+
-+	exit(EXIT_SUCCESS);
-+}
diff --git a/package/audiofile/0009-Fix-static-linking-with-libsndfile.patch b/package/audiofile/0009-Fix-static-linking-with-libsndfile.patch
deleted file mode 100644
index c48e664a3e..0000000000
--- a/package/audiofile/0009-Fix-static-linking-with-libsndfile.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From d89a938f48e97b5770509d53c5478c5c3008d6e8 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 27 May 2017 17:53:33 +0200
-Subject: [PATCH 1/1] Fix static linking with libsndfile
-
-libsndfile and audiofile both contain mixXX functions in their alac
-code which lead to symbol name clashes when apps like mpd try to
-statically link to both audiofile and libsndfile at the same time.
-
-This patch renames these functions to avoid the problem which was
-detected by the buildroot autobuilders:
-http://autobuild.buildroot.net/results/799/7997ccd698f03885f98d00bd150dc3a578e4b161/
-
-Patch sent upstream: https://github.com/mpruett/audiofile/pull/45
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- libaudiofile/alac/ALACEncoder.cpp | 28 ++++++++++++++--------------
- libaudiofile/alac/matrix_enc.c    |  8 ++++----
- libaudiofile/alac/matrixlib.h     |  8 ++++----
- 3 files changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/libaudiofile/alac/ALACEncoder.cpp b/libaudiofile/alac/ALACEncoder.cpp
-index da922c2..3d088cc 100644
---- a/libaudiofile/alac/ALACEncoder.cpp
-+++ b/libaudiofile/alac/ALACEncoder.cpp
-@@ -332,19 +332,19 @@ int32_t ALACEncoder::EncodeStereo( BitBuffer * bitstream, void * inputBuffer, ui
-         switch ( mBitDepth )
-         {
-             case 16:
--                mix16( (int16_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate, mixBits, mixRes );
-+                audiofile_alac_mix16( (int16_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate, mixBits, mixRes );
-                 break;
-             case 20:
--                mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate, mixBits, mixRes );
-+                audiofile_alac_mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate, mixBits, mixRes );
-                 break;
-             case 24:
-                 // includes extraction of shifted-off bytes
--                mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate,
-+                audiofile_alac_mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate,
-                         mixBits, mixRes, mShiftBufferUV, bytesShifted );
-                 break;
-             case 32:
-                 // includes extraction of shifted-off bytes
--                mix32( (int32_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate,
-+                audiofile_alac_mix32( (int32_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples/dilate,
-                         mixBits, mixRes, mShiftBufferUV, bytesShifted );
-                 break;
-         }
-@@ -379,19 +379,19 @@ int32_t ALACEncoder::EncodeStereo( BitBuffer * bitstream, void * inputBuffer, ui
- 	switch ( mBitDepth )
- 	{
- 		case 16:
--			mix16( (int16_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
-+			audiofile_alac_mix16( (int16_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
- 			break;
- 		case 20:
--			mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
-+			audiofile_alac_mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
- 			break;
- 		case 24:
- 			// also extracts the shifted off bytes into the shift buffers
--			mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
-+			audiofile_alac_mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
- 					mixBits, mixRes, mShiftBufferUV, bytesShifted );
- 			break;
- 		case 32:
- 			// also extracts the shifted off bytes into the shift buffers
--			mix32( (int32_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
-+			audiofile_alac_mix32( (int32_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
- 					mixBits, mixRes, mShiftBufferUV, bytesShifted );
- 			break;
- 	}
-@@ -605,19 +605,19 @@ int32_t ALACEncoder::EncodeStereoFast( BitBuffer * bitstream, void * inputBuffer
- 	switch ( mBitDepth )
- 	{
- 		case 16:
--			mix16( (int16_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
-+			audiofile_alac_mix16( (int16_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
- 			break;
- 		case 20:
--			mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
-+			audiofile_alac_mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, mixBits, mixRes );
- 			break;
- 		case 24:
- 			// also extracts the shifted off bytes into the shift buffers
--			mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
-+			audiofile_alac_mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
- 					mixBits, mixRes, mShiftBufferUV, bytesShifted );
- 			break;
- 		case 32:
- 			// also extracts the shifted off bytes into the shift buffers
--			mix32( (int32_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
-+			audiofile_alac_mix32( (int32_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples,
- 					mixBits, mixRes, mShiftBufferUV, bytesShifted );
- 			break;
- 	}
-@@ -756,7 +756,7 @@ int32_t ALACEncoder::EncodeStereoEscape( BitBuffer * bitstream, void * inputBuff
- 			break;
- 		case 20:
- 			// mix20() with mixres param = 0 means de-interleave so use it to simplify things
--			mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, 0, 0 );
-+			audiofile_alac_mix20( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, 0, 0 );
- 			for ( index = 0; index < numSamples; index++ )
- 			{
- 				BitBufferWrite( bitstream, mMixBufferU[index], 20 );
-@@ -765,7 +765,7 @@ int32_t ALACEncoder::EncodeStereoEscape( BitBuffer * bitstream, void * inputBuff
- 			break;
- 		case 24:
- 			// mix24() with mixres param = 0 means de-interleave so use it to simplify things
--			mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, 0, 0, mShiftBufferUV, 0 );
-+			audiofile_alac_mix24( (uint8_t *) inputBuffer, stride, mMixBufferU, mMixBufferV, numSamples, 0, 0, mShiftBufferUV, 0 );
- 			for ( index = 0; index < numSamples; index++ )
- 			{
- 				BitBufferWrite( bitstream, mMixBufferU[index], 24 );
-diff --git a/libaudiofile/alac/matrix_enc.c b/libaudiofile/alac/matrix_enc.c
-index e194330..8abd556 100644
---- a/libaudiofile/alac/matrix_enc.c
-+++ b/libaudiofile/alac/matrix_enc.c
-@@ -57,7 +57,7 @@
- 
- // 16-bit routines
- 
--void mix16( int16_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres )
-+void audiofile_alac_mix16( int16_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres )
- {
- 	int16_t	*	ip = in;
- 	int32_t			j;
-@@ -95,7 +95,7 @@ void mix16( int16_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t num
- // 20-bit routines
- // - the 20 bits of data are left-justified in 3 bytes of storage but right-aligned for input/output predictor buffers
- 
--void mix20( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres )
-+void audiofile_alac_mix20( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres )
- {
- 	int32_t		l, r;
- 	uint8_t *	ip = in;
-@@ -140,7 +140,7 @@ void mix20( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t num
- // 24-bit routines
- // - the 24 bits of data are right-justified in the input/output predictor buffers
- 
--void mix24( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
-+void audiofile_alac_mix24( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
- 			int32_t mixbits, int32_t mixres, uint16_t * shiftUV, int32_t bytesShifted )
- {	
- 	int32_t		l, r;
-@@ -240,7 +240,7 @@ void mix24( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t num
- // - otherwise, the calculations might overflow into the 33rd bit and be lost
- // - therefore, these routines deal with the specified "unused lower" bytes in the "shift" buffers
- 
--void mix32( int32_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
-+void audiofile_alac_mix32( int32_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
- 			int32_t mixbits, int32_t mixres, uint16_t * shiftUV, int32_t bytesShifted )
- {
- 	int32_t	*	ip = in;
-diff --git a/libaudiofile/alac/matrixlib.h b/libaudiofile/alac/matrixlib.h
-index 0a4f371..5728b6d 100644
---- a/libaudiofile/alac/matrixlib.h
-+++ b/libaudiofile/alac/matrixlib.h
-@@ -38,17 +38,17 @@ extern "C" {
- #endif
- 
- // 16-bit routines
--void	mix16( int16_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres );
-+void	audiofile_alac_mix16( int16_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres );
- void	unmix16( int32_t * u, int32_t * v, int16_t * out, uint32_t stride, int32_t numSamples, int32_t mixbits, int32_t mixres );
- 
- // 20-bit routines
--void	mix20( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres );
-+void	audiofile_alac_mix20( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples, int32_t mixbits, int32_t mixres );
- void	unmix20( int32_t * u, int32_t * v, uint8_t * out, uint32_t stride, int32_t numSamples, int32_t mixbits, int32_t mixres );
- 
- // 24-bit routines
- // - 24-bit data sometimes compresses better by shifting off the bottom byte so these routines deal with
- //	 the specified "unused lower bytes" in the combined "shift" buffer
--void	mix24( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
-+void	audiofile_alac_mix24( uint8_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
- 				int32_t mixbits, int32_t mixres, uint16_t * shiftUV, int32_t bytesShifted );
- void	unmix24( int32_t * u, int32_t * v, uint8_t * out, uint32_t stride, int32_t numSamples,
- 				 int32_t mixbits, int32_t mixres, uint16_t * shiftUV, int32_t bytesShifted );
-@@ -57,7 +57,7 @@ void	unmix24( int32_t * u, int32_t * v, uint8_t * out, uint32_t stride, int32_t
- // - note that these really expect the internal data width to be < 32-bit but the arrays are 32-bit
- // - otherwise, the calculations might overflow into the 33rd bit and be lost
- // - therefore, these routines deal with the specified "unused lower" bytes in the combined "shift" buffer
--void	mix32( int32_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
-+void	audiofile_alac_mix32( int32_t * in, uint32_t stride, int32_t * u, int32_t * v, int32_t numSamples,
- 				int32_t mixbits, int32_t mixres, uint16_t * shiftUV, int32_t bytesShifted );
- void	unmix32( int32_t * u, int32_t * v, int32_t * out, uint32_t stride, int32_t numSamples,
- 				 int32_t mixbits, int32_t mixres, uint16_t * shiftUV, int32_t bytesShifted );
--- 
-2.11.0
-
diff --git a/package/audiofile/Config.in b/package/audiofile/Config.in
deleted file mode 100644
index 4aa8d69c87..0000000000
--- a/package/audiofile/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_AUDIOFILE
-	bool "audiofile"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  The Audio File Library handles reading and writing audio files
-	  in many common formats.
-
-	  http://www.68k.org/~michael/audiofile/
-
-comment "audiofile needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/audiofile/audiofile.hash b/package/audiofile/audiofile.hash
deleted file mode 100644
index f4028f9a6e..0000000000
--- a/package/audiofile/audiofile.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated
-sha256  cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965  audiofile-0.3.6.tar.gz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
deleted file mode 100644
index bb46436d85..0000000000
--- a/package/audiofile/audiofile.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-################################################################################
-#
-# audiofile
-#
-################################################################################
-
-AUDIOFILE_VERSION = 0.3.6
-AUDIOFILE_SITE = http://audiofile.68k.org
-AUDIOFILE_INSTALL_STAGING = YES
-AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-AUDIOFILE_CONF_OPTS = --disable-examples
-AUDIOFILE_DEPENDENCIES = host-pkgconf
-# configure is outdated and has old bugs because of it
-AUDIOFILE_AUTORECONF = YES
-AUDIOFILE_LICENSE = GPL-2.0+, LGPL-2.1+
-AUDIOFILE_LICENSE_FILES = COPYING COPYING.GPL
-
-# 0003-Always-check-the-number-of-coefficients.patch
-AUDIOFILE_IGNORE_CVES += \
-	CVE-2017-6827 CVE-2017-6828 CVE-2017-6832 \
-	CVE-2017-6833 CVE-2017-6835 CVE-2017-6837
-# 0004-clamp-index-values-to-fix-index-overflow-in-IMA.cpp.patch
-AUDIOFILE_IGNORE_CVES += CVE-2017-6829
-# 0005-Check-for-multiplication-overflow-in-sfconvert.patch
-AUDIOFILE_IGNORE_CVES += \
-	CVE-2017-6830 CVE-2017-6834 CVE-2017-6836 CVE-2017-6838
-# 0006-Actually-fail-when-error-occurs-in-parseFormat.patch
-AUDIOFILE_IGNORE_CVES += CVE-2017-6831
-# 0007-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch
-AUDIOFILE_IGNORE_CVES += CVE-2017-6839
-# 0008-CVE-2015-7747.patch
-AUDIOFILE_IGNORE_CVES += CVE-2015-7747
-
-ifeq ($(BR2_PACKAGE_FLAC),y)
-AUDIOFILE_DEPENDENCIES += flac
-AUDIOFILE_CONF_OPTS += --enable-flac
-else
-AUDIOFILE_CONF_OPTS += --disable-flac
-endif
-
-$(eval $(autotools-package))
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 8a8ae69982..9748c7d0a5 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -84,13 +84,6 @@ config BR2_PACKAGE_MPD_LIBSOXR
 
 comment "Decoder plugins"
 
-config BR2_PACKAGE_MPD_AUDIOFILE
-	bool "audiofile"
-	select BR2_PACKAGE_AUDIOFILE
-	help
-	  Enable audiofile input/streaming support.
-	  Select this if you want to play back WAV files.
-
 config BR2_PACKAGE_MPD_DSD
 	bool "dsd"
 	help
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 75d1c6edee..5dfb5b42a4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -11,7 +11,9 @@ MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
-MPD_CONF_OPTS = -Ddocumentation=disabled
+MPD_CONF_OPTS = \
+	-Daudiofile=disabled \
+	-Ddocumentation=disabled
 
 # Zeroconf support depends on libdns_sd from avahi.
 ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
@@ -43,13 +45,6 @@ else
 MPD_CONF_OPTS += -Dao=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_AUDIOFILE),y)
-MPD_DEPENDENCIES += audiofile
-MPD_CONF_OPTS += -Daudiofile=enabled
-else
-MPD_CONF_OPTS += -Daudiofile=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
 MPD_CONF_OPTS += -Dbzip2=enabled
-- 
2.29.2
