From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:00 +0200
Subject: [Buildroot] [PATCH 07/20] Solve the host tools relying on host
	libraries problem
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4fdecac9d692b8d6f071ba6ad938b6ad68b675fd.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We build host tools installed in $(HOST_DIR)/usr/bin, and some of them
rely on host libraries in $(HOST_DIR)/usr/lib. So when these host
tools are executed, they need to find the host libraries, which are
not installed in a default location.

In c1b6242fdcf2cff7ebf09fec4cc1be58963e8427 we tried to use
LD_LIBRARY_PATH when building target packages to solve this
problem. Unfortunately, LD_LIBRARY_PATH is not only used to find
libraries at run-time, but also at compile time. So it leads the build
of some packages, such as icu, to fail.

Therefore, in 0d1830b07db4ebfd14e77a258de6fb391e57e960, we reverted
the LD_LIBRARY_PATH idea.

The other option to solve this problem was to hardcode a RPATH value
in the host binaries that would reference the location of host
libraries. We added this -Wl,-rpath option to HOST_CFLAGS in
6b939d40f6a29a43277566adc9d4312d49cb3abf. Unfortunately, this caused
problems when building binutils, as reported in bug 1789 so this
change was reverted in e1a7d916e9eeaa215551740de40c055130d6c073.

Then, we tried to use -Wl,-rpath in HOST_LDFLAGS, but it was causing
problems with fakeroot not recognizing 'ld' as the GNU linker, since
the -Wl,-rpath cannot be understood by 'ld' directly, only by 'gcc'.

This commit is a new attempt at using HOST_LDFLAGS, but in this case
we modified the definition of HOST_LD to *not* contain
HOST_LDFLAGS. LDFLAGS are being set separatly. It solved the fakeroot
issue and was tested against nearly 300 packages of Buildroot.

For more details on this story, see
 http://lists.busybox.net/pipermail/buildroot/2010-June/035580.html
 http://lists.busybox.net/pipermail/buildroot/2010-June/035581.html
 http://lists.busybox.net/pipermail/buildroot/2010-June/035586.html
 http://lists.busybox.net/pipermail/buildroot/2010-June/035609.html
 https://bugs.busybox.net/show_bug.cgi?id=1789

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 5147dc8..8a04c37 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -167,7 +167,7 @@ BISON:=$(shell which bison || type -p bison)
 
 HOST_CFLAGS   += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
 HOST_CXXFLAGS += -I$(HOST_DIR)/include -I$(HOST_DIR)/usr/include
-HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib
+HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
@@ -223,7 +223,7 @@ TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
-		LD="$(HOSTLD) $(HOST_LDFLAGS)" \
+		LD="$(HOSTLD)" \
 		NM="$(HOSTNM)" \
 		CC="$(HOSTCC) $(HOST_CFLAGS)" \
 		GCC="$(HOSTCC) $(HOST_CFLAGS)" \
@@ -255,6 +255,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		ORIGINAL_LD_FOR_TARGET="$(TARGET_LD)" \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
 		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-- 
1.7.0.4
