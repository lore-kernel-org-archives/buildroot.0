From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 08:51:58 -0300
Subject: [Buildroot] [PATCH] usb_modeswitch: fix static build failure
Message-ID: <1438084318-27699-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

abort() is used in two different places, jim (proper C library abort)
and usb_modeswitch.c (custom abort function).
Status: emailed the patch to author.

Fixes:
http://autobuild.buildroot.net/results/789/7899a37d2c766716a1deff58e8be94c5c4962240/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usb_modeswitch/0001-rename-abort.patch | 105 +++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 package/usb_modeswitch/0001-rename-abort.patch

diff --git a/package/usb_modeswitch/0001-rename-abort.patch b/package/usb_modeswitch/0001-rename-abort.patch
new file mode 100644
index 0000000..739e817
--- /dev/null
+++ b/package/usb_modeswitch/0001-rename-abort.patch
@@ -0,0 +1,105 @@
+abort() is a C library function and used by Jim, so it results in
+a duplicate definition and confusion when linking statically.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura usb-modeswitch-2.2.5.orig/usb_modeswitch.c usb-modeswitch-2.2.5/usb_modeswitch.c
+--- usb-modeswitch-2.2.5.orig/usb_modeswitch.c	2015-07-28 08:24:41.043352748 -0300
++++ usb-modeswitch-2.2.5/usb_modeswitch.c	2015-07-28 08:38:43.557315576 -0300
+@@ -544,7 +544,7 @@
+ 		libusb_open(dev, &devh);
+ 		if (devh == NULL) {
+ 			SHOW_PROGRESS(output,"Error opening the device. Abort\n\n");
+-			abort();
++			abortOut();
+ 		}
+ 	}
+ 
+@@ -574,18 +574,18 @@
+ 			ResponseEndpoint = find_first_bulk_endpoint(LIBUSB_ENDPOINT_IN);
+ 		if (!MessageEndpoint) {
+ 			fprintf(stderr,"Error: message endpoint not given or found. Abort\n\n");
+-			abort();
++			abortOut();
+ 		}
+ 		if (!ResponseEndpoint) {
+ 			fprintf(stderr,"Error: response endpoint not given or found. Abort\n\n");
+-			abort();
++			abortOut();
+ 		}
+ 		SHOW_PROGRESS(output,"Use endpoints 0x%02x (out) and 0x%02x (in)\n", MessageEndpoint, ResponseEndpoint);
+ 	}
+ 
+ 	if (interfaceClass == -1) {
+ 		fprintf(stderr, "Error: Could not get class of interface %d. Does it exist? Abort\n\n",Interface);
+-		abort();
++		abortOut();
+ 	}
+ 
+ 	if (defaultClass == 0)
+@@ -601,7 +601,7 @@
+ 		if (defaultClass != 8) {
+ 			fprintf(stderr, "Error: can't use storage command in MessageContent with interface %d;\n"
+ 				"       interface class is %d, expected 8. Abort\n\n", Interface, defaultClass);
+-			abort();
++			abortOut();
+ 		}
+ 
+ 	if (InquireDevice && show_progress) {
+@@ -629,7 +629,7 @@
+ 	 */
+ 	if ( ModeMap & (ModeMap-1) ) {
+ 		fprintf(output,"Multiple special modes selected; check configuration. Abort\n\n");
+-		abort();
++		abortOut();
+ 	}
+ 
+ 	if ((strlen(MessageContent) || StandardEject) && ModeMap ) {
+@@ -1339,7 +1339,7 @@
+ 	ret = libusb_claim_interface(devh, Interface);
+ 	if (ret < 0) {
+ 		SHOW_PROGRESS(output," Could not claim interface (error %d). Abort\n", ret);
+-		abort();
++		abortOut();
+ 	}
+ //	libusb_clear_halt(devh, MessageEndpoint);
+ 	if (show_progress)
+@@ -1832,7 +1832,7 @@
+ 	int ret = libusb_get_active_config_descriptor(dev, &active_config);
+ 	if (ret < 0) {
+ 		SHOW_PROGRESS(output," Determining the active configuration failed (error %d). Abort\n", ret);
+-		abort();
++		abortOut();
+ 	}
+ 	return active_config->bConfigurationValue;
+ }
+@@ -1878,7 +1878,7 @@
+ 			}
+ 			if (file==NULL) {
+ 				fprintf(stderr, "Error: Could not find file %s. Abort\n\n", FileName);
+-				abort();
++				abortOut();
+ 			} else {
+ 				token = fgets(Str, LINE_DIM-1, file);
+ 			}
+@@ -2014,7 +2014,7 @@
+ 		closelog();
+ }
+ 
+-void abort()
++void abortOut()
+ {
+ 	close_all();
+ 	exit(1);
+diff -Nura usb-modeswitch-2.2.5.orig/usb_modeswitch.h usb-modeswitch-2.2.5/usb_modeswitch.h
+--- usb-modeswitch-2.2.5.orig/usb_modeswitch.h	2015-07-28 08:24:41.043352748 -0300
++++ usb-modeswitch-2.2.5/usb_modeswitch.h	2015-07-28 08:38:54.986708480 -0300
+@@ -61,7 +61,7 @@
+ void printVersion();
+ void printHelp();
+ void close_all();
+-void abort();
++void abortOut();
+ int readArguments(int argc, char **argv);
+ void deviceDescription();
+ int deviceInquire();
-- 
2.3.6
