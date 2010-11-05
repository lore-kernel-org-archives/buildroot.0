From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] package: move autoreconfigure
	step to pre configure hook
Message-ID: <20101105092847.91EBD8DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89d1ad91fe4b1b65f0e902f94aba99a6cefbf631
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: update documentation to match]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html           |    1 +
 package/Makefile.autotools.in |    2 +-
 package/Makefile.package.in   |    2 ++
 3 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 00808ff..a94e7be 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1123,6 +1123,7 @@ endef
 
     <ul>
       <li><code>LIBFOO_POST_PATCH_HOOKS</code></li>
+      <li><code>LIBFOO_PRE_CONFIGURE_HOOKS</code></li>
       <li><code>LIBFOO_POST_CONFIGURE_HOOKS</code></li>
       <li><code>LIBFOO_POST_BUILD_HOOKS</code></li>
       <li><code>LIBFOO_POST_INSTALL_HOOKS</code> (for host packages only)</li>
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index b24c2b1..3e21369 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -177,7 +177,7 @@ define AUTORECONF_HOOK
 endef
 
 ifeq ($$($(2)_AUTORECONF),YES)
-$(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
+$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
 
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 377df65..816a013 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -261,6 +261,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Configuring")
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -410,6 +411,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 # post-steps hooks
 $(2)_POST_EXTRACT_HOOKS         ?=
 $(2)_POST_PATCH_HOOKS           ?=
+$(2)_PRE_CONFIGURE_HOOKS        ?=
 $(2)_POST_CONFIGURE_HOOKS       ?=
 $(2)_POST_BUILD_HOOKS           ?=
 $(2)_POST_INSTALL_HOOKS         ?=
-- 
1.7.1
