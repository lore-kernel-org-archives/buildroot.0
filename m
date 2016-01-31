From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 18:44:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/squeezelite: fix musl build
Message-ID: <1454262247-30214-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build error was not yet found by the autobuilders:

output_alsa.c: In function ?output_init_alsa?:
output_alsa.c:865:10: error: ?M_TRIM_THRESHOLD? undeclared (first use in this function)
  mallopt(M_TRIM_THRESHOLD, -1);
          ^
output_alsa.c:865:10: note: each undeclared identifier is reported only once for each function it appears in
output_alsa.c:866:10: error: ?M_MMAP_MAX? undeclared (first use in this function)
  mallopt(M_MMAP_MAX, 0);
          ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...02-only-run-glibc-specific-hacks-on-glibc.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/squeezelite/0002-only-run-glibc-specific-hacks-on-glibc.patch

diff --git a/package/squeezelite/0002-only-run-glibc-specific-hacks-on-glibc.patch b/package/squeezelite/0002-only-run-glibc-specific-hacks-on-glibc.patch
new file mode 100644
index 0000000..12237e4
--- /dev/null
+++ b/package/squeezelite/0002-only-run-glibc-specific-hacks-on-glibc.patch
@@ -0,0 +1,30 @@
+From d898fac929cd093bb39af3f517158777c21c06ef Mon Sep 17 00:00:00 2001
+From: Carlo Landmeter <clandmeter@gmail.com>
+Date: Tue, 31 Mar 2015 10:07:14 +0000
+Subject: [PATCH] only run glibc specific hacks on glibc
+
+---
+Patch downloaded from upstream PR:
+https://github.com/robadenshi/squeezelite/issues/97
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+ output_alsa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/output_alsa.c b/output_alsa.c
+index aa01560..c1b5435 100644
+--- a/output_alsa.c
++++ b/output_alsa.c
+@@ -853,7 +853,7 @@ void output_init_alsa(log_level level, const char *device, unsigned output_buf_s
+ 		set_mixer(output.device, volume_mixer_name, volume_mixer_index ? atoi(volume_mixer_index) : 0, true, 0, 0);
+ 	}
+ 
+-#if LINUX
++#if defined(__GLIBC__)
+ 	// RT linux - aim to avoid pagefaults by locking memory: 
+ 	// https://rt.wiki.kernel.org/index.php/Threaded_RT-application_with_memory_locking_and_stack_handling_example
+ 	if (mlockall(MCL_CURRENT | MCL_FUTURE) == -1) {
+-- 
+2.3.4
+
-- 
2.7.0
