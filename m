From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 07 Jun 2021 15:17:36 -0000
Subject: [Buildroot] [git commit] package/openblas: install static library
 even if BR2_STATIC_LIBS is not set
Message-ID: <20210607144654.5CC0481191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dd9bbda3541043f64f02256fbd43624b0b3d278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openblas has options 'NO_STATIC' and 'NO_SHARED' to steer the installation
of libopenblas.a and libopenblas.so. But this does not impact anything in
the build process, other than copying the respective file to the output
directory.

As openblas is very large (e.g. 3MB on ARM) but applications may only use a
small part of it, such applications may want to link statically with
openblas, even though the global BR2_STATIC_LIBS is not set and not desired.

One approach would have been to introduce options
BR2_PACKAGE_OPENBLAS_BUILD_SHARED_LIB and
BR2_PACKAGE_OPENBLAS_BUILD_STATIC_LIB which could be freely selected
regardless of BR2_STATIC_LIBS / BR2_SHARED_LIBS.

But since the installation of a static library does not have any negative
impact except for some disk space on the host system (.a files are removed
from the target in target-finalize anyway), change the installation rules to
install the static library unconditionally.

NO_SHARED is still passed for static-libs-only systems, because the
dynamic library would unnecessarily take up target disk space for such
systems.

Users that only need the static library would still need to remove the
shared library from a post-build script to actually save space.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openblas/openblas.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 21d05cf30d..60b9d9b15b 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -42,10 +42,10 @@ endif
 OPENBLAS_MAKE_OPTS += USE_OPENMP=0
 
 # Static-only/Shared-only toggle
+# Note: static library is always generated so that applications can link
+# statically for size reduction, even if BR2_STATIC_LIBS is not set.
 ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
-else ifeq ($(BR2_SHARED_LIBS),y)
-OPENBLAS_MAKE_OPTS += NO_STATIC=1
 endif
 
 # binutils version <= 2.23.2 has a bug
