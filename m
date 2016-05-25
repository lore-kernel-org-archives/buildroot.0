From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 22:57:59 +0200
Subject: [Buildroot] [git commit] hidapi: fix the patch renaming a file
Message-ID: <20160525205900.0668281E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2355a07f2ade3e8afd83da8185e740f3015a70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch
0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch in the
hidapi package needs to rename a file from .cpp to .c to avoid a
dependency on C++. This renaming currently uses the Git-way of
describing renames in patches. While this is interpreted properly by
recent enough versions of the 'patch' tool, it is ignored and not
understood by older versions of 'patch'. Due to this, with these older
versions of 'patch', the file is not renamed, and it causes a build
failure.

We fix this by not using the Git-like way of describing rename, but
rather using the old-style way of doing renames. It makes the patch
longer, but compatible with older versions of 'patch'.

Fixes:

  http://autobuild.buildroot.org/results/d7509d9fdf8f86332a023358a740975f535eafef/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ont-use-a-C-source-file-since-it-s-pure-C.patch | 416 ++++++++++++++++++++-
 1 file changed, 407 insertions(+), 9 deletions(-)

diff --git a/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch b/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch
index 3ea4fdb..4740cb7 100644
--- a/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch
+++ b/package/hidapi/0001-hidtest-dont-use-a-C-source-file-since-it-s-pure-C.patch
@@ -8,10 +8,12 @@ C++ support.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
- hidtest/Makefile.am                | 6 +++---
- hidtest/{hidtest.cpp => hidtest.c} | 0
- 2 files changed, 3 insertions(+), 3 deletions(-)
- rename hidtest/{hidtest.cpp => hidtest.c} (100%)
+ hidtest/Makefile.am |   6 +-
+ hidtest/hidtest.c   | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++
+ hidtest/hidtest.cpp | 194 ----------------------------------------------------
+ 3 files changed, 197 insertions(+), 197 deletions(-)
+ create mode 100644 hidtest/hidtest.c
+ delete mode 100644 hidtest/hidtest.cpp
 
 diff --git a/hidtest/Makefile.am b/hidtest/Makefile.am
 index d278644..5f52c3f 100644
@@ -38,10 +40,406 @@ index d278644..5f52c3f 100644
  hidtest_LDADD = $(top_builddir)/$(backend)/libhidapi.la
  
  endif
-diff --git a/hidtest/hidtest.cpp b/hidtest/hidtest.c
-similarity index 100%
-rename from hidtest/hidtest.cpp
-rename to hidtest/hidtest.c
+diff --git a/hidtest/hidtest.c b/hidtest/hidtest.c
+new file mode 100644
+index 0000000..94f0a5c
+--- /dev/null
++++ b/hidtest/hidtest.c
+@@ -0,0 +1,194 @@
++/*******************************************************
++ Windows HID simplification
++
++ Alan Ott
++ Signal 11 Software
++
++ 8/22/2009
++
++ Copyright 2009
++ 
++ This contents of this file may be used by anyone
++ for any reason without any conditions and may be
++ used as a starting point for your own applications
++ which use HIDAPI.
++********************************************************/
++
++#include <stdio.h>
++#include <wchar.h>
++#include <string.h>
++#include <stdlib.h>
++#include "hidapi.h"
++
++// Headers needed for sleeping.
++#ifdef _WIN32
++	#include <windows.h>
++#else
++	#include <unistd.h>
++#endif
++
++int main(int argc, char* argv[])
++{
++	int res;
++	unsigned char buf[256];
++	#define MAX_STR 255
++	wchar_t wstr[MAX_STR];
++	hid_device *handle;
++	int i;
++
++#ifdef WIN32
++	UNREFERENCED_PARAMETER(argc);
++	UNREFERENCED_PARAMETER(argv);
++#endif
++
++	struct hid_device_info *devs, *cur_dev;
++	
++	if (hid_init())
++		return -1;
++
++	devs = hid_enumerate(0x0, 0x0);
++	cur_dev = devs;	
++	while (cur_dev) {
++		printf("Device Found\n  type: %04hx %04hx\n  path: %s\n  serial_number: %ls", cur_dev->vendor_id, cur_dev->product_id, cur_dev->path, cur_dev->serial_number);
++		printf("\n");
++		printf("  Manufacturer: %ls\n", cur_dev->manufacturer_string);
++		printf("  Product:      %ls\n", cur_dev->product_string);
++		printf("  Release:      %hx\n", cur_dev->release_number);
++		printf("  Interface:    %d\n",  cur_dev->interface_number);
++		printf("\n");
++		cur_dev = cur_dev->next;
++	}
++	hid_free_enumeration(devs);
++
++	// Set up the command buffer.
++	memset(buf,0x00,sizeof(buf));
++	buf[0] = 0x01;
++	buf[1] = 0x81;
++	
++
++	// Open the device using the VID, PID,
++	// and optionally the Serial number.
++	////handle = hid_open(0x4d8, 0x3f, L"12345");
++	handle = hid_open(0x4d8, 0x3f, NULL);
++	if (!handle) {
++		printf("unable to open device\n");
++ 		return 1;
++	}
++
++	// Read the Manufacturer String
++	wstr[0] = 0x0000;
++	res = hid_get_manufacturer_string(handle, wstr, MAX_STR);
++	if (res < 0)
++		printf("Unable to read manufacturer string\n");
++	printf("Manufacturer String: %ls\n", wstr);
++
++	// Read the Product String
++	wstr[0] = 0x0000;
++	res = hid_get_product_string(handle, wstr, MAX_STR);
++	if (res < 0)
++		printf("Unable to read product string\n");
++	printf("Product String: %ls\n", wstr);
++
++	// Read the Serial Number String
++	wstr[0] = 0x0000;
++	res = hid_get_serial_number_string(handle, wstr, MAX_STR);
++	if (res < 0)
++		printf("Unable to read serial number string\n");
++	printf("Serial Number String: (%d) %ls", wstr[0], wstr);
++	printf("\n");
++
++	// Read Indexed String 1
++	wstr[0] = 0x0000;
++	res = hid_get_indexed_string(handle, 1, wstr, MAX_STR);
++	if (res < 0)
++		printf("Unable to read indexed string 1\n");
++	printf("Indexed String 1: %ls\n", wstr);
++
++	// Set the hid_read() function to be non-blocking.
++	hid_set_nonblocking(handle, 1);
++	
++	// Try to read from the device. There shoud be no
++	// data here, but execution should not block.
++	res = hid_read(handle, buf, 17);
++
++	// Send a Feature Report to the device
++	buf[0] = 0x2;
++	buf[1] = 0xa0;
++	buf[2] = 0x0a;
++	buf[3] = 0x00;
++	buf[4] = 0x00;
++	res = hid_send_feature_report(handle, buf, 17);
++	if (res < 0) {
++		printf("Unable to send a feature report.\n");
++	}
++
++	memset(buf,0,sizeof(buf));
++
++	// Read a Feature Report from the device
++	buf[0] = 0x2;
++	res = hid_get_feature_report(handle, buf, sizeof(buf));
++	if (res < 0) {
++		printf("Unable to get a feature report.\n");
++		printf("%ls", hid_error(handle));
++	}
++	else {
++		// Print out the returned buffer.
++		printf("Feature Report\n   ");
++		for (i = 0; i < res; i++)
++			printf("%02hhx ", buf[i]);
++		printf("\n");
++	}
++
++	memset(buf,0,sizeof(buf));
++
++	// Toggle LED (cmd 0x80). The first byte is the report number (0x1).
++	buf[0] = 0x1;
++	buf[1] = 0x80;
++	res = hid_write(handle, buf, 17);
++	if (res < 0) {
++		printf("Unable to write()\n");
++		printf("Error: %ls\n", hid_error(handle));
++	}
++	
++
++	// Request state (cmd 0x81). The first byte is the report number (0x1).
++	buf[0] = 0x1;
++	buf[1] = 0x81;
++	hid_write(handle, buf, 17);
++	if (res < 0)
++		printf("Unable to write() (2)\n");
++
++	// Read requested state. hid_read() has been set to be
++	// non-blocking by the call to hid_set_nonblocking() above.
++	// This loop demonstrates the non-blocking nature of hid_read().
++	res = 0;
++	while (res == 0) {
++		res = hid_read(handle, buf, sizeof(buf));
++		if (res == 0)
++			printf("waiting...\n");
++		if (res < 0)
++			printf("Unable to read()\n");
++		#ifdef WIN32
++		Sleep(500);
++		#else
++		usleep(500*1000);
++		#endif
++	}
++
++	printf("Data read:\n   ");
++	// Print out the returned buffer.
++	for (i = 0; i < res; i++)
++		printf("%02hhx ", buf[i]);
++	printf("\n");
++
++	hid_close(handle);
++
++	/* Free static HIDAPI objects. */
++	hid_exit();
++
++#ifdef WIN32
++	system("pause");
++#endif
++
++	return 0;
++}
+diff --git a/hidtest/hidtest.cpp b/hidtest/hidtest.cpp
+deleted file mode 100644
+index 94f0a5c..0000000
+--- a/hidtest/hidtest.cpp
++++ /dev/null
+@@ -1,194 +0,0 @@
+-/*******************************************************
+- Windows HID simplification
+-
+- Alan Ott
+- Signal 11 Software
+-
+- 8/22/2009
+-
+- Copyright 2009
+- 
+- This contents of this file may be used by anyone
+- for any reason without any conditions and may be
+- used as a starting point for your own applications
+- which use HIDAPI.
+-********************************************************/
+-
+-#include <stdio.h>
+-#include <wchar.h>
+-#include <string.h>
+-#include <stdlib.h>
+-#include "hidapi.h"
+-
+-// Headers needed for sleeping.
+-#ifdef _WIN32
+-	#include <windows.h>
+-#else
+-	#include <unistd.h>
+-#endif
+-
+-int main(int argc, char* argv[])
+-{
+-	int res;
+-	unsigned char buf[256];
+-	#define MAX_STR 255
+-	wchar_t wstr[MAX_STR];
+-	hid_device *handle;
+-	int i;
+-
+-#ifdef WIN32
+-	UNREFERENCED_PARAMETER(argc);
+-	UNREFERENCED_PARAMETER(argv);
+-#endif
+-
+-	struct hid_device_info *devs, *cur_dev;
+-	
+-	if (hid_init())
+-		return -1;
+-
+-	devs = hid_enumerate(0x0, 0x0);
+-	cur_dev = devs;	
+-	while (cur_dev) {
+-		printf("Device Found\n  type: %04hx %04hx\n  path: %s\n  serial_number: %ls", cur_dev->vendor_id, cur_dev->product_id, cur_dev->path, cur_dev->serial_number);
+-		printf("\n");
+-		printf("  Manufacturer: %ls\n", cur_dev->manufacturer_string);
+-		printf("  Product:      %ls\n", cur_dev->product_string);
+-		printf("  Release:      %hx\n", cur_dev->release_number);
+-		printf("  Interface:    %d\n",  cur_dev->interface_number);
+-		printf("\n");
+-		cur_dev = cur_dev->next;
+-	}
+-	hid_free_enumeration(devs);
+-
+-	// Set up the command buffer.
+-	memset(buf,0x00,sizeof(buf));
+-	buf[0] = 0x01;
+-	buf[1] = 0x81;
+-	
+-
+-	// Open the device using the VID, PID,
+-	// and optionally the Serial number.
+-	////handle = hid_open(0x4d8, 0x3f, L"12345");
+-	handle = hid_open(0x4d8, 0x3f, NULL);
+-	if (!handle) {
+-		printf("unable to open device\n");
+- 		return 1;
+-	}
+-
+-	// Read the Manufacturer String
+-	wstr[0] = 0x0000;
+-	res = hid_get_manufacturer_string(handle, wstr, MAX_STR);
+-	if (res < 0)
+-		printf("Unable to read manufacturer string\n");
+-	printf("Manufacturer String: %ls\n", wstr);
+-
+-	// Read the Product String
+-	wstr[0] = 0x0000;
+-	res = hid_get_product_string(handle, wstr, MAX_STR);
+-	if (res < 0)
+-		printf("Unable to read product string\n");
+-	printf("Product String: %ls\n", wstr);
+-
+-	// Read the Serial Number String
+-	wstr[0] = 0x0000;
+-	res = hid_get_serial_number_string(handle, wstr, MAX_STR);
+-	if (res < 0)
+-		printf("Unable to read serial number string\n");
+-	printf("Serial Number String: (%d) %ls", wstr[0], wstr);
+-	printf("\n");
+-
+-	// Read Indexed String 1
+-	wstr[0] = 0x0000;
+-	res = hid_get_indexed_string(handle, 1, wstr, MAX_STR);
+-	if (res < 0)
+-		printf("Unable to read indexed string 1\n");
+-	printf("Indexed String 1: %ls\n", wstr);
+-
+-	// Set the hid_read() function to be non-blocking.
+-	hid_set_nonblocking(handle, 1);
+-	
+-	// Try to read from the device. There shoud be no
+-	// data here, but execution should not block.
+-	res = hid_read(handle, buf, 17);
+-
+-	// Send a Feature Report to the device
+-	buf[0] = 0x2;
+-	buf[1] = 0xa0;
+-	buf[2] = 0x0a;
+-	buf[3] = 0x00;
+-	buf[4] = 0x00;
+-	res = hid_send_feature_report(handle, buf, 17);
+-	if (res < 0) {
+-		printf("Unable to send a feature report.\n");
+-	}
+-
+-	memset(buf,0,sizeof(buf));
+-
+-	// Read a Feature Report from the device
+-	buf[0] = 0x2;
+-	res = hid_get_feature_report(handle, buf, sizeof(buf));
+-	if (res < 0) {
+-		printf("Unable to get a feature report.\n");
+-		printf("%ls", hid_error(handle));
+-	}
+-	else {
+-		// Print out the returned buffer.
+-		printf("Feature Report\n   ");
+-		for (i = 0; i < res; i++)
+-			printf("%02hhx ", buf[i]);
+-		printf("\n");
+-	}
+-
+-	memset(buf,0,sizeof(buf));
+-
+-	// Toggle LED (cmd 0x80). The first byte is the report number (0x1).
+-	buf[0] = 0x1;
+-	buf[1] = 0x80;
+-	res = hid_write(handle, buf, 17);
+-	if (res < 0) {
+-		printf("Unable to write()\n");
+-		printf("Error: %ls\n", hid_error(handle));
+-	}
+-	
+-
+-	// Request state (cmd 0x81). The first byte is the report number (0x1).
+-	buf[0] = 0x1;
+-	buf[1] = 0x81;
+-	hid_write(handle, buf, 17);
+-	if (res < 0)
+-		printf("Unable to write() (2)\n");
+-
+-	// Read requested state. hid_read() has been set to be
+-	// non-blocking by the call to hid_set_nonblocking() above.
+-	// This loop demonstrates the non-blocking nature of hid_read().
+-	res = 0;
+-	while (res == 0) {
+-		res = hid_read(handle, buf, sizeof(buf));
+-		if (res == 0)
+-			printf("waiting...\n");
+-		if (res < 0)
+-			printf("Unable to read()\n");
+-		#ifdef WIN32
+-		Sleep(500);
+-		#else
+-		usleep(500*1000);
+-		#endif
+-	}
+-
+-	printf("Data read:\n   ");
+-	// Print out the returned buffer.
+-	for (i = 0; i < res; i++)
+-		printf("%02hhx ", buf[i]);
+-	printf("\n");
+-
+-	hid_close(handle);
+-
+-	/* Free static HIDAPI objects. */
+-	hid_exit();
+-
+-#ifdef WIN32
+-	system("pause");
+-#endif
+-
+-	return 0;
+-}
 -- 
-2.6.4
+2.7.4
 
