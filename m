From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:37:00 +0100
Subject: [Buildroot] [git commit] package/nano: fix tiny build
Message-ID: <20210111211826.D62B68741F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0202ffa4a1e89225d22433d162d1726e43cd629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit
https://git.savannah.gnu.org/cgit/nano.git/commit/configure.ac?id=235f92ce093099cd81f14827ab842bd331132790

--enable-color --enable-nanorc are needed for libmagic support in tiny
builds.

Fixes:
http://autobuild.buildroot.net/results/248/24894e62d6cf89d078959b12e67596c821d64696/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nano/nano.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index bde287bb32..1fc499c347 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -29,6 +29,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
 NANO_CONF_OPTS += --enable-tiny
+ifeq ($(BR2_PACKAGE_FILE),y)
+NANO_CONF_OPTS += --enable-color --enable-nanorc
+endif
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
