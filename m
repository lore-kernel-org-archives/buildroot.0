From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  6 Nov 2017 15:17:10 +0100
Subject: [Buildroot] [PATCH 2/2] usb_modeswitch: update config.guess /
 config.sub
In-Reply-To: <20171106141710.6029-1-peter@korsgaard.com>
References: <20171106141710.6029-1-peter@korsgaard.com>
Message-ID: <20171106141710.6029-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/fbe/fbe21bd173e6566dd93dddd58d4a848de8a3465e/

The build system of the embedded jimtcl copy doesn't use autotools, but does
use an old version of gnuconfig which doesn't know all the architectures
supported by Buildroot, so update config.guess / config.sub like we do in
pkg-autotools.mk

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usb_modeswitch/usb_modeswitch.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index ea08de256b..c67d4cd583 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -20,6 +20,12 @@ USB_MODESWITCH_BUILD_TARGETS = script
 USB_MODESWITCH_INSTALL_TARGETS = install-script
 endif
 
+# build system of embedded jimtcl doesn't use autotools, but does use
+# an old version of gnuconfig which doesn't know all the architectures
+# supported by Buildroot, so update config.guess / config.sub like we
+# do in pkg-autotools.mk
+USB_MODESWITCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
 define USB_MODESWITCH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
-- 
2.11.0
