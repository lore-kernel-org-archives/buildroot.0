From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 23:12:40 +0200
Subject: [Buildroot] [PATCH 2/2] e2fsprogs: simplify handling of ldconfig
 for target variant
In-Reply-To: <20180831211240.20322-1-thomas.petazzoni@bootlin.com>
References: <20180831211240.20322-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180831211240.20322-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index 5fe1ff8e68..4de469216e 100644
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
-- 
2.14.4
