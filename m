From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 Aug 2020 18:34:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/dieharder: fix build with gcc 10
Message-ID: <20200819163418.2012787-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable -fno-common with dieharder, there is more than 100 variables to
fix and upstream seems dead.

Fixes:
 - http://autobuild.buildroot.org/results/ba70d111cd1f2029a193a88af3b44daf6ef27786

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dieharder/dieharder.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
index c3eee64553..cbf28922fd 100644
--- a/package/dieharder/dieharder.mk
+++ b/package/dieharder/dieharder.mk
@@ -36,4 +36,9 @@ endif
 # parallel build fail, disable it
 DIEHARDER_MAKE = $(MAKE1)
 
+# Too many fixes needed to build with -fno-common which is default since gcc 10
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
+DIEHARDER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fcommon"
+endif
+
 $(eval $(autotools-package))
-- 
2.27.0
