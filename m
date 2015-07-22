From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 08:48:16 +0200
Subject: [Buildroot] [git commit] network-manager: bump to version 1.0.4
Message-ID: <20150722064822.243C5819E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2b285c2f3286cb40ad3c50b43ecbdd230d93e09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropped unused patches, added upstream proposed patch to fix build
error for kernels headers < 3.17.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Petr Vorel <vorel@jablocom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ..._user_ipv6ll_enabled-to-nm-platform-linux.patch |   87 ++++++++++++++++++++
 ...anager-fix-build-with-Linux-3.2.0-headers.patch |   30 -------
 ...d-dhcp-fix-build-with-Linux-3.2.0-headers.patch |   37 --------
 package/network-manager/network-manager.hash       |    4 +-
 package/network-manager/network-manager.mk         |    2 +-
 5 files changed, 90 insertions(+), 70 deletions(-)

diff --git a/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch b/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
new file mode 100644
index 0000000..4aebaef
--- /dev/null
+++ b/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
@@ -0,0 +1,87 @@
+From: Lubomir Rintel <lkundrak@v3.sk>
+Date: Mon, 20 Jul 2015 11:01:04 +0200
+Subject: [PATCH] platform: move link_get_user_ipv6ll_enabled() to	nm-platform-linux
+Source: https://mail.gnome.org/archives/networkmanager-list/2015-July/msg00028.html
+
+This fixes build error kernels headers < 3.17.
+
+Reported-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ src/platform/nm-linux-platform.c | 16 ++++++++++++++++
+ src/platform/nm-platform.c       | 11 ++---------
+ src/platform/nm-platform.h       |  1 +
+ 3 files changed, 19 insertions(+), 9 deletions(-)
+
+diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
+index f3a9254..b6b8e33 100644
+--- a/src/platform/nm-linux-platform.c
++++ b/src/platform/nm-linux-platform.c
+@@ -2987,6 +2987,21 @@ link_set_user_ipv6ll_enabled (NMPlatform *platform, int ifindex, gboolean enable
+ }
+
+ static gboolean
++link_get_user_ipv6ll_enabled (NMPlatform *platform, int ifindex)
++{
++#if HAVE_LIBNL_INET6_ADDR_GEN_MODE
++       {
++               const NMPlatformLink *pllink;
++
++               pllink = nm_platform_link_get (platform, ifindex);
++               if (pllink && pllink->inet6_addr_gen_mode_inv)
++                       return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
++       }
++#endif
++       return FALSE;
++}
++
++static gboolean
+ link_supports_carrier_detect (NMPlatform *platform, int ifindex)
+ {
+        const char *name = nm_platform_link_get_name (platform, ifindex);
+@@ -4968,6 +4968,7 @@
+	platform_class->link_get_udev_device = link_get_udev_device;
+
+	platform_class->link_set_user_ipv6ll_enabled = link_set_user_ipv6ll_enabled;
++	platform_class->link_get_user_ipv6ll_enabled = link_get_user_ipv6ll_enabled;
+
+	platform_class->link_set_address = link_set_address;
+	platform_class->link_get_permanent_address = link_get_permanent_address;
+
+diff --git a/src/platform/nm-platform.c b/src/platform/nm-platform.c
+index 8803377..ee4b1a1 100644
+--- a/src/platform/nm-platform.c
++++ b/src/platform/nm-platform.c
+@@ -965,15 +965,8 @@
+
+	g_return_val_if_fail (ifindex >= 0, FALSE);
+
+-#if HAVE_LIBNL_INET6_ADDR_GEN_MODE
+-	{
+-		const NMPlatformLink *pllink;
+-
+-		pllink = nm_platform_link_get (self, ifindex);
+-		if (pllink && pllink->inet6_addr_gen_mode_inv)
+-			return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
+-	}
+-#endif
++	if (klass->link_get_user_ipv6ll_enabled)
++		return klass->link_get_user_ipv6ll_enabled (self, ifindex);
+	return FALSE;
+ }
+
+diff --git a/src/platform/nm-platform.h b/src/platform/nm-platform.h
+index 16eb351..9ef4080 100644
+--- a/src/platform/nm-platform.h
++++ b/src/platform/nm-platform.h
+@@ -446,6 +446,7 @@
+	GObject *(*link_get_udev_device) (NMPlatform *self, int ifindex);
+
+	gboolean (*link_set_user_ipv6ll_enabled) (NMPlatform *, int ifindex, gboolean enabled);
++	gboolean (*link_get_user_ipv6ll_enabled) (NMPlatform *, int ifindex);
+
+	gboolean (*link_get_permanent_address) (NMPlatform *,
+	                                        int ifindex,
+--
+2.4.3
diff --git a/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
deleted file mode 100644
index 49c1996..0000000
--- a/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 22b99e3bbb2ca33963e839f12ab95314ab8d9ba9 Mon Sep 17 00:00:00 2001
-From: Lubomir Rintel <lkundrak@v3.sk>
-Date: Fri, 15 May 2015 16:37:20 +0200
-Subject: [PATCH] ppp-manager: fix build with Linux 3.2.0 headers
-
-Fixes build with Ubuntu 12.04.
-
-In file included from ppp-manager/nm-ppp-manager.c:42:0:
-/usr/include/linux/if_ppp.h:103:16: error: field 'b' has incomplete type
-/usr/include/linux/if_ppp.h:108:21: error: field 'b' has incomplete type
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- src/ppp-manager/nm-ppp-manager.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
-index e27c82b..d410ebf 100644
---- a/src/ppp-manager/nm-ppp-manager.c
-+++ b/src/ppp-manager/nm-ppp-manager.c
-@@ -39,6 +39,7 @@
- #ifndef aligned_u64
- #define aligned_u64 unsigned long long __attribute__((aligned(8)))
- #endif
-+#include <linux/if.h>
- #include <linux/if_ppp.h>
-
- #include "NetworkManagerUtils.h"
---
-2.1.4
diff --git a/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
deleted file mode 100644
index 01eefec..0000000
--- a/package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7f84150e9f6aa7e900d70178e0fc0acc6cfba651 Mon Sep 17 00:00:00 2001
-From: Lubomir Rintel <lkundrak@v3.sk>
-Date: Fri, 15 May 2015 16:38:10 +0200
-Subject: [PATCH] systemd-dhcp: fix build with Linux 3.2.0 headers
-
-Fixes build on Ubuntu 12.04.
-
-systemd/src/libsystemd-network/dhcp-network.c: In function '_bind_raw_socket':
-systemd/src/libsystemd-network/dhcp-network.c:75:17: error: 'BPF_XOR' undeclared (first use in this function)
-systemd/src/libsystemd-network/dhcp-network.c:75:17: note: each undeclared identifier is reported only once for each function it appears in
-make[4]: *** [libsystemd_nm_la-dhcp-network.lo] Error 1
-
-(cherry picked from commit 3811a68389b9277533f2eee8372927ca6238653e)
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h b/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h
-index 6d500f4..f8856a1 100644
---- a/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h
-+++ b/src/dhcp-manager/systemd-dhcp/nm-sd-adapt.h
-@@ -38,6 +38,11 @@
-
- #include "nm-logging.h"
-
-+/* Missing in Linux 3.2.0, in Ubuntu 12.04 */
-+#ifndef BPF_XOR
-+#define BPF_XOR 0xa0
-+#endif
-+
- static inline guint32
- _slog_level_to_nm (int slevel)
- {
---
-2.1.4
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index f47e053..c22fb94 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.2.sha256sum
-sha256  359385707494bedbb48cfe0992ccfbcc4ac147dae1f7a47055c71e96439508ff  NetworkManager-1.0.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.4.sha256sum
+sha256  e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500bf79aecbf54cee018c9  NetworkManager-1.0.4.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c118a92..25ad2a2 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 1.0
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
