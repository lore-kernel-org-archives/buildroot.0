From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 1 Aug 2019 17:35:22 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix find_sysroot
Message-ID: <20190801153317.5D9117FE20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0de9a53a340321de5d51b4092181d157c3b539ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 23c0e97b29a (toolchain-external: anchor sysroot regex with /)
tried to make the find-sysroot work more consistently, especially for
toolchains where the C library is located in a sub-directory, like the
"Realtek mips toolchain".

After that patch, the '/' that was trailing in the returned path got
removed now. This in turn breaks the Codesourcery toolchain.

We fix that by appending the now-missing trailing '/'.

Fixes:
http://autobuild.buildroot.net/results/9284d571668148febce23d96a9c0a97a6b2b43dc

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: ?????? ??? <shawn_chen@realsil.com.cn>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
