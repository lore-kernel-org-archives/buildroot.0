From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:14 +0200
Subject: [Buildroot] [PATCH v2 09/15] toolchain/helpers: add fortran check
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-10-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none
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
2.9.0
