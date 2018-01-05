From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Jan 2018 16:12:00 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.20.14
Message-ID: <20180105151726.4F13681036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be2f1d20fee41206dfc6b5846a53ad8a0eb0ba16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch '0002-libupnp-1-6-24-compat.patch'.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/0002-libupnp-1-6-24-compat.patch | 48 ----------------------------
 package/mpd/mpd.hash                         |  2 +-
 package/mpd/mpd.mk                           |  2 +-
 3 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/package/mpd/0002-libupnp-1-6-24-compat.patch b/package/mpd/0002-libupnp-1-6-24-compat.patch
deleted file mode 100644
index abcafa8..0000000
--- a/package/mpd/0002-libupnp-1-6-24-compat.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 78728138a04c2493c6bfadee98060043eca204bf Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max@musicpd.org>
-Date: Sat, 2 Dec 2017 14:47:27 +0100
-Subject: [PATCH] lib/upnp/Compat: disable the 1.8 API emulation with libupnp
- 1.6.24
-
-libupnp 1.6.24 added a few badly designed macros which break the MPD
-build:
-
- https://sourceforge.net/p/pupnp/code/ci/8177a4195a4d4a5d6cb095eaf4ca5b65ac446381/
-
-To work around this, we disable our emulation functions (from
-714011c81ed6053f7a35812071499356f337dd70) on this libupnp version.
-
-Closes #163
-
-Backported from: 78728138a04c2493c6bfadee98060043eca204bf
-
-Signed-off-by: Max Kellermann <max@musicpd.org>
-[J??rg Krause: Drop patching News file]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
----
- src/lib/upnp/Compat.hxx | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/upnp/Compat.hxx b/src/lib/upnp/Compat.hxx
-index 2e2d2f1de..c9f1cc47f 100644
---- a/src/lib/upnp/Compat.hxx
-+++ b/src/lib/upnp/Compat.hxx
-@@ -23,12 +23,15 @@
- #include <upnp/upnp.h>
- 
- #if UPNP_VERSION < 10800
--#include "Compiler.h"
--
- /* emulate the libupnp 1.8 API with older versions */
- 
- using UpnpDiscovery = Upnp_Discovery;
- 
-+#endif
-+
-+#if UPNP_VERSION < 10624
-+#include "Compiler.h"
-+
- gcc_pure
- static inline int
- UpnpDiscovery_get_Expires(const UpnpDiscovery *disco) noexcept
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 16661e5..99ec6c8 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  e159ac0608fb85c891bd19375ed7056d5f9ec4ba492b052f24820513e774f709  mpd-0.20.12.tar.xz
+sha256  7d59afa1e7aabe5f7ad2d66eb274b0d54568b4110a783dfe8e74bd0f94e3f781  mpd-0.20.14.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 57e3b46..f9ca160 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).12
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
