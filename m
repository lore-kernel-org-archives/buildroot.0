From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:43:40 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: remove legacy freetype
	handling
Message-ID: <20170406204348.7CAA97FCED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80e2a5465880965b93d3647ca96f4af5f55252c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 2010 commit 32d319e6f "gst-plugins-base: ensure <stdint.h> is used"
introduced a typo (missing backslash) that made the code ineffective.

In 2013 commit f8e7fdcd3 "gst1-plugins-base: add gstreamer1 base
plugins" copied the code.

It can be confirmed by looking at the output of:
$ make printvars | grep '^GST1_PLUGINS_BASE_CONF_ENV\|^FT2_CONFIG'
FT2_CONFIG=/bin/false ac_cv_header_stdint_t="stdint.h"
GST1_PLUGINS_BASE_CONF_ENV=

Direct use of freetype was dropped in version 1.7.2 by upstream [1], so
remove the code instead of fixing it.

Found using [2]:
check-package --include-only Indent $(find * -type f)
and manually removed.

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
[2] http://patchwork.ozlabs.org/patch/729669/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 8da1f42..08f53f7 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -11,13 +11,6 @@ GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
 GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
 
-# freetype is only used by examples, but if it is not found
-# and the host has a freetype-config script, then the host
-# include dirs are added to the search path causing trouble
-GST1_PLUGINS_BASE_CONF_ENV =
-	FT2_CONFIG=/bin/false \
-	ac_cv_header_stdint_t="stdint.h"
-
 # gio_unix_2_0 is only used for tests
 GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
