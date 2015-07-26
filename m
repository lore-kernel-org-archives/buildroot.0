From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:20:10 +0200
Subject: [Buildroot] [git commit] toolchain-external wrapper: don't pass
	march/mcpu if mtune is on cmdline
Message-ID: <20150726132028.6807B81954@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b62cb78d6fa982c0777053fe612159c692f1a948
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before commit 5715d2dcf48a39c16a3f3e41c97109613fed121d, the external
toolchain wrapper would not pass its own march/mcpu/mtune flags to the real
compiler if at least one of them was passed on the wrapper command-line.

The mentioned commit intended to remove the passing of an mtune parameter
coming from Buildroot, which was always empty after some other refactoring,
but the changes have the side-effect that march/mcpu is now also passed when
mtune is already given on the command-line. In that case, only mtune should
be passed to the real compiler.

Restore part of the original toolchain wrapper code to check the presence of
mtune on the command-line.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external/ext-toolchain-wrapper.c     |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-toolchain-wrapper.c b/toolchain/toolchain-external/ext-toolchain-wrapper.c
index e2d01dc..b3b02d8 100644
--- a/toolchain/toolchain-external/ext-toolchain-wrapper.c
+++ b/toolchain/toolchain-external/ext-toolchain-wrapper.c
@@ -177,11 +177,12 @@ int main(int argc, char **argv)
 
 #if defined(BR_ARCH) || \
     defined(BR_CPU)
-	/* Add our -march/cpu/abi flags, but only if none are
-	 * already specified on the commandline
+	/* Add our -march/cpu flags, but only if none of
+	 * -march/mtune/mcpu are already specified on the commandline
 	 */
 	for (i = 1; i < argc; i++) {
 		if (!strncmp(argv[i], "-march=", strlen("-march=")) ||
+		    !strncmp(argv[i], "-mtune=", strlen("-mtune=")) ||
 		    !strncmp(argv[i], "-mcpu=",  strlen("-mcpu=" )))
 			break;
 	}
