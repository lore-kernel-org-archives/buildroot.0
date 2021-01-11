From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 11 Jan 2021 20:09:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/nano: fix tiny build
Message-ID: <20210111190902.668095-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since upstream commit
https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790

--enable-color --enable-nanorc are needed for libmagic support in tiny
builds.

Fixes:
http://autobuild.buildroot.net/results/248/24894e62d6cf89d078959b12e67596c821d64696/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nano/nano.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a86474bfb4..9857ef3460 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -31,6 +31,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 NANO_CONF_OPTS += --enable-tiny
+ifeq ($(BR2_PACKAGE_FILE),y)
+NANO_CONF_OPTS += --enable-color --enable-nanorc
+endif
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
-- 
2.29.2
