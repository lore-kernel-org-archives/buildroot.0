From: Eric Limpens <limpens@gmail.com>
Date: Wed, 24 Feb 2016 21:55:42 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: change order of libraries to fix
	linking issue
Message-ID: <1456347342-3521-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building a static variant, link errors occur. Changing the order
of libsndfile and libm fixes this error

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/pifmrds/0003-Makefile-fix-static-link-libm.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/pifmrds/0003-Makefile-fix-static-link-libm.patch

diff --git a/package/pifmrds/0003-Makefile-fix-static-link-libm.patch b/package/pifmrds/0003-Makefile-fix-static-link-libm.patch
new file mode 100644
index 0000000..eb9cdcf
--- /dev/null
+++ b/package/pifmrds/0003-Makefile-fix-static-link-libm.patch
@@ -0,0 +1,15 @@
+--- pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile	2016-02-24 10:23:41.455695546 +0100
++++ pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2/src/Makefile	2016-02-24 10:25:07.003876714 +0100
+@@ -1,10 +1,10 @@
+ CC = gcc
+ 
+ app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
+-	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lsndfile -lm
+ 
+ rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
+-	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lsndfile -lm
+ 
+ rds.o: rds.c waveforms.h
+ 	$(CC) $(CFLAGS) rds.c
-- 
1.9.1
