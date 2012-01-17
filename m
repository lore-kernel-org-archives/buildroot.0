From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:28:47 +0100
Subject: [Buildroot] [git commit] package: derive HOST_FOO_DEPENDENCIES from
	FOO_DEPENDENCIES
Message-ID: <20120117224424.232BB9036D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbc53fa8446a4106eb666310f19a9bfbd0b4f3c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |   10 ++++++++++
 package/Makefile.package.in   |    7 ++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index c84afa0..495a075 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -200,6 +200,16 @@ define AUTORECONF_HOOK
 	fi
 endef
 
+# This must be repeated from GENTARGETS_INNER, otherwise we get an empty
+# _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
+# away from the non-host rule
+ifndef $(2)_DEPENDENCIES
+ ifdef $(3)_DEPENDENCIES
+  $(2)_DEPENDENCIES = $(filter-out host-automake host-autoconf host-libtool,\
+    $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ endif
+endif
+
 ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e85eb15..a27804b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -542,7 +542,12 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
 endif
 endif
 
-$(2)_DEPENDENCIES		?=
+ifndef $(2)_DEPENDENCIES
+ ifdef $(3)_DEPENDENCIES
+  $(2)_DEPENDENCIES = $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+ endif
+endif
+
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
 $(2)_INSTALL_TARGET		?= YES
