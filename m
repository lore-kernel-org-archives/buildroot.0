From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 17:49:21 +0200
Subject: [Buildroot] [git commit] qt5webkit: do not overwrite target python
Message-ID: <20161019155125.4A60781E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4b494b71e33a52db55b01c4c8f02d184b708615
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes an issue introduced in commit
ac16793eaaabfced0312420759e3a66cdaa1ea8e. This commit creates a link
$(@D)/bin/python pointing to the host Python 2, and adds $(@D)/bin/ to
the PATH. However, the QT5WEBKIT_INSTALL_TARGET_CMDS variable copies the
contents of $(@D)/bin/ to the target filesystem, in order to install
binaries produced by the qt5webkit build. By doing this, we overwrite
the 'python' symbolic link on the target.

In order to fix this, we simply create the 'python' symbolic link used
to trick qt5webkit to use python2 on the host in the $(@D)/host-bin/
sub-directory.

Signed-off-by: Johan Derycke <johan.derycke@barco.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index f300c11..378cdf7 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -36,10 +36,10 @@ endif
 # QtWebkit's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBKIT_ENV = PATH=$(@D)/bin:$(BR_PATH)
+QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
 define QT5WEBKIT_PYTHON2_SYMLINK
-	mkdir -p $(@D)/bin
-	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
+	mkdir -p $(@D)/host-bin
+	ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/host-bin/python
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
