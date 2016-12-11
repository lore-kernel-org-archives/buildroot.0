From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:26:02 +0100
Subject: [Buildroot] [git commit] pkg-waf: add additional variables for each
	install step
Message-ID: <20161211142730.0C07A7FB3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=693031b39c6a7b40bd560172d51ae9f1c0e2f1d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some waf packages may want to pass additional variables to waf script
in install step. Add the possibility to do so by defining the
following variables:

  <pkg>_INSTALL_STAGING_OPTS for the install to staging directory
  <pkg>_INSTALL_TARGET_OPTS for the install to target directory

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-waf.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 908ac03..a82f45c 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,6 +49,9 @@ else
 $(2)_WAF = ./waf
 endif
 
+$(2)_INSTALL_STAGING_OPTS 		?=
+$(2)_INSTALL_TARGET_OPTS 		?=
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file.
@@ -84,7 +87,8 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(STAGING_DIR)
+		install --destdir=$$(STAGING_DIR) \
+		$$($(2)_INSTALL_STAGING_OPTS)
 endef
 endif
 
@@ -96,7 +100,8 @@ ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$(@D) && \
 	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
-		install --destdir=$$(TARGET_DIR)
+		install --destdir=$$(TARGET_DIR) \
+		$$($(2)_INSTALL_TARGET_OPTS)
 endef
 endif
 
