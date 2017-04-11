From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 11 Apr 2017 19:59:13 -0300
Subject: [Buildroot] [PATCH v2] gst-plugins-base: fix handling of freetype
In-Reply-To: <20170406224619.65661d4e@free-electrons.com>
References: <20170406224619.65661d4e@free-electrons.com>
Message-ID: <20170411225913.22072-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2010 commit 32d319e6f "gst-plugins-base: ensure <stdint.h> is used"
introduced a typo (missing backslash) that made the code ineffective.

It can be confirmed by looking at the output of:
$ make printvars | grep '^GST_PLUGINS_BASE_CONF_ENV\|^FT2_CONFIG'
FT2_CONFIG=/bin/false ac_cv_header_stdint_t="stdint.h"
GST_PLUGINS_BASE_CONF_ENV=

Add the missing backslash to fix the code.
While at it, fix the indentation to use one tab instead of two.

The (end of the) diff of config.log confirms the code is still needed
when the host has freetype-config installed:
@@ -1674,10 +1674,8 @@
 configure:21882: checking for emmintrin.h
 configure:21882: result: no
 configure:21894: checking for stdint types
-configure:21917: /tmp/gst/output/host/usr/bin/i686-pc-linux-gnu-gcc -std=gnu99 -c   conftest.c >&5
-configure:21917: $? = 0
 configure:21961: result: stdint.h (shortcircuit)
-configure:22348: result: make use of stdint.h in _stdint.h (assuming C99 compatible system)
+configure:22348: result: make use of stdint.h in _stdint.h
 configure:22359: checking for localtime_r
 configure:22359: /tmp/gst/output/host/usr/bin/i686-pc-linux-gnu-gcc -std=gnu99 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c  >&5
 configure:22359: $? = 0
@@ -2468,8 +2466,7 @@
 Package 'freetype2', required by 'world', not found
 configure:31257: result: no
 configure:31298: checking for freetype-config
-configure:31316: found /usr/bin/freetype-config
-configure:31329: result: /usr/bin/freetype-config
+configure:31329: result: /bin/false
 configure:31339: checking for FreeType - version >= 2.0.9
 configure:31427: result: yes
 configure:32250: creating ./config.status
@@ -2789,7 +2786,7 @@
 ac_cv_objext='o'
 ac_cv_path_EGREP='/bin/grep -E'
 ac_cv_path_FGREP='/bin/grep -F'
-ac_cv_path_FT2_CONFIG='/usr/bin/freetype-config'
+ac_cv_path_FT2_CONFIG='/bin/false'
 ac_cv_path_GMSGFMT='/tmp/gst/output/host/usr/bin/msgfmt'
 ac_cv_path_GREP='/bin/grep'
 ac_cv_path_MSGFMT='/tmp/gst/output/host/usr/bin/msgfmt'
@@ -2818,7 +2815,6 @@
 ac_cv_prog_cxx_g='yes'
 ac_cv_prog_make_make_set='yes'
 ac_cv_stdint_message='using gnu compiler i686-pc-linux-gnu-gcc (Sourcery CodeBench Lite 2012.09-62) 4.7.2'
-ac_cv_stdint_result='(assuming C99 compatible system)'
 ac_cv_sys_file_offset_bits='no'
 ac_cv_sys_largefile_CC='no'
 ac_cv_sys_largefile_source='no'
@@ -2965,9 +2961,9 @@
 EXEEXT=''
 FFLAGS=' -Os '
 FGREP='/bin/grep -F'
-FT2_CFLAGS='-I/usr/include/freetype2'
-FT2_CONFIG='/usr/bin/freetype-config'
-FT2_LIBS='-lfreetype'
+FT2_CFLAGS=''
+FT2_CONFIG='/bin/false'
+FT2_LIBS=''
 GCOV=''
 GCOV_CFLAGS=''
 GCOV_LIBS=''

Detected by check-package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes v1 -> v2:
  - make the diff in commit message readable using 'diff -u' (Thomas);
  - check-package is now merged, so remove URL from commit message;

Thomas,
  I was unsure what to do with the long lines, so I pasted the raw
  output. Please feel free to ask me to respin or to tweak the message
  yourself. Below is the link [1] to the config.log files.

[1] https://gist.github.com/ricardo-martincoski/d9c27b7f589b35313f676357fc1037ac/archive/12363aac7be1adf9e62c2c20aa1aeefc18212dbb.zip

Regards,
Ricardo
---
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index fc3b2036a..735314365 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -14,9 +14,9 @@ GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
 # include dirs are added to the search path causing trouble
-GST_PLUGINS_BASE_CONF_ENV =
-		FT2_CONFIG=/bin/false \
-		ac_cv_header_stdint_t="stdint.h"
+GST_PLUGINS_BASE_CONF_ENV = \
+	FT2_CONFIG=/bin/false \
+	ac_cv_header_stdint_t="stdint.h"
 
 GST_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
-- 
2.11.0
