From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 17 Apr 2020 16:29:21 -0700
Subject: [Buildroot] [PATCH 3/4] package/openjdk: copy all directories and
 files when installing
In-Reply-To: <20200417232922.3762195-1-aduskett@gmail.com>
References: <20200417232922.3762195-1-aduskett@gmail.com>
Message-ID: <20200417232922.3762195-3-aduskett@gmail.com>
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
    require.

  - release
    This directory contains a list of modules included in the image.

Because these directories take up less than of megabyte extra, it is not an
issue to install all of them.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/openjdk.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index d540b65edc..19e71e98b2 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -124,9 +124,7 @@ endef
 # which makes manual installation necessary.
 define OPENJDK_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/bin/ \
-		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
-	cp -dpfr $(@D)/build/linux-*-release/images/jre/lib/ \
+	cp -dpfr $(@D)/build/linux-*-release/images/jre/* \
 		$(TARGET_DIR)/$(OPENJDK_INSTALL_BASE)
 	cd $(TARGET_DIR)/usr/bin && ln -snf ../../$(OPENJDK_INSTALL_BASE)/bin/* .
 endef
-- 
2.25.2
