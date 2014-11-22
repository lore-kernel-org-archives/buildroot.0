From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:35:58 +0100
Subject: [Buildroot] [git commit branch/next] pkg-autotools: move the
	libtool patching call out of the autoreconf hook
Message-ID: <20141122195743.4051F7FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2ae901036897bd9b4a0c3b2835a70667c076bf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Call it as a standalone hook, like is done for post-patch.

[Thomas: change back the author to Johan. Yann mistakenly changed it
when submitting the patch series.]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998 at free.fr: split the patch into semantically separate
patches]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-autotools.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
 
