From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 01 Mar 2012 13:06:42 -0000
Subject: [Buildroot] [git commit] Makefile: use /etc/os-release for version
	info rather than /etc/br-version
Message-ID: <20120301130635.0DDAD90BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=451a887894faddef019e9a0628c21b5f2e9eee56
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/etc/os-release is becoming a standard interface for distribution
name/version info, so let's use that instead of the nonstandard
/etc/br-version. Format of the file is something like:

NAME=Buildroot
VERSION=2012.02-rc1-00003-g2d10e81
ID=buildroot
VERSION_ID=2012.02-rc1
PRETTY_NAME="Buildroot 2012.02-rc1"

For more details, see:

http://0pointer.de/public/systemd-man/os-release.html

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 7d8dd2e..8a8b676 100644
--- a/Makefile
+++ b/Makefile
@@ -477,7 +477,13 @@ endif
 	else \
 		/sbin/ldconfig -r $(TARGET_DIR); \
 	fi
-	echo $(BR2_VERSION_FULL) > $(TARGET_DIR)/etc/br-version
+	( \
+		echo "NAME=Buildroot"; \
+		echo "VERSION=$(BR2_VERSION_FULL)"; \
+		echo "ID=buildroot"; \
+		echo "VERSION_ID=$(BR2_VERSION)"; \
+		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
+	) >  $(TARGET_DIR)/etc/os-release
 
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
