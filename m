From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 13:25:20 +0200
Subject: [Buildroot] [git commit] PPC: fix ltrace build on PPC32
Message-ID: <20140729112535.57A369D2F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e4b6c5764f689d03d5ba2345c27c1b8c735d42a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix the build on PPC32 platform. That patch has been
submitted upstream.

Fixes:

  http://autobuild.buildroot.org/results/446/4460aac38225289ef58a8693da9ae520ae07a226/

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch b/package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch
new file mode 100644
index 0000000..92055c9
--- /dev/null
+++ b/package/ltrace/ltrace-03-PPC-fix-PPC32-build.patch
@@ -0,0 +1,31 @@
+From c01c6dc017b5ae2b6de7b690725890642b6bf857 Mon Sep 17 00:00:00 2001
+From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+Date: Tue, 29 Jul 2014 11:01:31 +0200
+Subject: [PATCH] PPC: fix PPC32 build
+
+Compilation on PPC32 fails because STACK_FRAME_OVERHEAD is never defined
+in arch.h.
+
+Define it to 112 on that platform to restore the same behaviour as
+before commit eea4ad2cce289753aaa35b4e0258a76d8f8f367c.
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
+---
+ sysdeps/linux-gnu/ppc/arch.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sysdeps/linux-gnu/ppc/arch.h b/sysdeps/linux-gnu/ppc/arch.h
+index 7918a136b016..d5ad759a755c 100644
+--- a/sysdeps/linux-gnu/ppc/arch.h
++++ b/sysdeps/linux-gnu/ppc/arch.h
+@@ -57,6 +57,7 @@
+ #else
+ #define BREAKPOINT_VALUE { 0x7f, 0xe0, 0x00, 0x08 }
+ #define ARCH_ENDIAN_BIG
++# define STACK_FRAME_OVERHEAD 112
+ # ifndef EF_PPC64_ABI
+ # define EF_PPC64_ABI 3
+ # endif
+-- 
+1.9.1
+
