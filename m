From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 09:51:00 +0200
Subject: [Buildroot] [git commit] package: add read-edid
Message-ID: <20120506080021.15C4096A3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adebe9df0f42a929441d40e84f30e546f2852d68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup whitespace]
Signed-off-by: Dmitry <golubovsky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/read-edid/Config.in    |   14 ++++++++++++++
 package/read-edid/read-edid.mk |   19 +++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6caca9d..94d0fb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -211,6 +211,7 @@ source "package/openocd/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
+source "package/read-edid/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
new file mode 100644
index 0000000..bdcb7a7
--- /dev/null
+++ b/package/read-edid/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_READ_EDID
+	bool "read-edid"
+	depends on BR2_i386
+	help
+	  Read-edid is a pair of tools for reading the EDID from a
+	  monitor.  It should work with most monitors made since 1996
+	  (except for newer ones with 256-byte EDID's - WiP), assuming
+	  the video card supports the standard read commands (most
+	  do).  Read-edid is a set of two tools - get-edid, which gets
+	  the raw edid information from the monitor, and parse-edid,
+	  which turns the raw binary information into an
+	  XF86Config-compatible monitor section.
+
+	  http://polypux.org/projects/read-edid/
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
new file mode 100644
index 0000000..b568d5b
--- /dev/null
+++ b/package/read-edid/read-edid.mk
@@ -0,0 +1,19 @@
+############################################
+#
+# read-edid
+#
+############################################
+
+READ_EDID_VERSION = 1.4.2
+READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
+
+define READ_EDID_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define READ_EDID_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/get-edid $(TARGET_DIR)/sbin/get-edid
+	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/sbin/parse-edid
+endef
+
+$(eval $(call AUTOTARGETS))
