From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 10:33:57 +0200
Subject: [Buildroot] [git commit] openmpi: add Fortran support for MIPS64
Message-ID: <20160708084715.52EA682261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e80a2f300bdfd78b45048c10ad0cbddf5eedea05
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
[Thomas: use a config cache.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openmpi/openmpi-mips64-fortran.cache | 60 ++++++++++++++++++++++++++++
 package/openmpi/openmpi.mk                   |  2 +
 2 files changed, 62 insertions(+)

diff --git a/package/openmpi/openmpi-mips64-fortran.cache b/package/openmpi/openmpi-mips64-fortran.cache
new file mode 100644
index 0000000..7f02099
--- /dev/null
+++ b/package/openmpi/openmpi-mips64-fortran.cache
@@ -0,0 +1,60 @@
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
+ompi_cv_fortran_sizeof_INTEGERp16=16
+ompi_cv_fortran_sizeof_REAL=4
+ompi_cv_fortran_sizeof_REALp4=4
+ompi_cv_fortran_sizeof_REALp8=8
+ompi_cv_fortran_sizeof_REALp16=16
+ompi_cv_fortran_sizeof_DOUBLE_PRECISION=8
+ompi_cv_fortran_sizeof_COMPLEX=8
+ompi_cv_fortran_sizeof_COMPLEXp8=8
+ompi_cv_fortran_sizeof_COMPLEXp16=16
+ompi_cv_fortran_sizeof_COMPLEXp32=32
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
+ompi_cv_fortran_alignment_REALp16=16
+ompi_cv_fortran_alignment_DOUBLE_PRECISION=8
+ompi_cv_fortran_alignment_COMPLEX=4
+ompi_cv_fortran_alignment_COMPLEXp8=4
+ompi_cv_fortran_alignment_COMPLEXp16=8
+ompi_cv_fortran_alignment_COMPLEXp32=16
+ompi_cv_fortran_alignment_DOUBLE_COMPLEX=8
+ompi_cv_fortran_kind_value_C_SIGNED_CHAR=1
+ompi_cv_fortran_kind_value_C_SHORT=2
+ompi_cv_fortran_kind_value_C_INT=4
+ompi_cv_fortran_kind_value_C_INT16_T=2
+ompi_cv_fortran_kind_value_C_INT32_T=4
+ompi_cv_fortran_kind_value_C_INT64_T=8
+ompi_cv_fortran_kind_value_C_LONG_LONG=8
+ompi_cv_fortran_kind_value_C_LONG_DOUBLE=16
+ompi_cv_fortran_kind_value_C_LONG_DOUBLE_COMPLEX=16
+ompi_cv_fortran_kind_value_C_FLOAT=4
+ompi_cv_fortran_kind_value_C_FLOAT_COMPLEX=4
+ompi_cv_fortran_kind_value_C_DOUBLE=8
+ompi_cv_fortran_kind_value_C_DOUBLE_COMPLEX=8
+ompi_cv_fortran_kind_value_0=0
+ompi_cv_real16_c_equiv=yes
+ompi_cv_fortran_true_value=1
+ompi_cv_fortran_sizeof_type_test_mpi_handle_=4
diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index 379ce57..c5b8a01 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -20,6 +20,8 @@ OPENMPI_CONF_OPTS = --disable-vt
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
 ifeq ($(BR2_mips)$(BR2_mipsel),y)
 OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips32-fortran.cache
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips64-fortran.cache
 endif
 endif
 
