From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 22:53:24 +0100
Subject: [Buildroot] [git commit] assimp: fix gcc version condition
Message-ID: <20170227215431.4CE1A81952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35e02aeb7b493d61bbc3e90903337b4964e0213c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 68cebedeb977396f64f5f591f5e93f34fab8e0a8 ("assimp: work around
gcc bug on SuperH"), a work around was added to make the package build
with gcc on SuperH. The condition included a test on the gcc version,
which was mistakenly done on the host gcc version, while a test on the
target gcc version was intended.

Thanks to Peter Korsgaard for spotting the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/assimp/assimp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 298e121..acd3701 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -20,7 +20,7 @@ endif
 # not passed) in gcc versions 5.x or older. The -Os optimization level
 # causes a "unable to find a register to spill in class
 # ???GENERAL_REGS???" error. -O2 works fine.
-ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_HOST_GCC_AT_LEAST_6),y:y:)
+ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:y:)
 ASSIMP_CXXFLAGS += -O2
 endif
 
