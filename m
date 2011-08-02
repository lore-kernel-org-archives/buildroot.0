From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 02 Aug 2011 20:33:16 +0200
Subject: [Buildroot] [PATCH 2 of 5] Support URI schemes in DOWNLOAD function,
 when not using gentargets
In-Reply-To: <patchbomb.1312309994@localhost6.localdomain6>
References: <patchbomb.1312309994@localhost6.localdomain6>
Message-ID: <296a0d99c3bf2ff0c098.1312309996@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using the gentargets/autotools/cmake infrastructure, the DOWNLOAD function uses an appropriate download method based on $(PKG)_SITE_METHOD, which is autodetected based on the URI if none was explicitly set.
When the DOWNLOAD function is called directly, when not using gentargets, the SITE_METHOD is not autodetected, and thus the download defaults to wget.

This patch adds URI scheme detection directly to the DOWNLOAD method, in case no SITE_METHOD was detected yet.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -184,12 +184,19 @@
 # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
 ################################################################################
 
+geturischeme=$(firstword $(subst ://, ,$(call qstrip,$(1))))
+
 define DOWNLOAD
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
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
