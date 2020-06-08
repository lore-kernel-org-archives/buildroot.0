From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon,  8 Jun 2020 10:58:06 -0700
Subject: [Buildroot] [PATCH v2 1/1] package/earlyoom: new package
In-Reply-To: <20200529015402.2646343-1-joseph.kogut@gmail.com>
References: <20200529015402.2646343-1-joseph.kogut@gmail.com>
Message-ID: <20200608175806.1064874-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EarlyOOM daemon for triggering Linux OOM killer before running out of
memory, avoiding situations where the machine becomes unresponsive from
out of control swapping.

Some desktop distributions are installing and enabling this daemon by
default to prevent unresponsive machines in OOM scenarios.

https://fedoraproject.org/wiki/Changes/EnableEarlyoom
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Changes v1 -> v2:
  * Amend commit message with additional information about usage by
    other distros
  * Add project URL to Config.in help section
  * Add runlevel to sysv init script

 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/earlyoom/Config.in     | 11 ++++++++++
 package/earlyoom/earlyoom.hash |  4 ++++
 package/earlyoom/earlyoom.mk   | 39 ++++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/earlyoom/Config.in
 create mode 100644 package/earlyoom/earlyoom.hash
 create mode 100644 package/earlyoom/earlyoom.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 88050349db..3f64853316 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1366,6 +1366,7 @@ N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/
 F:	package/clang/
+F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
 F:	package/lld/
diff --git a/package/Config.in b/package/Config.in
index 85d7326361..9bda8419c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2335,6 +2335,7 @@ menu "System tools"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/docker-proxy/Config.in"
+	source "package/earlyoom/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
 	source "package/emlog/Config.in"
diff --git a/package/earlyoom/Config.in b/package/earlyoom/Config.in
new file mode 100644
index 0000000000..1df1cd8f63
--- /dev/null
+++ b/package/earlyoom/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_EARLYOOM
+	bool "earlyoom"
+	help
+	  Early OOM daemon for Linux.
+
+	  User space daemon for triggering Linux OOM killer
+	  before running out of memory, avoiding situations
+	  where the machine becomes unresponsive from out of
+	  control swapping.
+
+	  https://github.com/rfjakob/earlyoom
diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
new file mode 100644
index 0000000000..4cafe50bc3
--- /dev/null
+++ b/package/earlyoom/earlyoom.hash
@@ -0,0 +1,4 @@
+# locally calculated
+sha256 b81804fc4470f996014d52252a87a1cf3b43d3d8754140035b10dcee349302b8  earlyoom-1.6.tar.gz
+# License files, locally calculated
+sha256 e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
new file mode 100644
index 0000000000..af32054055
--- /dev/null
+++ b/package/earlyoom/earlyoom.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# earlyoom
+#
+################################################################################
+
+EARLYOOM_VERSION = 1.6
+EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
+EARLYOOM_LICENSE = MIT
+EARLYOOM_LICENSE_FILES = LICENSE
+
+EARLYOOM_MAKE_OPTS = \
+	CC=$(TARGET_CC) \
+	DESTDIR=$(TARGET_DIR) \
+	VERSION=$(EARLYOOM_VERSION) \
+	PREFIX=/usr \
+	SYSTEMDUNITDIR=/usr/lib/systemd/system
+
+define EARLYOOM_CONFIGURE_CMDS
+	$(SED) "/systemctl/d" $(EARLYOOM_DIR)/Makefile
+	$(SED) "/chcon/d" $(EARLYOOM_DIR)/Makefile
+	$(SED) "/update-rc.d/d" $(EARLYOOM_DIR)/Makefile
+	$(SED) "s/init.d\/earlyoom/init.d\/S01_earlyoom/" \
+		$(EARLYOOM_DIR)/Makefile
+endef
+
+define EARLYOOM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) earlyoom $(EARLYOOM_MAKE_OPTS)
+endef
+
+define EARLYOOM_INSTALL_INIT_SYSV
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-initscript $(EARLYOOM_MAKE_OPTS)
+endef
+
+define EARLYOOM_INSTALL_INIT_SYSTEMD
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install $(EARLYOOM_MAKE_OPTS)
+endef
+
+$(eval $(generic-package))
-- 
2.27.0
