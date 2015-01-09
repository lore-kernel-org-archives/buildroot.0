From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  9 Jan 2015 08:14:03 +0100
Subject: [Buildroot] [PATCH v4 2/2] libsvgtiny: update source url
In-Reply-To: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
References: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1420787643-6167-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As source url use the git repository instead of the unavaiable svn
repository.

Also because the git repository does not include the netsurf core
buildsystem source that are needed to build this package add as
dependency the netsurf-buildsystem package and use those files through a
symbolink link.

This fix the following error:

svn: E670002: Unable to connect to a repository at URL 'svn://svn.netsurf-browser.org/trunk/libsvgtiny'
svn: E670002: Unknown hostname 'svn.netsurf-browser.org'

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/libsvgtiny/libsvgtiny.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 3fc759f..acd08d7 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
-LIBSVGTINY_VERSION = 12121
+LIBSVGTINY_SITE = http://git.netsurf-browser.org/libsvgtiny.git
+LIBSVGTINY_SITE_METHOD = git
+LIBSVGTINY_VERSION = ea9d99fc8b231c22d06168135e181d61f4eb2f06
 LIBSVGTINY_INSTALL_STAGING = YES
-LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
+LIBSVGTINY_DEPENDENCIES = \
+	libxml2 host-gperf host-pkgconf host-netsurf-buildsystem
 LIBSVGTINY_LICENSE = MIT
 LIBSVGTINY_LICENSE_FILES = README
 
@@ -20,6 +22,10 @@ else
 LIBSVGTINY_COMPONENT_TYPE = lib-static
 endif
 
+define LIBSVGTINY_CONFIGURE_CMDS
+	ln -sf $(HOST_DIR)/usr/share/netsurf-buildsystem $(@D)/build
+endef
+
 define LIBSVGTINY_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr \
 		COMPONENT_TYPE=$(LIBSVGTINY_COMPONENT_TYPE)
-- 
2.2.1
