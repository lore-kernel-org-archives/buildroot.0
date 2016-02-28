From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 23:04:25 +0100
Subject: [Buildroot] [git commit] pifmrds: add patch to correct linking in
	static build
Message-ID: <20160228220430.A090580AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c434d2afcb58445ab3e151642f770555a4cc252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes an autobuild error during a static build:
http://autobuild.buildroot.net/results/f61ae46ba4d4fc3af3784d1f612a8c1cc7de3314/

Signed-off-by: Eric Limpens <limpens@gmail.com>
[Arnout: clean up commit message and patch log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../pifmrds/0003-Makefile-fix-static-link.patch    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pifmrds/0003-Makefile-fix-static-link.patch b/package/pifmrds/0003-Makefile-fix-static-link.patch
new file mode 100644
index 0000000..ecd7c4f
--- /dev/null
+++ b/package/pifmrds/0003-Makefile-fix-static-link.patch
@@ -0,0 +1,23 @@
+Makefile: Fix static linking
+
+Since libsndfile uses funtions from libm, the -lm should be specified
+after libsndfile for static linking.
+
+Signed-off-by: "Eric Limpens" <Limpens@gmail.com>
+
+diff -purN pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2/src/Makefile
+--- pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.orig/src/Makefile	2016-02-26 08:06:43.102962592 +0100
++++ pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2/src/Makefile	2016-02-26 08:27:11.069148203 +0100
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
