From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 12 Dec 2016 10:19:38 +0100
Subject: [Buildroot] [PATCH] e2fsprogs: fix missing OPTS
Message-ID: <20161212091938.24412-1-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the commit	64544178f180f03cedd8fe403d3718406d909c88 many packages
broke because they could not find the ext2fs.pc file.

This is perfectly normal, as the DESTDIR and the install target were not
passed anymore to make.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/e2fsprogs/e2fsprogs.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index c49ce4d..e0b0eef 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -64,8 +64,14 @@ E2FSPROGS_CONF_ENV += LIBS=-lintl
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
-- 
2.10.2
