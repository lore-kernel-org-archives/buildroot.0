From: Karoly Kasza <kaszak@gmail.com>
Date: Fri, 17 Oct 2014 20:25:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-autotools.mk: add host-m4
	dependency
Message-ID: <1413570319-55465-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-autoconf depends on host-m4, which is not reflected in
package/pkg-autotools.mk. This obstructs "make source" from running
host-m4-source, making offline builds fail while trying to download
it before building host-autoconf.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/pkg-autotools.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 2c93dd9..77bf696 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -248,7 +248,7 @@ endef
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # and _GETTEXTIZE away from the non-host rule
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool \
+$(2)_DEPENDENCIES ?= $$(filter-out host-automake host-autoconf host-libtool host-m4 \
 				host-gettext host-toolchain $(1),\
     $$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
@@ -260,7 +260,7 @@ $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
 $(2)_DEPENDENCIES += host-gettext
 endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
-$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool host-m4
 endif
 
 #
-- 
1.7.10.4
