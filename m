From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 15:47:17 +0200
Subject: [Buildroot] [PATCH] efivar: fix build with old gcc versions
Message-ID: <1466776037-12037-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The efivar build process starts by building one tool for the host,
which is needed for the rest of the build. This tool currently fails
to build with old gcc versions because the gcc.specs used by efivar
specifies -std=gnu11. To address this, this patch:

 - passes 'gcc_flags=' to the host build, so that the custom gcc specs
   are not passed. They are in practice not needed for the build of
   the simple makeguids host utility.

 - passes -std=gnu99 instead of -std=c99 in the build of host
   makeguids, because the source code uses anonymous structs and
   unions, which requires std=gnu99 and not just std=c99

In addition, the build by default assumes that the target toolchain is
LTO capable, and that therefore you can call gcc-ar, gcc-nm and
gcc-ranlib. This fails short when the target toolchain is for example
gcc 4.7. To address this, we explicitly specify AR, NM and RANLIB to
be used, but pass them as make options instead of in the environment,
in order to override the values specified in the package Makefile.

Fixes:

   http://autobuild.buildroot.net/results/fe40c1d139ba8ddeef3dafd5c1818a946f014d7c/

Cc: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efivar/efivar.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 3d37916..de48bc9 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -31,10 +31,11 @@ define EFIVAR_BUILD_CMDS
 	# makeguids is an internal host tool and must be built separately with
 	# $(HOST_CC), otherwise it gets cross-built.
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
-		CFLAGS="$(HOST_CFLAGS) -std=c99" \
-		$(MAKE) -C $(@D)/src makeguids
+		CFLAGS="$(HOST_CFLAGS) -std=gnu99" \
+		$(MAKE) -C $(@D)/src gcc_cflags=  makeguids
 
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) \
+		AR=$(TARGET_AR) NM=$(TARGET_NM) RANLIB=$(TARGET_RANLIB) \
 		$(EFIVAR_MAKE_OPTS) \
 		all
 endef
-- 
2.7.4
