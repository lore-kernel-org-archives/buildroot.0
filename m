From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:37:10 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: pass all options
 through MAKEDUMPFILE_MAKE_OPTS
Message-ID: <20200919123954.2E55D80467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=301f746629de3c01fa5ad4290c273043a49df69f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/makedumpfile.mk | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index c949af9f71..52a054e734 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -10,20 +10,24 @@ MAKEDUMPFILE_DEPENDENCIES = bzip2 elfutils xz zlib
 MAKEDUMPFILE_LICENSE = GPL-2.0
 MAKEDUMPFILE_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_LZO),y)
-MAKEDUMPFILE_DEPENDENCIES += lzo
-MAKEDUMPFILE_MAKE_OPTS += USELZO=on
-endif
-
 ifeq ($(BR2_powerpc),y)
 MAKEDUMPFILE_TARGET = powerpc32
 else
 MAKEDUMPFILE_TARGET = $(BR2_ARCH)
 endif
 
+MAKEDUMPFILE_MAKE_OPTS = \
+	TARGET=$(MAKEDUMPFILE_TARGET) \
+	LINKTYPE=dynamic
+
+ifeq ($(BR2_PACKAGE_LZO),y)
+MAKEDUMPFILE_DEPENDENCIES += lzo
+MAKEDUMPFILE_MAKE_OPTS += USELZO=on
+endif
+
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(MAKEDUMPFILE_MAKE_OPTS) TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
+		$(MAKEDUMPFILE_MAKE_OPTS)
 endef
 
 define MAKEDUMPFILE_INSTALL_TARGET_CMDS
