From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 22:44:34 +0100
Subject: [Buildroot] [git commit] systemd: switch to C.UTF-8 locale when
 building
Message-ID: <20180302214447.87D87815B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41569717c34a2334c8682985d8457447b9b5093a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_REPRODUCIBLE is enabled or host uses non UTF-8 capable locale
building systemd fails with an error:

[1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
FAILED: catalog/systemd.bg.catalog
/buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
Please switch to a UTF-8 locale for your platform.
...
UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)
package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1

This patch changes default host system locale from C to C.UTF-8 when
building systemd package to fix this issue. It also introduces
BR2_NEEDS_HOST_C_UTF8_LOCALE flag that checks if this locale is available on
the host system. If locale is not available error message is show and build
process is stopped.

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
[Thomas: use C.UTF-8 instead of en_US.UTF-8.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                            |  5 +++++
 package/systemd/Config.in            |  1 +
 package/systemd/systemd.mk           | 10 ++++++----
 support/dependencies/dependencies.sh | 13 +++++++++++++
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/Config.in b/Config.in
index 0002df5176..704840653e 100644
--- a/Config.in
+++ b/Config.in
@@ -94,6 +94,11 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
+# Hidden boolean selected by packages that explicitly need C.UTF-8 locale
+# to be available on host system.
+config BR2_NEEDS_HOST_C_UTF8_LOCALE
+	bool
+
 source "arch/Config.in"
 
 menu "Build options"
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 661f40dee4..8978e3bac1 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -27,6 +27,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
 	select BR2_TARGET_TZ_INFO
+	select BR2_NEEDS_HOST_C_UTF8_LOCALE
 	help
 	  systemd is a system and service manager for Linux,
 	  compatible with SysV and LSB init scripts. systemd provides
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 126727d602..793b966ff5 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -385,23 +385,25 @@ endef
 
 SYSTEMD_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
 
+SYSTEMD_ENV = $(TARGET_MAKE_ENV) LANG=C.UTF-8 LC_ALL=C.UTF-8
+
 define SYSTEMD_CONFIGURE_CMDS
 	rm -rf $(@D)/build
 	mkdir -p $(@D)/build
-	$(TARGET_MAKE_ENV) meson $(SYSTEMD_CONF_OPTS) $(@D) $(@D)/build
+	$(SYSTEMD_ENV) meson $(SYSTEMD_CONF_OPTS) $(@D) $(@D)/build
 endef
 
 define SYSTEMD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ninja $(SYSTEMD_NINJA_OPTS) -C $(@D)/build
+	$(SYSTEMD_ENV) ninja $(SYSTEMD_NINJA_OPTS) -C $(@D)/build
 endef
 
 define SYSTEMD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
+	$(SYSTEMD_ENV) DESTDIR=$(TARGET_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
 		-C $(@D)/build install
 endef
 
 define SYSTEMD_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
+	$(SYSTEMD_ENV) DESTDIR=$(STAGING_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
 		-C $(@D)/build install
 endef
 
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 1804e85508..17dbe08fa4 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -207,6 +207,19 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	fi
 fi
 
+if grep -q ^BR2_NEEDS_HOST_C_UTF8_LOCALE=y $BR2_CONFIG; then
+	if ! which locale > /dev/null ; then
+		echo
+		echo "You need locale support on your build machine"
+		exit 1 ;
+	fi
+	if ! LC_ALL=C.UTF-8 locale -c charmap | grep -q '^UTF-8$'; then
+		echo
+		echo "You need C.UTF-8 locale suppport on the host system"
+		exit 1 ;
+	fi
+fi
+
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	check_prog_host "java"
 	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
