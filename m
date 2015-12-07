From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Dec 2015 19:00:36 +0100
Subject: [Buildroot] [PATCH] package/xfsprogs: disable crc32selftest
Message-ID: <1449511236-21470-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xfsprogs generates a crc32 table, and wants to test it. So it builds a
native crc32selftest binary. So far, so good; except the host may not
have the required headers (uuid/uuid.h), and probably libs (like
libuuid).

And anyway, testing the table on the host is flawed, as it does not mean
it would be correct on the target (due to differences in bitness,
endianness, alignment...).

So we just disable the crc32selftest for Buildroot.

Fixes:
    http://autobuild.buildroot.org/results/5d0/5d0ed24b4d368fed100bc3c4959520ebaa48e693/
    http://autobuild.buildroot.org/results/aef/aef223ee2646599eaab7c82f63ff5f19569d69a5/
    http://autobuild.buildroot.org/results/fb6/fb6679f3b1473169702c303ee5060abe7559b0b3/
    ....

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/xfsprogs/0002-no-crc32-checks.patch | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/xfsprogs/0002-no-crc32-checks.patch

diff --git a/package/xfsprogs/0002-no-crc32-checks.patch b/package/xfsprogs/0002-no-crc32-checks.patch
new file mode 100644
index 0000000..2cf6634
--- /dev/null
+++ b/package/xfsprogs/0002-no-crc32-checks.patch
@@ -0,0 +1,32 @@
+libxfs: do not try to run the crc32selftest
+
+Even though the crc32selftest is natively compiled (because it is to be
+executed), it fails in cross-compilation as the host may lack the
+required headers, like uuid/uuid.h (e.g. in a minimal environment).
+
+Moreover, running the crc32selftest natively is completely wrong,
+because it passing on the host does not mean it would still pass n the
+target (because endianness or bitness or alignment differences).
+
+So, just disable running the crc32selftest altogether.
+
+Note that there's a remaining bug-in-hiding, because the crc32 table
+generator is natively built, but with the target CLFAGS.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN xfsprogs-4.3.0.orig/libxfs/Makefile xfsprogs-4.3.0/libxfs/Makefile
+--- xfsprogs-4.3.0.orig/libxfs/Makefile	2015-09-22 03:42:41.000000000 +0200
++++ xfsprogs-4.3.0/libxfs/Makefile	2015-12-07 18:45:27.190082913 +0100
+@@ -105,9 +105,9 @@
+ # don't try linking xfs_repair with a debug libxfs.
+ DEBUG = -DNDEBUG
+ 
+-LDIRT = gen_crc32table crc32table.h crc32selftest
++LDIRT = gen_crc32table crc32table.h
+ 
+-default: crc32selftest ltdepend $(LTLIBRARY)
++default: ltdepend $(LTLIBRARY)
+ 
+ crc32table.h: gen_crc32table.c
+ 	@echo "    [CC]     gen_crc32table"
-- 
1.9.1
