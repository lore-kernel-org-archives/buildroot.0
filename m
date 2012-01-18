From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:51 +0100
Subject: [Buildroot] [git commit] Only derrive HOST_FOO_DEPENDENCIES from
	FOO_DEPENDENCIES if not set, not nonempty
Message-ID: <20120118150407.81D8A90383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b07928aa647074f790a01f0302f241391b5c923
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In make, ifndef VAR means if 'VAR is not set to the empty string', and
NOT 'VAR is not defined', which meant that you couldn't specify empty
FOO_HOST_DEPENDENCIES.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    7 ++-----
 package/Makefile.package.in   |    6 +-----
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 495a075..0f9b2c6 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -203,12 +203,9 @@ endef
 # This must be repeated from GENTARGETS_INNER, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-ifndef $(2)_DEPENDENCIES
- ifdef $(3)_DEPENDENCIES
-  $(2)_DEPENDENCIES = $(filter-out host-automake host-autoconf host-libtool,\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool,\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
- endif
-endif
+
 
 ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index a27804b..e57bfed 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -542,11 +542,7 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
 endif
 endif
 
-ifndef $(2)_DEPENDENCIES
- ifdef $(3)_DEPENDENCIES
-  $(2)_DEPENDENCIES = $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
- endif
-endif
+$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
