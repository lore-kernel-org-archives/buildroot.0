From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 10:05:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/alsa-lib: fix musl-related openal
	build error
In-Reply-To: <1454144707-26838-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454144707-26838-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454144707-26838-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openal will fail to build without this patch when using pcm.h

In file included from /home/bernd/buildroot/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/alsa/asoundlib.h:54:0,
                 from /home/bernd/buildroot/br3/output/build/openal-1.17.2/Alc/backends/alsa.c:34:
/home/bernd/buildroot/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/alsa/pcm.h:1111:1: error: unknown type name ?u_int8_t?
 u_int8_t snd_pcm_format_silence(snd_pcm_format_t format);
 ^

It seems that this problem was not yet caught by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-lib/0005-musl-pcm-h.patch | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/alsa-lib/0005-musl-pcm-h.patch

diff --git a/package/alsa-lib/0005-musl-pcm-h.patch b/package/alsa-lib/0005-musl-pcm-h.patch
new file mode 100644
index 0000000..ce1528c
--- /dev/null
+++ b/package/alsa-lib/0005-musl-pcm-h.patch
@@ -0,0 +1,33 @@
+Fix musl-related build errors in packages depending on alsa, in our case
+this fixes openal.
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/alsa-lib/alsa-lib_pcm_h.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- alsa-lib-1.0.25/include/pcm.h
++++ alsa-lib-1.0.25.patched/include/pcm.h
+@@ -33,6 +33,7 @@
+ extern "C" {
+ #endif
+ 
++#include <stdint.h>
+ /**
+  *  \defgroup PCM PCM Interface
+  *  See the \ref pcm page for more details.
+@@ -941,10 +942,10 @@
+ int snd_pcm_format_physical_width(snd_pcm_format_t format);		/* in bits */
+ snd_pcm_format_t snd_pcm_build_linear_format(int width, int pwidth, int unsignd, int big_endian);
+ ssize_t snd_pcm_format_size(snd_pcm_format_t format, size_t samples);
+-u_int8_t snd_pcm_format_silence(snd_pcm_format_t format);
+-u_int16_t snd_pcm_format_silence_16(snd_pcm_format_t format);
+-u_int32_t snd_pcm_format_silence_32(snd_pcm_format_t format);
+-u_int64_t snd_pcm_format_silence_64(snd_pcm_format_t format);
++uint8_t snd_pcm_format_silence(snd_pcm_format_t format);
++uint16_t snd_pcm_format_silence_16(snd_pcm_format_t format);
++uint32_t snd_pcm_format_silence_32(snd_pcm_format_t format);
++uint64_t snd_pcm_format_silence_64(snd_pcm_format_t format);
+ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int samples);
+ 
+ snd_pcm_sframes_t snd_pcm_bytes_to_frames(snd_pcm_t *pcm, ssize_t bytes);
-- 
2.7.0.rc3
