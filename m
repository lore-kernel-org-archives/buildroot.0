From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:35:05 +0100
Subject: [Buildroot] [git commit] mpv: needs atomics or 8-byte sync
Message-ID: <20161121213516.0992A81630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48341ce1cb827df0862b5545900ed6b50ea6f03a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
