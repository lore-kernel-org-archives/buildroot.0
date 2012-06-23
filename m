From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 01:50:17 +0200
Subject: [Buildroot] [git commit] quota: new package (v8)
Message-ID: <20120623235216.A42238A342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da1884f048f691467febc2d6d4d570d414c530d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix help text whitespace]
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@intel.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    3 +++
 package/quota/Config.in |   14 ++++++++++++++
 package/quota/quota.mk  |   18 ++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b257c0f..374a5aa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -663,6 +663,9 @@ source "package/monit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
+endif
+source "package/quota/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rsyslog/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
diff --git a/package/quota/Config.in b/package/quota/Config.in
new file mode 100644
index 0000000..dfefb8a
--- /dev/null
+++ b/package/quota/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_QUOTA
+	bool "quota"
+	depends on BR2_INET_RPC
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+	  Implementation of the disk quota system.
+
+	  http://sourceforge.net/projects/linuxquota/
+
+comment "quota requires a toolchain with RPC + LARGEFILE + WCHAR support"
+	depends on !(BR2_INET_RPC && BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
new file mode 100644
index 0000000..845eefb
--- /dev/null
+++ b/package/quota/quota.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# QUOTA
+#
+#############################################################
+
+QUOTA_VERSION = 4.00
+QUOTA_SOURCE = quota-$(QUOTA_VERSION).tar.gz
+QUOTA_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
+
+QUOTA_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+
+# Package uses autoconf but not automake.
+QUOTA_INSTALL_TARGET_OPT = \
+	ROOTDIR=$(TARGET_DIR) \
+	install
+
+$(eval $(call AUTOTARGETS))
