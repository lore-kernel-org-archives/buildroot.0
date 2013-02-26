From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 00:01:36 +0100
Subject: [Buildroot] [git commit] collectd: don't build with -Werror
Message-ID: <20130226230151.512FD9AD91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c264e38fce27789a0ab050b6296c2fee8da3752c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/09659472f504a364590727a05ac900108ed027b4

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/collectd.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6d26622..88f6737 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -122,6 +122,14 @@ ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 	COLLECTD_CONF_OPT += --with-libgcrypt=$(STAGING_DIR)/usr
 endif
 
+# released software should not break on minor warnings
+define COLLECTD_DROP_WERROR
+	$(SED) 's/-Werror//' \
+		$(@D)/src/Makefile.in $(@D)/src/libcollectdclient/Makefile.in
+endef
+
+COLLECTD_POST_PATCH_HOOKS += COLLECTD_DROP_WERROR
+
 define COLLECTD_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
