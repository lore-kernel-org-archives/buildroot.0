From: Matt Weber <Matthew.Weber@rockwellcollins.com>
Date: Wed, 13 Aug 2014 21:44:25 -0500
Subject: [Buildroot] [PATCH v2] fio: add missing libaio dependency
Message-ID: <1407984265-10795-1-git-send-email-Matthew.Weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
The fio package dlopen()s the libaio library at runtime
when the ioengine function is selected as libaio.

Changes v1 -> v2
 - Renamed patch to not mention bugfix or description
 - Removed build dependency as we only need a config
   dependency for libaio.  Suggested by Thomas P.
 - Added dependencies to Config.in for targets that
   libaio supports building for.  Suggested by Thomas P.
 - Updated comment before select of libaio in Config.in
   Suggested by Thomas P.

Signed-off-by Matt Weber <Matthew.Weber@rockwellcollins.com>

 package/fio/Config.in | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 8cbbf6c..d70f3f7 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -13,7 +13,12 @@ config BR2_PACKAGE_FIO
 		!BR2_UCLIBC_VERSION_0_9_31
 	# fio uses fallocate() which becomes fallocate64() while compiling
 	# with BR2_LARGEFILE but fallocate64() is not available on nios2
-	depends on !BR2_nios2
+	depends on \
+		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
+		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
+		BR2_sparc || BR2_x86_64
+	# Runtime dependency: libaio is dlopen()ed by fio
+	select BR2_PACKAGE_LIBAIO
 	help
 	  fio is an I/O tool meant to be used both for benchmark
 	  and stress/hardware verification.
-- 
1.9.1
