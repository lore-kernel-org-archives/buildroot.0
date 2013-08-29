From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 22:56:35 +0200
Subject: [Buildroot] [git commit] dvb-apps: Fix generate-keynames.sh script
	for cross-compilation
Message-ID: <20130829211311.BB5699B5E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04fe6b134417c30cad90c663a870ed68b7dfc8ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../dvb-apps-0001-Fix-generate-keynames.patch      |   30 ++++++++++++++++++++
 package/dvb-apps/dvb-apps.mk                       |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch b/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
new file mode 100644
index 0000000..498607d
--- /dev/null
+++ b/package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
@@ -0,0 +1,30 @@
+Fix generate-keynames.sh script for cross-compilation
+
+generate-keynames.sh reads /usr/include/linux to find the keyname
+symbols. However, when cross-compiling, the include path points
+somewhere else. Allow the user to pass CROSS_ROOT to point to the
+root of the cross-compilation environment.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+diff -rup dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh
+--- dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh	2012-12-06 10:38:07.000000000 +0100
++++ dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh	2013-08-29 21:47:09.717991439 +0200
+@@ -18,7 +18,7 @@ echo "};" >> $1
+ echo >> $1
+ echo >> $1
+ echo "static struct input_key_name key_name [] = {" >> $1
+-for x in $(cat /usr/include/linux/input.h input_fake.h | \
++for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
+            egrep "#define[ \t]+KEY_" | grep -v KEY_MAX | \
+            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
+     echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
+@@ -26,7 +26,7 @@ done
+ echo "};" >> $1
+ echo >> $1
+ echo "static struct input_key_name btn_name [] = {" >> $1
+-for x in $(cat /usr/include/linux/input.h input_fake.h | \
++for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
+            egrep "#define[ \t]+BTN_" | \
+            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
+      echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 1e50aa4..8cf6a79 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -34,7 +34,8 @@ endif
 DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" $(MAKE) -C $(@D) V=1
+	$(TARGET_CONFIGURE_OPTS) LDFLAGS="$(DVB_APPS_LDFLAGS)" \
+		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) V=1
 endef
 
 define DVB_APPS_INSTALL_STAGING_CMDS
