From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:46 +0200
Subject: [Buildroot] [PATCH v3 10/14] toolchain/toolchain-external: add
	libgfortran and libquadmath to the TOOLCHAIN_EXTERNAL_LIBS list
In-Reply-To: <20160703134750.7516-1-s.martin49@gmail.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
Message-ID: <20160703134750.7516-11-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- s/USR_LIB_EXTERNAL_LIBS/TOOLCHAIN_EXTERNAL_LIBS/
- only install libquadmath for x86{,_64} target (not built on other
  arch.)

changes v2->v3:
- s/BR2_I386/BR2_i386/ (Thomas P.)
- use BR2_TOOLCHAIN_HAS_LIBQUADMATH to drive the libquadmath
  installation
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 4240a9b..d6a3d0e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -90,6 +90,14 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
+TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
+endif
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
-- 
2.9.0
