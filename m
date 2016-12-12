From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Dec 2016 10:57:20 +0100
Subject: [Buildroot] [git commit] e2fsprogs: fix missing OPTS
Message-ID: <20161212095946.82C9380408@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab7787b7b9e77692c5e0f9bf4404f1573ea6859d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the commit	64544178f180f03cedd8fe403d3718406d909c88 many packages
broke because they could not find the ext2fs.pc file.

This is perfectly normal, as the DESTDIR and the install target were not
passed anymore to make.

[Peter: remove redundant E2FSPROGS_INSTALL_STAGING_OPTS]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 48bb9ec..0253510 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -10,7 +10,6 @@ E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2F
 E2FSPROGS_LICENSE = GPLv2, libuuid BSD-3c, libss and libet MIT-like with advertising clause
 E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
-E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 # we don't have a host-util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
@@ -64,8 +63,14 @@ E2FSPROGS_CONF_ENV += LIBS=-lintl
 endif
 
 E2FSPROGS_MAKE_OPTS = LDCONFIG=true
-E2FSPROGS_INSTALL_STAGING_OPTS = LDCONFIG=true
-E2FSPROGS_INSTALL_TARGET_OPTS = LDCONFIG=true
+E2FSPROGS_INSTALL_STAGING_OPTS = \
+	DESTDIR=$(STAGING_DIR) \
+	LDCONFIG=true \
+	install-libs
+E2FSPROGS_INSTALL_TARGET_OPTS = \
+	DESTDIR=$(TARGET_DIR) \
+	LDCONFIG=true \
+	install
 
 define HOST_E2FSPROGS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
