From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 10:31:59 +0200
Subject: [Buildroot] [git commit] openmpi: add Fortran support for MIPS32
Message-ID: <20160708084715.4241782270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc8e222d01c82ed0ecee27929c520a09a841482b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We include a file containing cached values for Fortran tests that are
performed at the configure step. These tests fail when cross-compiling
and this is known upstream. See:

https://www.open-mpi.org/community/lists/users/2013/01/21186.php

In that thread the upstream maintainer admits that "cross compiling
OpenMPI is a known issue" and the way to workaround this is to
"pre-populate configure's answers to the Fortran tests (so that it
doesn't actually have to run anything)"

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas: use the config cache mechanism to preseed the cache variables.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openmpi/openmpi-mips32-fortran.cache | 51 ++++++++++++++++++++++++++++
 package/openmpi/openmpi.mk                   | 23 +++++++++++--
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/package/openmpi/openmpi-mips32-fortran.cache b/package/openmpi/openmpi-mips32-fortran.cache
new file mode 100644
index 0000000..473f73a
--- /dev/null
+++ b/package/openmpi/openmpi-mips32-fortran.cache
@@ -0,0 +1,51 @@
+ompi_cv_fortran_sizeof_CHARACTER=1
+ompi_cv_fortran_sizeof_LOGICAL=4
+ompi_cv_fortran_sizeof_LOGICALp1=1
+ompi_cv_fortran_sizeof_LOGICALp2=2
+ompi_cv_fortran_sizeof_LOGICALp4=4
+ompi_cv_fortran_sizeof_LOGICALp8=8
+ompi_cv_fortran_sizeof_INTEGER=4
+ompi_cv_fortran_sizeof_INTEGERp1=1
+ompi_cv_fortran_sizeof_INTEGERp2=2
+ompi_cv_fortran_sizeof_INTEGERp4=4
+ompi_cv_fortran_sizeof_INTEGERp8=8
+ompi_cv_fortran_sizeof_REAL=4
+ompi_cv_fortran_sizeof_REALp4=4
+ompi_cv_fortran_sizeof_REALp8=8
+ompi_cv_fortran_sizeof_DOUBLE_PRECISION=8
+ompi_cv_fortran_sizeof_COMPLEX=8
+ompi_cv_fortran_sizeof_COMPLEXp8=8
+ompi_cv_fortran_sizeof_COMPLEXp16=16
+ompi_cv_fortran_sizeof_DOUBLE_COMPLEX=16
+ompi_cv_fortran_alignment_CHARACTER=1
+ompi_cv_fortran_alignment_LOGICAL=4
+ompi_cv_fortran_alignment_LOGICALp1=1
+ompi_cv_fortran_alignment_LOGICALp2=2
+ompi_cv_fortran_alignment_LOGICALp4=4
+ompi_cv_fortran_alignment_LOGICALp8=8
+ompi_cv_fortran_alignment_INTEGER=4
+ompi_cv_fortran_alignment_INTEGERp1=1
+ompi_cv_fortran_alignment_INTEGERp2=2
+ompi_cv_fortran_alignment_INTEGERp4=4
+ompi_cv_fortran_alignment_INTEGERp8=8
+ompi_cv_fortran_alignment_REAL=4
+ompi_cv_fortran_alignment_REALp4=4
+ompi_cv_fortran_alignment_REALp8=8
+ompi_cv_fortran_alignment_DOUBLE_PRECISION=8
+ompi_cv_fortran_alignment_COMPLEX=4
+ompi_cv_fortran_alignment_COMPLEXp8=4
+ompi_cv_fortran_alignment_COMPLEXp16=8
+ompi_cv_fortran_alignment_DOUBLE_COMPLEX=8
+ompi_cv_fortran_kind_value_C_SIGNED_CHAR=1
+ompi_cv_fortran_kind_value_C_SHORT=2
+ompi_cv_fortran_kind_value_C_INT=4
+ompi_cv_fortran_kind_value_C_INT16_T=2
+ompi_cv_fortran_kind_value_C_INT32_T=4
+ompi_cv_fortran_kind_value_C_INT64_T=8
+ompi_cv_fortran_kind_value_C_LONG_LONG=8
+ompi_cv_fortran_kind_value_C_FLOAT=4
+ompi_cv_fortran_kind_value_C_FLOAT_COMPLEX=4
+ompi_cv_fortran_kind_value_C_DOUBLE=8
+ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
+ompi_cv_fortran_true_value=1
+ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 8871eaf..379ce57 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -13,8 +13,27 @@ OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
 OPENMPI_CONF_OPTS = --disable-vt
 
-# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
-# hidden symbol to our toolchain infrastructure
+# Enabling Fortran support requires pre-seeding the configure script
+# with various values that cannot be guessed, so we provide cache
+# files for various architectures.
+
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+ifeq ($(BR2_mips)$(BR2_mipsel),y)
+OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips32-fortran.cache
+endif
+endif
+
+ifneq ($(OPENMPI_FORTRAN_CONF_CACHE),)
+define OPENMPI_COPY_FORTRAN_CACHE
+	cp $(OPENMPI_FORTRAN_CONF_CACHE) $(@D)/openmpi-config.cache
+endef
+
+OPENMPI_POST_PATCH_HOOKS += OPENMPI_COPY_FORTRAN_CACHE
+OPENMPI_CONF_OPTS += \
+	--enable-mpi-fortran=yes \
+	--cache-file=$(@D)/openmpi-config.cache
+else
 OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
+endif
 
 $(eval $(autotools-package))
