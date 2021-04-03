From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:30:20 +0200
Subject: [Buildroot] [git commit] package/mender: make xz optional
Message-ID: <20210403070536.89D3C81358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cb8b2516956c865df88206971fa447b0e08da2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the README.md file, xz is optional.
  - Remove the dependency on the xz package.
  - If the xz package is not selected, add "nolzma" to MENDER_TAGS

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/Config.in | 1 -
 package/mender/mender.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index accee4676a..5ac8bb1676 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_XZ
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 794dd4be8c..1ebd5a2e83 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -38,7 +38,7 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/mattn/go-isatty/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
-MENDER_DEPENDENCIES = host-pkgconf openssl xz
+MENDER_DEPENDENCIES = host-pkgconf openssl
 
 MENDER_LDFLAGS = -X github.com/mendersoftware/mender/conf.Version=$(MENDER_VERSION)
 
@@ -81,6 +81,12 @@ endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+MENDER_DEPENDENCIES += xz
+else
+MENDER_TAGS += nolzma
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
