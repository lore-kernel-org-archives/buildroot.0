From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:22:02 +0200
Subject: [Buildroot] [git commit] e2fsprogs: simplify handling of ldconfig
 for target variant
Message-ID: <20180909132111.39187838CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2a065bc135f044b54f0c31890cc5218ab307dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

e2fsprogs now has a proper autoconf check for ldconfig, so we can
simply pass the apropriate ac_cv_path_LDCONFIG variable at configure
time, and it gets used at build/install time without having to force
LDCONFIG=true at every step.

Since the E2FSPROGS_INSTALL_TARGET_OPTS become the default, we can get
rid of them entirely.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 659df8062e..98001c3c99 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -64,7 +64,9 @@ endif
 # the configure script (i.e with the cross-compiler). Help them by
 # saying that <sys/stat.h> is available on the host, which is needed
 # for util/subst.c to build properly.
-E2FSPROGS_CONF_ENV += BUILD_CFLAGS="-DHAVE_SYS_STAT_H"
+E2FSPROGS_CONF_ENV += \
+	BUILD_CFLAGS="-DHAVE_SYS_STAT_H" \
+	ac_cv_path_LDCONFIG=true
 
 # Disable use of the host magic.h, as on older hosts (e.g. RHEL 5)
 # it doesn't provide definitions expected by e2fsprogs support lib.
@@ -73,18 +75,10 @@ HOST_E2FSPROGS_CONF_ENV += \
 	ac_cv_lib_magic_magic_file=no \
 	ac_cv_path_LDCONFIG=true
 
-E2FSPROGS_MAKE_OPTS = LDCONFIG=true
-
 E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
-	LDCONFIG=true \
 	install-libs
 
-E2FSPROGS_INSTALL_TARGET_OPTS = \
-	DESTDIR=$(TARGET_DIR) \
-	LDCONFIG=true \
-	install
-
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
