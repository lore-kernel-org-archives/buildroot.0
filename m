From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 27 Sep 2015 11:39:22 +0200
Subject: [Buildroot] [PATCH v2 2/4] pkg-generic: prevent _SITE URLs with a
	trailing slash
In-Reply-To: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
References: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1443346764-7433-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the recommended form for URLs. Buildroot will add a slash between
FOO_SITE and FOO_SOURCE as appropriate.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6a7d97efdf02..5ec2f807b137 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -70,6 +70,8 @@ endif
 
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
+	@(echo "$($(PKG)_SITE)" | grep -Eq "[^/]$$" && true || \
+		(echo "$(PKG)_SITE ($($(PKG)_SITE)) cannot have a trailing slash" && false))
 	$(foreach hook,$($(PKG)_PRE_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 # Only show the download message if it isn't already downloaded
 	$(Q)for p in $($(PKG)_ALL_DOWNLOADS); do \
-- 
1.9.1
