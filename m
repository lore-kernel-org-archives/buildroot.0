From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 18:43:01 +0100
Subject: [Buildroot] [git commit] mcelog: new package
Message-ID: <20141201104837.3E6E97FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00152b6a1fe760c1fd9ad54618af484517272f8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - use "make install", which allows to remove the custom installation
    logic in mcelog.mk.
  - no need to explicitly pass CFLAGS and CPPFLAGS when doing the
    build, since those definitions are already part of
    $(TARGET_CONFIGURE_OPTS).]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |    1 +
 package/mcelog/Config.in |    9 +++++++++
 package/mcelog/mcelog.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e91e95b..9188041 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -76,6 +76,7 @@ endif
 	source "package/lttng-babeltrace/Config.in"
 	source "package/lttng-modules/Config.in"
 	source "package/lttng-tools/Config.in"
+	source "package/mcelog/Config.in"
 	source "package/memstat/Config.in"
 	source "package/netperf/Config.in"
 	source "package/oprofile/Config.in"
diff --git a/package/mcelog/Config.in b/package/mcelog/Config.in
new file mode 100644
index 0000000..f3ccc71
--- /dev/null
+++ b/package/mcelog/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MCELOG
+	bool "mcelog"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU # fork()
+	help
+	  mcelog processes machine checks (in particular memory and CPU hardware
+	  errors) on modern x86 Linux systems.
+
+	  http://www.mcelog.org/
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
new file mode 100644
index 0000000..da338ba
--- /dev/null
+++ b/package/mcelog/mcelog.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# mcelog
+#
+################################################################################
+
+MCELOG_VERSION = v105
+MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
+MCELOG_SITE_METHOD = git
+MCELOG_LICENSE = GPLv2
+MCELOG_LICENSE_FILES = README
+
+define MCELOG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define MCELOG_INSTALL_TARGET_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
