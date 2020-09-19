From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:10:27 +0200
Subject: [Buildroot] [git commit] package/libpfm4: disable examples
Message-ID: <20200919190316.E7EBA8AB9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae8cfbd4e5f6a5bf5c1c6c71ebf082462eb4f349
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not build examples to avoid a build failure on rtop example which
depends on ncurses and has been added in version 4.11.0 with
https://sourceforge.net/p/perfmon2/libpfm4/ci/7d1ec562ddbb2af2d6b7af8cec78b03213a3e4ce

/tmp/instance-0/output-1/host/bin/arm-linux-gcc   -I. -I/tmp/instance-0/output-1/build/libpfm4-4.11.0/perf_examples/../include -DCONFIG_PFMLIB_DEBUG -DCONFIG_PFMLIB_OS_LINUX -I. -D_GNU_SOURCE -pthread -o rtop  rtop.o perf_util.o /tmp/instance-0/output-1/build/libpfm4-4.11.0/perf_examples/../lib/libpfm.a  -lpthread -lncurses -ltinfo -lm
/tmp/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/9.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find -ltinfo

Fixes:
 - http://autobuild.buildroot.org/results/8ad23a82bcf32cd22256f9984a8f4cfa45951eee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpfm4/libpfm4.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 3692ebabe7..2144766d96 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -14,7 +14,8 @@ LIBPFM4_INSTALL_STAGING = YES
 LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) \
 	CC="$(TARGET_CC)" LDCONFIG=true \
 	CONFIG_PFMLIB_SHARED=$(if $(BR2_STATIC_LIBS),n,y) \
-	DBG=
+	DBG= \
+	EXAMPLE_DIRS=
 
 define LIBPFM4_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
