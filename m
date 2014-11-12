From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:48 +0100
Subject: [Buildroot] [PATCH 02/24 v3] pkg-autotools: re-order cleaning up
	the host dependencies
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <bef112634eb5c8c8c62fd611a44a290d055404fb.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the host dependencies cleanup out from in-between all the hooks, so
it is easier to see how the hooks all work together.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-autotools.mk | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 60f6997..6e198ed 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -169,6 +169,14 @@ $(2)_INSTALL_OPTS                ?= install
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
 
+# This must be repeated from inner-generic-package, otherwise we get an empty
+# _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
+# and _GETTEXTIZE away from the non-host rule
+ifeq ($(4),host)
+$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
+				host-gettext host-toolchain $(1),\
+    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
+endif
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -248,15 +256,6 @@ ifneq ($$($(2)_LIBTOOL_PATCH),NO)
 $(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
 endif
 
-# This must be repeated from inner-generic-package, otherwise we get an empty
-# _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
-# and _GETTEXTIZE away from the non-host rule
-ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-gettext host-toolchain $(1),\
-    $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
-endif
-
 ifeq ($$($(2)_AUTORECONF),YES)
 # This has to come before autoreconf
 ifeq ($$($(2)_GETTEXTIZE),YES)
-- 
1.9.1
