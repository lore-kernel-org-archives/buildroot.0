From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:03 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-input-tslib: fixed build
	against new x11 version
Message-ID: <20130324225158.E2C939B226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f386dcd39be98ad1a76c9ef69021148cf9af1d26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 ...driver_xf86-input-tslib-0001-fix-segfault.patch |   34 ++++
 ...xdriver_xf86-input-tslib-0002-port-abi-12.patch |  196 ++++++++++++++++++++
 2 files changed, 230 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0001-fix-segfault.patch b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0001-fix-segfault.patch
new file mode 100644
index 0000000..adef18b
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0001-fix-segfault.patch
@@ -0,0 +1,34 @@
+Fetch from: https://launchpad.net/ubuntu/+archive/primary/+files/xf86-input-tslib_0.0.6-7build3.debian.tar.gz
+
+Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
+---
+--- xf86-input-tslib-0.0.6/src/tslib.c	2009-10-19 18:07:18.000000000 +0300
++++ xf86-input-tslib-0.0.6.new/src/tslib.c	2010-02-12 16:15:05.000000000 +0200
+@@ -103,8 +103,6 @@
+ static void
+ PointerControlProc(DeviceIntPtr dev, PtrCtrl * ctrl)
+ {
+-	ErrorF("%s\n", __FUNCTION__);
+-	return;
+ }
+ 
+ static Bool
+@@ -406,7 +404,9 @@
+ 		xf86MotionHistoryAllocate(pInfo);
+ #endif
+ 
+-		break;
++		if (!InitPtrFeedbackClassDeviceStruct(device, PointerControlProc))
++			return !Success;
++		break;
+ 
+ 	case DEVICE_ON:
+ 		AddEnabledDevice(pInfo->fd);
+@@ -435,6 +435,7 @@
+ 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
+ 	ts_close(priv->ts);
+ 	xfree(pInfo->private);
++	pInfo->private = NULL;
+ 	xf86DeleteInput(pInfo, 0);
+ }
+ 
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0002-port-abi-12.patch b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0002-port-abi-12.patch
new file mode 100644
index 0000000..eb8fb54
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib-0002-port-abi-12.patch
@@ -0,0 +1,196 @@
+Fetch from: https://launchpad.net/ubuntu/+archive/primary/+files/xf86-input-tslib_0.0.6-7build3.debian.tar.gz
+Fixes build against newer versions of xorg.
+
+Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
+---
+Index: xf86-input-tslib-trunk/src/tslib.c
+===================================================================
+--- xf86-input-tslib-trunk/src/tslib.c	(revision 48)
++++ xf86-input-tslib-trunk/src/tslib.c	(working copy)
+@@ -69,6 +69,13 @@
+ #define DEFAULT_HEIGHT		240
+ #define DEFAULT_WIDTH		320
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
++#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options), NULL)
++#else
++#define COLLECT_INPUT_OPTIONS(pInfo, options) xf86CollectInputOptions((pInfo), (options))
++#endif
++
++
+ enum { TSLIB_ROTATE_NONE=0, TSLIB_ROTATE_CW=270, TSLIB_ROTATE_UD=180, TSLIB_ROTATE_CCW=90 };
+ 
+ enum button_state { BUTTON_NOT_PRESSED = 0, BUTTON_1_PRESSED = 1, BUTTON_3_CLICK = 3, BUTTON_3_CLICKED=4, BUTTON_EMULATION_OFF=-1 };
+@@ -106,7 +113,7 @@
+ }
+ 
+ static Bool
+-ConvertProc( LocalDevicePtr local,
++ConvertProc( InputInfoPtr local,
+ 			 int first,
+ 			 int num,
+ 			 int v0,
+@@ -135,7 +142,7 @@
+     return t;
+ }
+ 
+-static void ReadInput (LocalDevicePtr local)
++static void ReadInput (InputInfoPtr local)
+ {
+ 	struct ts_priv *priv = (struct ts_priv *) (local->private);
+ 	struct ts_sample samp;
+@@ -382,7 +389,11 @@
+ 					       axiswidth - 1,	/* max val */
+ 					       axiswidth,	/* resolution */
+ 					       0,		/* min_res */
+-					       axiswidth);	/* max_res */
++					       axiswidth	/* max_res */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++					       ,Absolute
++#endif
++					       );
+ 
+ 		InitValuatorAxisStruct(device, 1,
+ #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 7
+@@ -392,7 +403,11 @@
+ 					       axisheight - 1,	/* max val */
+ 					       axisheight,	/* resolution */
+ 					       0,		/* min_res */
+-					       axisheight);	/* max_res */
++					       axisheight	/* max_res */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++					       ,Absolute
++#endif
++					       );
+ 
+ 		if (InitProximityClassDeviceStruct (device) == FALSE) {
+ 			ErrorF ("Unable to allocate EVTouch touchscreen ProximityClassDeviceStruct\n");
+@@ -434,7 +449,7 @@
+ 	ErrorF("%s\n", __FUNCTION__);
+ 	xf86TslibControlProc(pInfo->dev, DEVICE_OFF);
+ 	ts_close(priv->ts);
+-	xfree(pInfo->private);
++	free(pInfo->private);
+ 	pInfo->private = NULL;
+ 	xf86DeleteInput(pInfo, 0);
+ }
+@@ -444,47 +459,57 @@
+  *
+  * called when the module subsection is found in XF86Config
+  */
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 12
++static int 
++xf86TslibInit(InputDriverPtr drv, InputInfoPtr pInfo, int flags)
++#else
+ static InputInfoPtr
+ xf86TslibInit(InputDriverPtr drv, IDevPtr dev, int flags)
++#endif
+ {
+ 	struct ts_priv *priv;
+ 	char *s;
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 	InputInfoPtr pInfo;
++#endif
+ 
+-	priv = xcalloc (1, sizeof (struct ts_priv));
++	priv = calloc (1, sizeof (struct ts_priv));
+         if (!priv)
+-                return NULL;
++                return BadValue;
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 	if (!(pInfo = xf86AllocateInput(drv, 0))) {
+-		xfree(priv);
+-		return NULL;
++		free(priv);
++		return BadValue;
+ 	}
+ 
+ 	/* Initialise the InputInfoRec. */
+ 	pInfo->name = dev->identifier;
+-	pInfo->type_name = XI_TOUCHSCREEN;
+ 	pInfo->flags =
+ 	    XI86_KEYBOARD_CAPABLE | XI86_POINTER_CAPABLE |
+ 	    XI86_SEND_DRAG_EVENTS;
+-	pInfo->device_control = xf86TslibControlProc;
+-	pInfo->read_input = ReadInput;
+ #if GET_ABI_MAJOR(ABI_XINPUT_VERSION) == 0
+ 	pInfo->motion_history_proc = xf86GetMotionEvents;
+ 	pInfo->history_size = 0;
+ #endif
+-	pInfo->control_proc = NULL;
++	pInfo->conf_idev = dev;
+ 	pInfo->close_proc = NULL;
+-	pInfo->switch_mode = NULL;
+ 	pInfo->conversion_proc = ConvertProc;
+ 	pInfo->reverse_conversion_proc = NULL;
+-	pInfo->dev = NULL;
+ 	pInfo->private_flags = 0;
+ 	pInfo->always_core_feedback = 0;
+-	pInfo->conf_idev = dev;
++#endif
++
++	pInfo->type_name = XI_TOUCHSCREEN;
++	pInfo->control_proc = NULL;
++	pInfo->read_input = ReadInput;
++	pInfo->device_control = xf86TslibControlProc;
++	pInfo->switch_mode = NULL;
+ 	pInfo->private = priv;
++	pInfo->dev = NULL;
+ 
+ 	/* Collect the options, and process the common options. */
+-	xf86CollectInputOptions(pInfo, NULL, NULL);
++	COLLECT_INPUT_OPTIONS(pInfo, NULL);
+ 	xf86ProcessCommonOptions(pInfo, pInfo->options);
+ 
+ 	priv->screen_num = xf86SetIntOption(pInfo->options, "ScreenNumber", 0 );
+@@ -510,23 +535,31 @@
+ 		priv->rotate = TSLIB_ROTATE_NONE;
+ 	}
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+  	s = xf86CheckStrOption(dev->commonOptions, "path", NULL);
++#else
++	s = xf86CheckStrOption(pInfo->options, "path", NULL);
++#endif
+   	if (!s)
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 		s = xf86CheckStrOption(dev->commonOptions, "Device", NULL);
++#else
++		s = xf86CheckStrOption(pInfo->options, "Device", NULL);
++#endif
+  
+ 	priv->ts = ts_open(s, 1);
+-	xfree(s);
++	free(s);
+ 
+ 	if (!priv->ts) {
+ 		ErrorF("ts_open failed (device=%s)\n",s);
+ 		xf86DeleteInput(pInfo, 0);
+-		return NULL;
++		return BadValue;
+ 	}
+ 
+ 	if (ts_config(priv->ts)) {
+ 		ErrorF("ts_config failed\n");
+ 		xf86DeleteInput(pInfo, 0);
+-		return NULL;
++		return BadValue;
+ 	}
+ 
+ 	pInfo->fd = ts_fd(priv->ts);
+@@ -536,11 +569,13 @@
+ 		priv->state = BUTTON_EMULATION_OFF;
+ 	}
+ 
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) < 12
+ 	/* Mark the device configured */
+ 	pInfo->flags |= XI86_CONFIGURED;
++#endif
+ 
+ 	/* Return the configured device */
+-	return (pInfo);
++	return Success;
+ }
+ 
+ _X_EXPORT InputDriverRec TSLIB = {
