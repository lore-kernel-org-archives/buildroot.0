From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 7 Jul 2016 16:47:33 +0100
Subject: [Buildroot] [PATCH v2 1/2] openmpi: add Fortran support for MIPS32
Message-ID: <1467906454-60557-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We include a file containing cached values for Fortran tests that are
performed at the configure step. These tests fail when cross-compiling
and this is known upstream. See:

https://www.open-mpi.org/community/lists/users/2013/01/21186.php

In that thread the upstream maintainer admits that "cross compiling
OpenMPI is a known issue" and the way to workaround this is to
"pre-populate configure's answers to the Fortran tests (so that it
doesn't actually have to run anything)"

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Nothing.

 package/openmpi/openmpi.mk                         | 12 ++++-
 .../openmpi_mips32_fortran_cached_values.mk        | 51 ++++++++++++++++++++++
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 package/openmpi/openmpi_mips32_fortran_cached_values.mk

diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 8871eaf..47f42be 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -13,8 +13,16 @@ OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
 OPENMPI_CONF_OPTS = --disable-vt
 
-# Disable fortran by default until we add BR2_TOOLCHAIN_HAS_FORTRAN
-# hidden symbol to our toolchain infrastructure
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+
+# Enable Fortran for MIPS32
+ifeq ($(BR2_mips)$(BR2_mipsel),y)
+OPENMPI_CONF_OPTS += --enable-mpi-fortran=yes
+include $(TOPDIR)/package/openmpi/openmpi_mips32_fortran_cached_values.mk
+endif
+
+else
 OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
+endif
 
 $(eval $(autotools-package))
diff --git a/package/openmpi/openmpi_mips32_fortran_cached_values.mk b/package/openmpi/openmpi_mips32_fortran_cached_values.mk
new file mode 100644
index 0000000..4962d88
--- /dev/null
+++ b/package/openmpi/openmpi_mips32_fortran_cached_values.mk
@@ -0,0 +1,51 @@
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_CHARACTER=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICAL=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICALp1=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICALp2=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICALp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_LOGICALp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_INTEGER=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_INTEGERp1=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_INTEGERp2=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_INTEGERp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_INTEGERp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REAL=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REALp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REALp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_DOUBLE_PRECISION=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEX=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEXp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEXp16=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_DOUBLE_COMPLEX=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_CHARACTER=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_LOGICAL=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_LOGICALp1=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_LOGICALp2=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_LOGICALp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_LOGICALp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_INTEGER=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_INTEGERp1=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_INTEGERp2=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_INTEGERp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_INTEGERp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_REAL=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_REALp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_REALp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_DOUBLE_PRECISION=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEX=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEXp8=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEXp16=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_DOUBLE_COMPLEX=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_SIGNED_CHAR=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_SHORT=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT16_T=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT32_T=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT64_T=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_LONG_LONG=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_FLOAT=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_FLOAT_COMPLEX=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_DOUBLE=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_true_value=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
-- 
2.7.3
