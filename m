From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 22:18:14 +0200
Subject: [Buildroot] [git commit] package: add a PRE_PATCH_HOOKS hook point
Message-ID: <20110920202237.A479C8D723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33518020ba93b739252f6d7f82bc48e6cbf3100a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be useful to integrate Xenomai and RTAI into Buildroot, so
that they can patch the kernel before the normal patching process
starts.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 66be0a2..e2d0e28 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -259,6 +259,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
+	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
@@ -443,6 +444,7 @@ $(2)_EXTRACT_CMDS ?= \
 # post-steps hooks
 $(2)_POST_DOWNLOAD_HOOKS        ?=
 $(2)_POST_EXTRACT_HOOKS         ?=
+$(2)_PRE_PATCH_HOOKS            ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_PRE_CONFIGURE_HOOKS        ?=
 $(2)_POST_CONFIGURE_HOOKS       ?=
