From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2015 16:28:15 +0200
Subject: [Buildroot] [git commit] libmemcached: don't use -fPIE and -pie
	when linking statically
Message-ID: <20150512142853.CA27F80481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9fcc83fbe9bcf7a3d58f82c532f36462ba21267
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These compiler options shouldn't be used when linking statically, and in
particular FLAT binaries cannot use -fPIE and -pie code, so let's teach
libmemcached to not use such flags in those setups.

Fixes:

  http://autobuild.buildroot.org/results/8cb/8cbf57f9136cb42be31c88e0f1f32d3d2353e5ff/
  and many previous similar build failures

[Peter: rework/reword to do this based on BR2_STATIC_LIBS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index d442b3c..a5ea4f5 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -18,4 +18,14 @@ LIBMEMCACHED_AUTORECONF = YES
 LIBMEMCACHED_LICENSE = BSD-3c
 LIBMEMCACHED_LICENSE_FILES = COPYING
 
+# Help libmemcached to understand that -fPIE and -pie should not be
+# used when linking statically.
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBMEMCACHED_CONF_ENV += \
+	ax_cv_check_cflags__Werror__fPIE=no \
+	ax_cv_check_cflags__Werror__pie=no \
+	ax_cv_check_cxxflags__Werror__fPIE=no \
+	ax_cv_check_cxxflags__Werror__pie=no
+endif
+
 $(eval $(autotools-package))
