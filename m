From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 12 Jul 2014 14:27:03 -0300
Subject: [Buildroot] [PATCH 2/3] infra: add gettextize run in AUTORECONF
In-Reply-To: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405186024-8170-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1405186024-8170-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bump to gettext version 0.19 many autoreconfigured packages
will complain about gettext infra version mismatch and fail to
AUTORECONF.
Fix this by hooking up a gettextize run before autoreconfiguring.

It adds some extra build time when doing autoreconf passes but the alternative
would require a new GETTEXTIZE option and package audit which could take some
time to get resolved.

Fixes:
http://autobuild.buildroot.net/results/6d4/6d477b7042d949c3ceea9a63bd26ffc187a67221/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-autotools.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index ddff9bf..544f524 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -204,7 +204,7 @@ endif
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
@@ -224,14 +224,14 @@ endef
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
-				host-toolchain $(1),\
+$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-gettext \
+				host-libtool host-toolchain $(1),\
     $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 
 ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
-$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+$(2)_DEPENDENCIES += host-automake host-autoconf host-gettext host-libtool
 endif
 
 #
-- 
1.8.5.5
