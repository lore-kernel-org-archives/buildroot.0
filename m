From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  1 Feb 2015 17:51:39 +0100
Subject: [Buildroot] [PATCH 1/2] automake: complete the removal of the
	target package
Message-ID: <1422809500-23948-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable ACLOCAL_DIR points to the staging area but is not useful
anymore because the target package was removed.  Fix ACLOCAL_DIR by
pointing to $(HOST_DIR)/usr/share/aclocal and remove ACLOCAL_HOST_DIR
because ACLOCAL_DIR has the same value so it's not useful anymore.

Also remove the reference to ACLOCAL_HOST_DIR from the host-autoconf
package.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/autoconf/autoconf.mk | 2 +-
 package/automake/automake.mk | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index fd91961..2c0ff30 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/usr/bin/autoconf
 AUTOHEADER = $(HOST_DIR)/usr/bin/autoheader
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)"
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index a3fd18c..5021b49 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -28,6 +28,5 @@ $(eval $(host-autotools-package))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
-ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
-ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL_DIR = $(HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
-- 
2.1.0
