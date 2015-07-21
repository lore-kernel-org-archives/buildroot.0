From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 21 Jul 2015 09:49:22 +0800
Subject: [Buildroot] [PATCH 4/4] cubieboard: [PATCH] ipconfig: add
	nameserver IPs to kernel-parameter ip=
In-Reply-To: <1437443362-8025-3-git-send-email-fancp2007@gmail.com>
References: <1437443362-8025-3-git-send-email-fancp2007@gmail.com>
Message-ID: <1437443362-8025-4-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .../5e953778a2aab04929a5e7b69f53dc26e39b079e.patch | 133 +++++++++++++++++++++
 configs/cubieboard2_defconfig                      |   1 +
 configs/cubieboard_defconfig                       |   1 +
 configs/cubietruck_defconfig                       |   1 +
 4 files changed, 136 insertions(+)
 create mode 100644 board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch

diff --git a/board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch b/board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch
new file mode 100644
index 0000000..e473040
--- /dev/null
+++ b/board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch
@@ -0,0 +1,133 @@
+From 5e953778a2aab04929a5e7b69f53dc26e39b079e Mon Sep 17 00:00:00 2001
+From: Christoph Fritz <chf.fritz@googlemail.com>
+Date: Fri, 21 Sep 2012 08:31:19 +0000
+Subject: [PATCH] ipconfig: add nameserver IPs to kernel-parameter ip=
+
+On small systems (e.g. embedded ones) IP addresses are often configured
+by bootloaders and get assigned to kernel via parameter "ip=".  If set to
+"ip=dhcp", even nameserver entries from DHCP daemons are handled. These
+entries exported in /proc/net/pnp are commonly linked by /etc/resolv.conf.
+
+To configure nameservers for networks without DHCP, this patch adds option
+<dns0-ip> and <dns1-ip> to kernel-parameter 'ip='.
+
+Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
+Tested-by: Jan Weitzel <j.weitzel@phytec.de>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+---
+ Documentation/filesystems/nfs/nfsroot.txt | 10 +++++++-
+ net/ipv4/ipconfig.c                       | 39 ++++++++++++++++++++++++++++---
+ 2 files changed, 45 insertions(+), 4 deletions(-)
+
+diff --git a/Documentation/filesystems/nfs/nfsroot.txt b/Documentation/filesystems/nfs/nfsroot.txt
+index ffdd9d8..2d66ed6 100644
+--- a/Documentation/filesystems/nfs/nfsroot.txt
++++ b/Documentation/filesystems/nfs/nfsroot.txt
+@@ -78,7 +78,8 @@ nfsroot=[<server-ip>:]<root-dir>[,<nfs-options>]
+ 			flags		= hard, nointr, noposix, cto, ac
+ 
+ 
+-ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>
++ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:
++   <dns0-ip>:<dns1-ip>
+ 
+   This parameter tells the kernel how to configure IP addresses of devices
+   and also how to set up the IP routing table. It was originally called
+@@ -158,6 +159,13 @@ ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>
+ 
+                 Default: any
+ 
++  <dns0-ip>	IP address of first nameserver.
++		Value gets exported by /proc/net/pnp which is often linked
++		on embedded systems by /etc/resolv.conf.
++
++  <dns1-ip>	IP address of secound nameserver.
++		Same as above.
++
+ 
+ nfsrootdebug
+ 
+diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
+index 67e8a6b..1c0e7e0 100644
+--- a/net/ipv4/ipconfig.c
++++ b/net/ipv4/ipconfig.c
+@@ -743,14 +743,22 @@ static void __init ic_bootp_init_ext(u8 *e)
+ 
+ 
+ /*
+- *  Initialize the DHCP/BOOTP mechanism.
++ *  Predefine Nameservers
+  */
+-static inline void __init ic_bootp_init(void)
++static inline void __init ic_nameservers_predef(void)
+ {
+ 	int i;
+ 
+ 	for (i = 0; i < CONF_NAMESERVERS_MAX; i++)
+ 		ic_nameservers[i] = NONE;
++}
++
++/*
++ *  Initialize the DHCP/BOOTP mechanism.
++ */
++static inline void __init ic_bootp_init(void)
++{
++	ic_nameservers_predef();
+ 
+ 	dev_add_pack(&bootp_packet_type);
+ }
+@@ -1379,6 +1387,7 @@ static int __init ip_auto_config(void)
+ 	int retries = CONF_OPEN_RETRIES;
+ #endif
+ 	int err;
++	unsigned int i;
+ 
+ #ifdef CONFIG_PROC_FS
+ 	proc_net_fops_create(&init_net, "pnp", S_IRUGO, &pnp_seq_fops);
+@@ -1499,7 +1508,15 @@ static int __init ip_auto_config(void)
+ 		&ic_servaddr, &root_server_addr, root_server_path);
+ 	if (ic_dev_mtu)
+ 		pr_cont(", mtu=%d", ic_dev_mtu);
+-	pr_cont("\n");
++	for (i = 0; i < CONF_NAMESERVERS_MAX; i++)
++		if (ic_nameservers[i] != NONE) {
++			pr_info("     nameserver%u=%pI4",
++				i, &ic_nameservers[i]);
++			break;
++		}
++	for (i++; i < CONF_NAMESERVERS_MAX; i++)
++		if (ic_nameservers[i] != NONE)
++			pr_cont(", nameserver%u=%pI4\n", i, &ic_nameservers[i]);
+ #endif /* !SILENT */
+ 
+ 	return 0;
+@@ -1570,6 +1587,8 @@ static int __init ip_auto_config_setup(char *addrs)
+ 		return 1;
+ 	}
+ 
++	ic_nameservers_predef();
++
+ 	/* Parse string for static IP assignment.  */
+ 	ip = addrs;
+ 	while (ip && *ip) {
+@@ -1613,6 +1632,20 @@ static int __init ip_auto_config_setup(char *addrs)
+ 					ic_enable = 0;
+ 				}
+ 				break;
++			case 7:
++				if (CONF_NAMESERVERS_MAX >= 1) {
++					ic_nameservers[0] = in_aton(ip);
++					if (ic_nameservers[0] == ANY)
++						ic_nameservers[0] = NONE;
++				}
++				break;
++			case 8:
++				if (CONF_NAMESERVERS_MAX >= 2) {
++					ic_nameservers[1] = in_aton(ip);
++					if (ic_nameservers[1] == ANY)
++						ic_nameservers[1] = NONE;
++				}
++				break;
+ 			}
+ 		}
+ 		ip = cp;
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 41d5266..a2b2aef 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d47d367036be38c5180632ec8a3ad169a4593a88"
+BR2_LINUX_KERNEL_PATCH="board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/cubietech/cubieboard/sun7i-cubieboard2.config"
 BR2_PACKAGE_SUNXI_TOOLS=y
diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
index 85dc794..566f633 100644
--- a/configs/cubieboard_defconfig
+++ b/configs/cubieboard_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d47d367036be38c5180632ec8a3ad169a4593a88"
+BR2_LINUX_KERNEL_PATCH="board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/cubietech/cubieboard/sun4i-cubieboard.config"
 BR2_PACKAGE_SUNXI_TOOLS=y
diff --git a/configs/cubietruck_defconfig b/configs/cubietruck_defconfig
index 01a5fc2..419b64f 100644
--- a/configs/cubietruck_defconfig
+++ b/configs/cubietruck_defconfig
@@ -9,6 +9,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d47d367036be38c5180632ec8a3ad169a4593a88"
+BR2_LINUX_KERNEL_PATCH="board/cubietech/cubieboard/5e953778a2aab04929a5e7b69f53dc26e39b079e.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="sun7i"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/cubietech/cubieboard/sun7i-cubietruck.config"
 BR2_PACKAGE_SUNXI_TOOLS=y
-- 
2.4.6
