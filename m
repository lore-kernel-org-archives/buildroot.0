From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Sep 2010 15:33:06 +0200
Subject: [Buildroot] [PATCH 1/2] autotargets: don't use install-strip
In-Reply-To: <cover.1285594377.git.thomas.petazzoni@free-electrons.com>
References: <cover.1285594377.git.thomas.petazzoni@free-electrons.com>
Message-ID: <55ade5c7964e15f9b1eba061ab840cc4c25e4e37.1285594377.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many packages using the AUTOTARGETS infrastructure do not support the
install-strip target. Moreover, we are already stripping all binary
files in the $(TARGET_DIR) anyway, so using install-strip is a bit
useless.

So, we use "make install" in all cases, and let Buildroot do the
stripping of the binaries if BR2_ENABLE_DEBUG is not set.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 1ccf44c..589079b 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -66,11 +66,7 @@ $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
 $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
-ifeq ($(BR2_ENABLE_DEBUG),y)
 $(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install
-else
-$(2)_INSTALL_TARGET_OPT		?= DESTDIR=$$(TARGET_DIR)  install-strip
-endif
 $(2)_CLEAN_OPT			?= clean
 $(2)_UNINSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) uninstall
 $(2)_UNINSTALL_TARGET_OPT	?= DESTDIR=$$(TARGET_DIR)  uninstall
-- 
1.7.0.4
