From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Dec 2020 11:18:40 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] toolchain/toolchain-wrapper: fix gcc -v with relro
Message-ID: <20201224101840.3428243-1-fontaine.fabrice@gmail.com>
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

This build failure is raised because the toolchain-wrapper calls gcc with
-Wl,-z,relro and as a result gcc wrongly assumes that some linking must
be done.

Fixes:
 - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2 (after review of Peter Seiderer):
 - Fix typos in commit log and update comment in source code

 toolchain/toolchain-wrapper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 0fb6064b1c..2a7dd61729 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -453,10 +453,11 @@ int main(int argc, char **argv)
 			*cur++ = "-pie";
 	}
 #endif
-	/* Are we building the Linux Kernel or U-Boot? */
+	/* Are we building the Linux Kernel or U-Boot or displaying the programs invoked by the compiler? */
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
