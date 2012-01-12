From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Thu, 12 Jan 2012 14:33:41 +0100
Subject: [Buildroot] [PATCH] Add package for open2300
Message-ID: <1326375221-2223-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Open2300 is a package of software tools that reads (and writes) data
from a Lacrosse WS2300/WS2305/WS2310/WS2315 Weather Station.

This package will install all the binaries on the target.

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 package/Config.in            |    1 +
 package/open2300/Config.in   |    5 +++++
 package/open2300/open2300.mk |   24 ++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/open2300/Config.in
 create mode 100644 package/open2300/open2300.mk

diff --git a/package/Config.in b/package/Config.in
index 1042d95..2ce4a36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -412,6 +412,7 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
+source "package/open2300/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
 
diff --git a/package/open2300/Config.in b/package/open2300/Config.in
new file mode 100644
index 0000000..0f9c83d
--- /dev/null
+++ b/package/open2300/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_OPEN2300
+	bool "open2300"
+	help
+	  open2300 reads (and writes) data from a Lacrosse
+	  WS2300/WS2305/WS2310/WS2315 Weather Station
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
new file mode 100644
index 0000000..0467fb2
--- /dev/null
+++ b/package/open2300/open2300.mk
@@ -0,0 +1,24 @@
+############################################################
+#
+# Open2300
+#
+############################################################
+
+OPEN2300_SITE:=http://www.lavrsen.dk/svn/open2300/trunk/
+OPEN2300_SITE_METHOD:=svn
+OPEN2300_VERSION:=12
+
+OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+	OPEN2300_BINS += mysql2300 mysqlhistlog2300
+endif
+
+define OPEN2300_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) $(OPEN2300_BINS)
+endef
+
+define OPEN2300_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(addprefix $(@D)/,$(OPEN2300_BINS)) $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(call GENTARGETS,package,open2300))
-- 
1.7.5.4
