From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Feb 2013 19:19:19 +0100
Subject: [Buildroot] [git commit] proxychains-ng: ensure cross compiler is
	used
Message-ID: <20130207182100.B9BC19AA02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2831427373db54b076e19c59c60c20f1018e8204
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/e184fcb1c100e9d8aa3d9f18a8caee8c0839e207

Contrary to what the .mk file states, proxychains-ng doesn't use autotools.
Instead it uses a handwritten configure script, so convert it to
generic-package.

This handwritten configure script generates config.mak which is then
included by the Makefile. Unfortunately config.mak does:

CC ?= $(TARGET_CC)

But as make sets CC to 'cc' by default, this never does anything - So
it ends up using the host compiler (and target CFLAGS), breaking the build.

Fix it by passing the correct CC setting at build time as well.

While we're at it, also cleanup the package by using 'make install-config'
to install the configuration file.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proxychains-ng/proxychains-ng.mk |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
index c38a7db..2020e3f 100644
--- a/package/proxychains-ng/proxychains-ng.mk
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -3,15 +3,22 @@
 # proxychains-ng
 #
 #############################################################
+
 PROXYCHAINS_NG_VERSION = 4.4
 PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
 PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
 
-define PROXYCHAINS_NG_POST_INSTALL_TARGET
-	$(INSTALL) -m 644 -D $(@D)/src/proxychains.conf \
-		$(TARGET_DIR)/etc/proxychains.conf
+define PROXYCHAINS_NG_CONFIGURE_CMDS
+	cd $(@D) && \
+	$(TARGET_CONFIGURE_OPTS) ./configure --prefix=/usr --sysconfdir=/etc
+endef
+
+define PROXYCHAINS_NG_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
-PROXYCHAINS_NG_POST_INSTALL_TARGET_HOOKS += PROXYCHAINS_NG_POST_INSTALL_TARGET
+define PROXYCHAINS_NG_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install install-config
+endef
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
