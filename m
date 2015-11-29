From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 14:45:53 +0100
Subject: [Buildroot] [git commit] gpsd: work-around ICE when compiling for
	microblaze with GCC5
Message-ID: <20151129135144.0523580E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f48e36873b9106b6b38ed0d413bc3cecaf495be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 5.X generates an ICE when compiling gpsd for microblaze due
to optimizations, so lets disable it for now to works around
this problem.

A bug was reported to the gcc bug tracker:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index aa35053..d603ba5 100644
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
