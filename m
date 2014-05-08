From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu,  8 May 2014 10:59:43 +0200
Subject: [Buildroot] [PATCH 2/2] libcec: Add patch to fix assert with XBMC
	Gotham
In-Reply-To: <1399539583-31334-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1399539583-31334-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1399539583-31334-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the new XBMC, on RaspberryPi, libcec throws an asserts in RPi
userland's code which forbid XBMC Gotham to start.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...gistering-a-callback-that-wasn-t-register.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch

diff --git a/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch b/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
new file mode 100644
index 0000000..41d93aa
--- /dev/null
+++ b/package/libcec/libcec-0001-Fix-unregistering-a-callback-that-wasn-t-register.patch
@@ -0,0 +1,36 @@
+From 78e52d55d6fc079b9a96d1a663d1991d9a0f2a2b Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Wed, 7 May 2014 08:41:27 +0200
+Subject: [PATCH] Fix unregistering a callback that wasn't register
+
+This patchs fixes an asserts that get's thrown when you start XBMC and thus
+prevents it from starting.
+The asserts you'll endup getting is:
+assertion failure:
+[...]/interface/vmcs_host/vc_vchi_tvservice.c:430:vc_tv_unregister_callback():done
+
+Found: https://github.com/raspberrypi/userland/issues/159
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp b/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp
+index 76c61b3..1eb6417 100644
+--- a/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp
++++ b/src/lib/adapter/RPi/RPiCECAdapterCommunication.cpp
+@@ -353,7 +353,9 @@ void CRPiCECAdapterCommunication::Close(void)
+     else
+       return;
+   }
+-  vc_tv_unregister_callback(rpi_tv_callback);
++
++  if (m_bInitialised)
++    vc_tv_unregister_callback(rpi_tv_callback);
+
+   UnregisterLogicalAddress();
+
+--
+1.9.2
+
-- 
1.9.2
