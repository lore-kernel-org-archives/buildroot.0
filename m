From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:27:50 +0100
Subject: [Buildroot] [git commit] debianutils: new package
Message-ID: <20141201104836.3B7137FCD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb50abe7cf2e7082907e5949aec8f884b5b45eb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: add optional dependency on Busybox, because debianutils
installs its own version of which, so we need to override the Busybox
one.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |    1 +
 package/debianutils/Config.in        |    7 +++++++
 package/debianutils/debianutils.hash |    2 ++
 package/debianutils/debianutils.mk   |   16 ++++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d59876f..a6977ce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1204,6 +1204,7 @@ endif
 	source "package/cpuload/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
+	source "package/debianutils/Config.in"
 endif
 	source "package/dsp-tools/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/debianutils/Config.in b/package/debianutils/Config.in
new file mode 100644
index 0000000..f865868
--- /dev/null
+++ b/package/debianutils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DEBIANUTILS
+	bool "debianutils"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Miscellaneous utilities specific to Debian.
+
+	  https://tracker.debian.org/pkg/debianutils
diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
new file mode 100644
index 0000000..089dd42
--- /dev/null
+++ b/package/debianutils/debianutils.hash
@@ -0,0 +1,2 @@
+# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.4.dsc
+sha256	190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6	debianutils_4.4.tar.gz
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
new file mode 100644
index 0000000..dd78774
--- /dev/null
+++ b/package/debianutils/debianutils.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# debianutils
+#
+################################################################################
+
+DEBIANUTILS_VERSION = 4.4
+DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.gz
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20130728T034252Z/pool/main/d/debianutils
+DEBIANUTILS_CONF_OPTS = --exec-prefix=/
+# Make sure we override the busybox tools, such as which
+DEBIANUTILS_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+DEBIANUTILS_LICENSE = GPLv2+, SMAIL (savelog)
+DEBIANUTILS_LICENSE_FILES = debian/copyright
+
+$(eval $(autotools-package))
