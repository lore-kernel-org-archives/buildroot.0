From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 23:38:37 +0200
Subject: [Buildroot] [git commit] package/hostapd: enable Linux ioctls for
 VLANs
Message-ID: <20191011213647.168208D4D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=319ff11ddabd0bf1ba2727f11dea900457eb9712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hostapd v2.9 follows the approach taken by bridge-utils and attempts
to use new bridge ioctls whenever possible. New bridge calls are
enabled in hostapd build using NEED_LINUX_IOCTL configuration option.
That switch is enabled for all the practical configurations excluding
wired driver. However it is required to support dynamic VLANs in
any configuration.

Enable NEED_LINUX_IOCTL hostapd configuration option whenever
dynamic VLANs support is requested in buildroot.

Fixes:
http://autobuild.buildroot.net/results/71a/71aa92578622a266b4bed92b66a65438bc32cbd6

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
