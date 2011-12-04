From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Dec 2011 20:27:21 +0100
Subject: [Buildroot] [git commit] dependencies: check for extract tools as
	well
Message-ID: <20111204192810.3EF7B8F790@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c6390a5d0c01420879e9f23bc89afb19976da4a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most of the extract tools (gzip/bzip/..) we already check for explicitly
in dependencies.sh (as they are used outside GENTARGETS), but not for
xzcat.
The .xz format is used fairly rarely, and it is likely to not be available
on build hosts, so an explicit (hardcoded) check for it isn't optimal.
Instead, add the inflate tools used to DL_TOOLS_DEPENDENCIES, similar to
how we do it for svn/git/bzr/...

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in            |    2 ++
 toolchain/dependencies/dependencies.mk |    8 +-------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 2349b05..e85eb15 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -726,6 +726,8 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 endif # SITE_METHOD
 
+DL_TOOLS_DEPENDENCIES += $(firstword $(INFLATE$(suffix $($(2)_SOURCE))))
+
 endif # $(2)_KCONFIG_VAR
 endef # GENTARGETS_INNER
 
diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
index 24d6666..ea8bf25 100644
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -10,16 +10,10 @@ ifeq ($(BR2_STRIP_sstrip),y)
 DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
 
-# Remove duplicate entries from $(DL_TOOLS_DEPENDENCIES)
-DL_TOOLS = \
-	$(findstring svn,$(DL_TOOLS_DEPENDENCIES)) \
-	$(findstring git,$(DL_TOOLS_DEPENDENCIES)) \
-	$(findstring bzr,$(DL_TOOLS_DEPENDENCIES))
-
 core-dependencies:
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		CONFIG_FILE="$(CONFIG_DIR)/.config" \
-		DL_TOOLS="$(DL_TOOLS)" \
+		DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
