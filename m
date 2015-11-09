From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Nov 2015 22:11:06 +0100
Subject: [Buildroot] [git commit branch/next] usb_modeswitch: bump to
	version 2.2.6
Message-ID: <20151109211437.663C881E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c06ecb2cef56d220d1f607eae24bdd9a4025af8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/usb_modeswitch/0001-rename-abort.patch |  105 ------------------------
 package/usb_modeswitch/usb_modeswitch.hash     |    2 +-
 package/usb_modeswitch/usb_modeswitch.mk       |    2 +-
 3 files changed, 2 insertions(+), 107 deletions(-)

diff --git a/package/usb_modeswitch/0001-rename-abort.patch b/package/usb_modeswitch/0001-rename-abort.patch
deleted file mode 100644
index 739e817..0000000
--- a/package/usb_modeswitch/0001-rename-abort.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-abort() is a C library function and used by Jim, so it results in
-a duplicate definition and confusion when linking statically.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura usb-modeswitch-2.2.5.orig/usb_modeswitch.c usb-modeswitch-2.2.5/usb_modeswitch.c
---- usb-modeswitch-2.2.5.orig/usb_modeswitch.c	2015-07-28 08:24:41.043352748 -0300
-+++ usb-modeswitch-2.2.5/usb_modeswitch.c	2015-07-28 08:38:43.557315576 -0300
-@@ -544,7 +544,7 @@
- 		libusb_open(dev, &devh);
- 		if (devh == NULL) {
- 			SHOW_PROGRESS(output,"Error opening the device. Abort\n\n");
--			abort();
-+			abortOut();
- 		}
- 	}
- 
-@@ -574,18 +574,18 @@
- 			ResponseEndpoint = find_first_bulk_endpoint(LIBUSB_ENDPOINT_IN);
- 		if (!MessageEndpoint) {
- 			fprintf(stderr,"Error: message endpoint not given or found. Abort\n\n");
--			abort();
-+			abortOut();
- 		}
- 		if (!ResponseEndpoint) {
- 			fprintf(stderr,"Error: response endpoint not given or found. Abort\n\n");
--			abort();
-+			abortOut();
- 		}
- 		SHOW_PROGRESS(output,"Use endpoints 0x%02x (out) and 0x%02x (in)\n", MessageEndpoint, ResponseEndpoint);
- 	}
- 
- 	if (interfaceClass == -1) {
- 		fprintf(stderr, "Error: Could not get class of interface %d. Does it exist? Abort\n\n",Interface);
--		abort();
-+		abortOut();
- 	}
- 
- 	if (defaultClass == 0)
-@@ -601,7 +601,7 @@
- 		if (defaultClass != 8) {
- 			fprintf(stderr, "Error: can't use storage command in MessageContent with interface %d;\n"
- 				"       interface class is %d, expected 8. Abort\n\n", Interface, defaultClass);
--			abort();
-+			abortOut();
- 		}
- 
- 	if (InquireDevice && show_progress) {
-@@ -629,7 +629,7 @@
- 	 */
- 	if ( ModeMap & (ModeMap-1) ) {
- 		fprintf(output,"Multiple special modes selected; check configuration. Abort\n\n");
--		abort();
-+		abortOut();
- 	}
- 
- 	if ((strlen(MessageContent) || StandardEject) && ModeMap ) {
-@@ -1339,7 +1339,7 @@
- 	ret = libusb_claim_interface(devh, Interface);
- 	if (ret < 0) {
- 		SHOW_PROGRESS(output," Could not claim interface (error %d). Abort\n", ret);
--		abort();
-+		abortOut();
- 	}
- //	libusb_clear_halt(devh, MessageEndpoint);
- 	if (show_progress)
-@@ -1832,7 +1832,7 @@
- 	int ret = libusb_get_active_config_descriptor(dev, &active_config);
- 	if (ret < 0) {
- 		SHOW_PROGRESS(output," Determining the active configuration failed (error %d). Abort\n", ret);
--		abort();
-+		abortOut();
- 	}
- 	return active_config->bConfigurationValue;
- }
-@@ -1878,7 +1878,7 @@
- 			}
- 			if (file==NULL) {
- 				fprintf(stderr, "Error: Could not find file %s. Abort\n\n", FileName);
--				abort();
-+				abortOut();
- 			} else {
- 				token = fgets(Str, LINE_DIM-1, file);
- 			}
-@@ -2014,7 +2014,7 @@
- 		closelog();
- }
- 
--void abort()
-+void abortOut()
- {
- 	close_all();
- 	exit(1);
-diff -Nura usb-modeswitch-2.2.5.orig/usb_modeswitch.h usb-modeswitch-2.2.5/usb_modeswitch.h
---- usb-modeswitch-2.2.5.orig/usb_modeswitch.h	2015-07-28 08:24:41.043352748 -0300
-+++ usb-modeswitch-2.2.5/usb_modeswitch.h	2015-07-28 08:38:54.986708480 -0300
-@@ -61,7 +61,7 @@
- void printVersion();
- void printHelp();
- void close_all();
--void abort();
-+void abortOut();
- int readArguments(int argc, char **argv);
- void deviceDescription();
- int deviceInquire();
diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 9552a24..2033d31 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8b2340303732aabc8c8e1cdd7d4352f61dcb942839f58ce22ba0ecfa122426d5	usb-modeswitch-2.2.5.tar.bz2
+sha256	7ee42be2fe26dde20c58f54bf678fb136d2706250e4aa74f06fc97268a46e90f	usb-modeswitch-2.2.6.tar.bz2
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index c1b0a76..aca13e4 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.2.5
+USB_MODESWITCH_VERSION = 2.2.6
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
