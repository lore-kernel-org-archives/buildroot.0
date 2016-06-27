From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Jun 2016 16:11:17 +0100
Subject: [Buildroot] [PATCH 03/13] package/gcc: wrap gfortran
In-Reply-To: <1467040287-39390-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467040287-39390-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1467040287-39390-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

gfortran supports all options supported by gcc, so it can and should be called
via the toolchain wrapper.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gcc/gcc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index cffdb19..8bc34ea 100644
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
2.7.3
