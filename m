From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:50 +0100
Subject: [Buildroot] [PATCH 04/24 v3] pkg-autotools: move the libtool
	patching call out of the autoreconf hook
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <6ea40a37507892ad093c4a13acf3b5a9dae346c2.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Call it as a standalone hook, like is done for post-patch.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: split the patch into semantically separate
patches]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-autotools.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 393f995..45947b0 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -98,7 +98,6 @@ endef
 define AUTORECONF_HOOK
 	@$(call MESSAGE,"Autoreconfiguring")
 	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
-	$(call PATCH_LIBTOOL,$($(PKG)_SRCDIR))
 endef
 
 ################################################################################
@@ -260,6 +259,10 @@ $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
 $(2)_DEPENDENCIES += host-gettext
 endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
+# default values are not evaluated yet, so don't rely on this defaulting to YES
+ifneq ($$($(2)_LIBTOOL_PATCH),NO)
+$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
+endif
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
 
-- 
1.9.1
