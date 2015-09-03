From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Sep 2015 07:10:53 +0300
Subject: [Buildroot] [PATCH v3 4/5] dos2unix: remove host-gettext dependency
	from host package
In-Reply-To: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
References: <35a5aad580e5c2cae7eb79522f11a1aded941caf.1441253454.git.baruch@tkos.co.il>
Message-ID: <34042a90627862a05815f38fea948493777bdf4c.1441253454.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This shortens build time.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:
   * New patch in this series (Peter)
---
 package/dos2unix/dos2unix.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 4c5f4fcff384..55608c653f9c 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -9,7 +9,7 @@ DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2c
 DOS2UNIX_LICENSE_FILES = COPYING.txt
 DOS2UNIX_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
-HOST_DOS2UNIX_DEPENDENCIES = host-gettext
+HOST_DOS2UNIX_DEPENDENCIES =
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 DOS2UNIX_MAKE_OPTS += ENABLE_NLS=
@@ -34,11 +34,12 @@ define DOS2UNIX_INSTALL_TARGET_CMDS
 endef
 
 define HOST_DOS2UNIX_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) ENABLE_NLS=
 endef
 
 define HOST_DOS2UNIX_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) ENABLE_NLS= \
+		install
 endef
 
 $(eval $(generic-package))
-- 
2.5.0
