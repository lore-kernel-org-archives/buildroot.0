From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:28:49 +0200
Subject: [Buildroot] [git commit] toolchain-external.mk: fix ARCH_SUBDIR
	calculation
Message-ID: <20161028123525.5711E81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2da85c396ba6aad88a698ade4b0ccd8c6c9e8e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARCH_SUBDIR is computed based on the value of ARCH_SYSROOT_DIR and
SYSROOT_DIR. For nested toolchains ARCH_SYSROOT_DIR is a subdir of
SYSROOT_DIR, so a sed command like this one...

  sed -r -e "s:^${SYSROOT_DIR}(.*)/$:\1:"

...basically removes the leading SYSROOT_DIR part from ARCH_SYSROOT_DIR.

But, for side-by-side sysroot toolchains ARCH_SYSROOT_DIR and
SYSROOT_DIR are at the same level, so the above sed command doesn't
make any effect.

This patch therefore improves the calculation of ARCH_SUBDIR to
clearly handle the three possible cases:

 - There is a single sysroot, or the selected architecture sysroot is
   the main one (i.e SYSROOT_DIR == ARCH_SYSROOT_DIR). In this case,
   ARCH_SUBDIR is empty.

 - There are side-by-side sysroots, such as
   SYSROOT_DIR=.../sysroot/mips-r2-hard/ and
   ARCH_SYSROOT_DIR=.../sysroot/mipsel-r2-hard/.

 - The arch-sysroot is nested, such as SYSROOT_DIR=.../sysroot and
   ARCH_SYSROOT_DIR=.../sysroot/armv4t/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas: improve the logic to handle the SYSROOT_DIR==ARCH_SYSROOT_DIR
case.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f7c6a19..b7a36be 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -665,7 +665,14 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
 	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	if [ "$${SYSROOT_DIR}" == "$${ARCH_SYSROOT_DIR}" ] ; then \
+		ARCH_SUBDIR="" ; \
+	elif [ "`dirname $${ARCH_SYSROOT_DIR}`" = "`dirname $${SYSROOT_DIR}`" ] ; then \
+		SYSROOT_DIR_DIRNAME=`dirname $${SYSROOT_DIR}`/ ; \
+		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR_DIRNAME}(.*)/$$:\1:"` ; \
+	else \
+		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
