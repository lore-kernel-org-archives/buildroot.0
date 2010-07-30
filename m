From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jul 2010 10:24:08 +0200
Subject: [Buildroot] [git commit master 1/1] cdrkit: fix
	TARGET_CC/TARGET_CFLAGS for CMake
Message-ID: <20100730082546.C8EFB836C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0eae20b7be89bc76225a15c7238ff0c809259ac3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the reorganization of the variables in package/Makefile.in,
TARGET_CC and TARGET_CXX now directly contain the --sysroot= option in
addition to the compiler path. This is due to some ./configure scripts
using just $(TARGET_CC) for some tests instead of $(TARGET_CC)
$(TARGET_CFLAGS).

However, in the case of CMake, this fails as CMake really only wants
the path of the compiler in its CMAKE_C_COMPILER and
CMAKE_CXX_COMPILER variables. So here, we recompute proper values for
CMake by removing the --sysroot option from the compiler variables and
re-adding it to the flags variables.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cdrkit/cdrkit.mk |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index f7e21b0..a0ce9cb 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -11,15 +11,23 @@ else
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
 endif
 
+# CMake doesn't support having the --sysroot option directly in the
+# compiler path, so move this option to the CFLAGS/CXXFLAGS variables.
+CDRKIT_TARGET_CC = $(filter-out --sysroot=%,$(TARGET_CC))
+CDRKIT_TARGET_CXX = $(filter-out --sysroot=%,$(TARGET_CXX))
+CDRKIT_TARGET_CFLAGS = $(filter --sysroot=%,$(TARGET_CC)) $(TARGET_CFLAGS)
+CDRKIT_TARGET_CXXFLAGS = $(filter --sysroot=%,$(TARGET_CXX)) $(TARGET_CXXFLAGS)
+
 define CDRKIT_CONFIGURE_CMDS
  -mkdir $(@D)/build
  (cd $(@D)/build ; \
 	$(HOST_DIR)/usr/bin/cmake .. \
 		-Wno-dev \
 		-DCMAKE_SYSTEM_NAME:STRING="Linux" \
-		-DCMAKE_C_COMPILER:FILEPATH="$(TARGET_CC)" \
-		-DCMAKE_CXX_COMPILER:FILEPATH="$(TARGET_CXX)" \
-		-DCMAKE_C_FLAGS:STRING="$(TARGET_CFLAGS)" \
+		-DCMAKE_C_COMPILER:FILEPATH="$(CDRKIT_TARGET_CC)" \
+		-DCMAKE_CXX_COMPILER:FILEPATH="$(CDRKIT_TARGET_CXX)" \
+		-DCMAKE_C_FLAGS:STRING="$(CDRKIT_TARGET_CFLAGS)" \
+		-DCMAKE_CXX_FLAGS:STRING="$(CDRKIT_TARGET_CXXFLAGS)" \
 		-DCMAKE_EXE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
 		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
 		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
-- 
1.7.1
