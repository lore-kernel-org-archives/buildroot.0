From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 11 Nov 2016 10:15:06 +0100
Subject: [Buildroot] [PATCH autobuild-run] autobuild-run: Add an exception
	for ctng toolchain armv5 with Guile package
Message-ID: <1478855706-5152-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Like for CS 2014.05 ARM toolchain, the ctng toolchain trigger an
assembler error when Guile package is compiled with -Os.

[1] https://git.buildroot.net/buildroot/commit/?id=401c47e44b26e97db1c12cce0a42c62cfb72a9b9

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2583098..65276bd 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -424,6 +424,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
         return False
+    # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
+    if 'BR2_PACKAGE_GUILE=y\n' in configlines and 'BR2_OPTIMIZE_S=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
+        return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
-- 
2.5.5
