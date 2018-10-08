From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:55:27 +0200
Subject: [Buildroot] [git commit] perl-sys-cpu: fix build failures due to
 <sys/unistd.h>
Message-ID: <20181008195432.819C18E53F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cd5d6eea13e2a4fcfcf864e2cb0b92ac196a3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch that drops an unneeded <sys/unistd.h>
include, as it causes build failures on uClibc/musl.

Fixes:

  http://autobuild.buildroot.net/results/a87116b34ee0c660537430638e38f7ebbf052024/

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-remove-extraneous-include.patch             | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/perl-sys-cpu/0001-remove-extraneous-include.patch b/package/perl-sys-cpu/0001-remove-extraneous-include.patch
new file mode 100644
index 0000000000..eb7d8f76a8
--- /dev/null
+++ b/package/perl-sys-cpu/0001-remove-extraneous-include.patch
@@ -0,0 +1,20 @@
+Drop <sys/unistd.h> include
+
+<sys/unistd.h> does not exist in musl or uClibc, so including it
+causes a build failure. In glibc, it simply redirects to <unistd.h>,
+so we can safely drop the inclusion of <sys/unistd.h>
+
+Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
+
+Index: b/CPU.xs
+===================================================================
+--- a/CPU.xs
++++ b/CPU.xs
+@@ -24,7 +24,6 @@
+  #include <winreg.h>
+ #else                /* other (try unix) */
+  #include <unistd.h>
+- #include <sys/unistd.h>
+ #endif
+ #if defined(__sun) || defined(__sun__) 
+  #include <sys/processor.h>
