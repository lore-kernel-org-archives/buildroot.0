From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 22:55:05 +0200
Subject: [Buildroot] [git commit] package/gcc: wrap gfortran
Message-ID: <20160701205537.7511E8025D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6331b9c24aac3fe6c032de5dd1f8e84d355dbe02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gfortran supports all options supported by gcc, so it can and should be called
via the toolchain wrapper.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6e1c02d..a796f47 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -265,6 +265,8 @@ endif # BR2_CCACHE
 # used. However, we should not add the toolchain wrapper for them, and they
 # match the *cc-* pattern. Therefore, an additional case is added for *-ar,
 # *-ranlib and *-nm.
+# According to gfortran manpage, it supports all options supported by gcc, so
+# add gfortran to the list of the program called via the Buildroot wrapper.
 # Avoid that a .br_real is symlinked a second time.
 # Also create <arch>-linux-<tool> symlinks.
 define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
@@ -276,7 +278,7 @@ define HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 		*-ar|*-ranlib|*-nm) \
 			ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp) \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran) \
 			rm -f $$i.br_real; \
 			mv $$i $$i.br_real; \
 			ln -sf toolchain-wrapper $$i; \
