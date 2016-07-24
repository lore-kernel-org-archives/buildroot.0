From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:50:05 +0200
Subject: [Buildroot] [git commit] package/go: needs PIE support
Message-ID: <20160724195029.B99AA80AC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f2ff6064497637d1af04a163d83e849902f4bc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When built statically, runc try to link against Scrt1.o which is not
provided by uClibc ARM toolchain for static build only.

[...]arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory
collect2: error: ld returned 1 exit status

On ARM, Go forces the use of -pie, for some reason:

    pie := (goarch == "arm" && goos == "linux") || goos == "android"
    if pie { // we need to use -pie for Linux/ARM to get accurate imported sym
              cgoLDFLAGS = append(cgoLDFLAGS, "-pie")
    }

For this reason, add a dependency on BR2_TOOLCHAIN_SUPPORTS_PIE for ARM
CPUs to disable Go for such toolchains.

While at it, rewrap Go dependencies.

[1] http://lists.busybox.net/pipermail/buildroot/2016-July/167206.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Christian Stewart <christian@paral.in>
Tested-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/Config.in.host | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index d6d35dc..d79c669 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
+	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
+		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64 || BR2_powerpc64le \
+		|| BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_mips_64r6
