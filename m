From: Markos Chandras <markos.chandras@gmail.com>
Date: Tue, 25 Jun 2013 16:14:36 +0100
Subject: [Buildroot] [PATCH] openswan: Restore -fPIE to USERCOMPILE flags
Message-ID: <1372173276-13616-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

The default USERCOMPILE variable uses -fPIE so we bring this back.
This also fixes linking problems for MIPS when non-PIC objects
are used to form a PIC one.

Fixes the following linking problem on MIPS:
connections.o: relocation R_MIPS_HI16 against `__gnu_local_gp'
can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 8a857d4..0b8e7d3 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -11,7 +11,7 @@ OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison gmp iproute2
 OPENSWAN_MAKE_OPT = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
-	USERCOMPILE="$(TARGET_CFLAGS)" INC_USRLOCAL=/usr \
+	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
 	USE_KLIPS=false USE_MAST=false USE_NM=false
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-- 
1.8.2.1
