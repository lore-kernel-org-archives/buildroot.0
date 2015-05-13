From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 10:07:13 +0200
Subject: [Buildroot] [git commit] google-breakpad: add patch to fix AArch64
	build issue
Message-ID: <20150513080938.4E13C80411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=901fec315d0eb5ceb96f32a318494b9907350a72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/b2b/b2bfbcc922b3041ab3a1892d5c1469ec68476682/

[Peter: fix s/wiht/with/ typo as pointed out by Romain]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-add-missing-asm-ptrace-include.patch      |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch b/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
new file mode 100644
index 0000000..281c7a0
--- /dev/null
+++ b/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
@@ -0,0 +1,31 @@
+Include <asm/ptrace.h> to get necessary definitions on AArch64
+
+In glibc commit
+https://sourceware.org/git/?p=glibc.git;a=commit;h=7d05a8168b45c0580e1f9a79c2dd26c8f0d31fca,
+including <asm/ptrace.h> from <sys/user.h> on AArch64 has been
+removed. So the Google Breakpad code, which used to build fine on
+glibc 2.18 (CodeSourcery toolchain for example), no longer builds with
+glibc 2.19 (Linaro toolchain for example).
+
+To fix this, this patch adds the missing <asm/ptrace.h> include (for
+AArch64 only, to be conservative).
+
+This patch has not been submitted upstream, since more recent versions
+of Google Breakpad have completely changed this part of the code.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/client/linux/minidump_writer/linux_dumper.h
+===================================================================
+--- a/src/client/linux/minidump_writer/linux_dumper.h
++++ b/src/client/linux/minidump_writer/linux_dumper.h
+@@ -43,6 +43,9 @@
+ #include <stdint.h>
+ #include <sys/types.h>
+ #include <sys/user.h>
++#if defined(__aarch64__)
++#include <asm/ptrace.h>
++#endif
+ 
+ #include "common/memory.h"
+ #include "google_breakpad/common/minidump_format.h"
