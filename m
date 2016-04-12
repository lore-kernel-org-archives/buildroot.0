From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Apr 2016 19:51:36 -0300
Subject: [Buildroot] [PATCH v2] xdriver_x86-input-joystick: Install server
	config
In-Reply-To: <1460439467-29560-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460439467-29560-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460501496-2305-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for joysticks to be detected and used with this
driver, we need an xorg-server configuration file. This commit
installs such conf file to the default X11 xorg.conf.d path,
so we can at least provide a working template.

Users with specific needs can of course override it.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf        | 6 ++++++
 .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk    | 8 ++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf

diff --git a/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf b/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf
new file mode 100644
index 000000000000..95a295ab0010
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf
@@ -0,0 +1,6 @@
+Section "InputClass"
+	Identifier "joystick catchall"
+	MatchIsJoystick "on"
+	MatchDevicePath "/dev/input/event*"
+	Driver "joystick"
+EndSection
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index c63312dd099f..67144eda652b 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -11,4 +11,12 @@ XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+define XDRIVER_XF86_INPUT_JOYSTICK_CONF
+	$(INSTALL) -m 0644 -D \
+		package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf \
+		$(TARGET_DIR)/usr/share/X11/xorg.conf.d/50-joystick.conf
+
+endef
+XDRIVER_XF86_INPUT_JOYSTICK_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_INPUT_JOYSTICK_CONF
+
 $(eval $(autotools-package))
-- 
2.7.0
