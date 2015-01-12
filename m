From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Mon, 12 Jan 2015 17:37:26 +0100
Subject: [Buildroot] [PATCH 2/2] linux/linux.mk: fixed downloading kernel
	patches
In-Reply-To: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
References: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
Message-ID: <1421080646-26230-2-git-send-email-ivo.slanina@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches located at ftp or http(s) URLs were downloaded using DOWNLOAD
macro. For example, if linux source was located at external git
repository, DOWNLOAD macro uses git scheme as well and buildroot
tried to downlod a path using DOWNLOAD_GIT macro. As a result, nothing
was downloaded and build siletly passes.

Patches located at mentioned URLs is now downloaded directly with
DOWNLOAD_WGET macro.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
---
 linux/linux.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d02b02b..29f59e8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -148,7 +148,7 @@ define LINUX_DOWNLOAD_PATCHES
 	$(if $(LINUX_PATCHES),
 		@$(call MESSAGE,"Download additional patches"))
 	$(foreach patch,$(filter ftp://% http://% https://%,$(LINUX_PATCHES)),\
-		$(call DOWNLOAD,$(patch))$(sep))
+		$(call DOWNLOAD_WGET,$(patch),$(notdir $(patch)))$(sep))
 endef
 
 LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
-- 
1.7.10.4
