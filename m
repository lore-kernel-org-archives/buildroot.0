From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 May 2021 07:44:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/pifmrds: always link with -lm
Message-ID: <20210525054427.455433-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 888546e5273d77d49bec564a515e85d7acee6bdd wrongly removed linking
with -lm resulting in the following build failure:

/home/buildroot/autobuild/run/instance-3/output-1/host/bin/arm-linux-gnueabihf-gcc  -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib -lsndfile
/home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld: fm_mpx.o: undefined reference to symbol 'cos@@GLIBC_2.4'
/home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/lib/libm.so.6: error adding symbols: DSO missing from command line

Fixes:
 - http://autobuild.buildroot.org/results/b2a6e6fd77bf9071ce9f75fed1811be9ffe5366d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pifmrds/0003-Makefile-fix-static-link.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pifmrds/0003-Makefile-fix-static-link.patch b/package/pifmrds/0003-Makefile-fix-static-link.patch
index 3bd91c981f..3832b77d59 100644
--- a/package/pifmrds/0003-Makefile-fix-static-link.patch
+++ b/package/pifmrds/0003-Makefile-fix-static-link.patch
@@ -15,11 +15,11 @@ diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pi
  
  app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
 -	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
-+	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS)
++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o $(SNDFILE_LIBS) -lm
  
  rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
 -	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
-+	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS)
++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o $(SNDFILE_LIBS) -lm
  
  rds.o: rds.c waveforms.h
  	$(CC) $(CFLAGS) rds.c
-- 
2.30.2
