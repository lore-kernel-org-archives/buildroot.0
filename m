From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:19 +0200
Subject: [Buildroot] [PATCH 05/35] pkg-generic: allow full URLs for
	<pkg>_EXTRA_DOWNLOADS
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current logic for <pkg>_EXTRA_DOWNLOADS assumes that it is a list
of files, all hosted at <pkg>_SITE. However, just like for
<pkg>_PATCH, it may be useful to specify <pkg>_EXTRA_DOWNLOADS entries
that are hosted on a different site than the package <pkg>_SITE.

This commit implements this, by re-using the same logic as the one
used for <pkg>_PATCH.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
 package/pkg-generic.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3c86878..22b3fb9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -81,7 +81,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	done
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
+	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
+		$(if $(findstring ://,$(p)),\
+			$(call DOWNLOAD,$(p)),\
+			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
+		)\
+	$(sep))
 	$(foreach p,$($(PKG)_PATCH),\
 		$(if $(findstring ://,$(p)),\
 			$(call DOWNLOAD,$(p)),\
-- 
2.1.0
