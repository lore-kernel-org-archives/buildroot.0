From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 13:36:51 +0200
Subject: [Buildroot] [PATCH 4/4] perf: fix compilation in case of i386
 userspace with x86_64 kernel
In-Reply-To: <20210518113652.29609-1-patrickdepinguin@gmail.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
Message-ID: <20210518113652.29609-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

If a 64-bit kernel is combined with 32-bit userspace, and this is achieved
via a multilib toolchain that defaults to 64-bit with '-m32' in
BR2_TARGET_OPTIMIZATION, the '<cross>-ld' command will still default to
64-bit output.

In this case, packages that use 'ld' directly need to be instructed to use
the correct ABI via the '-m' parameter. 'perf' is one such package.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 4e28129f50..b84b5fd415 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -45,6 +45,9 @@ PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmipn32"
 else
 PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64ltsmip"
 endif
+# case for x86 toolchain that defaults to 64-bit output
+else ifeq ($(BR2_i386):$(call qstrip,$(BR2_KERNEL_ARCH_OVERRIDE)),y:x86_64)
+PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf_i386"
 endif
 
 # The call to backtrace() function fails for ARC, because for some
-- 
2.26.3
