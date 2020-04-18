From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 18 Apr 2020 12:07:00 -0700
Subject: [Buildroot] [PATCH v2 2/3] package/openjdk: copy all directories
 and files when installing
In-Reply-To: <20200418190701.2629613-1-aduskett@gmail.com>
References: <20200418190701.2629613-1-aduskett@gmail.com>
Message-ID: <20200418190701.2629613-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

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
---
Changes v1 -> v2:
  - Added a better explination for why the legal directory is necessary.

 package/openjdk/openjdk.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index a06a8a7307..ffa62dd10d 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -123,10 +123,8 @@ endef
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
-		$(TARGET_DIR)$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
-		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)/
+	cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
+		$(TARGET_DIR)$(OPENJDK_INSTALL_BASE)/
 	cd $(TARGET_DIR)/usr/bin && ln -snf ../..$(OPENJDK_INSTALL_BASE)/bin/* .
 endef
 
-- 
2.25.2
