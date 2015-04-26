From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:51:03 +0200
Subject: [Buildroot] [git commit] pkg-download: extend DOWNLOAD_INNER,
	add a SOURCE_CHECK macro
Message-ID: <20150426202108.3D8A381734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=224a591d6f7ff5b63654b12f01b22634bdfae153
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As part of moving to a package infrastructure based source-check
implementation, we are going to move away from the global DL_MODE
variable to select the behavior of the DOWNLOAD_INNER macro.

As a preparation to this, this commit makes the DOWNLOAD_INNER macro
take a third argument, which is the action to be done: either DOWNLOAD
or SOURCE_CHECK. For now, the DOWNLOAD macro passes $(DL_MODE) as this
third argument, in order to keep the existing behavior.

In addition, a SOURCE_CHECK macro is added, which calls DOWNLOAD_INNER
with the appropriate action. This macro will be used in the upcoming
package infra based implementation of source-check.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested by doing a "make source" on a randpackageconfig]
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-download.mk |   28 ++++++++++++++++------------
 1 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index eee9e59..76afced 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -212,14 +212,18 @@ endef
 ################################################################################
 
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)))
+	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),$(DL_MODE))
+endef
+
+define SOURCE_CHECK
+	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),SOURCE_CHECK)
 endef
 
 define DOWNLOAD_INNER
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
-			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
-			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
+			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
+			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
 	if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
@@ -232,18 +236,18 @@ define DOWNLOAD_INNER
 			scheme="$($(PKG)_SITE_METHOD)" ; \
 		fi ; \
 		case "$$scheme" in \
-			git) $($(DL_MODE)_GIT) && exit ;; \
-			svn) $($(DL_MODE)_SVN) && exit ;; \
-			cvs) $($(DL_MODE)_CVS) && exit ;; \
-			bzr) $($(DL_MODE)_BZR) && exit ;; \
-			file) $($(DL_MODE)_LOCALFILES) && exit ;; \
-			scp) $($(DL_MODE)_SCP) && exit ;; \
-			hg) $($(DL_MODE)_HG) && exit ;; \
-			*) $(call $(DL_MODE)_WGET,$(1),$(2)) && exit ;; \
+			git) $($(3)_GIT) && exit ;; \
+			svn) $($(3)_SVN) && exit ;; \
+			cvs) $($(3)_CVS) && exit ;; \
+			bzr) $($(3)_BZR) && exit ;; \
+			file) $($(3)_LOCALFILES) && exit ;; \
+			scp) $($(3)_SCP) && exit ;; \
+			hg) $($(3)_HG) && exit ;; \
+			*) $(call $(3)_WGET,$(1),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
 	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call $(DL_MODE)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
+		$(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(2),$(2)) && exit ; \
 	fi ; \
 	exit 1
 endef
