From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 13:35:05 +0200
Subject: [Buildroot] [git commit] package/gettext: ensure GETTEXTIZE is
 always defined
Message-ID: <20190410113058.A4B4B81489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=554fa317ba015cba631b9c412b3d8dd7edac362d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After introducing gettext-tiny in:

	5367a1b253 package/gettext-tiny: new package

GETTEXTIZE variable is conditionally defined separately by gettext-gnu
or gettext-tiny package depending on which of them is
enabled. However, gettext-gnu only defines it when the target
gettext-gnu package is enabled. This is wrong, because the target
gettext-gnu package is only needed when the C library doesn't provide
a proper gettext implementation (uClibc, musl). When glibc is used,
gettext functionality is provided by the toolchain, and the target
gettext-gnu package is not enabled, causing GETTEXTIZE to not be
defined. This causes build failures in packages that need
gettextizing, in configurations that have BR2_SYSTEM_ENABLE_NLS=y and
use glibc.

This commit fixes this issue by defining GETTEXTIZE unconditionally in
package/gettext/gettext.mk. It is not needed to define it in each
gettext-*.mk because the difference is only in passing the 'data_dir'
parameter which points to ${PREFIX}/share/gettext-tiny (in case of
gettext-tiny provider), but a simple symlink:

	${PREFIX}/share/gettext -> ${PREFIX}/share/gettext-tiny

solves this issue.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
[Thomas: improve commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-gnu/gettext-gnu.mk   |  4 ----
 package/gettext-tiny/gettext-tiny.mk | 10 +++-------
 package/gettext/gettext.mk           |  2 ++
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index c63ad8cb36..28662e0dec 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -95,9 +95,5 @@ endef
 
 HOST_GETTEXT_GNU_POST_INSTALL_HOOKS += HOST_GETTEXT_GNU_ADD_ABOUT_NLS
 
-ifeq ($(BR2_PACKAGE_GETTEXT_GNU),y)
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 87e90bcc70..7db478d845 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -94,6 +94,9 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/extra/Makevars.template $(HOST_DIR)/share/gettext-tiny/po/Makevars.template
 
 	$(Q)touch $(HOST_DIR)/share/gettext-tiny/ABOUT-NLS
+
+	# for gettextize
+	ln -sf $(HOST_DIR)/usr/share/gettext-tiny $(HOST_DIR)/usr/share/gettext
 endef
 
 # Install simple echo wrapper for gettext tool
@@ -101,12 +104,5 @@ define GETTEXT_TINY_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(GETTEXT_TINY_PKGDIR)/gettext-wrapper $(TARGET_DIR)/usr/bin/gettext
 endef
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-GETTEXTIZE = $(HOST_CONFIGURE_OPTS) \
-	     AUTOM4TE=$(HOST_DIR)/bin/autom4te \
-	     gettext_datadir=$(HOST_DIR)/usr/share/gettext-tiny \
-	     $(HOST_DIR)/bin/gettextize -f
-endif
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index a86e26f69e..146d40e13b 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -4,5 +4,7 @@
 #
 ################################################################################
 
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/bin/autom4te $(HOST_DIR)/bin/gettextize -f
+
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
