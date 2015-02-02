From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 00:40:20 +0100
Subject: [Buildroot] [git commit] Revert "automake: complete the removal of
	the target package"
Message-ID: <20150202234151.C864C807AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7ff733e83416bb2faa6cc4900e05f11d3ac490e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6c33512e01acfc576dc4e3ad28def8b29c0db822.

We DO need to look in the staging directory for .m4 files installed by other
target packages, otherwise we'll have breakage like:

http://autobuild.buildroot.net/results/b20/b20e3efcb0be3032781d7b2f0ef4c351834da0ce/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autoconf/autoconf.mk |    2 +-
 package/automake/automake.mk |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 2c0ff30..fd91961 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/usr/bin/autoconf
 AUTOHEADER = $(HOST_DIR)/usr/bin/autoheader
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)"
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 5021b49..a3fd18c 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -28,5 +28,6 @@ $(eval $(host-autotools-package))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
-ACLOCAL_DIR = $(HOST_DIR)/usr/share/aclocal
+ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
+ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
