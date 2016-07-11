From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:33 +0200
Subject: [Buildroot] [PATCH 10/12 v8] package/libudev: make it selectable
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <a9b2e3dfb8a1dcdde4e02fe166e841848586521d.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually, it is not possible for a pacakge to select a virtual package it
depends on, and expects a provider to suddenly be available.

However, for libudev, this is slightly simpler: there will be only two
providers ever: eudev and systemd. Both are incompatible one with the
other, systemd is only available if chosen as an init system.

So, if systemd is not enabled (as an init system), then we can
forcefully enable eudev as the provider for libudev.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libudev/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libudev/Config.in b/package/libudev/Config.in
index 2745fcc..036adce 100644
--- a/package/libudev/Config.in
+++ b/package/libudev/Config.in
@@ -1,3 +1,10 @@
+config BR2_PACKAGE_LIBUDEV
+	bool
+	depends on BR2_USE_MMU # eudev / systemd
+	depends on BR2_USE_WCHAR # eudev / systemd
+	depends on !BR2_STATIC_LIBS # eudev / systemd
+	select BR2_PACKAGE_EUDEV if !BR2_PACKAGE_SYSTEMD
+
 config BR2_PACKAGE_HAS_LIBUDEV
 	bool
 
-- 
2.7.4
