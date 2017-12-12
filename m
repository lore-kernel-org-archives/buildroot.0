From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 12 Dec 2017 20:51:09 +0100
Subject: [Buildroot] [PATCH] mpd: add upstream patch to fix build with
 libupnp 1.6.24
Message-ID: <20171212195109.29683-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream patch to fix build with libupnp 1.6.24.

libupnp 1.6.24 added some compat helpers for programs making use of
libupnp to support 1.6.x and 1.8.x easier [1].

MPD added its own wrappers in version 0.20.12 [2] which are clashing with the
newly added compat helpers in libupnp 1.6.24.

The patch disables the MPD wrappers for libupnp version 1.6.24+.

Fixes:
http://autobuild.buildroot.net/results/949bf9d42c82de34f3328a31bb122c81243e5418/
http://autobuild.buildroot.net/results/b12ca93cb3ad52e601cc99f54a867e21a28fd1c9/
http://autobuild.buildroot.net/results/7af8e96fdf823bbc427caa562d6d0a130a4875f0/
.. and many more.

Backported from: 78728138a04c2493c6bfadee98060043eca204bf

[1] https://sourceforge.net/p/pupnp/code/ci/8177a4195a4d4a5d6cb095eaf4ca5b65ac446381/
[2] https://github.com/MusicPlayerDaemon/MPD/commit/714011c81ed6053f7a35812071499356f337dd70

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/0002-libupnp-1-6-24-compat.patch | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/mpd/0002-libupnp-1-6-24-compat.patch

diff --git a/package/mpd/0002-libupnp-1-6-24-compat.patch b/package/mpd/0002-libupnp-1-6-24-compat.patch
new file mode 100644
index 0000000000..abcafa8616
--- /dev/null
+++ b/package/mpd/0002-libupnp-1-6-24-compat.patch
@@ -0,0 +1,48 @@
+From 78728138a04c2493c6bfadee98060043eca204bf Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@musicpd.org>
+Date: Sat, 2 Dec 2017 14:47:27 +0100
+Subject: [PATCH] lib/upnp/Compat: disable the 1.8 API emulation with libupnp
+ 1.6.24
+
+libupnp 1.6.24 added a few badly designed macros which break the MPD
+build:
+
+ https://sourceforge.net/p/pupnp/code/ci/8177a4195a4d4a5d6cb095eaf4ca5b65ac446381/
+
+To work around this, we disable our emulation functions (from
+714011c81ed6053f7a35812071499356f337dd70) on this libupnp version.
+
+Closes #163
+
+Backported from: 78728138a04c2493c6bfadee98060043eca204bf
+
+Signed-off-by: Max Kellermann <max@musicpd.org>
+[J?rg Krause: Drop patching News file]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+---
+ src/lib/upnp/Compat.hxx | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/upnp/Compat.hxx b/src/lib/upnp/Compat.hxx
+index 2e2d2f1de..c9f1cc47f 100644
+--- a/src/lib/upnp/Compat.hxx
++++ b/src/lib/upnp/Compat.hxx
+@@ -23,12 +23,15 @@
+ #include <upnp/upnp.h>
+ 
+ #if UPNP_VERSION < 10800
+-#include "Compiler.h"
+-
+ /* emulate the libupnp 1.8 API with older versions */
+ 
+ using UpnpDiscovery = Upnp_Discovery;
+ 
++#endif
++
++#if UPNP_VERSION < 10624
++#include "Compiler.h"
++
+ gcc_pure
+ static inline int
+ UpnpDiscovery_get_Expires(const UpnpDiscovery *disco) noexcept
-- 
2.15.1
