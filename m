From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:55:31 +0200
Subject: [Buildroot] [PATCH 1 of 5] Support URI schemes in DOWNLOAD function,
 when not using gentargets
In-Reply-To: <patchbomb.1316588130@localhost6.localdomain6>
References: <patchbomb.1316588130@localhost6.localdomain6>
Message-ID: <073328f576445d4e02ea.1316588131@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the gentargets/autotools/cmake infrastructure, the DOWNLOAD function
uses an appropriate download method based on $(PKG)_SITE_METHOD, which is
autodetected based on the URI if none was explicitly set.
When the DOWNLOAD function is called directly, when not using gentargets, the
SITE_METHOD is not autodetected, and thus the download defaults to wget.

This patch adds URI scheme detection directly to the DOWNLOAD method, in case
no SITE_METHOD was detected yet.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/Makefile.package.in |  10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -85,6 +85,9 @@
 DL_DIR:=$(TOPDIR)/dl
 endif
 
+# URI scheme helper function
+geturischeme=$(firstword $(subst ://, ,$(call qstrip,$(1))))
+
 ################################################################################
 # The DOWNLOAD_{GIT,SVN,BZR} helpers are in charge of getting a
 # working copy of the source repository for their corresponding SCM,
@@ -189,7 +192,12 @@
 		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
 	fi ; \
 	if test -n "$(1)" ; then \
-		case "$($(PKG)_SITE_METHOD)" in \
+		if test -z "$($(PKG)_SITE_METHOD)" ; then \
+			scheme="$(call geturischeme,$(1))" ; \
+		else \
+			scheme="$($(PKG)_SITE_METHOD)" ; \
+		fi ; \
+		case "$$scheme" in \
 			git) $($(DL_MODE)_GIT) && exit ;; \
 			svn) $($(DL_MODE)_SVN) && exit ;; \
 			bzr) $($(DL_MODE)_BZR) && exit ;; \
