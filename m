From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 21 Jan 2009 00:17:05 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
Message-ID: <20090121001706.78888775D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-21 00:17:03 +0000 (Wed, 21 Jan 2009)
New Revision: 24931

Log:
add kismet-unpacked target, fix lack of include for memset etc.

Added:
   trunk/buildroot/package/kismet/kismet-2007-10-R1-memset.patch

Modified:
   trunk/buildroot/package/kismet/kismet.mk


Changeset:
Added: trunk/buildroot/package/kismet/kismet-2007-10-R1-memset.patch
===================================================================
--- trunk/buildroot/package/kismet/kismet-2007-10-R1-memset.patch	                        (rev 0)
+++ trunk/buildroot/package/kismet/kismet-2007-10-R1-memset.patch	2009-01-21 00:17:03 UTC (rev 24931)
@@ -0,0 +1,45 @@
+diff -urN kismet-2007-10-R1-0rig//kismet_wrapper.cc kismet-2007-10-R1/kismet_wrapper.cc
+--- kismet-2007-10-R1-0rig//kismet_wrapper.cc	2007-10-06 23:50:03.000000000 +0200
++++ kismet-2007-10-R1/kismet_wrapper.cc	2009-01-21 01:12:42.000000000 +0100
+@@ -27,6 +27,7 @@
+ #include <unistd.h>
+ 
+ #include "config.h"
++#include <string.h>
+ 
+ /* Blob of globals since sighandler needs them */
+ vector<string> postcli_err;
+diff -urN kismet-2007-10-R1-0rig//ringbuf.cc kismet-2007-10-R1/ringbuf.cc
+--- kismet-2007-10-R1-0rig//ringbuf.cc	2005-12-11 20:14:39.000000000 +0100
++++ kismet-2007-10-R1/ringbuf.cc	2009-01-21 01:12:26.000000000 +0100
+@@ -17,6 +17,7 @@
+ */
+ 
+ #include "ringbuf.h"
++#include <string.h>
+ 
+ RingBuffer::RingBuffer(int in_size) {
+     ring_len = in_size;
+diff -urN kismet-2007-10-R1-0rig//util.cc kismet-2007-10-R1/util.cc
+--- kismet-2007-10-R1-0rig//util.cc	2006-08-28 22:37:29.000000000 +0200
++++ kismet-2007-10-R1/util.cc	2009-01-21 01:12:26.000000000 +0100
+@@ -22,6 +22,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <string.h>
+ 
+ // We need this to make uclibc happy since they don't even have rintf...
+ #ifndef rintf
+diff -urN kismet-2007-10-R1-0rig//util.h kismet-2007-10-R1/util.h
+--- kismet-2007-10-R1-0rig//util.h	2006-08-28 22:37:29.000000000 +0200
++++ kismet-2007-10-R1/util.h	2009-01-21 01:12:26.000000000 +0100
+@@ -65,7 +65,7 @@
+         end = op.end;
+         return *this;
+     }
+-};
++} swt;
+ vector<smart_word_token> SmartStrTokenize(string in_str, string in_split, int return_partial = 1);
+ 
+ vector<string> LineWrap(string in_txt, unsigned int in_hdr_len, unsigned int in_maxlen);

Modified: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	2009-01-20 22:38:39 UTC (rev 24930)
+++ trunk/buildroot/package/kismet/kismet.mk	2009-01-21 00:17:03 UTC (rev 24931)
@@ -62,6 +62,7 @@
 
 kismet: uclibc ncurses libpcap dbus $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY)
 
+kismet-unpacked: $(KISMET_DIR)/.patched
 
 kismet-clean:
 	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
