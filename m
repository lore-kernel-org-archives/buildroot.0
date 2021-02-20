From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sat, 20 Feb 2021 19:35:53 +0100
Subject: [Buildroot] [PATCH 2020.11.x] package/i7z: fix build with gcc 10
Message-ID: <20210220183553.10627-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Fixes:
- http://autobuild.buildroot.org/results/1a433611ba8676cf1ca276fccaf3633971bd562e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[cherry pick commit dbe6870a4c9b to fix
http://autobuild.buildroot.net/results/72ca4e447655e1dda5d201301b6916b47be2dc71]
Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---


Hi,

I would like to propose backporting this patch from Fabrice Fontaine to the
2020.11.x branch, please. This would make the autobuild happy.

Best regards,
Vincent.


 package/i7z/0001-fix-build-with-gcc-10.patch | 63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/i7z/0001-fix-build-with-gcc-10.patch

diff --git a/package/i7z/0001-fix-build-with-gcc-10.patch b/package/i7z/0001-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..a25e937b07
--- /dev/null
+++ b/package/i7z/0001-fix-build-with-gcc-10.patch
@@ -0,0 +1,63 @@
+From 6e4e407a374512b5bcb5a7c184258653e472ef9f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 19 Jan 2021 07:47:58 +0100
+Subject: [PATCH] fix build with gcc 10
+
+Fix the following build failure with gcc 10 (which defaults to
+-fno-common):
+
+/home/buildroot/autobuild/instance-2/output-1/host/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -fno-schedule-insns2  -fno-schedule-insns -fno-inline-small-functions -fno-caller-saves -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DBUILD_MAIN -Wimplicit-function-declaration -Dx64_BIT  -o i7z i7z.o helper_functions.o i7z_Single_Socket.o i7z_Dual_Socket.o -lncurses -lpthread -lrt -lm
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-gnu/10.2.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: i7z_Dual_Socket.o:(.bss+0x0): multiple definition of `global_ts'; i7z_Single_Socket.o:(.bss+0x0): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1a433611ba8676cf1ca276fccaf3633971bd562e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ajaiantilal/i7z/pull/27]
+---
+ i7z.c               | 1 +
+ i7z_Dual_Socket.c   | 2 +-
+ i7z_Single_Socket.c | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/i7z.c b/i7z.c
+index 61e2757..910a608 100644
+--- a/i7z.c
++++ b/i7z.c
+@@ -34,6 +34,7 @@ int Dual_Socket();
+ 
+ int socket_0_num=0, socket_1_num=1;
+ bool use_ncurses = true;
++struct timespec global_ts;
+ 
+ /////////////////////LOGGING TO FILE////////////////////////////////////////
+ FILE *fp_log_file_freq;
+diff --git a/i7z_Dual_Socket.c b/i7z_Dual_Socket.c
+index 1388339..ceafdce 100644
+--- a/i7z_Dual_Socket.c
++++ b/i7z_Dual_Socket.c
+@@ -37,7 +37,7 @@ float Read_Voltage_CPU(int cpu_num);
+ extern struct program_options prog_options;
+ FILE *fp_log_file;
+ 
+-struct timespec global_ts;
++extern struct timespec global_ts;
+ extern FILE *fp_log_file_freq_1, *fp_log_file_freq_2;
+ 
+ extern char* CPU_FREQUENCY_LOGGING_FILE_single;
+diff --git a/i7z_Single_Socket.c b/i7z_Single_Socket.c
+index 16e98c1..b7266e6 100644
+--- a/i7z_Single_Socket.c
++++ b/i7z_Single_Socket.c
+@@ -35,7 +35,7 @@ int Read_Thermal_Status_CPU(int cpu_num);
+ extern struct program_options prog_options;
+ extern FILE *fp_log_file_freq;
+ 
+-struct timespec global_ts;
++extern struct timespec global_ts;
+ 
+ extern char* CPU_FREQUENCY_LOGGING_FILE_single;
+ extern char* CPU_FREQUENCY_LOGGING_FILE_dual;
+-- 
+2.29.2
+
-- 
2.30.0
