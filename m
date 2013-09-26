From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 26 Sep 2013 10:17:40 +0800
Subject: [Buildroot] [PATCH] logsurfer: needs mmu
Message-ID: <1380161860.11201.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below build error:

exec.o: In function `do_exec':
exec.c:(.text+0x14c): undefined reference to `fork'
exec.o: In function `do_pipe_line':
exec.c:(.text+0x218): undefined reference to `fork'
logsurfer.o: In function `runasdaemon':
logsurfer.c:(.text+0x388): undefined reference to `fork'
logsurfer.c:(.text+0x3dc): undefined reference to `fork'
report.o: In function `make_report':
report.c:(.text+0x1a8): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [logsurfer] Error 1
make[2]: Leaving directory `/opt/test/buildroot/buildroot/output/build/logsurfer-1.8/src'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/test/buildroot/buildroot/output/build/logsurfer-1.8'

 package/logsurfer/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
index 27d1881..d4218bc 100644
--- a/package/logsurfer/Config.in
+++ b/package/logsurfer/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LOGSURFER
 	bool "logsurfer"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Logsurfer is a program for monitoring system logs in real-time,
 	  and reporting on the occurrence of events.
-- 
1.8.1.2
