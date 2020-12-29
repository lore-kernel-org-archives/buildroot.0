From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:03:17 +0100
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains: do
 not assume RPC for glibc toolchains
Message-ID: <20201229204554.8D58883A4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cba5463deb263e1581895a58fef089e8ec02380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic in gen-bootlin-toolchains was assuming all glibc toolchains
have RPC support, which is no longer true since glibc 2.32 has dropped
RPC support.

It turns out that gen-bootlin-toolchains already had some proper logic
that selects BR2_TOOLCHAIN_HAS_NATIVE_RPC depending on the presence of
BR2_TOOLCHAIN_EXTERNAL_INET_RPC in the toolchain fragment. As such
toolchain fragments have been fixed in https://toolchains.bootlin.com,
we can now rely on this to properly decide if the toolchain has RPC
support or not.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index fce75c51c2..fc9d57f5a4 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -263,8 +263,6 @@ class Toolchain:
                 # glibc doesn't support static only configuration
                 depends.append("!BR2_STATIC_LIBS")
                 selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
-                # all glibc toolchains have RPC support
-                selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
             elif frag.startswith("BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL"):
                 # musl needs mmu support
                 depends.append("BR2_USE_MMU")
