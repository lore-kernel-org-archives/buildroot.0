From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 18:17:50 +0100
Subject: [Buildroot] [git commit] squeezelite: fix musl build
Message-ID: <20160207174236.91E527FA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=292d0266a9de12500d1c8ceac3cec5e45f9099af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error was not yet found by the autobuilders:

output_alsa.c: In function ???output_init_alsa???:
output_alsa.c:865:10: error: ???M_TRIM_THRESHOLD??? undeclared (first use in this function)
  mallopt(M_TRIM_THRESHOLD, -1);
          ^
output_alsa.c:865:10: note: each undeclared identifier is reported only once for each function it appears in
output_alsa.c:866:10: error: ???M_MMAP_MAX??? undeclared (first use in this function)
  mallopt(M_MMAP_MAX, 0);
          ^

This commit adds a patch fixing this build error by making the
mallopt() usage conditional on __GLIBC__.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: only enclose the mallopt() call in __GLIBC__, use Git to
format the patch, improve the commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...002-output_alsa-use-mallopt-only-on-glibc.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch b/package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch
new file mode 100644
index 0000000..6962b7b
--- /dev/null
+++ b/package/squeezelite/0002-output_alsa-use-mallopt-only-on-glibc.patch
@@ -0,0 +1,34 @@
+From 903922a7bcf06e04d9830b47bba6d65ed37304c1 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 Feb 2016 18:05:56 +0100
+Subject: [PATCH] output_alsa: use mallopt() only on glibc
+
+The musl C library does not provide the glibc specific mallopt()
+functionality, so use it only when __GLIBC__ is defined.
+
+uClibc pretends to be glibc by defining __GLIBC__, but it implements
+mallopt(), so it works fine.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ output_alsa.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/output_alsa.c b/output_alsa.c
+index aa01560..44c9fc7 100644
+--- a/output_alsa.c
++++ b/output_alsa.c
+@@ -862,8 +862,10 @@ void output_init_alsa(log_level level, const char *device, unsigned output_buf_s
+ 		LOG_INFO("memory locked");
+ 	}
+ 
++#ifdef __GLIBC__
+ 	mallopt(M_TRIM_THRESHOLD, -1);
+ 	mallopt(M_MMAP_MAX, 0);
++#endif
+ 
+ 	touch_memory(silencebuf, MAX_SILENCE_FRAMES * BYTES_PER_FRAME);
+ 	touch_memory(outputbuf->buf, outputbuf->size);
+-- 
+2.6.4
+
