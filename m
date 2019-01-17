From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 17 Jan 2019 22:14:22 +0100
Subject: [Buildroot] [RFC PATCH 1/1] package/googlefontdirectory: change to
 google repo
Message-ID: <20190117211422.14576-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As because the current repository doesn't support new fonts
we need to change it to the new one official google github repository
which contains a lot of new available fonts.

Note: There are some things to improve like license files
because in the new repository every directory with font
contains separate license file however I have no idea
how to do it in proper way.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 .../googlefontdirectory.hash                  |  2 +-
 .../googlefontdirectory.mk                    | 23 +++++++++++--------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/package/googlefontdirectory/googlefontdirectory.hash b/package/googlefontdirectory/googlefontdirectory.hash
index 6b15b2b8b7..e77ee3d7cb 100644
--- a/package/googlefontdirectory/googlefontdirectory.hash
+++ b/package/googlefontdirectory/googlefontdirectory.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8a7d04feef21fdfc09d90cd3e2c0c05dcb2fdd4e15f971e8ceaf4d90c1c123cd googlewebfonts.tgz
+sha256 ec2ddbeee673cce1b0796e3b20fbff5fd836ce9ba6d88deed8b59154fa255f06  googlefontdirectory-94dff3eaa9301b6640cccc63c56d6ff33d82882c.tar.gz
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index c34de3b0fe..3a78b0588b 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -4,20 +4,25 @@
 #
 ################################################################################
 
-GOOGLEFONTDIRECTORY_SITE = \
-	https://s3.amazonaws.com/joemaller_google_webfonts
-GOOGLEFONTDIRECTORY_SOURCE = googlewebfonts.tgz
-GOOGLEFONTDIRECTORY_LICENSE = OFL-1.1
+GOOGLEFONTDIRECTORY_VERSION = 94dff3eaa9301b6640cccc63c56d6ff33d82882c
+GOOGLEFONTDIRECTORY_SITE = $(call github,google,fonts,$(GOOGLEFONTDIRECTORY_VERSION))
+GOOGLEFONTDIRECTORY_LICENSE = OFL-1.1 (ofl) Apache-2.0 (apache) UFL-1.0 (ufl)
+GOOGLEFONTDIRECTORY_LICENSE_FILES = LICENCE OFL
+GOOGLEFONTDIRECTORY_DIRECTORIES_LIST = apache ofl ufl
 
 GOOGLEFONTDIRECTORY_FONTS = \
 	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
 
 define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
-	for i in $(GOOGLEFONTDIRECTORY_FONTS); \
-	do \
-		$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
-		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf || exit 1; \
-	done
+	$(foreach d,$(GOOGLEFONTDIRECTORY_DIRECTORIES_LIST),\
+		for i in $(GOOGLEFONTDIRECTORY_FONTS); \
+		do \
+			if font -d $(@D)/$(d)/$$i ; then \
+				$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
+				$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$(d)/$$i/*.ttf ; \
+			fi  \
+		done
+	)
 endef
 
 $(eval $(generic-package))
-- 
2.20.1
