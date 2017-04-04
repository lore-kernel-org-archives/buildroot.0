From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:19 -0300
Subject: [Buildroot] [PATCH 11/11] gst-plugins-base: fix handling of freetype
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-11-ricardo.martincoski@gmail.com>
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
 1704c1702
 < configure:22348: result: make use of stdint.h in _stdint.h (assuming C99 compatible system)
 ---
 > configure:22348: result: make use of stdint.h in _stdint.h
 2499,2500c2497
 < configure:31316: found /usr/bin/freetype-config
 < configure:31329: result: /usr/bin/freetype-config
 ---
 > configure:31329: result: /bin/false
 2820c2817
 < ac_cv_path_FT2_CONFIG='/usr/bin/freetype-config'
 ---
 > ac_cv_path_FT2_CONFIG='/bin/false'
 2849d2845
 < ac_cv_stdint_result='(assuming C99 compatible system)'
 2996,2998c2992,2994
 < FT2_CFLAGS='-I/usr/include/freetype2'
 < FT2_CONFIG='/usr/bin/freetype-config'
 < FT2_LIBS='-lfreetype'
 ---
 > FT2_CFLAGS=''
 > FT2_CONFIG='/bin/false'
 > FT2_LIBS=''

Found using [1]:
check-package --include-only Indent $(find * -type f)
and manually fixed.

[1] http://patchwork.ozlabs.org/patch/729669/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
From get-developers:
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
