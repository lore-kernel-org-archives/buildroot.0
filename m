From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Oct 2012 21:09:58 +0200
Subject: [Buildroot] [git commit] package/time: New package for GNU time.
Message-ID: <20121020191222.E0F32998CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2073c21ec041b6404b19e17e0f139ddbc639a35f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/time/Config.in |    6 ++++++
 package/time/time.mk   |   17 +++++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d7b3db6..dd4c97e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -672,6 +672,7 @@ source "package/logsurfer/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+source "package/time/Config.in"
 source "package/which/Config.in"
 endif
 source "package/xmlstarlet/Config.in"
diff --git a/package/time/Config.in b/package/time/Config.in
new file mode 100644
index 0000000..634d41a
--- /dev/null
+++ b/package/time/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TIME
+	bool "time"
+	help
+	  The GNU time utility.
+
+	  http://savannah.gnu.org/projects/time/
diff --git a/package/time/time.mk b/package/time/time.mk
new file mode 100644
index 0000000..7b53286
--- /dev/null
+++ b/package/time/time.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# time
+#
+#############################################################
+
+TIME_VERSION = 1.7
+TIME_SITE = $(BR2_GNU_MIRROR)/time
+TIME_CONF_ENV = ac_cv_func_wait3=yes
+
+# time uses an old version of automake that does not support
+# installing in DESTDIR.
+define TIME_INSTALL_TARGET_CMDS
+	install -D -m 755  $(@D)/time $(TARGET_DIR)/usr/bin/time
+endef
+
+$(eval $(autotools-package))
