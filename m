From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 26 Sep 2011 14:31:17 +0200
Subject: [Buildroot] [PATCH] kexec: fix compilation with gcc 4.6
Message-ID: <1317040277-1183-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 4.6 has stricter checks for invalid command-line options.
Fix compilation by passing linker options with -Wl,

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/kexec/kexec-fix-linker-options.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/kexec/kexec-fix-linker-options.patch

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
-- 
1.7.5.4
