From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  4 Nov 2017 09:47:07 +0100
Subject: [Buildroot] [PATCH v2] usb_modeswitch: explicitly set --host /
 --build for the embedded jimtcl
Message-ID: <20171104084707.25418-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/106/106af20196089e74c35daabdae46f030981600bd/

Otherwise the (handwritten) configure script uses a config.guess script from
2010 to figure out the build host, breaking builds on ppc64le hosts.

The result of --host / --build is only used to detect if we are building for
Windows or not, which is why things are working on x86(-64) build hosts
without specifying --host even though we are cross compiling - But this may
change in the future, so we better pass the correct values.

Passing extra jimtcl configure flags is unfortunately not forseen in the
usb_modeswitch Makefile, so add a small patch making this possible.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...low-extra-configure-flags-to-be-passed-to.patch | 29 ++++++++++++++++++++++
 package/usb_modeswitch/usb_modeswitch.mk           |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch

diff --git a/package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch b/package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch
new file mode 100644
index 0000000000..9e1e681fa5
--- /dev/null
+++ b/package/usb_modeswitch/0001-Makefile-allow-extra-configure-flags-to-be-passed-to.patch
@@ -0,0 +1,29 @@
+From 1309df373c882f27f476130b06746a6d1e1a0f85 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 3 Nov 2017 23:21:44 +0100
+Subject: [PATCH] Makefile: allow extra configure flags to be passed to jimtcl
+ on the make command line
+
+E.G. to pass --host / --build for cross compilation.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a151e2a..94dabd9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -19,7 +19,7 @@ TCL        ?= $(HOST_TCL)
+ else
+ TCL        ?= /usr/bin/tclsh
+ endif
+-JIM_CONFIGURE_OPTS = --disable-lineedit \
++override JIM_CONFIGURE_OPTS += --disable-lineedit \
+ 	--with-out-jim-ext="stdlib posix load signal syslog" --prefix=/usr
+ 
+ .PHONY: clean install install-common uninstall \
+-- 
+2.11.0
+
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 1901767f89..ea08de256b 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -23,6 +23,7 @@ endif
 define USB_MODESWITCH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE -Wall -I." \
+		JIM_CONFIGURE_OPTS="--host=$(GNU_TARGET_NAME) --build=$(GNU_HOST_NAME)" \
 		-C $(@D) $(USB_MODESWITCH_BUILD_TARGETS)
 endef
 
-- 
2.11.0
