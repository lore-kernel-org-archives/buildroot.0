From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 7 Jul 2016 16:39:19 +0100
Subject: [Buildroot] [PATCH 2/2] openmpi: add support for MIPS64
In-Reply-To: <1467905959-60052-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467905959-60052-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467905959-60052-2-git-send-email-Vincent.Riera@imgtec.com>
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

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openmpi/openmpi.mk                         |  4 ++
 .../openmpi_mips64_fortran_cached_values.mk        | 60 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 package/openmpi/openmpi_mips64_fortran_cached_values.mk

diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 47f42be..a2e79aa 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -19,6 +19,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
 ifeq ($(BR2_mips)$(BR2_mipsel),y)
 OPENMPI_CONF_OPTS += --enable-mpi-fortran=yes
 include $(TOPDIR)/package/openmpi/openmpi_mips32_fortran_cached_values.mk
+# Enable Fortran for MIPS64
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+OPENMPI_CONF_OPTS += --enable-mpi-fortran=yes
+include $(TOPDIR)/package/openmpi/openmpi_mips64_fortran_cached_values.mk
 endif
 
 else
diff --git a/package/openmpi/openmpi_mips64_fortran_cached_values.mk b/package/openmpi/openmpi_mips64_fortran_cached_values.mk
new file mode 100644
index 0000000..d0070b3
--- /dev/null
+++ b/package/openmpi/openmpi_mips64_fortran_cached_values.mk
@@ -0,0 +1,60 @@
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
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_INTEGERp16=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REAL=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REALp4=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REALp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_REALp16=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_DOUBLE_PRECISION=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEX=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEXp8=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEXp16=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_COMPLEXp32=32
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
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_REALp16=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_DOUBLE_PRECISION=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEX=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEXp8=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEXp16=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_COMPLEXp32=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_alignment_DOUBLE_COMPLEX=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_SIGNED_CHAR=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_SHORT=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT16_T=2
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT32_T=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_INT64_T=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_LONG_LONG=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_LONG_DOUBLE=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_LONG_DOUBLE_COMPLEX=16
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_FLOAT=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_FLOAT_COMPLEX=4
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_DOUBLE=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
+OPENMPI_CONF_ENV += ompi_cv_fortran_kind_value_0=0
+OPENMPI_CONF_ENV += ompi_cv_real16_c_equiv=yes
+OPENMPI_CONF_ENV += ompi_cv_fortran_true_value=1
+OPENMPI_CONF_ENV += ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
-- 
2.7.3
