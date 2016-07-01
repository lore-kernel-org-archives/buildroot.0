From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:16 +0200
Subject: [Buildroot] [PATCH v2 11/15] toolchain/toolchain-external: add
	libgfortran and libquadmath to the TOOLCHAIN_EXTERNAL_LIBS list
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-12-s.martin49@gmail.com>
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
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 53a7c7a..9629c46 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -90,6 +90,14 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+TOOLCHAIN_EXTERNAL_LIBS += libgfortran.so.*
+# fortran needs quadmath on x86 and x86_64
+ifeq ($(BR2_I386)$(BR2_x86_64),y)
+TOOLCHAIN_EXTERNAL_LIBS += libquadmath.so*
+endif
+endif
+
 TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
-- 
2.9.0
