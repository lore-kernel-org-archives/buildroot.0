From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:40:45 +0200
Subject: [Buildroot] [PATCH 04/19] autotools: inherit LIBTOOL_PATCH for host
	packages
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a36e2e3588a8a2e629cf779d06440d18c80b4e4b.1272490771.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When FOO_LIBTOOL_PATCH is defined, assume that the same value should
be used for HOST_FOO_LIBTOOL_PATCH.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d624881..d8404d9 100644
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
