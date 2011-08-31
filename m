From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:29:12 +0200
Subject: [Buildroot] [PATCH 04/16] package: add <pkg>-rebuild and
	<pkg>-reconfigure
In-Reply-To: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
Message-ID: <550d3ba3c9db7d0a9df78aa52e09da9af93e20d8.1314826051.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are often asked "how can I restart the build of a package ?" or
"how can I restart the build of package from the configure part
?". Obviously, tweaking with stamp files is possible, but not very
user friendly.

Therefore this patch adds two new per-package targets: <pkg>-rebuild
and <pkg>-reconfigure. They will remove the right stamp files and
restart the complete build process (by using the 'all' target, so that
not only the package is reconfigured, recompiled and reinstalled, but
the root filesystem images are also regenerated).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1de2838..7af689d 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -555,6 +555,22 @@ $(1)-clean:		$(1)-uninstall \
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-clean-for-rebuild:
+ifneq ($$($(2)_OVERRIDE_SRCDIR),)
+			rm -f $$($(2)_TARGET_RSYNC)
+endif
+			rm -f $$($(2)_TARGET_BUILD)
+			rm -f $$($(2)_TARGET_INSTALL_STAGING)
+			rm -f $$($(2)_TARGET_INSTALL_TARGET)
+			rm -f $$($(2)_TARGET_INSTALL_HOST)
+
+$(1)-rebuild:		$(1)-clean-for-rebuild all
+
+$(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
+			rm -f $$($(2)_TARGET_CONFIGURE)
+
+$(1)-reconfigure:	$(1)-clean-for-reconfigure all
+
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
-- 
1.7.4.1
