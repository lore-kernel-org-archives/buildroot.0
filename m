From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 23:07:43 +0200
Subject: [Buildroot] [git commit] rtai: install to staging
Message-ID: <20140412211016.318479C740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=924c9328d36f6004b93d05cbca10433ac0a6cb15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building RTAI userspace applications requires having the RTAI headers
and libraries installed to the staging directory, so this patch adds
RTAI_INSTALL_STAGING = YES.

In addition, this patch fixes up the rtai-config script, but does that
manually, because the rtai-config script doesn't match the convention
that the common <pkg>_CONFIG_SCRIPTS logic is designed for. It also
specifies a special directory for the RTAI headers, so that they don't
get mixed up with kernel headers.

Finally, it updates the RTAI download address to use the new correct
location.

[Thomas: fix commit log.]

Signed-off-by: Andrew Barnes <andy@outsideglobe.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rtai/rtai.mk |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index c24fa41..72327b0 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,11 +6,20 @@
 
 RTAI_VERSION = 3.8.1
 RTAI_SOURCE  = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE    = http://www.rtai.org/RTAI/
+RTAI_SITE    = https://www.rtai.org/userfiles/downloads/RTAI/
+RTAI_INSTALL_STAGING = YES
+
+# The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
+define RTAI_POST_PATCH_FIXUP
+	(SED) 's%^staging=.*%staging=$(STAGING_DIR)%' $(STAGING_DIR)/usr/bin/rtai-config
+endef
+
+RTAI_POST_INSTALL_STAGING_HOOKS += RTAI_POST_PATCH_FIXUP
 
 RTAI_DEPENDENCIES = linux
 
 RTAI_CONF_OPT = \
+	--includedir=/usr/include/rtai \
 	--with-linux-dir=$(LINUX_DIR) 	\
 	--disable-leds		      	\
 	--disable-rtailab		\
