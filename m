From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:47:03 +0100
Subject: [Buildroot] [PATCH 25/38] imagemagick: help configure to detect
	file_offset_bits
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9c4f86f05a9eded5abe5a87f497fe8e78bd8c82d.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imagemagick configure script wants to run programs to detect the
file_offset_bits, but fails since it is running cross-compile
mode. Therefore, we help the configure script by passing the
appropriate ac_cv variable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 2bcd076..e858430 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -31,6 +31,12 @@ $(IMAGEMAGICK_DIR)/.unpacked: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
 	$(CONFIG_UPDATE) $(IMAGEMAGICK_DIR)/config
 	touch $@
 
+ifeq ($(BR2_LARGEFILE),y)
+IMAGEMAGICK_CONF_OPTS = ac_cv_sys_file_offset_bits=64
+else
+IMAGEMAGICK_CONF_OPTS = ac_cv_sys_file_offset_bits=32
+endif
+
 $(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
 	(cd $(IMAGEMAGICK_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -55,6 +61,7 @@ $(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
 		--without-fpx \
 		--without-freetype \
 		--without-x \
+		$(IMAGEMAGICK_CONF_OPTS) \
 	)
 	touch $@
 
-- 
1.6.3.3
