From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:31:45 +0200
Subject: [Buildroot] [git commit] package/flac: Fix musl compile
Message-ID: <20150411133155.63B9A80E17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e1a97ad1b9225d5826d711204035c93c865157a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flac/0002-sigemptyset.patch |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/flac/0002-sigemptyset.patch b/package/flac/0002-sigemptyset.patch
new file mode 100644
index 0000000..9cbc338
--- /dev/null
+++ b/package/flac/0002-sigemptyset.patch
@@ -0,0 +1,18 @@
+Fix musl compile since it does not define __sigemptyset
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/commit/main/flac/sigemptyset.patch?id=49fd0f4cebc46e2753d6a60e450078446f7f18a7
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- ./src/libFLAC/cpu.c.orig
++++ ./src/libFLAC/cpu.c
+@@ -243,7 +243,7 @@
+ 		struct sigaction sigill_save;
+ 		struct sigaction sigill_sse;
+ 		sigill_sse.sa_sigaction = sigill_handler_sse_os;
+-		__sigemptyset(&sigill_sse.sa_mask);
++		sigemptyset(&sigill_sse.sa_mask);
+ 		sigill_sse.sa_flags = SA_SIGINFO | SA_RESETHAND; /* SA_RESETHAND just in case our SIGILL return jump breaks, so we don't get stuck in a loop */
+ 		if(0 == sigaction(SIGILL, &sigill_sse, &sigill_save))
+ 		{
