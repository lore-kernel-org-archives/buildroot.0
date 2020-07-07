From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 22:58:39 +0200
Subject: [Buildroot] [git commit] package/zip: install to staging
Message-ID: <20200707205554.CA1CB865A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5b5b5ccabe35e11f0ca8db4361bb3f335fc59fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install header files and libraries into the staging area.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zip/zip.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index ca52c74fb1..c78efedc25 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -10,6 +10,7 @@ ZIP_SOURCE = zip$(subst .,,$(ZIP_VERSION)).tgz
 ZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
+ZIP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ZIP_DEPENDENCIES += bzip2
@@ -39,6 +40,11 @@ define ZIP_INSTALL_TARGET_CMDS
 		prefix=$(TARGET_DIR)/usr
 endef
 
+define ZIP_INSTALLING_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) -f unix/Makefile install \
+		prefix=$(STAGING_DIR)/usr
+endef
+
 define HOST_ZIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
