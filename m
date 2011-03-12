From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Mar 2011 22:27:06 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile.package.in: make
	<pkg>_SOURCE optional
Message-ID: <20110312212828.3BBB78FFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7266ed46535c4195e2f5cbd644bc5745992b043e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For packages where the sources are included in buildroot (E.G. makedevs).
We unfortunately already use no <pkg>_SOURCE to mean <pkg>_<version>.tar.gz,
in several packages (and for git/svn/bzr support), so you need to
define <pkg>_SOURCE to the empty string to use it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 92ce4e2..84687d5 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -232,7 +232,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE)))
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
@@ -243,8 +243,8 @@ endif
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
-	$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
-	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
 # some packages have messed up permissions inside
 	$(Q)chmod -R ug+rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
-- 
1.7.3.4
