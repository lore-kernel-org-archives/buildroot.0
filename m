From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:38 -0200
Subject: [Buildroot] [PATCH 3/8] Revert "avrdude: add license information"
In-Reply-To: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
Message-ID: <20190127185943.1136-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit d1f545004bf0533064363d87c2d7c71e7acf7435 from 2014
because the added variables already existed. The real problem at the
time was that one of the pre-existent variables had a typo, fixed in a
later commit.

Currently AVRDUDE_LICENSE and AVRDUDE_LICENSE_FILES are declared twice
with the same values for each one. So remove one of them.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Wojciech M. Zabolotny <wzab01@gmail.com>
---
NOTE: When I first sent the series adding check-package, I reported the
typo. Unfortunately I failed to identify the duplicated variables.

The output for below command is the same in current master (f6843a75fe)
and after this patch:
$ make -s BR2_HAVE_DOT_CONFIG=y printvars VARS=AVRDUDE_LICENSE%
AVRDUDE_LICENSE=GPL-2.0+
AVRDUDE_LICENSE_FILES=avrdude/COPYING
---
 package/avrdude/avrdude.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 0e34076e38..ae378dfbac 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -2,34 +2,32 @@
 #
 # avrdude
 #
 ################################################################################
 
 AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
 AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 AVRDUDE_SUBDIR = avrdude
 # Sources coming from git, without generated configure and Makefile.in
 # files.
 AVRDUDE_AUTORECONF = YES
 AVRDUDE_CONF_OPTS = --enable-linuxgpio
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
-AVRDUDE_LICENSE = GPL-2.0+
-AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
 AVRDUDE_DEPENDENCIES += libftdi1
 else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
 # if /etc/avrdude.conf exists, the installation process creates a
 # backup file, which we do not want in the context of Buildroot.
 define AVRDUDE_REMOVE_BACKUP_FILE
 	$(RM) -f $(TARGET_DIR)/etc/avrdude.conf.bak
 endef
 
 AVRDUDE_POST_INSTALL_TARGET_HOOKS += AVRDUDE_REMOVE_BACKUP_FILE
 
 $(eval $(autotools-package))
-- 
2.17.1
