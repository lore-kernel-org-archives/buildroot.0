From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:34:11 +0200
Subject: [Buildroot] [PATCH] crda: enable staging install
Message-ID: <20170704163412.13728-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's needed to make mklibs work otherwise it can't find the missing
library for the crda binary.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/crda/crda.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index df879f68bb..713f852b65 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -10,12 +10,17 @@ CRDA_SITE = $(BR2_KERNEL_MIRROR)/software/network/crda
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycrypto libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
+CRDA_INSTALL_STAGING = YES

 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
 		$(MAKE) all_noverify -C $(@D)
 endef

+define CRDA_INSTALL_STAGING_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(STAGING_DIR)
+endef
+
 define CRDA_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR)
 endef
--
2.13.2
