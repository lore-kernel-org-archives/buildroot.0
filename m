From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 22:39:52 +0100
Subject: [Buildroot] [git commit] trace-cmd: fix ptrace detection
Message-ID: <20131104211054.6C7B59BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b0e9c83022deac95c85d8f7526b16e420f0b6c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ptrace support detection is ignored when CFLAGS is set by
buildroot. Use override in Makefile to add -DWARN_NO_PTRACE and
-DNO_PTRACE in CFLAGS if ptrace is not available.

Fixes:
  http://autobuild.buildroot.net/results/60e/60ed317d52d93ba2c087aa6ff4f422d760806d89//

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../trace-cmd-0002-Fix-ptrace-detection.patch      |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/trace-cmd/trace-cmd-0002-Fix-ptrace-detection.patch b/package/trace-cmd/trace-cmd-0002-Fix-ptrace-detection.patch
new file mode 100644
index 0000000..b17d7df
--- /dev/null
+++ b/package/trace-cmd/trace-cmd-0002-Fix-ptrace-detection.patch
@@ -0,0 +1,36 @@
+From 0070081ffe65a4fbe442044ddfcc818593c98e33 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 30 Oct 2013 22:35:34 +0100
+Subject: [PATCH] Fix ptrace detection
+
+Ptrace support detection is ignored when CFLAGS is set in command
+arguments. Use override in Makefile to add -DWARN_NO_PTRACE and
+-DNO_PTRACE in CFLAGS if ptrace is not available.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 83329ca..01b4f45 100644
+--- a/Makefile
++++ b/Makefile
+@@ -223,12 +223,12 @@ LDFLAGS ?=
+ ifndef NO_PTRACE
+ ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
+ 	NO_PTRACE = 1
+-	CFLAGS += -DWARN_NO_PTRACE
++	override CFLAGS += -DWARN_NO_PTRACE
+ endif
+ endif
+ 
+ ifdef NO_PTRACE
+-CFLAGS += -DNO_PTRACE
++override CFLAGS += -DNO_PTRACE
+ endif
+ 
+ # Append required CFLAGS
+-- 
+1.8.1.2
+
