From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 09:28:28 +0100
Subject: [Buildroot] [git commit] dvb-apps: fix avr32 build failure
Message-ID: <20131215090215.D71A09C016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a52d9ef80a2c5decc3b80f8813f1f656b3ab6694
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building for avr32, the build fails as follows.

  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"

An example of an autobuild failure arising from this is the following.

  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/

Clearly, not all toolchains provide a gcc that understands
the -Wno-packed-bitfield-compat flag; remove usage of this flag.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dvb-apps-0002-Fix-compiler-warning-flags.patch |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
new file mode 100644
index 0000000..9da0408
--- /dev/null
+++ b/package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
@@ -0,0 +1,25 @@
+When building for avr32, the build fails as follows.
+
+  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"
+
+An example of an autobuild failure arising from this is the following.
+
+  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/
+
+Clearly, not all toolchains provide a gcc that understands
+the -Wno-packed-bitfield-compat flag; remove usage of this flag.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/util/scan/Makefile b/util/scan/Makefile
+--- a/util/scan/Makefile	2013-11-24 17:04:10.000000000 +0000
++++ b/util/scan/Makefile	2013-12-13 09:37:11.967975173 +0000
+@@ -14,7 +14,7 @@ inst_bin = $(binaries)
+ 
+ removing = atsc_psip_section.c atsc_psip_section.h
+ 
+-CPPFLAGS += -Wno-packed-bitfield-compat -D__KERNEL_STRICT_NAMES
++CPPFLAGS += -D__KERNEL_STRICT_NAMES
+ 
+ .PHONY: all
+ 
