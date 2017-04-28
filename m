From: Martin Kepplinger <martink@posteo.de>
Date: Fri, 28 Apr 2017 15:33:54 +0200
Subject: [Buildroot] [PATCH v2] x11r7: xdriver_xf86-input-tslib: update to
	0.0.7
In-Reply-To: <1493382976-26007-2-git-send-email-martink@posteo.de>
References: <1493382976-26007-2-git-send-email-martink@posteo.de>
Message-ID: <1493386434-26756-1-git-send-email-martink@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches are removed as they are part of this release. 0.0.7 is a
bugfix and compatibility release to keep this usable for on newer systems.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

damn, I forgot to update the hash

revision history
----------------
v2: fix the hash
v1: initial commit


 .../0001-fix-segfault.patch                        |  34 ----
 .../0002-port-abi-12.patch                         | 196 ---------------------
 .../xdriver_xf86-input-tslib.hash                  |   4 +-
 .../xdriver_xf86-input-tslib.mk                    |   2 +-
 4 files changed, 3 insertions(+), 233 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-input-tslib/0001-fix-segfault.patch
 delete mode 100644 package/x11r7/xdriver_xf86-input-tslib/0002-port-abi-12.patch

diff --git a/package/x11r7/xdriver_xf86-input-tslib/0001-fix-segfault.patch b/package/x11r7/xdriver_xf86-input-tslib/0001-fix-segfault.patch
deleted file mode 100644
index adef18b..0000000
--- a/package/x11r7/xdriver_xf86-input-tslib/0001-fix-segfault.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Fetch from: https://launchpad.net/ubuntu/+archive/primary/+files/xf86-input-tslib_0.0.6-7build3.debian.tar.gz
-
-Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
----
---- xf86-input-tslib-0.0.6/src/tslib.c	2009-10-19 18:07:18.000000000 +0300
-+++ xf86-input-tslib-0.0.6.new/src/tslib.c	2010-02-12 16:15:05.000000000 +0200
-@@ -103,8 +103,6 @@
- static void
- PointerControlProc(DeviceIntPtr dev, PtrCtrl * ctrl)
- {
--	ErrorF("%s\n", __FUNCTION__);
--	return;
- }
- 
- static Bool
-@@ -406,7 +404,9 @@
- 		xf86MotionHistoryAllocate(pInfo);
- #endif
- 
--		break;
-+		if (!InitPtrFeedbackClassDeviceStruct(device, PointerControlProc))
-+			return !Success;
-+		break;
- 
- 	case DEVICE_ON:
- 		AddEnabledDevice(pInfo->fd);
-@@ -435,6 +435,7 @@
- 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
- 	ts_close(priv->ts);
- 	xfree(pInfo->private);
-+	pInfo->private = NULL;
- 	xf86DeleteInput(pInfo, 0);
- }
- 
diff --git a/package/x11r7/xdriver_xf86-input-tslib/0002-port-abi-12.patch b/package/x11r7/xdriver_xf86-input-tslib/0002-port-abi-12.patch
deleted file mode 100644
index eb8fb54..0000000
--- a/package/x11r7/xdriver_xf86-input-tslib/0002-port-abi-12.patch
+++ /dev/null
@@ -1,196 +0,0 @@
-Fetch from: https://launchpad.net/ubuntu/+archive/primary/+files/xf86-input-tslib_0.0.6-7build3.debian.tar.gz
-Fixes build against newer versions of xorg.
-
-Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
----
-Index: xf86-input-tslib-trunk/src/tslib.c
-===================================================================
---- xf86-input-tslib-trunk/src/tslib.c	(revision 48)
-+++ xf86-input-tslib-trunk/src/tslib.c	(working copy)
-@@ -69,6 +69,13 @@
- #define DEFAULT_HEIGHT		240
- #define DEFAULT_WIDTH		320
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
-+#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options), NULL)
-+#else
-+#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options))
-+#endif
-+
-+
- enum { TSLIB_ROTATE_NONE=0, TSLIB_ROTATE_CW=270, TSLIB_ROTATE_UD=180, TSLIB_ROTATE_CCW=90 };
- 
- enum button_state { BUTTON_NOT_PRESSED = 0, BUTTON_1_PRESSED = 1, BUTTON_3_CLICK = 3, BUTTON_3_CLICKED=4, BUTTON_EMULATION_OFF=-1 };
-@@ -106,7 +113,7 @@
- }
- 
- static Bool
--ConvertProc( LocalDevicePtr local,
-+ConvertProc( InputInfoPtr local,
- 			 int first,
- 			 int num,
- 			 int v0,
-@@ -135,7 +142,7 @@
-     return t;
- }
- 
--static void ReadInput (LocalDevicePtr local)
-+static void ReadInput (InputInfoPtr local)
- {
- 	struct ts_priv *priv = (struct ts_priv *) (local->private);
- 	struct ts_sample samp;
-@@ -382,7 +389,11 @@
- 					       axiswidth - 1,	/* max val */
- 					       axiswidth,	/* resolution */
- 					       0,		/* min_res */
--					       axiswidth);	/* max_res */
-+					       axiswidth	/* max_res */
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
-+					       ,Absolute
-+#endif
-+					       );
- 
- 		InitValuatorAxisStruct(device, 1,
- #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 7
-@@ -392,7 +403,11 @@
- 					       axisheight - 1,	/* max val */
- 					       axisheight,	/* resolution */
- 					       0,		/* min_res */
--					       axisheight);	/* max_res */
-+					       axisheight	/* max_res */
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
-+					       ,Absolute
-+#endif
-+					       );
- 
- 		if (InitProximityClassDeviceStruct (device) == FALSE) {
- 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
-@@ -434,7 +449,7 @@
- 	ErrorF("%s\n", __FUNCTION__);
- 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
- 	ts_close(priv->ts);
--	xfree(pInfo->private);
-+	free(pInfo->private);
- 	pInfo->private = NULL;
- 	xf86DeleteInput(pInfo, 0);
- }
-@@ -444,47 +459,57 @@
-  *
-  * called when the module subsection is found in XF86Config
-  */
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
-+static int 
-+xf86TslibInit(InputDriverPtr drv, InputInfoPtr pInfo, int flags)
-+#else
- static InputInfoPtr
- xf86TslibInit(InputDriverPtr drv, IDevPtr dev, int flags)
-+#endif
- {
- 	struct ts_priv *priv;
- 	char *s;
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 	InputInfoPtr pInfo;
-+#endif
- 
--	priv = xcalloc (1, sizeof (struct ts_priv));
-+	priv = calloc (1, sizeof (struct ts_priv));
-         if (!priv)
--                return NULL;
-+                return BadValue;
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 	if (!(pInfo = xf86AllocateInput(drv, 0))) {
--		xfree(priv);
--		return NULL;
-+		free(priv);
-+		return BadValue;
- 	}
- 
- 	/* Initialise the InputInfoRec. */
- 	pInfo->name = dev->identifier;
--	pInfo->type_name = XI_TOUCHSCREEN;
- 	pInfo->flags =
- 	    XI86_KEYBOARD_CAPABLE | XI86_POINTER_CAPABLE |
- 	    XI86_SEND_DRAG_EVENTS;
--	pInfo->device_control = xf86TslibControlProc;
--	pInfo->read_input = ReadInput;
- #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) == 0
- 	pInfo->motion_history_proc = xf86GetMotionEvents;
- 	pInfo->history_size = 0;
- #endif
--	pInfo->control_proc = NULL;
-+	pInfo->conf_idev = dev;
- 	pInfo->close_proc = NULL;
--	pInfo->switch_mode = NULL;
- 	pInfo->conversion_proc = ConvertProc;
- 	pInfo->reverse_conversion_proc = NULL;
--	pInfo->dev = NULL;
- 	pInfo->private_flags = 0;
- 	pInfo->always_core_feedback = 0;
--	pInfo->conf_idev = dev;
-+#endif
-+
-+	pInfo->type_name = XI_TOUCHSCREEN;
-+	pInfo->control_proc = NULL;
-+	pInfo->read_input = ReadInput;
-+	pInfo->device_control = xf86TslibControlProc;
-+	pInfo->switch_mode = NULL;
- 	pInfo->private = priv;
-+	pInfo->dev = NULL;
- 
- 	/* Collect the options, and process the common options. */
--	xf86CollectInputOptions(pInfo, NULL, NULL);
-+	COLLECT_INPUT_OPTIONS(pInfo, NULL);
- 	xf86ProcessCommonOptions(pInfo, pInfo->options);
- 
- 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
-@@ -510,23 +535,31 @@
- 		priv->rotate = TSLIB_ROTATE_NONE;
- 	}
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
-  	s = xf86CheckStrOption(dev->commonOptions, "path", NULL);
-+#else
-+	s = xf86CheckStrOption(pInfo->options, "path", NULL);
-+#endif
-   	if (!s)
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 		s = xf86CheckStrOption(dev->commonOptions, "Device", NULL);
-+#else
-+		s = xf86CheckStrOption(pInfo->options, "Device", NULL);
-+#endif
-  
- 	priv->ts = ts_open(s, 1);
--	xfree(s);
-+	free(s);
- 
- 	if (!priv->ts) {
- 		ErrorF("ts_open failed (device=%s)\n",s);
- 		xf86DeleteInput(pInfo, 0);
--		return NULL;
-+		return BadValue;
- 	}
- 
- 	if (ts_config(priv->ts)) {
- 		ErrorF("ts_config failed\n");
- 		xf86DeleteInput(pInfo, 0);
--		return NULL;
-+		return BadValue;
- 	}
- 
- 	pInfo->fd = ts_fd(priv->ts);
-@@ -536,11 +569,13 @@
- 		priv->state = BUTTON_EMULATION_OFF;
- 	}
- 
-+#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
- 	/* Mark the device configured */
- 	pInfo->flags |= XI86_CONFIGURED;
-+#endif
- 
- 	/* Return the configured device */
--	return (pInfo);
-+	return Success;
- }
- 
- _X_EXPORT InputDriverRec TSLIB = {
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
index 9eb3f1d..b8eb2b8 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105  xf86-input-tslib-0.0.6.tar.bz2
+# https://github.com/merge/xf86-input-tslib/releases/download/0.0.7/xf86-input-tslib-0.0.7.tar.bz2.sha256
+sha256 6f23cc9702b0ae16086d364b275335c094efbf6acde57f8a030e4db5b9aece03  xf86-input-tslib-0.0.7.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index 0a92153..6f4b64f 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
+XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.7
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_TSLIB_SITE = https://github.com/merge/xf86-input-tslib/releases/download/$(TSLIB_VERSION)
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
-- 
2.1.4
