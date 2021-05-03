From: Urja Rannikko <urjaman@gmail.com>
Date: Mon,  3 May 2021 11:04:08 +0300
Subject: [Buildroot] [RFNC] [PATCH] libsamplerate: add option to remove best
 quality, make much smaller
Message-ID: <20210503080408.2952261-1-urjaman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
---
Request For _No_ Comments. I made this before I heard
that conditional patching will not do, so posting
it as-is in case someone else wants to make the idea happen.
I don't even know if the hook works yet
(rebuild in progress lol), so it's just an idea.
Consider this contribution in the public domain.
---
 package/libsamplerate/Config.in               | 11 +++++++
 .../hack_out_best_quality.condpatch           | 31 +++++++++++++++++++
 package/libsamplerate/libsamplerate.mk        |  7 +++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/libsamplerate/hack_out_best_quality.condpatch

diff --git a/package/libsamplerate/Config.in b/package/libsamplerate/Config.in
index b394fdb..73ec036 100644
--- a/package/libsamplerate/Config.in
+++ b/package/libsamplerate/Config.in
@@ -7,3 +7,14 @@ config BR2_PACKAGE_LIBSAMPLERATE
 	  44.1kHz to the 48kHz sample rate used by DAT players.
 
 	  http://www.mega-nerd.com/SRC/
+
+if BR2_PACKAGE_LIBSAMPLERATE
+
+config BR2_PACKAGE_LIBSAMPLERATE_REMOVE_SINC_BEST_QUALITY
+	bool "remove best quality sinc conversion (> 1 MB smaller)"
+	help
+	  If you select this, SRC_SINC_BEST_QUALITY silently
+	  maps to SRC_SINC_MEDIUM_QUALITY, but libsamplerate
+	  is also significantly smaller.
+
+endif
diff --git a/package/libsamplerate/hack_out_best_quality.condpatch b/package/libsamplerate/hack_out_best_quality.condpatch
new file mode 100644
index 0000000..07ae473
--- /dev/null
+++ b/package/libsamplerate/hack_out_best_quality.condpatch
@@ -0,0 +1,31 @@
+diff --git a/src/src_sinc.c b/src/src_sinc.c
+index 1871684..b592a10 100644
+--- a/src/src_sinc.c
++++ b/src/src_sinc.c
+@@ -33,7 +33,6 @@ typedef float	coeff_t ;
+ 
+ #include "fastest_coeffs.h"
+ #include "mid_qual_coeffs.h"
+-#include "high_qual_coeffs.h"
+ 
+ typedef struct
+ {	int		sinc_magic_marker ;
+@@ -190,17 +189,12 @@ sinc_set_converter (SRC_PRIVATE *psrc, int src_enum)
+ 				break ;
+ 
+ 		case SRC_SINC_MEDIUM_QUALITY :
++		case SRC_SINC_BEST_QUALITY :
+ 				temp_filter.coeffs = slow_mid_qual_coeffs.coeffs ;
+ 				temp_filter.coeff_half_len = ARRAY_LEN (slow_mid_qual_coeffs.coeffs) - 2 ;
+ 				temp_filter.index_inc = slow_mid_qual_coeffs.increment ;
+ 				break ;
+ 
+-		case SRC_SINC_BEST_QUALITY :
+-				temp_filter.coeffs = slow_high_qual_coeffs.coeffs ;
+-				temp_filter.coeff_half_len = ARRAY_LEN (slow_high_qual_coeffs.coeffs) - 2 ;
+-				temp_filter.index_inc = slow_high_qual_coeffs.increment ;
+-				break ;
+-
+ 		default :
+ 				return SRC_ERR_BAD_CONVERTER ;
+ 		} ;
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index c107650..fde53e4 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -20,4 +20,11 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LIBSAMPLERATE_DEPENDENCIES += libsndfile
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE_REMOVE_SINC_BEST_QUALITY),y)
+define LIBSAMPLERATE_REMOVE_SINC_BEST_QUALITY_HOOK
+	(cd $(@D); patch -p1 < $(LIBSAMPLERATE_PKGDIR)/hack_out_best_quality.condpatch)
+endef
+LIBSAMPLERATE_POST_PATCH_HOOKS += LIBSAMPLERATE_REMOVE_SINC_BEST_QUALITY_HOOK
+endif
+
 $(eval $(autotools-package))
-- 
2.31.1
