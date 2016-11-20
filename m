From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Nov 2016 15:54:34 +0100
Subject: [Buildroot] [PATCH v2] mpv: needs atomics or 8-byte sync
Message-ID: <20161120145434.20506-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The wscript checks the following.
        'func': check_libs(['atomic'],
            check_statement('stdint.h',
                'int64_t test = 0;'
                'test = __atomic_add_fetch(&test, 1, __ATOMIC_SEQ_CST)')),
and
        'func': check_statement('stdint.h',
                    'int64_t test = 0;'
                    '__typeof__(test) x = ({int a = 1; a;});'
                    'test = __sync_add_and_fetch(&test, 1)'),
It fails if neither of these are available.

Fixes
http://autobuild.buildroot.net/results/8c20f719f784af1312294600e39004c1d382368a

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I couldn't find a compiler without atomics and with 8-byte sync, so not
entirely sure if it's enough.

v2: improved commit message (in v1 it sounded as if both were needed)
---
 package/mpv/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 25288a4..2719981 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MPV
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -17,5 +18,6 @@ config BR2_PACKAGE_MPV
 
 comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-- 
2.10.2
