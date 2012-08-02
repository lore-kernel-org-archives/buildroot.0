From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:21 -0000
Subject: [Buildroot] [git commit branch/next] nanocom: new package
Message-ID: <20120802195239.72320800EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c959c117d9079432e6e03c249a6534cca4eb6eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/nanocom/Config.in  |   11 +++++++++++
 package/nanocom/nanocom.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 13310b2..b3a2f80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -209,6 +209,7 @@ source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
 source "package/minicom/Config.in"
 source "package/mtd/Config.in"
+source "package/nanocom/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/ofono/Config.in"
 source "package/open2300/Config.in"
diff --git a/package/nanocom/Config.in b/package/nanocom/Config.in
new file mode 100644
index 0000000..51d628a
--- /dev/null
+++ b/package/nanocom/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NANOCOM
+	bool "nanocom"
+	help
+	  Nanocom is based upon microcom (http://microcom.port5.com/) but
+	  removes the scripting and logging features while introducing support
+	  for setting local/remote echo, parity and stop bits. It also follows
+	  a more standard command line style using the getopt function.
+	  Internally much of the code has been rewritten and reformatted, the
+	  menu system in particular is almost entirely different.
+
+	  http://nanocom.sourceforge.net/
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
new file mode 100644
index 0000000..4fb7aee
--- /dev/null
+++ b/package/nanocom/nanocom.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# nanocom
+#
+#############################################################
+NANOCOM_VERSION = 2.6.1
+NANOCOM_SOURCE = nanocom.tar.gz
+NANOCOM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nanocom/nanocom/v1.0
+
+# N.B. Don't strip any path components during extraction.
+define NANOCOM_EXTRACT_CMDS
+	gzip -d -c $(DL_DIR)/$(NANOCOM_SOURCE) | tar --strip-components=0 -C $(NANOCOM_DIR) -xf -
+endef
+
+define NANOCOM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define NANOCOM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/nanocom $(TARGET_DIR)/usr/bin/nanocom
+endef
+
+define NANOCOM_UNINSTALL_TARGET_CMDS
+	$(RM) $(TARGET_DIR)/usr/bin/nanocom
+endef
+
+$(eval $(call GENTARGETS))
