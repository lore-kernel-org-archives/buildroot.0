From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 15:47:18 +0200
Subject: [Buildroot] [git commit] android-tools: fix build on big endian
	systems
Message-ID: <20160517134937.E7F3781EB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60cc46321db0b0df92a920b5535b25562b1db7c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the android-tools package to make it build
properly on big-endian systems.

Fixes:

  http://autobuild.buildroot.net/results/1b8ace1a083b419c1ab913fda0d36a1d2d910f13/ (PowerPC)
  http://autobuild.buildroot.net/results/5bb304c91367f1570903c8c527b387c65e572e56/ (Xtensa)

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../android-tools/0005-fix-big-endian-build.patch  | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/android-tools/0005-fix-big-endian-build.patch b/package/android-tools/0005-fix-big-endian-build.patch
new file mode 100644
index 0000000..c35fdcb
--- /dev/null
+++ b/package/android-tools/0005-fix-big-endian-build.patch
@@ -0,0 +1,61 @@
+Fix build on big endian systems
+
+The usb_linux_client.c file defines cpu_to_le16/32 by using the C
+library htole16/32 function calls. However, cpu_to_le16/32 are used
+when initializing structures, i.e in a context where a function call
+is not allowed.
+
+It works fine on little endian systems because htole16/32 are defined
+by the C library as no-ops. But on big-endian systems, they are
+actually doing something, which might involve calling a function,
+causing build failures.
+
+To solve this, we simply open-code cpu_to_le16/32 in a way that allows
+them to be used when initializing structures.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/core/adb/usb_linux_client.c
+===================================================================
+--- a/core/adb/usb_linux_client.c
++++ b/core/adb/usb_linux_client.c
+@@ -34,8 +34,15 @@
+ #define MAX_PACKET_SIZE_FS	64
+ #define MAX_PACKET_SIZE_HS	512
+ 
+-#define cpu_to_le16(x)  htole16(x)
+-#define cpu_to_le32(x)  htole32(x)
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++# define cpu_to_le16(x) (x)
++# define cpu_to_le32(x) (x)
++#else
++# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
++# define cpu_to_le32(x) \
++	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
++	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
++#endif
+ 
+ struct usb_handle
+ {
+Index: b/core/adbd/usb_linux_client.c
+===================================================================
+--- a/core/adbd/usb_linux_client.c
++++ b/core/adbd/usb_linux_client.c
+@@ -34,8 +34,15 @@
+ #define MAX_PACKET_SIZE_FS	64
+ #define MAX_PACKET_SIZE_HS	512
+ 
+-#define cpu_to_le16(x)  htole16(x)
+-#define cpu_to_le32(x)  htole32(x)
++#if __BYTE_ORDER == __LITTLE_ENDIAN
++# define cpu_to_le16(x) (x)
++# define cpu_to_le32(x) (x)
++#else
++# define cpu_to_le16(x) ((((x) >> 8) & 0xffu) | (((x) & 0xffu) << 8))
++# define cpu_to_le32(x) \
++	((((x) & 0xff000000u) >> 24) | (((x) & 0x00ff0000u) >>  8) | \
++	 (((x) & 0x0000ff00u) <<  8) | (((x) & 0x000000ffu) << 24))
++#endif
+ 
+ struct usb_handle
+ {
