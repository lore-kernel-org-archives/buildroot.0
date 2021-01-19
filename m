From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 18:53:26 +0100
Subject: [Buildroot] [PATCH 2/2] package/nano: fix tiny build
In-Reply-To: <20210119175326.497192-1-fontaine.fabrice@gmail.com>
References: <20210119175326.497192-1-fontaine.fabrice@gmail.com>
Message-ID: <20210119175326.497192-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since upstream commit
https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790

--enable-color --enable-nanorc are needed for libmagic support in tiny
builds however as --enable-color needs fork() and tiny is selected when
!BR2_USE_MMU, it is easier to just disable libmagic with tiny builds

Fixes:
 - http://autobuild.buildroot.net/results/24894e62d6cf89d078959b12e67596c821d64696

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nano/nano.mk | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index c688ff216c..af6e1d62de 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -19,18 +19,16 @@ NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
 NANO_MAKE_ENV += CURSES_LIB="-lncurses"
 endif
 
-ifeq ($(BR2_PACKAGE_FILE),y)
-NANO_DEPENDENCIES += file
-NANO_CONF_OPTS += --enable-libmagic
-else
-NANO_CONF_OPTS += --disable-libmagic
-endif
-
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 NANO_CONF_OPTS += --enable-tiny
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
+else ifeq ($(BR2_PACKAGE_FILE),y)
+NANO_DEPENDENCIES += file
+NANO_CONF_OPTS += --enable-libmagic
+else
+NANO_CONF_OPTS += --disable-libmagic
 endif
 
 $(eval $(autotools-package))
-- 
2.29.2
