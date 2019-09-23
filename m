From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:29:28 +0200
Subject: [Buildroot] [git commit] package/skeleton-init-openrc: add support
 for starting sysv scripts
Message-ID: <20190923210218.95AC18F1E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=162044407b0f3794cd6d70749ed615de5902c7c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an OpenRC service that starts and stops sysv-init scripts. We order
that script 'after local' so that it is started after all other native
openrc services.

Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
[yann.morin.1998 at free.fr:
  - don't propagate the micro optimisation for running .sh scripts
  - use spaces, not TABs
  - stop services in reverse order
  - reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt            |  5 ++++-
 package/openrc/sysv-rcs                            | 25 ++++++++++++++++++++++
 package/pkg-generic.mk                             |  3 ++-
 .../skeleton/etc/runlevels/default/sysv-rcs        |  1 +
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 5ac07a81b4..b402767b05 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -542,7 +542,10 @@ different steps of the build process.
   sysvinit, etc.), openrc or for the systemd units. These commands
   will be run only when the relevant init system is installed (i.e.
   if systemd is selected as the init system in the configuration,
-  only +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run).
+  only +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run). The only exception
+  is when openrc is chosen as init system and +LIBFOO_INSTALL_INIT_OPENRC+
+  has not been set, in such situation +LIBFOO_INSTALL_INIT_SYSV+ will
+  be called, since openrc supports sysv init scripts.
 
 * +LIBFOO_HELP_CMDS+ lists the actions to print the package help, which
   is included to the main +make help+ output. These commands can print
diff --git a/package/openrc/sysv-rcs b/package/openrc/sysv-rcs
new file mode 100755
index 0000000000..606a73d2b4
--- /dev/null
+++ b/package/openrc/sysv-rcs
@@ -0,0 +1,25 @@
+#!/sbin/openrc-run
+
+description="start or stop sysv rc[S,K] scripts"
+
+depend() {
+    after local
+}
+
+start() {
+    einfo "Starting sysv rc scripts"
+    for i in /etc/init.d/S??*; do
+        # Ignore dangling symlinks (if any).
+        [ -e "$i" ] || continue
+        $i start
+    done
+}
+
+stop() {
+    einfo "Stopping sysv rc scripts"
+    for i in $(ls -r /etc/init.d/S??*); do
+        # Ignore dangling symlinks (if any).
+        [ -e "$i" ] || continue
+        $i stop
+    done
+}
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9620dec524..1f24b52a69 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -338,7 +338,8 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$(if $(BR2_INIT_OPENRC), \
-		$($(PKG)_INSTALL_INIT_OPENRC))
+		$(or $($(PKG)_INSTALL_INIT_OPENRC), \
+			$($(PKG)_INSTALL_INIT_SYSV)))
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
new file mode 120000
index 0000000000..ef5e00823c
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
@@ -0,0 +1 @@
+/etc/init.d/sysv-rcs
\ No newline at end of file
