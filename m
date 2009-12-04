From: Emmanuel Blot <eblot.ml@gmail.com>
Date: Fri, 4 Dec 2009 12:04:46 +0100
Subject: [Buildroot] Small building issue busybox-1.14.4 with linux kernel
	2.6.32
Message-ID: <92a1e6ea0912040304q7c79b418t2a5972ae0a4502d5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm not sure if it's a real bug or if I did something wrong, but
busybox fails to build with the latest linux kernel, because of a
missing type definition:
(from git buildroot repository)

The actual error is:

make[1]: Entering directory `buildroot/output/build/busybox-1.14.4'
  CC      miscutils/eject.o
In file included from miscutils/eject.c:31:
buildroot/output/toolchain/linux/include/scsi/scsi.h:148: error:
expected specifier-qualifier-list before 'u8'
buildroot/output/toolchain/linux/include/scsi/scsi.h: In function
'scsi_varlen_cdb_length':
buildroot/output/toolchain/linux/include/scsi/scsi.h:159: error:
'struct scsi_varlen_cdb_hdr' has no member named
'additional_cdb_length'
make[2]: *** [miscutils/eject.o] Error 1

scsi.h inclusion list does not seem to define the "u8" type.

A quick workaround is to define this type in the eject.c file (see
below), but I guess it's not a proper fix.

--- output/build/busybox-1.14.4/miscutils/eject.c.old	2009-12-04
11:56:34.000000000 +0100
+++ output/build/busybox-1.14.4/miscutils/eject.c	2009-12-04
11:47:02.000000000 +0100
@@ -26,6 +26,8 @@

 /* Code taken from the original eject (http://eject.sourceforge.net/),
  * refactored it a bit for busybox (ne-bb at nicoerfurth.de) */
+#include <stdint.h>
+typedef uint8_t u8;
 #include <scsi/sg.h>
 #include <scsi/scsi.h>

Cheers,
Manu
