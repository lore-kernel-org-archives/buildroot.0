From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:12:29 +0100
Subject: [Buildroot] [PATCH 08/13] toolchain/helpers: add fortran check
In-Reply-To: <1467040354-39816-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040354-39816-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040354-39816-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/helpers.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 108fdaa..3288c90 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -311,6 +311,21 @@ check_cplusplus = \
 	fi
 
 #
+#
+# Check that the external toolchain supports Fortran
+#
+# $1: cross-gfortran path
+#
+check_fortran = \
+	__CROSS_FC=$(strip $1) ; \
+	printf 'program hello\n\tprint *, "Hello Fortran!\\n"\nend program hello\n' | \
+		$${__CROSS_FC} -x f95 -o /dev/null - ; \
+	if test $$? -ne 0 ; then \
+		echo "Fortran support is selected but is not available in external toolchain" ; \
+		exit 1 ; \
+	fi
+
+#
 # Check that the cross-compiler given in the configuration exists
 #
 # $1: cross-gcc path
-- 
2.7.3
