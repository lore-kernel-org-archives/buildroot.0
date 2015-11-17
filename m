From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 17:07:09 +0100
Subject: [Buildroot] [git commit] pulseaudio: fix build issue with old gcc
	versions
Message-ID: <20151117160747.31A8C81933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec81a789b7b7c78f36e4fe24da1e24a6e750e101
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to pulseaudio (already submitted upstream)
that avoids a structure redefinition build failure that occurs with
old gcc versions.

Fixes:

  http://autobuild.buildroot.org/results/a1e/a1e7e59f9c65a6ce38800439c78b7808048ad708/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...acket-avoid-redefinition-of-pa_packet-str.patch |   64 ++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/package/pulseaudio/0001-pulsecore-packet-avoid-redefinition-of-pa_packet-str.patch b/package/pulseaudio/0001-pulsecore-packet-avoid-redefinition-of-pa_packet-str.patch
new file mode 100644
index 0000000..10741a1
--- /dev/null
+++ b/package/pulseaudio/0001-pulsecore-packet-avoid-redefinition-of-pa_packet-str.patch
@@ -0,0 +1,64 @@
+From 0c9b79cd8f6b8a88d7e60741607173af5d320203 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 17 Nov 2015 12:00:53 +0100
+Subject: [PATCH] pulsecore/packet: avoid redefinition of pa_packet structure
+
+packet.h defines:
+
+  typedef struct pa_packet pa_packet;
+
+and packet.c defines:
+
+  typedef struct pa_packet {
+    ...
+  } pa_packet;
+
+With old versions of gcc (such as gcc 4.5) this causes a redefinition
+error at compile time:
+
+pulsecore/packet.c:43:3: error: redefinition of typedef 'pa_packet'
+pulsecore/packet.h:26:26: note: previous declaration of 'pa_packet' was here
+
+In order to fix this, this commit changes the definition in packet.c
+to just:
+
+  struct pa_packet {
+    ...
+  };
+
+This way, the contents of the structure remain opaque to users of
+pa_packet outside packet.c, and the 'pa_packet' type remains usable.
+
+Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=91334
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted-upstream-at: http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-November/024785.html
+---
+ src/pulsecore/packet.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/pulsecore/packet.c b/src/pulsecore/packet.c
+index e275d23..2a61d58 100644
+--- a/src/pulsecore/packet.c
++++ b/src/pulsecore/packet.c
+@@ -32,7 +32,7 @@
+ 
+ #define MAX_APPENDED_SIZE 128
+ 
+-typedef struct pa_packet {
++struct pa_packet {
+     PA_REFCNT_DECLARE;
+     enum { PA_PACKET_APPENDED, PA_PACKET_DYNAMIC } type;
+     size_t length;
+@@ -40,7 +40,7 @@ typedef struct pa_packet {
+     union {
+         uint8_t appended[MAX_APPENDED_SIZE];
+     } per_type;
+-} pa_packet;
++};
+ 
+ PA_STATIC_FLIST_DECLARE(packets, 0, pa_xfree);
+ 
+-- 
+2.6.3
+
