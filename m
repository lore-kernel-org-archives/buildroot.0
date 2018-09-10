From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Sep 2018 19:23:53 +0200
Subject: [Buildroot] [PATCH 1/1] e2fsprogs: disable parallel build for host
Message-ID: <20180910172353.4156-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems that host-e2fsprogs has an issue with parallel build since
version 1.44.2:

symlinks.o: file not recognized: File truncated

/home/buildroot/build/instance-0/output/host/lib/libss.so.2: file or directory does not exist

Fixes:
 - http://autobuild.buildroot.org/results/6b424ba788ccd738c2afcd940075991581e860b6
 - http://autobuild.buildroot.org/results/1d816f9be6bad6e10d273dc2d0acb200233d8d4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 98001c3c99..d9ae0b29b6 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -79,8 +79,9 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
 	install-libs
 
+#??Package does not build in parallel due to improper make rules
 define HOST_E2FSPROGS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
 endef
 
 $(eval $(autotools-package))
-- 
2.17.1
