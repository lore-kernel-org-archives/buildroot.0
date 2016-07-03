From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:44 +0200
Subject: [Buildroot] [PATCH v3 08/14] toolchain/helpers: add fortran check
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-9-s.martin49@gmail.com>
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

changes v2->v3:
- use real files as input/output in the test (Thomas P.)
---
 toolchain/helpers.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 108fdaa..74ec944 100644
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
+	__o=$(BUILD_DIR)/.br-toolchain-test-fortran.tmp.f.o ; \
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
-- 
2.9.0
