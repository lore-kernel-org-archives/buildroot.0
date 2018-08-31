From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:12:39 +0200
Subject: [Buildroot] [PATCH 1/2] e2fsprogs: do not use ldconfig when
 building the host variant
Message-ID: <20180831211240.20322-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 93acaa5a573865afc7a8c0912a7037965eb845a6 ("e2fsprogs:
build shared library for the host"), we are building shared libraries
in host-e2fsprogs instead of static libraries. A consequence of this
is that the e2fsprogs build system tries to run ldconfig on the host,
which fails when running as non-root:

/usr/sbin/ldconfig: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
make[3]: [Makefile:441: install-shlibs] Error 1 (ignored)

Tell the configure script to use "true" as ldconfig in order to avoid
this problem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fecef118ac..5fe1ff8e68 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -70,7 +70,8 @@ E2FSPROGS_CONF_ENV += BUILD_CFLAGS="-DHAVE_SYS_STAT_H"
 # it doesn't provide definitions expected by e2fsprogs support lib.
 HOST_E2FSPROGS_CONF_ENV += \
 	ac_cv_header_magic_h=no \
-	ac_cv_lib_magic_magic_file=no
+	ac_cv_lib_magic_magic_file=no \
+	ac_cv_path_LDCONFIG=true
 
 E2FSPROGS_MAKE_OPTS = LDCONFIG=true
 
-- 
2.14.4
