From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Oct 2016 16:33:42 +0100
Subject: [Buildroot] [PATCH] toolchain-external.mk: fix ARCH_SUBDIR for
	side-by-side sysroot toolchains
Message-ID: <20161027153342.27718-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARCH_SUBDIR is computed based on the value of ARCH_SYSROOT_DIR and
SYSROOT_DIR. For nested toolchains ARCH_SYSROOT_DIR is a subdir of
SYSROOT_DIR, so a sed command like this one...

  sed -r -e "s:^${SYSROOT_DIR}(.*)/$:\1:"

...basically removes the leading SYSROOT_DIR part from ARCH_SYSROOT_DIR.

But, for side-by-side sysroot toolchains ARCH_SYSROOT_DIR and
SYSROOT_DIR are at the same level, so the above sed command doesn't
make any effect. This patch detects that situation and uses an
appropriate sed command for it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f7c6a19..a25c102 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -665,7 +665,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
 	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	if [ "`dirname $${ARCH_SYSROOT_DIR}`" = "`dirname $${SYSROOT_DIR}`" ] ; then \
+		SYSROOT_DIR_DIRNAME=`dirname $${SYSROOT_DIR}`/ ; \
+		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR_DIRNAME}(.*)/$$:\1:"` ; \
+	else \
+		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
-- 
2.10.1
