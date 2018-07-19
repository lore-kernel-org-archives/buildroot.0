From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:43:17 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] pixiewps: fix static
 linking with uclibc-ng
Message-ID: <20180719094633.EC3537FFFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a6e14b4be0d1950a22a2bc73edb5759361858c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes following linking error with uClibc-ng:
/home/peko/autobuild/instance-0/output/host/lib/gcc/powerpc-buildroot-linux-uclibc/7.3.0/libgcc.a(unwind-dw2-fde-dip.o):
In function `_Unwind_Find_FDE':
/home/peko/autobuild/instance-0/output/build/host-gcc-final-7.3.0/build/powerpc-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde-dip.c:469:
undefined reference to `dl_iterate_phdr'
collect2: error: ld returned 1 exit status

Since uClibc-ng 1.0.18 a circular dependency between libc and libgcc
exist, when static linking is used. It can be resolved by the compiler
when -static is correctly passed in the linking step.

So use TARGET_CONFIGURE_OPTS to pass CC as well as LDFLAGS to make

Fixes:
 - http://autobuild.buildroot.net/results/d9f0311538c8db1196839e36af3f6ef4e403be2b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b28d859c0655cb95ddb194bf244c213fad03eb9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixiewps/pixiewps.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pixiewps/pixiewps.mk b/package/pixiewps/pixiewps.mk
index 95a253ab83..1f84bbeb34 100644
--- a/package/pixiewps/pixiewps.mk
+++ b/package/pixiewps/pixiewps.mk
@@ -10,7 +10,7 @@ PIXIEWPS_LICENSE = GPL-3.0+
 PIXIEWPS_LICENSE_FILES = LICENSE.md
 
 define PIXIEWPS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define PIXIEWPS_INSTALL_TARGET_CMDS
