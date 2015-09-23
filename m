From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Sep 2015 23:10:30 +0200
Subject: [Buildroot] [git commit] micropython: fix build for MIPS64 n32
Message-ID: <20150923211119.53FDE819FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9119c1e6586d0719cec0f39488c22f136da318f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch applies an upstream patch to fix a compile error like this
one:

modffi.c: In function 'ffifunc_call':
modffi.c:358:25: error: cast from pointer to integer of different size
[-Werror=pointer-to-int-cast]
             values[i] = (ffi_arg)a;

This error can be highlighted when building micropython for MIPS64 n32
because ffi_arg is 64-bit wide and the pointers on MIPS64 n32 are 32-bit
wide, so it's trying to case an integer to a pointer (or vice versa) of
a different size. We should cast first the pointer (or the integer) to a
pointer sized integer (intptr_t) to fix that problem.

This patch was merged upstream as a result of this pull request:

  https://github.com/micropython/micropython/pull/1471

Fixes:

  http://autobuild.buildroot.net/results/e22/e2253de3f96e9a53e75b4cecaf56c1df2950803f/

[Thomas: use a single assignement for MICROPYTHON_PATCH.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/micropython.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index f2ad5bf..7ae88a0 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,7 +9,9 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
-MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch
+MICROPYTHON_PATCH = \
+	https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch \
+	https://github.com/micropython/micropython/commit/587914169cc6ff7f0513bd14c42dcbb275bf77bd.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
