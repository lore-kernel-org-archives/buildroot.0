From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu,  9 Apr 2015 20:28:55 +0900
Subject: [Buildroot] [PATCH v2] Makefile: delete HOSTFC and FC_FOR_BUILD
Message-ID: <1428578935-13452-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This definition of HOSTFC is completely wrong.

"$(HOSTLD)" should be "$(HOSTFC)".  Also, "echo" always succeeds, so
"which g77 || type -p g77 || echo gfortran" is never run.

Anyway, HOSTFC is most likely set to "/use/bin/ld" and nobody has
complained about it before me, so I guess it is not used at all.

At least grepping HOSTFC, FC_FOR_BUILD did not hit any packages.
Drop HOSTFC and FC_FOR_BUILD.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---

Changes in v2:
 - Remove HOSTFC rather than fix it.

 Makefile            | 6 +-----
 package/Makefile.in | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 9db52a8..5f9a2c3 100644
--- a/Makefile
+++ b/Makefile
@@ -228,9 +228,6 @@ HOSTCXX := g++
 HOSTCXX := $(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 endif
 HOSTCXX_NOCCACHE := $(HOSTCXX)
-ifndef HOSTFC
-HOSTFC := gfortran
-endif
 ifndef HOSTCPP
 HOSTCPP := cpp
 endif
@@ -251,7 +248,6 @@ HOSTRANLIB := ranlib
 endif
 HOSTAR := $(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
 HOSTAS := $(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTFC := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
 HOSTCPP := $(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
 HOSTLD := $(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
 HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
@@ -259,7 +255,7 @@ HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
 HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
 
-export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
+export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
 # Make sure pkg-config doesn't look outside the buildroot tree
diff --git a/package/Makefile.in b/package/Makefile.in
index 8e471ee..e65e08b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -264,7 +264,6 @@ TARGET_CONFIGURE_OPTS = \
 	CC_FOR_BUILD="$(HOSTCC)" \
 	GCC_FOR_BUILD="$(HOSTCC)" \
 	CXX_FOR_BUILD="$(HOSTCXX)" \
-	FC_FOR_BUILD="$(HOSTFC)" \
 	LD_FOR_BUILD="$(HOSTLD)" \
 	CPPFLAGS_FOR_BUILD="$(HOST_CPPFLAGS)" \
 	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
-- 
1.9.1
