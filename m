From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 23 Jan 2015 12:10:22 -0600
Subject: [Buildroot] [PATCH 1/1] pkg-cmake: fix host-cmake-package type
Message-ID: <1422036622-54535-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
CC: Yann E. MORIN <yann.morin.1998@free.fr>
---
v1 -> v2
 - Implemented spacing and quote concerns from Yann E. MORIN and
   Samuel Marin.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/pkg-cmake.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index 1037513..e738ba9 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -22,13 +22,13 @@
 
 # Set compiler variables.
 ifeq ($(BR2_CCACHE),y)
-CMAKE_HOST_C_COMPILER="$(HOST_DIR)/usr/bin/ccache"
-CMAKE_HOST_CXX_COMPILER="$(HOST_DIR)/usr/bin/ccache"
-CMAKE_HOST_C_COMPILER_ARG1="$(HOSTCC_NOCCACHE)"
-CMAKE_HOST_CXX_COMPILER_ARG1="$(HOSTCXX_NOCCACHE)"
+CMAKE_HOST_C_COMPILER = "$(HOST_DIR)/usr/bin/ccache"
+CMAKE_HOST_CXX_COMPILER = "$(HOST_DIR)/usr/bin/ccache"
+CMAKE_HOST_C_COMPILER_ARG1 = $(HOSTCC_NOCCACHE)
+CMAKE_HOST_CXX_COMPILER_ARG1 = $(HOSTCXX_NOCCACHE)
 else
-CMAKE_HOST_C_COMPILER="$$(HOSTCC)"
-CMAKE_HOST_CXX_COMPILER="$$(HOSTCXX)"
+CMAKE_HOST_C_COMPILER = $(HOSTCC)
+CMAKE_HOST_CXX_COMPILER = $(HOSTCXX)
 endif
 
 ################################################################################
-- 
1.9.1
