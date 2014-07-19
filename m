From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:35:22 +0200
Subject: [Buildroot] [git commit] infra/pkg-autotools: cleanup the
	gettextize step
Message-ID: <20140719093552.7A0B39D286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bea8f267d550290c994d9616b98bb9c1cd9e03ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Align the way we call gettextize to the way we call autoreconf:
  - provide the $(GETTEXTIZE) variable
  - pass $(HOST_CONFIGURE_OPTS) in the environment
  - pass the fully-qualified path to autom4te
  - use of -f even if the package provides its own options

Some eye-candy in the output of gettextize.

Thanks to Gustavo for pointing out the discrepancy between the way we
call gettextize and the way we call autoreconf, and to Thomas for the
live debug session. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    8 ++++++++
 package/pkg-autotools.mk   |   10 +++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index c8ef765..121d25d 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -57,6 +57,12 @@ endef
 
 GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_UNNEEDED
 
+define GETTEXT_GETTEXTIZE_EYE_CANDY
+	$(SED) '/Press Return\|read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+endef
+
+HOST_GETTEXT_POST_INSTALL_HOOKS += GETTEXT_GETTEXTIZE_EYE_CANDY
+
 # Force build with NLS support, otherwise libintl is not built
 # This is needed because some packages (eg. libglib2) requires
 # locales, but do not properly depend on BR2_ENABLE_LOCALE, and
@@ -72,5 +78,7 @@ define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 endef
 HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 
+GETTEXTIZE = $(HOST_CONFIGURE_OPTS) AUTOM4TE=$(HOST_DIR)/usr/bin/autom4te $(HOST_DIR)/usr/bin/gettextize -f
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 557413d..53bca30 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -95,12 +95,8 @@ ifndef $(2)_GETTEXTIZE
  endif
 endif
 
-ifndef $(2)_GETTEXTIZE_OPT
- ifdef $(3)_GETTEXTIZE_OPT
-  $(2)_GETTEXTIZE_OPT = $$($(3)_GETTEXTIZE_OPT)
- else
-  $(2)_GETTEXTIZE_OPT ?= -f
- endif
+ifeq ($(4),host)
+ $(2)_GETTEXTIZE_OPT ?= $$($(3)_GETTEXTIZE_OPT)
 endif
 
 ifeq ($(4),host)
@@ -220,7 +216,7 @@ endif
 #
 define GETTEXTIZE_HOOK
 	@$$(call MESSAGE,"Gettextizing")
-	$(Q)cd $$($$(PKG)_SRCDIR) && $(HOST_DIR)/usr/bin/gettextize $$($$(PKG)_GETTEXTIZE_OPT)
+	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPT)
 endef
 
 #
