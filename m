From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:29:28 +0200
Subject: [Buildroot] [git commit] package/openrc: add support for spawning
 getty
Message-ID: <20190923210218.ABA098F1E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4019559de087d9b3a7f54d6b05e388af92b41746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We install a template getty service, and we 'instantiate' it in the
default runlevel, using the configured tty.

Ideally, packages that provide a getty program would be responsible
for installing the corresponding service file. However, to keep
consistency with the existing init systems (busybox, systemd, and
sysv), so we do provide it from the openrc package itself.

OpenRC only acts on the files in a runlevel sub-directory, but the
documentation [0] actually suggests that the instance symlink be done
in init.d, and then again symlinked into the actual runlevel
sub-directory. So, we abide by the rules.

Also, to be noted, the getty service file is installed without ensuring
that a getty command is available. This again is not unlike other init
systems, sysvinit and busybox, which behave the same.

[0] https://wiki.gentoo.org/wiki/OpenRC

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
[yann.morin.1998 at free.fr:
  - move getty template to openrc package  (Thomas)
  - fix namespace of the vaiables (Thomas)
  - simplify creation of the defaults file
  - rewrite commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/getty                               | 24 ++++++++++++++++++++++
 package/openrc/openrc.mk                           | 18 ++++++++++++++++
 .../skeleton/etc/conf.d/.empty                     |  0
 .../skeleton/etc/runlevels/default/.empty          |  0
 system/Config.in                                   |  8 ++++----
 5 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/package/openrc/getty b/package/openrc/getty
new file mode 100755
index 0000000000..8fcb071f8a
--- /dev/null
+++ b/package/openrc/getty
@@ -0,0 +1,24 @@
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
+	export EINFO_QUIET="${quiet:-yes}"
+}
+
+stop_pre() {
+	export EINFO_QUIET="${quiet:-yes}"
+}
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 53f2947dcc..5978b6de5d 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -42,4 +42,22 @@ define OPENRC_REMOVE_UNNEEDED
 endef
 OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_REMOVE_UNNEEDED
 
+ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
+OPENRC_GETTY_SVCNAME = getty.$(SYSTEM_GETTY_PORT)
+OPENRC_GETTY_CONF_D = $(TARGET_DIR)/etc/conf.d/$(OPENRC_GETTY_SVCNAME)
+define OPENRC_SET_GETTY
+	{ \
+		echo "baud=\"$(SYSTEM_GETTY_BAUDRATE)\""; \
+		echo "term_type=\"$(SYSTEM_GETTY_TERM)\"" ; \
+		echo "getty_options=\"-L $(SYSTEM_GETTY_OPTIONS)\""; \
+	} > $(OPENRC_GETTY_CONF_D)
+	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/getty \
+		$(TARGET_DIR)/etc/init.d/getty
+	ln -sf getty $(TARGET_DIR)/etc/init.d/$(OPENRC_GETTY_SVCNAME)
+	ln -sf /etc/init.d/$(OPENRC_GETTY_SVCNAME) \
+		$(TARGET_DIR)/etc/runlevels/default/$(OPENRC_GETTY_SVCNAME)
+endef
+OPENRC_TARGET_FINALIZE_HOOKS += OPENRC_SET_GETTY
+endif # BR2_TARGET_GENERIC_GETTY
+
 $(eval $(generic-package))
diff --git a/package/skeleton-init-openrc/skeleton/etc/conf.d/.empty b/package/skeleton-init-openrc/skeleton/etc/conf.d/.empty
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/.empty b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/.empty
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/system/Config.in b/system/Config.in
index af7d8566d3..1bfe069b2e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -348,16 +348,16 @@ config BR2_TARGET_GENERIC_GETTY_BAUDRATE
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
