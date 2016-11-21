From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:48:09 +0100
Subject: [Buildroot] [git commit] qextserialport: fix static build
Message-ID: <20161121214828.9F19D7FB06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f09b33a0abe964a137041f52afb111d351c9e5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, qextserialport will attempt to build a shared library.
qesp_static has to be set in CONFIG to build static. Note that
static+shared is not supported, in that case we just build shared.

The install target commands also have to be gated in that case,
because the *.so files don't exist. For completeness we both set
QEXTSERIALPORT_INSTALL_STAGING to NO and don't define
QEXTSERIALPORT_INSTALL_TARGET_CMDS for static builds, although one
of them would be sufficient.

Fixes:
http://autobuild.buildroot.net/results/c9233ad71fd60d0e6a85731a8bd4e598bd84947a

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qextserialport/qextserialport.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index 15cb74c..3641353 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -10,6 +10,10 @@ QEXTSERIALPORT_LICENSE = MIT
 QEXTSERIALPORT_LICENSE_FILES = LICENSE.md
 QEXTSERIALPORT_INSTALL_STAGING = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QEXTSERIALPORT_CONF_OPTS += CONFIG+=qesp_static
+endif
+
 ifeq ($(BR2_PACKAGE_QT),y)
 QEXTSERIALPORT_DEPENDENCIES += qt
 QEXTSERIALPORT_QMAKE = $(QT_QMAKE)
@@ -19,7 +23,7 @@ QEXTSERIALPORT_QMAKE = $(QT5_QMAKE)
 endif
 
 define QEXTSERIALPORT_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE)
+	cd $(@D); $(TARGET_MAKE_ENV) $(QEXTSERIALPORT_QMAKE) $(QEXTSERIALPORT_CONF_OPTS)
 endef
 
 define QEXTSERIALPORT_BUILD_CMDS
@@ -32,8 +36,12 @@ define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 	cp $(@D)/qextserialport.pc $(STAGING_DIR)/usr/lib/pkgconfig/
 endef
 
+ifeq ($(BR2_STATIC_LIBS),y)
+QEXTSERIALPORT_INSTALL_STAGING = NO
+else
 define QEXTSERIALPORT_INSTALL_TARGET_CMDS
 	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
 endef
+endif
 
 $(eval $(generic-package))
