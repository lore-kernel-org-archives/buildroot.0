From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2016 09:17:38 +0100
Subject: [Buildroot] [git commit] gstreamer1: don't rely on a recent
	coreutils for relative symlink support
Message-ID: <20160202081741.8D6C181696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c15f70488b4b5fd132ccf27cc6ab556ba410e387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3ae/3ae368cfd0ecd7be4c7e864590ec5dbf79d576ac/
http://autobuild.buildroot.net/results/4c9/4c951f31984e0eff21fc165cb68065f527c237e6/

And many more.

The recent change to create the legacy gstconfig.h symlink using ln -srf
unfortunately breaks on older distributions as it was only added in
coreutils 8.16 (2012).

Instead, "manually" create the relative symlink.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 0eb46e8..b788160 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -41,8 +41,8 @@ GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 # updated to look in the correct location.
 # Add a symlink to the legacy location
 define GSTREAMER1_LEGACY_CGSTCONFIG_H
-	ln -srf $(STAGING_DIR)/usr/lib/gstreamer-1.0/include/gst/gstconfig.h \
-	       $(STAGING_DIR)/usr/include/gstreamer-1.0/gst/gstconfig.h
+	cd $(STAGING_DIR)/usr/include/gstreamer-1.0/gst && \
+		ln -sf ../../../lib/gstreamer-1.0/include/gst/gstconfig.h .
 endef
 GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_LEGACY_CGSTCONFIG_H
 
