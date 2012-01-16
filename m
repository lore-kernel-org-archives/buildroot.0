From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 16 Jan 2012 16:45:21 +0100
Subject: [Buildroot] [git commit] Add package for open2300
Message-ID: <20120116154914.897BC90359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=723cc255f74321967df80a6ff821edad5a35830b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Open2300 is a package of software tools that reads (and writes) data
from a Lacrosse WS2300/WS2305/WS2310/WS2315 Weather Station.

This package will install all the binaries on the target.

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/open2300/Config.in   |    7 +++++++
 package/open2300/open2300.mk |   29 +++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 67b8094..2e91427 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -195,6 +195,7 @@ source "package/memtester/Config.in"
 source "package/mtd/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
+source "package/open2300/Config.in"
 source "package/openocd/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
diff --git a/package/open2300/Config.in b/package/open2300/Config.in
new file mode 100644
index 0000000..df0a969
--- /dev/null
+++ b/package/open2300/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_OPEN2300
+	bool "open2300"
+	help
+	  open2300 reads (and writes) data from a Lacrosse
+	  WS2300/WS2305/WS2310/WS2315 Weather Station
+
+	  http://www.lavrsen.dk/foswiki/bin/view/Open2300/WebHome
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
new file mode 100644
index 0000000..450b990
--- /dev/null
+++ b/package/open2300/open2300.mk
@@ -0,0 +1,29 @@
+############################################################
+#
+# Open2300
+#
+############################################################
+
+OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk/
+OPEN2300_SITE_METHOD = svn
+OPEN2300_VERSION     = 12
+
+OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
+		histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+	OPEN2300_DEPENDENCIES += mysql_client
+	OPEN2300_BINS         += mysql2300 mysqlhistlog2300
+endif
+
+define OPEN2300_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) $(OPEN2300_BINS)
+endef
+
+define OPEN2300_INSTALL_TARGET_CMDS
+	for prog in $(OPEN2300_BINS); do \
+		$(INSTALL) -D -m 0755 $(@D)/$$prog $(TARGET_DIR)/usr/bin/$$prog ; \
+	done
+endef
+
+$(eval $(call GENTARGETS))
