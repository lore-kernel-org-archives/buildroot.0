From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Jan 2019 23:00:14 +0100
Subject: [Buildroot] [PATCH 2/2] package/gdb/8.2.1: fix gdb build with musl
 and kernel headers
In-Reply-To: <20190124220014.10707-1-romain.naour@gmail.com>
References: <20190124220014.10707-1-romain.naour@gmail.com>
Message-ID: <20190124220014.10707-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by toolchain builder [1], gdb 8.2.1 doesn't build with musl
toolchains on aarch64.

Backport an upstream patch [2].

Keep gdb 8.2.x disable for aarch64 with musl toolchain since it require
kernel headers > 5.0. We can enable this gdb version as soon as we have
BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_0 symbol in Buildroot.

[1] https://gitlab.com/kubu93/toolchains-builder/-/jobs/148356393
[2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=51b4f73a37c2e7eec31e932fc3c8dae879735f63

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...-AArch64-Fix-the-gdb-build-with-musl-libc.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/gdb/8.2.1/0006-AArch64-Fix-the-gdb-build-with-musl-libc.patch

diff --git a/package/gdb/8.2.1/0006-AArch64-Fix-the-gdb-build-with-musl-libc.patch b/package/gdb/8.2.1/0006-AArch64-Fix-the-gdb-build-with-musl-libc.patch
new file mode 100644
index 0000000000..d90750f849
--- /dev/null
+++ b/package/gdb/8.2.1/0006-AArch64-Fix-the-gdb-build-with-musl-libc.patch
@@ -0,0 +1,52 @@
+From dc3493a11c987edc1c85d9bd7f2242b5bffb7430 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Thu, 13 Dec 2018 17:47:17 +0000
+Subject: [PATCH] AArch64: Fix the gdb build with musl libc
+
+Including asm/sigcontext.h together with libc headers is not valid. In
+general linux headers may not work with libc headers, so mixing them
+should be avoided, especially when the linux header defines types that
+are also exposed in libc headers.
+
+In case of asm/sigcontext.h glibc happens to work because glibc signal.h
+directly includes it, but e.g. in musl libc signal.h replicates the
+sigcontext.h definitions in an abi compatible way which are in conflict
+with the linux definitions when both headers are included.
+
+Since old linux headers or old libc headers may not have the necessary
+definitions, gdb has to replicate the definitions it relies on anyway.
+Which is fine since all definitions must be ABI stable. For linux apis
+that are not available via libc headers, replicating the definitions in
+gdb is the most reliable way to use them.
+
+Note: asm/ptrace.h includes asm/sigcontext.h in some versions of linux
+headers, which is just as problematic and should be fixed in linux.
+
+gdb/ChangeLog:
+
+	* nat/aarch64-sve-linux-ptrace.h: Include signal.h instead of
+	asm/sigcontext.h.
+
+[Romain: backport to 8.2 from upstream commit
+  51b4f73a37c2e7eec31e932fc3c8dae879735f63]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/nat/aarch64-sve-linux-ptrace.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/nat/aarch64-sve-linux-ptrace.h b/gdb/nat/aarch64-sve-linux-ptrace.h
+index 029e753ffe8..172ae39432f 100644
+--- a/gdb/nat/aarch64-sve-linux-ptrace.h
++++ b/gdb/nat/aarch64-sve-linux-ptrace.h
+@@ -20,7 +20,7 @@
+ #ifndef AARCH64_SVE_LINUX_PTRACE_H
+ #define AARCH64_SVE_LINUX_PTRACE_H
+ 
+-#include <asm/sigcontext.h>
++#include <signal.h>
+ #include <sys/utsname.h>
+ #include <sys/ptrace.h>
+ #include <asm/ptrace.h>
+-- 
+2.14.5
+
-- 
2.14.5
