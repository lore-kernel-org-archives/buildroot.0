From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 24 Mar 2015 12:51:43 +0300
Subject: [Buildroot] [PATCH] autobuild-run: do not build evtest using
	extrenal arc-2014.12 toolchain
Message-ID: <1427190703-2935-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This external arc-2014.12 toolchain has uClibc with disabled
UCLIBC_HAS_PROGRAM_INVOCATION_NAME.

Because of this following build failure happens in autobuilder -
http://autobuild.buildroot.net/results/0fd/0fd36a0d79c4d82aedebb5aca8d3ce4214b1ed61/
--->8---
evtest.c: In function 'version':
evtest.c:730:20: error: 'program_invocation_short_name' undeclared (first use in this function)
  printf("%s %s\n", program_invocation_short_name, PACKAGE_VERSION);
                    ^
evtest.c:730:20: note: each undeclared identifier is reported only once for each function it appears in
evtest.c: In function 'usage':
evtest.c:742:38: error: 'program_invocation_short_name' undeclared (first use in this function)
  printf("   %s /dev/input/eventX\n", program_invocation_short_name);
--->8---

Mentioned config option was recently enabled in uClibc's defconfig for ARC:
https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/commit/c2460b9b7b8c76098dfb1313be4aa4a4a65ff619

So newer ARC uClibc toolchains should build evtest perfectly well.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 872ee9d..69637f2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -420,6 +420,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This ARC uClibc toolchain fails to build the evtest package
+    if 'BR2_PACKAGE_EVTEST=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12=y\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
2.1.0
