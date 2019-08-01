From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  1 Aug 2019 16:53:36 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix find_sysroot
Message-ID: <20190801145336.15199-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 23c0e97b29a (toolchain-external: anchor sysroot regex with /)
tried to make the find-sysroot work more consistently, especially for
toolchains where the C library is located in a sub-directory, like the
"Realtek mips toolchain".

After that patch, the '/' that was trailing in the returned path got
removed now. This in turn breaks the Codesourcery toolchain.

We fix that by appending the now-missing trailing '/'.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: ?? ? <shawn_chen@realsil.com.cn>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index e618aa7a09..894e76ee32 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -331,7 +331,7 @@ endef
 #
 # And variations on these.
 define toolchain_find_sysroot
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:/(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:/(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a:/:')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
-- 
2.20.1
