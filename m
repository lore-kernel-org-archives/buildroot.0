From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:28 +0200
Subject: [Buildroot] [PATCH 04/13] package/openrc: add support for spawning
 getty
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-4-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* package/openrc/openrc.mk
  add code that monitors BR2_TARGET_GENERIC_GETTY and if set,
  creates configuration file (with SYSTEM_GETTY_*) for port in
  /etc/conf.d/getty.$(SYSTEM_GETTY_PORT) and links so openrc
  starts service.

* package/skeleton-init-openrc/skeleton/etc/init.d/getty
  openrc service that spawns getty on configured port.

* system/Config.in
  change dependency of BR2_TARGET_GENERIC_GETTY_TERM and
  BR2_TARGET_GENERIC_GETTY_OPTIONS so openrc can make use
  of these fields too.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 package/openrc/openrc.mk                      | 13 ++++++++
 .../skeleton/etc/conf.d/.empty                |  0
 .../skeleton/etc/init.d/getty                 | 31 +++++++++++++++++++
 .../skeleton/etc/runlevels/default/.empty     |  0
 system/Config.in                              |  8 ++---
 5 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 package/skeleton-init-openrc/skeleton/etc/conf.d/.empty
 create mode 100755 package/skeleton-init-openrc/skeleton/etc/init.d/getty
 create mode 100644 package/skeleton-init-openrc/skeleton/etc/runlevels/default/.empty

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index faffb5beb0..f0aa014256 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -43,4 +43,17 @@ define OPENRC_REMOVE_UNNEEDED
 endef
 OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_REMOVE_UNNEEDED
 
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+GETTY_SVCNAME = getty.$(SYSTEM_GETTY_PORT)
+GETTY_CONF_D = $(TARGET_DIR)/etc/conf.d/$(GETTY_SVCNAME)
+define OPENRC_SET_GETTY
+	echo "baud=\"$(SYSTEM_GETTY_BAUDRATE)\"" > $(GETTY_CONF_D)
+	echo "term_type=\"$(SYSTEM_GETTY_TERM)\"" >> $(GETTY_CONF_D)
+	echo "getty_options=\"-L $(SYSTEM_GETTY_OPTIONS)\"" >> $(GETTY_CONF_D)
+	ln -sf getty $(TARGET_DIR)/etc/init.d/$(GETTY_SVCNAME)
+	ln -sf /etc/init.d/$(GETTY_SVCNAME) $(TARGET_DIR)/etc/runlevels/default/$(GETTY_SVCNAME)
+endef
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY
+endif # BR2_TARGET_GENERIC_GETTY
+
 $(eval $(generic-package))
diff --git a/package/skeleton-init-openrc/skeleton/etc/conf.d/.empty b/package/skeleton-init-openrc/skeleton/etc/conf.d/.empty
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/skeleton-init-openrc/skeleton/etc/init.d/getty b/package/skeleton-init-openrc/skeleton/etc/init.d/getty
new file mode 100755
index 0000000000..acae1b218b
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/etc/init.d/getty
@@ -0,0 +1,31 @@
+#!/sbin/openrc-run
+# based on agetty service from OpenRC package
+
+description="start getty on terminal"
+supervisor=supervise-daemon
+port="${RC_SVCNAME#*.}"
+term_type="${term_type:-linux}"
+command=/sbin/getty
+command_args_foreground="${getty_options} ${baud} ${port} ${term_type}"
+pidfile="/run/${RC_SVCNAME}.pid"
+
+depend() {
+	# start getty at the very end of init
+	after *
+	keyword -prefix
+}
+
+start_pre() {
+	if [ -z "$port" ]; then
+		eerror "${RC_SVCNAME} cannot be started directly. You must create"
+		eerror "symbolic links to it for the ports you want to start"
+		eerror "agetty on and add those to the appropriate runlevels."
+		return 1
+	else
+		export EINFO_QUIET="${quiet:-yes}"
+	fi
+}
+
+stop_pre() {
+	export EINFO_QUIET="${quiet:-yes}"
+}
diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/.empty b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/.empty
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/system/Config.in b/system/Config.in
index 808fc070f3..90aa0e52b9 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -343,16 +343,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
 config BR2_TARGET_GENERIC_GETTY_TERM
 	string "TERM environment variable"
 	default "vt100"
-	# currently observed only by busybox and sysvinit
-	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+	# currently observed by all but systemd
+	depends on !BR2_INIT_SYSTEMD
 	help
 	  Specify a TERM type.
 
 config BR2_TARGET_GENERIC_GETTY_OPTIONS
 	string "other options to pass to getty"
 	default ""
-	# currently observed only by busybox and sysvinit
-	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV
+	# currently observed by all but systemd
+	depends on !BR2_INIT_SYSTEMD
 	help
 	  Any other flags you want to pass to getty,
 	  Refer to getty --help for details.
-- 
2.18.1
