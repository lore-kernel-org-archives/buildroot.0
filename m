From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun, 12 May 2019 21:55:42 +0200
Subject: [Buildroot] [PATCH v2 05/13] package/pkg-generic.mk: add
 _INSTALL_INIT_OPENRC
In-Reply-To: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
Message-ID: <20190512195550.24457-5-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* package/pkg-generic.mk
  Add _INSTALL_INIT_OPENRC so packages can define own steps to perform
  to install openrc service scripts.

* docs/manual/adding-packages-generic.txt
  update documentation about new hook.

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

---
Changes v1 -> v2
  Suggested by Thomas Petazzoni:
  - update "adding-packages-generic.txt" about new hook
---
 docs/manual/adding-packages-generic.txt | 13 +++++++------
 package/pkg-generic.mk                  |  2 ++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 7be1754f54..5ac07a81b4 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -536,12 +536,13 @@ different steps of the build process.
   should utilize this step if it has binaries which would be similar
   to the kernel image, bootloader or root filesystem images.
 
-* +LIBFOO_INSTALL_INIT_SYSV+ and +LIBFOO_INSTALL_INIT_SYSTEMD+ list the
-  actions to install init scripts either for the systemV-like init systems
-  (busybox, sysvinit, etc.) or for the systemd units. These commands
-  will be run only when the relevant init system is installed (i.e. if
-  systemd is selected as the init system in the configuration, only
-  +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run).
+* +LIBFOO_INSTALL_INIT_SYSV+, +LIBFOO_INSTALL_INIT_OPENRC+ and
+  +LIBFOO_INSTALL_INIT_SYSTEMD+ list the actions to install init
+  scripts either for the systemV-like init systems (busybox,
+  sysvinit, etc.), openrc or for the systemd units. These commands
+  will be run only when the relevant init system is installed (i.e.
+  if systemd is selected as the init system in the configuration,
+  only +LIBFOO_INSTALL_INIT_SYSTEMD+ will be run).
 
 * +LIBFOO_HELP_CMDS+ lists the actions to print the package help, which
   is included to the main +make help+ output. These commands can print
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 67782138b4..6d63c46a5b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -337,6 +337,8 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
 	$(if $(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),\
 		$($(PKG)_INSTALL_INIT_SYSV))
+	$(if $(BR2_INIT_OPENRC), \
+		$($(PKG)_INSTALL_INIT_OPENRC))
 	$(foreach hook,$($(PKG)_POST_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
-- 
2.18.1
