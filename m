From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Oct 2012 23:50:26 +0200
Subject: [Buildroot] [git commit] Makefile.in: add CPPFLAGS support
Message-ID: <20121010215221.E3D8899826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdac1ad29ae4e384e2af88b7b485064337bf37f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 30a542a..c042984 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -85,14 +85,16 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING=-g3
 endif
 
-TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+TARGET_CPPFLAGS =
 
 ifeq ($(BR2_LARGEFILE),y)
-TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
-TARGET_CXXFLAGS=$(TARGET_CFLAGS)
-TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
+TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+
+TARGET_CXXFLAGS  = $(TARGET_CFLAGS)
+TARGET_LDFLAGS   = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
@@ -149,9 +151,10 @@ FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 SED:=$(shell which sed || type -p sed) -i -e
 
+HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
-HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
-HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
+HOST_CFLAGS   += $(HOST_CPPFLAGS)
+HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 
@@ -180,12 +183,14 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		CXX_FOR_BUILD="$(HOSTCXX)" \
 		FC_FOR_BUILD="$(HOSTFC)" \
 		LD_FOR_BUILD="$(HOSTLD)" \
+		CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
 		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
 		CXXFLAGS_FOR_BUILD="$(HOST_CXXFLAGS)" \
 		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
 		FCFLAGS_FOR_BUILD="$(HOST_FCFLAGS)" \
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
+		CPPFLAGS="$(TARGET_CPPFLAGS)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		CXXFLAGS="$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -206,6 +211,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		GCC="$(HOSTCC)" \
 		CXX="$(HOSTCXX)" \
 		CPP="$(HOSTCPP)" \
+		CPPFLAGS="$(HOST_CPPFLAGS)" \
 		CFLAGS="$(HOST_CFLAGS)" \
 		CXXFLAGS="$(HOST_CXXFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
