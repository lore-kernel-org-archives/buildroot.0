From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Dec 2018 16:04:56 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer1-edting-services: fix build with
 pkgconf 1.5.3
Message-ID: <20181215150456.14240-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
paths found in the .pc file. This is correct when the paths refer to
something in STAGING_DIR (e.g. libdir, includedir), but not when it
refers to something used for the target.

gstreamer-editing-services uses the completionsdir variable from
bash-completions.pc to decide where to install things. Since DESTDIR is
prepended to the install destination, this will end up in the wrong
location.

Until a better solution is found in pkgconf, pass the appdefaultdir to
use explicitly instead of relying on bash-completions.pc.

Fixes:
 - http://autobuild.buildroot.org/results/095f75be81b93db0ab45ea60b0dd6c34c99212e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 74a36824ed..620dcd24eb 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -20,6 +20,10 @@ GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
 
 GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --disable-benchmarks
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-bash-completion-dir=/usr/share/bash-completion/completions
+endif
+
 # examples need GTK2/3 with X11 backend
 ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3_X11),)
 GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --enable-examples
-- 
2.14.1
