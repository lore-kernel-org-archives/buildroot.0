From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 22:35:55 +0100
Subject: [Buildroot] [git commit] radvd: use <pkg>_INSTALL_INIT_SYSV
Message-ID: <20141201221140.42F4E8002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f21c9fdacb48fd43075e6dbe447171ec84b6b10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes the radvd to use the <pkg>_INSTALL_INIT_SYSV
mechanism instead of using a post install target hook. We also use a
full destination path when calling $(INSTALL).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index bd2086d..cc50ce4 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -12,10 +12,8 @@ RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # We're patching configure.ac/Makefile.am.
 RADVD_AUTORECONF = YES
 
-define RADVD_INSTALL_INITSCRIPT
-	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
+define RADVD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d/S50radvd
 endef
 
-RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
-
 $(eval $(autotools-package))
