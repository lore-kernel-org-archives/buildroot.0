From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 07:52:03 +0200
Subject: [Buildroot] [PATCH 04/12] package: add <pkg>-rebuild and
	<pkg>-reconfigure
In-Reply-To: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c2f2d67a5161a763ebd6738c28c27e470d0e0dbd.1311141087.git.thomas.petazzoni@free-electrons.com>
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
 package/Makefile.package.in |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index c22c104..96ed9a7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -555,6 +555,19 @@ $(1)-clean:		$(1)-uninstall \
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-clean-for-rebuild:
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
