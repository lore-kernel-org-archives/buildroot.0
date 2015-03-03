From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:33 +0100
Subject: [Buildroot] [RFC v3 28/30] pkgconf: Move PKG_CONFIG_HOST_BINARY to
	Makefile.in
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-29-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.
Because the PKG_CONFIG_HOST_BINARY will be used inside the
pkg-generic.mk, move the definition in the Makefile.in so it will be
loaded before the pkg-generic.mk.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/Makefile.in        | 2 ++
 package/pkgconf/pkgconf.mk | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 88ace05..6cfe3ed 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -247,6 +247,8 @@ export PERL=$(shell which perl)
 # finds this perl module by exporting the proper value for PERL5LIB.
 export PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
+PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
+
 TARGET_CONFIGURE_OPTS = \
 	PATH=$(BR_PATH) \
 	AR="$(TARGET_AR)" \
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index a27c084..7feeb4f 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -10,8 +10,6 @@ PKGCONF_SOURCE = pkgconf-$(PKGCONF_VERSION).tar.bz2
 PKGCONF_LICENSE = pkgconf license
 PKGCONF_LICENSE_FILES = COPYING
 
-PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config
-
 define PKGCONF_LINK_PKGCONFIG
 	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
 endef
-- 
2.3.1
