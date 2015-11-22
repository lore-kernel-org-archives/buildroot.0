From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Nov 2015 13:43:24 -0200
Subject: [Buildroot] [PATCH] gpsd: work-around ICE when compiling for
	microblaze with GCC5
Message-ID: <1448207004-6959-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC 5.X generates an ICE when compiling gpsd for microblaze due
to optimizations, so lets disable it for now to works around
this problem.

A bug was reported to the gcc bug tracker:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/gpsd/gpsd.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index aa35053baf09..d603ba5c96c8 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -39,8 +39,10 @@ GPSD_SCONS_OPTS += libgpsmm=no
 endif
 
 # prevents from triggering GCC ICE
+# A bug was reported to the gcc bug tracker:
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485
 ifeq ($(BR2_microblaze),y)
-GPSD_CFLAGS += -fno-expensive-optimizations
+GPSD_CFLAGS += -fno-expensive-optimizations -fno-schedule-insns
 endif
 
 # Enable or disable Qt binding
-- 
1.9.1
