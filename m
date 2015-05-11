From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 May 2015 22:55:36 +0200
Subject: [Buildroot] [PATCH] libmemcached: don't use -fPIE and -pie with
	FLAT binaries
Message-ID: <1431377736-2574-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FLAT binaries cannot use -fPIE and -pie code, so let's teach
libmemcached to not use such flags when BR2_BINFMT_FLAT=y.

Fixes:

  http://autobuild.buildroot.org/results/8cb/8cbf57f9136cb42be31c88e0f1f32d3d2353e5ff/
  and many previous similar build failures

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmemcached/libmemcached.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index d442b3c..f32963d 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -18,4 +18,15 @@ LIBMEMCACHED_AUTORECONF = YES
 LIBMEMCACHED_LICENSE = BSD-3c
 LIBMEMCACHED_LICENSE_FILES = COPYING
 
+# Help libmemcached to understand that -fPIE and -pie should not be
+# used when FLAT binaries are used (shared libraries are not
+# supported).
+ifeq ($(BR2_BINFMT_FLAT),y)
+LIBMEMCACHED_CONF_ENV += \
+	ax_cv_check_cflags__Werror__fPIE=no \
+	ax_cv_check_cflags__Werror__pie=no \
+	ax_cv_check_cxxflags__Werror__fPIE=no \
+	ax_cv_check_cxxflags__Werror__pie=no
+endif
+
 $(eval $(autotools-package))
-- 
2.1.0
