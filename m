From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:42:14 +0100
Subject: [Buildroot] [git commit] lynx: new package
Message-ID: <20171213073534.6CE9B81473@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85e08bfdb5f39caf71846628764ee57e2d0b62d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Lang <mlang@blind.guru>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
[Thomas: invert ncurses/slang select to avoid a circular dependency,
add BR2_USE_MMU dependency inherited from slang.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/lynx/Config.in |  9 +++++++++
 package/lynx/lynx.hash |  3 +++
 package/lynx/lynx.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index da38e2e..6a4e8de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1040,6 +1040,9 @@ F:	package/polkit/
 F:	package/sg3_utils/
 F:	package/udisks/
 
+N:	Mario Lang <mlang@blind.guru>
+F:	package/lynx/
+
 N:	Mario Rugiero <mrugiero@gmail.com>
 F:	package/ratpoison/
 
diff --git a/package/Config.in b/package/Config.in
index cb2141b..c3ebbfc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1699,6 +1699,7 @@ menu "Networking applications"
 	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
 	source "package/lrzsz/Config.in"
+	source "package/lynx/Config.in"
 	source "package/macchanger/Config.in"
 	source "package/memcached/Config.in"
 	source "package/mii-diag/Config.in"
diff --git a/package/lynx/Config.in b/package/lynx/Config.in
new file mode 100644
index 0000000..a338f83
--- /dev/null
+++ b/package/lynx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LYNX
+	bool "lynx"
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_SLANG if !BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	help
+	  The Text Web-Browser.
+
+	  http://lynx.invisible-island.net/
diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
new file mode 100644
index 0000000..c39475a
--- /dev/null
+++ b/package/lynx/lynx.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  04318a100b052d079d0018fa371aa28cfb41ab68db3a959f3b75c2170eea1bc8  lynx2.8.9dev.16.tar.bz2
+sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
new file mode 100644
index 0000000..a95326a
--- /dev/null
+++ b/package/lynx/lynx.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# lynx
+#
+################################################################################
+
+LYNX_VERSION = 2.8.9dev.16
+LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
+LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
+LYNX_LICENSE = GPL-2.0
+LYNX_LICENSE_FILES = COPYING
+
+LYNX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+LYNX_DEPENDENCIES += ncurses
+LYNX_CONF_OPTS += --with-screen=ncurses$(if $(BR2_PACKAGE_NCURSES_WCHAR),w)
+else ifeq ($(BR2_PACKAGE_SLANG),y)
+LYNX_DEPENDENCIES += slang
+LYNX_CONF_OPTS += --with-screen=slang
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LYNX_DEPENDENCIES += openssl
+LYNX_CONF_OPTS += --with-ssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LYNX_DEPENDENCIES += gnutls
+LYNX_CONF_OPTS += --with-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LYNX_DEPENDENCIES += zlib
+LYNX_CONF_OPTS += --with-zlib
+else
+LYNX_CONF_OPTS += --without-zlib
+endif
+
+$(eval $(autotools-package))
