From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 21:55:09 +0100
Subject: [Buildroot] [git commit] efl: optional 'upower' ecore system module.
Message-ID: <20170108205619.839C580386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c78f24301c5d226473799306f587e59265580907
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ecore will reach 'upower' using D-Bus system bus in order to detect if
the system state changes and let applications know about the power
state such as low battery or AC power in order to optimize their power
consumption.

For host this is not needed and would not work, since output/host DBus
declares its own output/host/var/run/dbus/system_bus_socket, which has
no dbus-daemon and thus no services in it.

For target it's optional and only installed if BR2_PACKAGE_UPOWER=y,
otherwise it prints error messages about missing upower service.

Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 7a8e47f..2fe140a 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -272,6 +272,18 @@ else
 EFL_CONF_OPTS += --disable-librsvg
 endif
 
+ifeq ($(BR2_PACKAGE_UPOWER),)
+# upower ecore system module is only useful if upower
+# dbus service is available.
+# It's not essential, only used to notify applications
+# of power state, such as low battery or AC power, so
+# they can adapt their power consumption.
+define EFL_HOOK_REMOVE_UPOWER
+	rm -fr $(TARGET_DIR)/usr/lib/ecore/system/upower
+endef
+EFL_POST_INSTALL_TARGET_HOOKS = EFL_HOOK_REMOVE_UPOWER
+endif
+
 $(eval $(autotools-package))
 
 ################################################################################
@@ -352,4 +364,13 @@ else
 HOST_EFL_CONF_OPTS += --disable-cxx-bindings
 endif
 
+# Always disable upower system module from host as it's
+# not useful and would try to use the output/host/var
+# system bus which is non-existent and does not contain
+# any upower service in it.
+define HOST_EFL_HOOK_REMOVE_UPOWER
+	rm -fr $(HOST_DIR)/usr/lib/ecore/system/upower
+endef
+HOST_EFL_POST_INSTALL_HOOKS = HOST_EFL_HOOK_REMOVE_UPOWER
+
 $(eval $(host-autotools-package))
