From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 18:47:30 +0100
Subject: [Buildroot] [git commit] pkg-cmake: fix host-cmake-package type
Message-ID: <20150125174803.8820480468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3852a3e526b11fade9a9769712a439fb16e11c60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When trying to compile a host-cmake-package type such as host-cdrkit,
an error happens in regards to HOSTCC and HOSTCXX not being found.

  /bin/sh: HOSTCC: command not found
  /bin/sh: HOSTCXX: command not found

This due to the fact that the environment is incorrectly configured by
having the following:

  -DCMAKE_C_COMPILER=""$(HOSTCC)"" -DCMAKE_CXX_COMPILER=""$(HOSTCXX)""

This is due to having too many dollar signs. The fix is to remove the
extra dollar sign.

Also removing the unncessary quotes since the HOSTCC/HOSTCXX will
already contain quotes. This could cause an issue with make as double
quotes are not interpreted by make.

Minor formatting fix too.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-cmake.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 1037513..6c9955d 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -22,13 +22,13 @@
 
 # Set compiler variables.
 ifeq ($(BR2_CCACHE),y)
-CMAKE_HOST_C_COMPILER="$(HOST_DIR)/usr/bin/ccache"
-CMAKE_HOST_CXX_COMPILER="$(HOST_DIR)/usr/bin/ccache"
-CMAKE_HOST_C_COMPILER_ARG1="$(HOSTCC_NOCCACHE)"
-CMAKE_HOST_CXX_COMPILER_ARG1="$(HOSTCXX_NOCCACHE)"
+CMAKE_HOST_C_COMPILER = $(HOST_DIR)/usr/bin/ccache
+CMAKE_HOST_CXX_COMPILER = $(HOST_DIR)/usr/bin/ccache
+CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
+CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
 else
-CMAKE_HOST_C_COMPILER="$$(HOSTCC)"
-CMAKE_HOST_CXX_COMPILER="$$(HOSTCXX)"
+CMAKE_HOST_C_COMPILER = $(HOSTCC)
+CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
 endif
 
 ################################################################################
