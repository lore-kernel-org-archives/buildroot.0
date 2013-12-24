From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 24 Dec 2013 08:53:57 +0200
Subject: [Buildroot] [PATCH] qt5: install headers into /usr/include/qt5
Message-ID: <1387868037-31734-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are places in Qt's source where headers included with the name of
the module subdirectory (e.g. #include <QtCore/QHash>). Therefore, the
build system passes the top header directory to the compiler; but this
results in a error when building host tools since sysroot/usr/include
directory includes architecture specific system headers.

In order to prevent this, install all Qt headers into a subdirectory in
/usr/include.

Fixes: http://autobuild.buildroot.net/results/4f1/4f16c0b38bdd6e40efcc781c12fae81c0bfabb72/

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 1b753d3..e46bdeb 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -159,6 +159,7 @@ define QT5BASE_CONFIGURE_CMDS
 		-v \
 		-prefix /usr \
 		-hostprefix $(HOST_DIR)/usr \
+		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
 		-plugindir /usr/lib/qt/plugins \
 		-no-rpath \
-- 
1.8.5.1
