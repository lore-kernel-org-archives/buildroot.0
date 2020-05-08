From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 09:23:03 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjdk: copy all
 directories and files when installing
Message-ID: <20200508080227.6E99A90FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0282033f42d4360b0f379cf01f12c1155d957f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Several directories and files are currently not installed during the
target installation, these include:
  - conf
    Several configuration files, including security configuration files which
    may be necessary for running various java applications.

  - legal
    This directory contains legal notices that some java applications may
    require, as they may print legal information and will throw exceptions at
    runtime if the legal files are not present on the system.

  - release
    This file contains a list of modules included in the image.

Because these directories take up less than of megabyte extra, it is not an
issue to install all of them.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Tested-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 63b576095b1dbabaf15a6eee7ceabed6d868a707)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/openjdk.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e58757b2ed..1f906517fe 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -123,9 +123,7 @@ endef
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
-		$(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
+	cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
 		$(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
 	cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/* .
 endef
