From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 24 Jan 2019 23:00:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/gdb: disable gdb 8.2 for aarch64
 and kernel headers < 5.0
Message-ID: <20190124220014.10707-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdb 8.2 on aarch64 needs kernel headers >= 5.0 due to issues with the new
SVE kernel support introduced by [1].

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=95228a0d790f16deae3436e18f41b70fc711a5b2

These issues are fixed in by the following patches in kernel >= 5.0.

[arm64/sve: Disentangle <uapi/asm/ptrace.h> from <uapi/asm/sigcontext.h>]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9966a05c7b80f075f2bc7e48dbb108d3f2927234

[arm64/sve: ptrace: Fix SVE_PT_REGS_OFFSET definition]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ee1b465b303591d3a04d403122bbc0d7026520fb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gdb/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 969168ffa2..ec253308eb 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -68,6 +68,8 @@ config BR2_GDB_VERSION_8_2
 	bool "gdb 8.2.x"
 	# Needs a C++11 compiler
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	# Issue with kernel headers < 5.0 and musl
+	depends on !BR2_aarch64 || (BR2_aarch64 && !BR2_TOOLCHAIN_USES_MUSL)
 
 endchoice
 
-- 
2.14.5
