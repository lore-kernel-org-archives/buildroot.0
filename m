From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 20:52:43 +0100
Subject: [Buildroot] [git commit] package/libcec: Bump to version 2.2.0
Message-ID: <20141223195431.9FF328069C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e243a5102aa0e589262f14c9b49a61e8c8028ab9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kodi Helix depends on libcec >= 2.2.0

Removed libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
applied upstream: https://github.com/Pulse-Eight/libcec/commit/485660f

Renamed remaining patch according to new naming convention.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...i-warning.patch => 0001-no-psabi-warning.patch} |    0
 ...gistering-a-callback-that-wasn-t-register.patch |   36 --------------------
 package/libcec/libcec.mk                           |    2 +-
 3 files changed, 1 insertions(+), 37 deletions(-)

diff --git a/package/libcec/libcec-0002-no-psabi-warning.patch b/package/libcec/0001-no-psabi-warning.patch
similarity index 100%
rename from package/libcec/libcec-0002-no-psabi-warning.patch
rename to package/libcec/0001-no-psabi-warning.patch
diff --git a/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch b/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
deleted file mode 100644
index 41d93aa..0000000
--- a/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 78e52d55d6fc079b9a96d1a663d1991d9a0f2a2b Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Wed, 7 May 2014 08:41:27 +0200
-Subject: [PATCH] Fix unregistering a callback that wasn't register
-
-This patchs fixes an asserts that get's thrown when you start XBMC and thus
-prevents it from starting.
-The asserts you'll endup getting is:
-assertion failure:
-[...]/interface/vmcs_host/vc_vchi_tvservice.c:430:vc_tv_unregister_callback():done
-
-Found: https://github.com/raspberrypi/userland/issues/159
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp b/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp
-index 76c61b3..1eb6417 100644
---- a/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp
-+++ b/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp
-@@ -353,7 +353,9 @@ void CRPiCECAdapterCommunication::Close(void)
-     else
-       return;
-   }
--  vc_tv_unregister_callback(rpi_tv_callback);
-+
-+  if (m_bInitialised)
-+    vc_tv_unregister_callback(rpi_tv_callback);
-
-   UnregisterLogicalAddress();
-
---
-1.9.2
-
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 5a889b9..8bdc9ea 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = libcec-2.1.4-repack
+LIBCEC_VERSION = libcec-2.2.0-repack
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
