From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:07 +0200
Subject: [Buildroot] [PATCH v2 02/15] package/gcc: wrap gfortran
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gfortran supports all options supported by gcc, so it can and should be called
via the toolchain wrapper.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

---
changes v1->v2:
- none
---
 package/gcc/gcc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index e981940..ff92bbc 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -270,6 +270,8 @@ endif # BR2_CCACHE
 # used. However, we should not add the toolchain wrapper for them, and they
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
+# According to gfortran manpage, it supports all options supported by gcc, so
+# add gfortran to the list of the program called via the Buildroot wrapper.
 # Avoid that a .br_real is symlinked a second time.
 # Also create <arch>-linux-<tool> symlinks.
 define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
@@ -281,7 +283,7 @@ define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 		*-ar|*-ranlib|*-nm) \
 			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp) \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
 			rm -f $$i.br_real; \
 			mv $$i $$i.br_real; \
 			ln -sf toolchain-wrapper $$i; \
-- 
2.9.0
