From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Dec 2020 19:27:40 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-wrapper: fix gcc -v
 with relro
Message-ID: <20201223182740.2879160-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rhash in version 1.4.0 with relro fails to build because gcc -v raises
the following build failure:

/data/buildroot-test/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/soft-float/el/usr/lib64/Scrt1.o: In function `__start':
(.text+0x20): undefined reference to `main'
collect2: error: ld returned 1 exit status
Run result: 1

This buid failure is raised because the toolchain-wrapper calls gcc with
-Wl,-z,relro and as a result gcc wrongly assumes that some linking must
be done with -v

Fixes:
 - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/toolchain-wrapper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 0fb6064b1c..4c3375cfbc 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -456,7 +456,8 @@ int main(int argc, char **argv)
 	/* Are we building the Linux Kernel or U-Boot? */
 	for (i = 1; i < argc; i++) {
 		if (!strcmp(argv[i], "-D__KERNEL__") ||
-		    !strcmp(argv[i], "-D__UBOOT__"))
+		    !strcmp(argv[i], "-D__UBOOT__") ||
+		    !strcmp(argv[i], "-v"))
 			break;
 	}
 	if (i == argc) {
-- 
2.29.2
