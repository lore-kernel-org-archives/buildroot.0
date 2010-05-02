From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] autotools: inherit LIBTOOL_PATCH
	for host packages
Message-ID: <20100502220949.C461F8A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d2c73f5cf925baf1bcf99c1a187e2a846dd56f43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When FOO_LIBTOOL_PATCH is defined, assume that the same value should
be used for HOST_FOO_LIBTOOL_PATCH.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index fc5bcee..bbc79b7 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -49,6 +49,14 @@ ifndef $(2)_SUBDIR
  endif
 endif
 
+ifndef $(2)_LIBTOOL_PATCH
+ ifdef $(3)_LIBTOOL_PATCH
+  $(2)_LIBTOOL_PATCH = $($(3)_LIBTOOL_PATCH)
+ else
+  $(2)_LIBTOOL_PATCH ?= YES
+ endif
+endif
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE			?= $(MAKE)
@@ -56,7 +64,6 @@ $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_AUTORECONF			?= NO
 $(2)_AUTORECONF_OPT		?=
-$(2)_LIBTOOL_PATCH		?= YES
 $(2)_USE_CONFIG_CACHE           ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_INSTALL_STAGING_OPT	?= DESTDIR=$$(STAGING_DIR) install
 ifeq ($(BR2_ENABLE_DEBUG),y)
-- 
1.6.3.3
