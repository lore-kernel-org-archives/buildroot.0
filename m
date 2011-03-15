From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 Mar 2011 08:27:07 +0100
Subject: [Buildroot] [PATCH 2 of 3] Allow BR2_PRIMARY_SITE and
 BR2_BACKUP_SITE to be a file:// URL
In-Reply-To: <patchbomb.1300174025@localhost6.localdomain6>
References: <patchbomb.1300174025@localhost6.localdomain6>
Message-ID: <0aa192a871d0b6d66c57.1300174027@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/Makefile.package.in |  14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -198,9 +198,14 @@
 # $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
 ################################################################################
 
+geturischeme=$(firstword $(subst ://, ,$(call qstrip,$(1))))
+
 define DOWNLOAD
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ; \
+		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
+			file) $(call $(DL_MODE)_FILE,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+		esac ; \
 	fi ; \
 	if test -n "$(1)" ; then \
 		case "$($(PKG)_SITE_METHOD)" in \
@@ -212,7 +217,10 @@
 		esac ; \
 	fi ; \
 	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ; \
+		case "$(call geturischeme,$(BR2_BACKUP_SITE))" in \
+			file) $(call $(DL_MODE)_FILE,$(BR2_BACKUP_SITE),$(2)) && exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE),$(2)) && exit ;; \
+		esac ; \
 	fi ; \
 	exit 1
 endef
@@ -419,7 +427,7 @@
   $(2)_SITE_METHOD = $($(3)_SITE_METHOD)
  else
 	# Try automatic detection using the scheme part of the URI
-	$(2)_SITE_METHOD = $(firstword $(subst ://, ,$(call qstrip,$($(2)_SITE))))
+	$(2)_SITE_METHOD = $(call geturischeme,$($(2)_SITE))
  endif
 endif
 
