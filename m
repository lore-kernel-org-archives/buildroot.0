From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 28 Sep 2019 20:36:30 +0300
Subject: [Buildroot] [PATCH 1/3] package/hostapd: enable Linux ioctls for
 VLANs
In-Reply-To: <20190928173632.21119-1-geomatsi@gmail.com>
References: <20190928173632.21119-1-geomatsi@gmail.com>
Message-ID: <20190928173632.21119-2-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hostapd v2.9 follows the approach taken by bridge-utils and attempts
to use new bridge ioctls whenever possible. New bridge calls are
enabled in hostapd build using NEED_LINUX_IOCTL configuration option.
That switch is enabled for all the practical configurations excluding
wired driver. However it is required to support dynamic VLANs in
any configuration.

Enable NEED_LINUX_IOCTL hostapd configuration option whenever
dynamic VLANs support is requested in buildroot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 package/hostapd/hostapd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 4a493cb9b2..0e5e5b2962 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -96,6 +96,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
+HOSTAPD_CONFIG_SET += NEED_LINUX_IOCTL
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
-- 
2.23.0
