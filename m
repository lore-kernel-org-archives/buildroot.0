From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 22:51:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] usb_modeswitch: set CXX
 to false when C++ is missing
Message-ID: <20180501073415.A740F890ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b058d288ef1d0150c368647cc1ada6dfead24f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Similar to the openocd fix in commit 5966e2dc54 (package/openocd: fix
fallout after no-C++ fixups) the jimctl that is bundled with
usb_modeswitch also wants to find a binary. This broke with commit
4cd1ab158 (core: alternate solution to disable C++). Revert to 'false'
instead of 'no' here as well.

Fixes:
http://autobuild.buildroot.net/results/b4d/b4d4e925763cb6558af915f9781afe07fc557ebc/
http://autobuild.buildroot.net/results/61b/61b9dc2148df2e8fd0b30e62aedbfd30bb755e19/
http://autobuild.buildroot.net/results/468/468a7e6b049f159fbb4e79d3a12b53ca890f6933/

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 107e3ebf45931adfc9c995dbb5db3bf1d17311d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index c67d4cd583..8dd712f264 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -28,6 +28,7 @@ USB_MODESWITCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define USB_MODESWITCH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
 		JIM_CONFIGURE_OPTS="--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME)" \
 		-C $(@D) $(USB_MODESWITCH_BUILD_TARGETS)
