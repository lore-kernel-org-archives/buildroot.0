From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 21 Apr 2016 12:05:21 +0100
Subject: [Buildroot] [PATCH] network-manager: bump version to 1.2.0
Message-ID: <1461236721-60129-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And rebase 0001 patch on top of 1.2.0, otherwise it will fail to apply.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ..._user_ipv6ll_enabled-to-nm-platform-linux.patch | 93 +++++++++++-----------
 package/network-manager/network-manager.hash       |  4 +-
 package/network-manager/network-manager.mk         |  7 +-
 3 files changed, 53 insertions(+), 51 deletions(-)

diff --git a/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch b/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
index 4aebaef..be2fb0a 100644
--- a/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
+++ b/package/network-manager/0001-platform-move-link_get_user_ipv6ll_enabled-to-nm-platform-linux.patch
@@ -5,83 +5,86 @@ Source: https://mail.gnome.org/archives/networkmanager-list/2015-July/msg00028.h
 
 This fixes build error kernels headers < 3.17.
 
+[Vincent: rebase on top of 1.2.0]
+
 Reported-by: Petr Vorel <petr.vorel@gmail.com>
 Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
 Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
  src/platform/nm-linux-platform.c | 16 ++++++++++++++++
- src/platform/nm-platform.c       | 11 ++---------
+ src/platform/nm-platform.c       |  7 ++-----
  src/platform/nm-platform.h       |  1 +
- 3 files changed, 19 insertions(+), 9 deletions(-)
+ 3 files changed, 19 insertions(+), 5 deletions(-)
 
 diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
-index f3a9254..b6b8e33 100644
+index 254f9c8..3860983 100644
 --- a/src/platform/nm-linux-platform.c
 +++ b/src/platform/nm-linux-platform.c
-@@ -2987,6 +2987,21 @@ link_set_user_ipv6ll_enabled (NMPlatform *platform, int ifindex, gboolean enable
+@@ -4285,6 +4285,21 @@ link_set_user_ipv6ll_enabled (NMPlatform *platform, int ifindex, gboolean enable
  }
-
+ 
  static gboolean
 +link_get_user_ipv6ll_enabled (NMPlatform *platform, int ifindex)
 +{
 +#if HAVE_LIBNL_INET6_ADDR_GEN_MODE
-+       {
-+               const NMPlatformLink *pllink;
++	{
++	const NMPlatformLink *pllink;
 +
-+               pllink = nm_platform_link_get (platform, ifindex);
-+               if (pllink && pllink->inet6_addr_gen_mode_inv)
-+                       return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
-+       }
++	pllink = nm_platform_link_get (platform, ifindex);
++	if (pllink && pllink->inet6_addr_gen_mode_inv)
++	return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
++	}
 +#endif
-+       return FALSE;
++	return FALSE;
 +}
 +
 +static gboolean
  link_supports_carrier_detect (NMPlatform *platform, int ifindex)
  {
-        const char *name = nm_platform_link_get_name (platform, ifindex);
-@@ -4968,6 +4968,7 @@
-	platform_class->link_get_udev_device = link_get_udev_device;
-
-	platform_class->link_set_user_ipv6ll_enabled = link_set_user_ipv6ll_enabled;
+ 	nm_auto_pop_netns NMPNetns *netns = NULL;
+@@ -6380,6 +6395,7 @@ nm_linux_platform_class_init (NMLinuxPlatformClass *klass)
+ 	platform_class->link_get_udev_device = link_get_udev_device;
+ 
+ 	platform_class->link_set_user_ipv6ll_enabled = link_set_user_ipv6ll_enabled;
 +	platform_class->link_get_user_ipv6ll_enabled = link_get_user_ipv6ll_enabled;
-
-	platform_class->link_set_address = link_set_address;
-	platform_class->link_get_permanent_address = link_get_permanent_address;
-
+ 
+ 	platform_class->link_set_address = link_set_address;
+ 	platform_class->link_get_permanent_address = link_get_permanent_address;
 diff --git a/src/platform/nm-platform.c b/src/platform/nm-platform.c
-index 8803377..ee4b1a1 100644
+index 26ac766..5d76f0a 100644
 --- a/src/platform/nm-platform.c
 +++ b/src/platform/nm-platform.c
-@@ -965,15 +965,8 @@
-
-	g_return_val_if_fail (ifindex >= 0, FALSE);
-
--#if HAVE_LIBNL_INET6_ADDR_GEN_MODE
--	{
--		const NMPlatformLink *pllink;
+@@ -956,15 +956,12 @@ nm_platform_link_get_udev_device (NMPlatform *self, int ifindex)
+ gboolean
+ nm_platform_link_get_user_ipv6ll_enabled (NMPlatform *self, int ifindex)
+ {
+-	const NMPlatformLink *pllink;
 -
--		pllink = nm_platform_link_get (self, ifindex);
--		if (pllink && pllink->inet6_addr_gen_mode_inv)
--			return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == IN6_ADDR_GEN_MODE_NONE;
--	}
--#endif
+ 	_CHECK_SELF (self, klass, FALSE);
+ 
+ 	g_return_val_if_fail (ifindex >= 0, FALSE);
+ 
+-	pllink = nm_platform_link_get (self, ifindex);
+-	if (pllink && pllink->inet6_addr_gen_mode_inv)
+-		return _nm_platform_uint8_inv (pllink->inet6_addr_gen_mode_inv) == NM_IN6_ADDR_GEN_MODE_NONE;
 +	if (klass->link_get_user_ipv6ll_enabled)
 +		return klass->link_get_user_ipv6ll_enabled (self, ifindex);
-	return FALSE;
+ 	return FALSE;
  }
-
+ 
 diff --git a/src/platform/nm-platform.h b/src/platform/nm-platform.h
-index 16eb351..9ef4080 100644
+index 658b709..4cd6d4d 100644
 --- a/src/platform/nm-platform.h
 +++ b/src/platform/nm-platform.h
-@@ -446,6 +446,7 @@
-	GObject *(*link_get_udev_device) (NMPlatform *self, int ifindex);
-
-	gboolean (*link_set_user_ipv6ll_enabled) (NMPlatform *, int ifindex, gboolean enabled);
+@@ -507,6 +507,7 @@ typedef struct {
+ 	GObject *(*link_get_udev_device) (NMPlatform *self, int ifindex);
+ 
+ 	gboolean (*link_set_user_ipv6ll_enabled) (NMPlatform *, int ifindex, gboolean enabled);
 +	gboolean (*link_get_user_ipv6ll_enabled) (NMPlatform *, int ifindex);
+ 
+ 	gboolean (*link_get_permanent_address) (NMPlatform *,
+ 	                                        int ifindex,
+-- 
+2.7.3
 
-	gboolean (*link_get_permanent_address) (NMPlatform *,
-	                                        int ifindex,
---
-2.4.3
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index ab601bc..45cf150 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.12.sha256sum
-sha256 3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e  NetworkManager-1.0.12.tar.xz
+# From http://download.gnome.org/sources/NetworkManager/1.2/NetworkManager-1.2.0.sha256sum
+sha256 e947cf30fa3d19dce88e6f6af51f06dc282b7db7996f946aaa37b03526ef2a80  NetworkManager-1.2.0.tar.xz
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 12b8f3c..bf9765b 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.0
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
+NETWORK_MANAGER_VERSION_MAJOR = 1.2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
-NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
+NETWORK_MANAGER_SITE = http://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
@@ -22,7 +22,6 @@ NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_file__etc_redhat_release=no \
 	ac_cv_file__etc_SuSE_release=no
 
-
 NETWORK_MANAGER_CONF_OPTS = \
 	--mandir=$(STAGING_DIR)/usr/man/ \
 	--disable-tests \
-- 
2.7.3
