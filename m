From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 14:59:32 +0000
Subject: [Buildroot] [PATCH] libsvgtiny: disable -Werror
Message-ID: <1418223572-2456-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc-2.20 includes some changes to the include/features.h file
introduced by this commit:

  https://sourceware.org/git/?p=glibc.git;a=commit;h=ade40b10ff5fa59a318cf55b9d8414b758e8df78

Those changes make libsvgtiny fail because some warnings are thrown and
the build system is using the -Werror option. We disable this to be able
to build it, or otherwise we will see errors like this one:

GPERF: src/colors.gperf
COMPILE: build-Linux-Linux-release-lib-static/src_colors.c
In file included from
/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:25:0,
		 from src/colors.gperf:16:
/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
_DEFAULT_SOURCE" [-Werror=cpp]

and this one:

In file included from src/colors.gperf:18:0:
/home/ldap/vriera/work/mips-buildroots/mips32/output/build/libsvgtiny-12121/src/svgtiny_internal.h:71:0:
error: "strndup" redefined [-Werror]

Fixes:
  http://autobuild.buildroot.net/results/3dd/3dd700405055750262738f867eb5aa08531f5781/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/libsvgtiny/libsvgtiny.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index a2d494e..2c33f79 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -25,4 +25,9 @@ define LIBSVGTINY_INSTALL_TARGET_CMDS
 		$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
+define LIBSVGTINY_DISABLE_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile
+endef
+LIBSVGTINY_POST_CONFIGURE_HOOKS += LIBSVGTINY_DISABLE_WERROR
+
 $(eval $(generic-package))
-- 
1.7.1
