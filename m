From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:15:27 +0200
Subject: [Buildroot] [git commit] package/supertux: fix bug when compiling
	with PPC altivec vectorization
Message-ID: <20170415101548.C9DA1826D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b4f1b73e7711a3eb3a233b7d727fd9d1fa4cf36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
Acording to a bug report in GCC [2]:
"You need to use -std=g++11 or undefine bool after the include of altivec.h
as context sensitive keywords is not part of the C++11 standard".

So use gnu++11 instead of c++11 only for altivec system.

This allow to revert [3] and keep Altivec vectorization.

[1] 0024465d8a7b51f7fc7c9e8581072695d869adca
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3
[3] d2903aaf1314b50a8a10ce937d2b33c5c42e463e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/supertux/supertux.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/supertux/supertux.mk b/package/supertux/supertux.mk
index 4fb0611..f49df35 100644
--- a/package/supertux/supertux.mk
+++ b/package/supertux/supertux.mk
@@ -46,4 +46,25 @@ endef
 SUPERTUX_POST_PATCH_HOOKS += SUPERTUX_REMOVE_PEDANTIC
 endif
 
+# From https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
+# "The problem lies within SDL_cpuinfo.h.  It includes altivec.h, which by
+# definition provides an unconditional vector, pixel and bool define in
+# standard-c++ mode.  In GNU-c++ mode this names are only defined
+# context-sensitive by cpp.  SDL_cpuinfo.h is included by SDL.h.
+# Including altivec.h makes arbitrary code break."
+#
+# Acording to a bug report in GCC [1]:
+# "You need to use -std=g++11 or undefine bool after the include of altivec.h
+# as context sensitive keywords is not part of the C++11 standard".
+# So use gnu++11 instead of c++11 only for altivec system.
+# [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58241#c3
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+define SUPERTUX_FIX_ALTIVEC_ISSUE
+	$(SED) 's%std=c++0x%std=gnu++0x%' $(@D)/CMakeLists.txt
+	$(SED) 's%std=c++11%std=gnu++11%' $(@D)/CMakeLists.txt
+	$(SED) 's%std=c++0x%std=gnu++0x%' $(@D)/external/tinygettext/CMakeLists.txt
+endef
+SUPERTUX_POST_PATCH_HOOKS += SUPERTUX_FIX_ALTIVEC_ISSUE
+endif
+
 $(eval $(cmake-package))
