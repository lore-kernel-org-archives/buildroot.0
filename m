From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:27:50 +0200
Subject: [Buildroot] [git commit] package/armadillo: fix build when host has
 hdf5
Message-ID: <20200420211422.80C6B8F536@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2c0f234ed44d01ef5fc8a21e9d67f619e084ad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When host computer has hdf5 library installed, armadillo fails to build with:

    [...]
    aarch64-buildroot-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/hdf5/serial'
    make[3]: *** [CMakeFiles/armadillo.dir/build.make:63: CMakeFiles/armadillo.dir/src/wrapper1.cpp.o] Error 1
    aarch64-buildroot-linux-gnu-g++: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/hdf5/serial'
    [...]

This issue seems known and is mentionned in a message, displayed at detection step:

    [...]
    -- *** If use of HDF5 is causing problems,
    -- *** rerun cmake with HDF5 detection disabled:
    -- *** cmake -D DETECT_HDF5=false .
    --
    [...]

nce hdf5 in not supported by buildroot, this patch force disabling this
detection.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998 at free.fr: fix pacakge name in title]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/armadillo/armadillo.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index d9a28e9878..f693d8c946 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -12,4 +12,6 @@ ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
+ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
+
 $(eval $(cmake-package))
