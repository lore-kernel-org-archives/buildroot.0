From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Jun 2012 18:13:59 +0200
Subject: [Buildroot] [PATCH 09/10] qt: make $(HOST_DIR)/usr/mkspecs a
	symlink to $(STAGING_DIR)/usr/mkspecs
In-Reply-To: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6e3c4b7bdba8afe3d9d50b2e6af7144f9606a6e0.1338653505.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In fact, not only qt can install stuff in $(STAGING_DIR)/usr/mkspecs,
but also libraries that which to integrate with qmake, such as
qwt. However, qmake and al. will look inside $(HOST_DIR)/usr/mkspecs,
so the easiest solution is to have a symbolic between the two
directories, instead of copying things around.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
 
-- 
1.7.9.5
