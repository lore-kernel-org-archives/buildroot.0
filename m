From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 16:48:56 +0100
Subject: [Buildroot] [git commit] linux/linux.mk: fixed downloading kernel
	patches
Message-ID: <20150114154902.3E54480142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9d575e0b2e2be130be7e92955bac92afc23c10c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches located at ftp or http(s) URLs were downloaded using DOWNLOAD
macro. For example, if linux source was located at external git
repository, DOWNLOAD macro uses git scheme as well and buildroot
tried to downlod a path using DOWNLOAD_GIT macro. As a result, nothing
was downloaded and build siletly passes.

Patches located at mentioned URLs is now downloaded directly with
DOWNLOAD_WGET macro.

Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
