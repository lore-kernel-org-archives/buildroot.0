From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 22:09:49 +0200
Subject: [Buildroot] [git commit] xdriver_x86-input-joystick: Install server
	config
Message-ID: <20160413201001.B92EB80273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f30ee8c0e8dcd709731f0a79fe525e0188d4a19e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for joysticks to be detected and used with this
driver, we need an xorg-server configuration file. This commit
installs such conf file to the default X11 xorg.conf.d path,
so we can at least provide a working template.

Users with specific needs can of course override it.

Signed-off-by: Ezequiel Garc??a <ezequiel@vanguardiasur.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - use XDRIVER_XF86_INPUT_JOYSTICK_PKGDIR
 - remove useless empty line.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf         | 6 ++++++
 .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk     | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf b/package/x11r7/xdriver_xf86-input-joystick/50-joystick.conf
new file mode 100644
index 0000000..95a295a
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
index c63312d..2696e2b 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -11,4 +11,11 @@ XDRIVER_XF86_INPUT_JOYSTICK_LICENSE = MIT
 XDRIVER_XF86_INPUT_JOYSTICK_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
+define XDRIVER_XF86_INPUT_JOYSTICK_CONF
+	$(INSTALL) -m 0644 -D \
+		$(XDRIVER_XF86_INPUT_JOYSTICK_PKGDIR)/50-joystick.conf \
+		$(TARGET_DIR)/usr/share/X11/xorg.conf.d/50-joystick.conf
+endef
+XDRIVER_XF86_INPUT_JOYSTICK_POST_INSTALL_TARGET_HOOKS += XDRIVER_XF86_INPUT_JOYSTICK_CONF
+
 $(eval $(autotools-package))
