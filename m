From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Jan 2016 23:05:40 +0100
Subject: [Buildroot] [git commit] pulseaudio: bump to version 8.0
Message-ID: <20160201224704.AC78F7F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6faa779d08e18edba37b88ee119718d410ac62e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump to version 8.0
- Update hash values
- Remove upstreamed patch:
  http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=1c5005ef77737a21b513eaa322d2f119e12f31e3

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...acket-avoid-redefinition-of-pa_packet-str.patch | 64 ----------------------
 package/pulseaudio/pulseaudio.hash                 |  6 +-
 package/pulseaudio/pulseaudio.mk                   |  2 +-
 3 files changed, 4 insertions(+), 68 deletions(-)

diff --git a/package/pulseaudio/0001-pulsecore-packet-avoid-redefinition-of-pa_packet-str.patch b/package/pulseaudio/0001-pulsecore-packet-avoid-redefinition-of-pa_packet-str.patch
deleted file mode 100644
index 10741a1..0000000
--- a/package/pulseaudio/0001-pulsecore-packet-avoid-redefinition-of-pa_packet-str.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 0c9b79cd8f6b8a88d7e60741607173af5d320203 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 17 Nov 2015 12:00:53 +0100
-Subject: [PATCH] pulsecore/packet: avoid redefinition of pa_packet structure
-
-packet.h defines:
-
-  typedef struct pa_packet pa_packet;
-
-and packet.c defines:
-
-  typedef struct pa_packet {
-    ...
-  } pa_packet;
-
-With old versions of gcc (such as gcc 4.5) this causes a redefinition
-error at compile time:
-
-pulsecore/packet.c:43:3: error: redefinition of typedef 'pa_packet'
-pulsecore/packet.h:26:26: note: previous declaration of 'pa_packet' was here
-
-In order to fix this, this commit changes the definition in packet.c
-to just:
-
-  struct pa_packet {
-    ...
-  };
-
-This way, the contents of the structure remain opaque to users of
-pa_packet outside packet.c, and the 'pa_packet' type remains usable.
-
-Fixes: https://bugs.freedesktop.org/show_bug.cgi?id=91334
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Submitted-upstream-at: http://lists.freedesktop.org/archives/pulseaudio-discuss/2015-November/024785.html
----
- src/pulsecore/packet.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/pulsecore/packet.c b/src/pulsecore/packet.c
-index e275d23..2a61d58 100644
---- a/src/pulsecore/packet.c
-+++ b/src/pulsecore/packet.c
-@@ -32,7 +32,7 @@
- 
- #define MAX_APPENDED_SIZE 128
- 
--typedef struct pa_packet {
-+struct pa_packet {
-     PA_REFCNT_DECLARE;
-     enum { PA_PACKET_APPENDED, PA_PACKET_DYNAMIC } type;
-     size_t length;
-@@ -40,7 +40,7 @@ typedef struct pa_packet {
-     union {
-         uint8_t appended[MAX_APPENDED_SIZE];
-     } per_type;
--} pa_packet;
-+};
- 
- PA_STATIC_FLIST_DECLARE(packets, 0, pa_xfree);
- 
--- 
-2.6.3
-
diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 7e9dcac..0d1a3d2 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,3 +1,3 @@
-# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-7.1.tar.xz.{md5,sha1}
-md5 9d0a9817b632cac8e3f3834d7eb1c99d pulseaudio-7.1.tar.xz
-sha1 dc35a8aa66c513ac989319e13a18e317d8e432b3 pulseaudio-7.1.tar.xz
+# From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-8.0.tar.xz.{md5,sha1}
+md5 8678442ba0bb4b4c33ac6f62542962df  pulseaudio-8.0.tar.xz
+sha1 1399a2f6288ad743184b6c2192129fef033343ac  pulseaudio-8.0.tar.xz
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index a59a6c5..8450090 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 7.1
+PULSEAUDIO_VERSION = 8.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
