From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  3 Oct 2011 23:20:37 +0200
Subject: [Buildroot] [PATCH 01/22] package: derive HOST_FOO_DEPENDENCIES
	from FOO_DEPENDENCIES
In-Reply-To: <1317676858-3407-1-git-send-email-arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
Message-ID: <1317676858-3407-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Unfortunately, duplication is needed for autotools because it updates
FOO_DEPENDENCIES.
---
 package/Makefile.autotools.in |   10 ++++++++++
 package/Makefile.package.in   |    7 ++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 3f523dc..a1d4fa5 100644
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
index b5ef57b..91dda1a 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -478,7 +478,12 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
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
-- 
1.7.6.3
