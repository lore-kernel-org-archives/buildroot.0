From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Apr 2015 23:43:57 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/tvheadend: Fix inclusion of
	dtv-scan-tables files
Message-ID: <1428529439-29437-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-dvbscan forces downloading the tables from upstream when the
files are not already present in data/dvb-scan/, see support/getmuxlist.

By moving the copy command for the dvb-scan files before tvheadend configure
calls the getmuxlist script, the latter will recognize the existing files,
quote: "# Note: will not update existing set (if not .git)"

To verify the bundled contents have a look at build.linux/bundle.d.
Also fix a comment typo.

Fixes
http://autobuild.buildroot.net/results/25f/25fc657dbc37228483eeefb3618be9df2ee13832/
http://autobuild.buildroot.net/results/37a/37abb5d2ec62ac59897d019e6ca85c8eb0e69786/
http://autobuild.buildroot.net/results/e86/e860e501f904d94bbab6a765aad4d19947135513/
http://autobuild.buildroot.net/results/a55/a55ab4fc34bebda14236d6a0efe893aa75374ed2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: do not patch header files but use a better moment for copying the dvb files (Yann)

 package/tvheadend/tvheadend.mk |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index d6b77da..44154c6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -40,6 +40,13 @@ endif
 
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
+define TVHEADEND_INSTALL_DTV_SCAN_TABLES
+	$(INSTALL) -d $(@D)/data/dvb-scan
+	cp -r $(TARGET_DIR)/usr/share/dvb/* $(@D)/data/dvb-scan/
+	touch $(@D)/data/dvb-scan/.stamp
+endef
+TVHEADEND_POST_EXTRACT_HOOKS += TVHEADEND_INSTALL_DTV_SCAN_TABLES
+
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);						\
 		$(TARGET_CONFIGURE_OPTS)			\
@@ -58,12 +65,9 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 # The tvheadend build system expects the transponder data to be present inside
-# its source tree. To prevent a downloaded initiated by the build system just
+# its source tree. To prevent a download initiated by the build system just
 # copy the data files in the right place and add the corresponding stamp file.
 define TVHEADEND_BUILD_CMDS
-	$(INSTALL) -d $(@D)/data/dvb-scan
-	cp -r $(TARGET_DIR)/usr/share/dvb/* $(@D)/data/dvb-scan/
-	touch $(@D)/data/dvb-scan/.stamp
 	$(MAKE) -C $(@D)
 endef
 
-- 
1.7.10.4
