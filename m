From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 23:48:12 +0200
Subject: [Buildroot] [PATCH 3/4] package: add <pkg>-rebuild and
	<pkg>-reconfigure
In-Reply-To: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <67a2cdbdc6a1428ad1d218b1fea95350a593947c.1305755245.git.thomas.petazzoni@free-electrons.com>
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
and <pkg>-reconfigure. They will respectively restart the
build/install or the configure/build/install of the package <pkg>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 702395a..8abfd8b 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -501,6 +501,19 @@ $(1)-clean:		$(1)-uninstall \
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-clean-for-rebuild:
+			rm -f $$($(2)_TARGET_BUILD)
+			rm -f $$($(2)_TARGET_INSTALL_STAGING)
+			rm -f $$($(2)_TARGET_INSTALL_TARGET)
+			rm -f $$($(2)_TARGET_INSTALL_HOST)
+
+$(1)-rebuild:		$(1)-clean-for-rebuild $(1)
+
+$(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
+			rm -f $$($(2)_TARGET_CONFIGURE)
+
+$(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
+
 # define the PKG variable for all targets, containing the
 # uppercase package variable prefix
 $$($(2)_TARGET_INSTALL_TARGET):		PKG=$(2)
-- 
1.7.1
