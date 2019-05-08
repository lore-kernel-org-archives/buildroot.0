From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Thu,  9 May 2019 00:09:37 +0200
Subject: [Buildroot] [PATCH 13/13] package/skeleton-init-openrc: add support
 for starting sysv scripts
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190508220937.23200-13-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* package/skeleton-init-openrc/skeleton/etc/init.d/sysv-rcs
  This openrc script implements rcS and rcK equivalent which will
  start or stop any script from /etc/init.d/S??*

* package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
  symlink to /etc/init.d/sysv-rcs to start service at startup

* package/pkg-generic.mk
  When openrc is enabled, evaluate $(PKG)_INSTALL_INIT_OPENRC, but
  if install steps for openrc are not avilable, then evaluate
  $(PKG)_INSTALL_INIT_SYSV))

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 package/pkg-generic.mk                        |  4 +-
 .../skeleton/etc/init.d/sysv-rcs              | 53 +++++++++++++++++++
 .../skeleton/etc/runlevels/default/sysv-rcs   |  1 +
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100755 package/skeleton-init-openrc/skeleton/etc/init.d/sysv-rcs
 create mode 120000 package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6d63c46a5b..dc335973c7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -338,7 +338,9 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
 	$(if $(BR2_INIT_OPENRC), \
-		$($(PKG)_INSTALL_INIT_OPENRC))
+		$(if $($(PKG)_INSTALL_INIT_OPENRC), \
+			$($(PKG)_INSTALL_INIT_OPENRC), \
+			$($(PKG)_INSTALL_INIT_SYSV)))
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
diff --git a/package/skeleton-init-openrc/skeleton/etc/init.d/sysv-rcs b/package/skeleton-init-openrc/skeleton/etc/init.d/sysv-rcs
new file mode 100755
index 0000000000..9cbfe354d1
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/etc/init.d/sysv-rcs
@@ -0,0 +1,53 @@
+#!/sbin/openrc-run
+
+description="start or stop sysv rc[S,K] scripts"
+
+depend() {
+	after local
+}
+
+start() {
+	einfo "Starting sysv rc scripts"
+	for i in /etc/init.d/S??* ; do
+		# Ignore dangling symlinks (if any).
+		[ ! -f "$i" ] && continue
+
+		case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set start
+				. $i
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			$i start
+			;;
+		esac
+	done
+}
+
+stop() {
+	einfo "Stopping sysv rc scripts"
+	for i in /etc/init.d/S??* ; do
+		# Ignore dangling symlinks (if any).
+		[ ! -f "$i" ] && continue
+
+		case "$i" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				set stop
+				. $i
+			)
+			;;
+		*)
+			# No sh extension, so fork subprocess.
+			$i stop
+			;;
+		esac
+	done
+}
diff --git a/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
new file mode 120000
index 0000000000..ef5e00823c
--- /dev/null
+++ b/package/skeleton-init-openrc/skeleton/etc/runlevels/default/sysv-rcs
@@ -0,0 +1 @@
+/etc/init.d/sysv-rcs
\ No newline at end of file
-- 
2.18.1
