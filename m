From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 22:50:26 +0200
Subject: [Buildroot] [git commit] qt: make $(HOST_DIR)/usr/mkspecs a symlink
	to $(STAGING_DIR)/usr/mkspecs
Message-ID: <20120611205424.878D996ED1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=755a51f327d7d18f31e6b352cdd7032d2d01e35f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In fact, not only qt can install stuff in $(STAGING_DIR)/usr/mkspecs,
but also libraries that wish to integrate with qmake, such as
qwt. However, qmake and al. will look inside $(HOST_DIR)/usr/mkspecs,
so the easiest solution is to have a symbolic link between the two
directories, instead of copying things around.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 7e6c5dd..b751696 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -583,8 +583,7 @@ define QT_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/usr/bin
 	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
-	rm -rf $(HOST_DIR)/usr/mkspecs
-	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
+	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
 	$(QT_INSTALL_QT_CONF)
 endef
 
