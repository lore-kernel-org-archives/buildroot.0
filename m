From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 20:51:48 +0200
Subject: [Buildroot] [git commit] openswan: Restore -fPIE to USERCOMPILE
	flags
Message-ID: <20130627190851.7666C9B25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e8efc0ed409d7211a81d5370e088aa438990607
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default USERCOMPILE variable uses -fPIE so we bring this back.
This also fixes linking problems for MIPS when non-PIC objects
are used to form a PIC one.

Fixes the following linking problem on MIPS:
connections.o: relocation R_MIPS_HI16 against `__gnu_local_gp'
can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openswan/openswan.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
