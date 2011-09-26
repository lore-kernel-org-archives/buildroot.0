From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 22:16:08 +0200
Subject: [Buildroot] [git commit] kexec: fix compilation with gcc 4.6
Message-ID: <20110926204530.BE0E48DA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b766ed21e8b5499dd2237d80358229de04ddab9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 4.6 has stricter checks for invalid command-line options.
Fix compilation by passing linker options with -Wl,

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/kexec-fix-linker-options.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/kexec/kexec-fix-linker-options.patch b/package/kexec/kexec-fix-linker-options.patch
new file mode 100644
index 0000000..7bd5f1d
--- /dev/null
+++ b/package/kexec/kexec-fix-linker-options.patch
@@ -0,0 +1,15 @@
+Fix compilation with gcc 4.6 by correcting the way that linker options
+are passed to gcc.
+
+Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
+--- kexec-2.0.2/purgatory/Makefile.orig	2011-09-26 14:16:44.256595912 +0200
++++ kexec-2.0.2/purgatory/Makefile	2011-09-26 14:17:01.606621357 +0200
+@@ -56,7 +56,7 @@
+ 			-I$(srcdir)/include \
+ 			-I$(shell $(CC) -print-file-name=include)
+ $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
+-			--no-undefined -nostartfiles -nostdlib -nodefaultlibs \
++			-Wl,-no-undefined -nostartfiles -nostdlib -nodefaultlibs \
+ 			-e purgatory_start -r
+ 
+ $(PURGATORY): $(PURGATORY_OBJS)
