From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Jul 2013 07:35:52 +0200
Subject: [Buildroot] [git commit] package: allow to override the make
	install target for host packages
Message-ID: <20130703070347.39A93998B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=598ade90a8a4eb6036499d8d81589aadd69d9f43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to convert gcc to the package infrastructure, we need a way
of overriding the name of the make target used for the installation of
host packages, just like we have for target packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-autotools.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d8d7e6d..09deef2 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -76,6 +76,7 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
+$(2)_INSTALL_OPT                ?= install
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
 $(2)_CLEAN_OPT			?= clean
@@ -232,7 +233,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
+	$$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
