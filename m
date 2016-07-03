From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 16:58:11 +0200
Subject: [Buildroot] [git commit] toolchain/helpers: add fortran check
Message-ID: <20160703145820.BC99581E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26db83c8a03bd7199902a9bcb62a0b63537c0048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[Thomas: remove extension for the generated temporary file, since it's
really an executable, not an object file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 108fdaa..3991bc1 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -311,6 +311,24 @@ check_cplusplus = \
 	fi
 
 #
+#
+# Check that the external toolchain supports Fortran
+#
+# $1: cross-gfortran path
+#
+check_fortran = \
+	__CROSS_FC=$(strip $1) ; \
+	__o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp ; \
+	printf 'program hello\n\tprint *, "Hello Fortran!\\n"\nend program hello\n' | \
+	$${__CROSS_FC} -x f95 -o $${__o} - ; \
+	if test $$? -ne 0 ; then \
+		rm -f $${__o}* ; \
+		echo "Fortran support is selected but is not available in external toolchain" ; \
+		exit 1 ; \
+	fi ; \
+	rm -f $${__o}* \
+
+#
 # Check that the cross-compiler given in the configuration exists
 #
 # $1: cross-gcc path
