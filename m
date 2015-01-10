From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:08:04 +0100
Subject: [Buildroot] [git commit] bootstrap: new package
Message-ID: <20150110110942.1A2107FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62ffb640b6ade91f13fc3709fa5489d59e4e1471
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add 'cp -dpfr' instead of a convuluted use of 'tar c' + 'tar
x' do not a copy.]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/bootstrap/Config.in      |    7 +++++++
 package/bootstrap/bootstrap.hash |    2 ++
 package/bootstrap/bootstrap.mk   |   21 +++++++++++++++++++++
 4 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5ece4a5..8476773 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -740,6 +740,7 @@ menu "Hardware handling"
 endmenu
 
 menu "Javascript"
+	source "package/bootstrap/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
diff --git a/package/bootstrap/Config.in b/package/bootstrap/Config.in
new file mode 100644
index 0000000..743d8a3
--- /dev/null
+++ b/package/bootstrap/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BOOTSTRAP
+	bool "bootstrap"
+	help
+	  Bootstrap is the most popular HTML, CSS, and JS framework
+	  for developing responsive, mobile first projects on the web.
+
+	  http://getbootstrap.com
diff --git a/package/bootstrap/bootstrap.hash b/package/bootstrap/bootstrap.hash
new file mode 100644
index 0000000..acb06b4
--- /dev/null
+++ b/package/bootstrap/bootstrap.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  95ca4a02aff37570660c81a87065b53ebc281c33fa86b91a6a7a650eee10678f  bootstrap-3.3.1-dist.zip
diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
new file mode 100644
index 0000000..1bf8aa2
--- /dev/null
+++ b/package/bootstrap/bootstrap.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# bootstrap
+#
+################################################################################
+
+BOOTSTRAP_VERSION = 3.3.1
+BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)
+BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
+BOOTSTRAP_LICENSE = MIT
+
+define BOOTSTRAP_EXTRACT_CMDS
+	unzip $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
+endef
+
+define BOOTSTRAP_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/var/www/bootstrap
+	cp -dpfr $(@D)/dist/* $(TARGET_DIR)/var/www/bootstrap
+endef
+
+$(eval $(generic-package))
