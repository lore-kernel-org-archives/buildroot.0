From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 00:10:31 +0200
Subject: [Buildroot] [PATCH 3/3] qt: tune .pc files after installation in
	staging directory
In-Reply-To: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1343167832-14198-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt configuration and installation process is a bit strange, and it
leads the .pc files to contain absolute paths to the staging
directory, while it should only contains paths relative to the staging
directory, because pkg-config already adds the path of the sysroot
automatically to the headers and libraries locations.

This allows the 'pkg-config --cflags' results for Qt libraries to be
correct.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index feb0d6f..3b40ea4 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -577,13 +577,20 @@ endef
 # everything in the STAGING_DIR), we move host programs such as qmake,
 # rcc or uic to the HOST_DIR so that they are available at the usual
 # location. A qt.conf file is generated to make sure that all host
-# programs still find all files they need.
+# programs still find all files they need. The .pc files are tuned to
+# remove the sysroot path from them, since pkg-config already adds it
+# automatically.
 define QT_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/usr/bin
 	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
 	ln -sf $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr/mkspecs
 	$(QT_INSTALL_QT_CONF)
+	for i in moc uic rcc lupdate lrelease ; do \
+		$(SED) "s,^$${i}_location=.*,$${i}_location=$(HOST_DIR)/usr/bin/$${i}," \
+			$(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc ; \
+	done
+	$(SED) "s,$(STAGING_DIR)/,,g" $(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc
 endef
 
 # Library installation
-- 
1.7.9.5
