From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 26 Feb 2016 22:55:57 +0100
Subject: [Buildroot] [PATCH v3] pifmrds: add patch to correct linking in
	static build
In-Reply-To: <1456475491-5098-1-git-send-email-limpens@gmail.com>
References: <1456475491-5098-1-git-send-email-limpens@gmail.com>
Message-ID: <1456523757-16847-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Limpens <limpens@gmail.com>

This patch fixes an autobuild error during a static build:
http://autobuild.buildroot.net/results/f61ae46ba4d4fc3af3784d1f612a8c1cc7de3314/

Signed-off-by: Eric Limpens <limpens@gmail.com>
[Arnout: clean up commit message and patch log]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: clean up commit message and patch log [Arnout]
---
 .../pifmrds/0003-Makefile-fix-static-link.patch    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/pifmrds/0003-Makefile-fix-static-link.patch

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
-- 
2.7.0
