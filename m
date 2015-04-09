From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:39:54 +0200
Subject: [Buildroot] [git commit] package/tvheadend: Fix inclusion of
	dtv-scan-tables files
Message-ID: <20150409194013.21DD47FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7461b02503e404854a4f207bd9be308a7987c6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--enable-dvbscan forces downloading the tables from upstream when the
files are not already present in data/dvb-scan/, see support/getmuxlist.

By moving the copy command for the dvb-scan files before tvheadend configure
the getmuxlist script, called by tvheadend configure, will recognize the
existing directory, quote: "# Note: will not update existing set (if not .git)"

To verify the bundled contents have a look at build.linux/bundle.d.
Also fix a comment typo.

Fixes
http://autobuild.buildroot.net/results/25f/25fc657dbc37228483eeefb3618be9df2ee13832/
http://autobuild.buildroot.net/results/37a/37abb5d2ec62ac59897d019e6ca85c8eb0e69786/
http://autobuild.buildroot.net/results/e86/e860e501f904d94bbab6a765aad4d19947135513/
http://autobuild.buildroot.net/results/a55/a55ab4fc34bebda14236d6a0efe893aa75374ed2/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.mk |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index d6b77da..112e7aa 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -40,6 +40,16 @@ endif
 
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
+# The tvheadend build system expects the transponder data to be present inside
+# its source tree. To prevent a download initiated by the build system just
+# copy the data files in the right place and add the corresponding stamp file.
+define TVHEADEND_INSTALL_DTV_SCAN_TABLES
+	$(INSTALL) -d $(@D)/data/dvb-scan
+	cp -r $(TARGET_DIR)/usr/share/dvb/* $(@D)/data/dvb-scan/
+	touch $(@D)/data/dvb-scan/.stamp
+endef
+TVHEADEND_PRE_CONFIGURE_HOOKS += TVHEADEND_INSTALL_DTV_SCAN_TABLES
+
 define TVHEADEND_CONFIGURE_CMDS
 	(cd $(@D);						\
 		$(TARGET_CONFIGURE_OPTS)			\
@@ -57,13 +67,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	)
 endef
 
-# The tvheadend build system expects the transponder data to be present inside
-# its source tree. To prevent a downloaded initiated by the build system just
-# copy the data files in the right place and add the corresponding stamp file.
 define TVHEADEND_BUILD_CMDS
-	$(INSTALL) -d $(@D)/data/dvb-scan
-	cp -r $(TARGET_DIR)/usr/share/dvb/* $(@D)/data/dvb-scan/
-	touch $(@D)/data/dvb-scan/.stamp
 	$(MAKE) -C $(@D)
 endef
 
