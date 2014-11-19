From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Nov 2014 10:01:35 +0100
Subject: [Buildroot] [git commit] live555: add support for building dynamic
	libraries
Message-ID: <20141201104836.741367FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d6728ac2c42abbf3a9233fb8f473959f4d5be74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both config.linux and config.linux-with-shared-libraries already exist
in upstream code. We are only appending to these files to override
some variables. The linux-with-shared-libraries variant defines a few
additional variables needed for dynamic linking (library version,
installation target).

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/live555/live555.mk |   26 +++++++++++++++++++-------
 1 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 8c31a08..b923388 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -13,18 +13,30 @@ LIVE555_INSTALL_STAGING = YES
 
 LIVE555_CFLAGS = $(TARGET_CFLAGS)
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+LIVE555_CONFIG_TARGET = linux
+LIVE555_LIBRARY_LINK = $(TARGET_AR) cr
+else
+LIVE555_CONFIG_TARGET = linux-with-shared-libraries
+LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
+endif
+
 ifndef ($(BR2_ENABLE_LOCALE),y)
 LIVE555_CFLAGS += -DLOCALE_NOT_USED
 endif
 
 define LIVE555_CONFIGURE_CMDS
-	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(LIVE555_CFLAGS)' >> $(@D)/config.linux
-	echo 'C_COMPILER = $(TARGET_CC)' >> $(@D)/config.linux
-	echo 'CPLUSPLUS_COMPILER = $(TARGET_CXX)' >> $(@D)/config.linux
-	echo 'LINK = $(TARGET_CXX) -o' >> $(@D)/config.linux
-	echo 'LINK_OPTS = -L. $(TARGET_LDFLAGS)' >> $(@D)/config.linux
-	echo 'PREFIX = /usr' >> $(@D)/config.linux
-	(cd $(@D); ./genMakefiles linux)
+	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(LIVE555_CFLAGS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	echo 'C_COMPILER = $(TARGET_CC)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	echo 'CPLUSPLUS_COMPILER = $(TARGET_CXX)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+
+	echo 'LINK = $(TARGET_CXX) -o' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	echo 'LINK_OPTS = -L. $(TARGET_LDFLAGS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	echo 'PREFIX = /usr' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	# Must have a whitespace at the end of LIBRARY_LINK, otherwise static link
+	# fails
+	echo 'LIBRARY_LINK = $(LIVE555_LIBRARY_LINK) ' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
+	(cd $(@D); ./genMakefiles $(LIVE555_CONFIG_TARGET))
 endef
 
 define LIVE555_BUILD_CMDS
