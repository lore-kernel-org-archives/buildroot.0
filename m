From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2020 08:02:24 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/systemd: Backport
 fix for network-generator
Message-ID: <20200909055709.9A27E7FA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb81345aa9b05409e9070b93217abf427c21fc94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The systemd-network-generator.service will fail to parse the bootarg "ip=xxx"
if it's missing the (optional) hostname field. Backport this fix from
systemd v245.

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...03-network-generator-allow-empty-hostname.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/systemd/0003-network-generator-allow-empty-hostname.patch b/package/systemd/0003-network-generator-allow-empty-hostname.patch
new file mode 100644
index 0000000000..8d1f3aa86f
--- /dev/null
+++ b/package/systemd/0003-network-generator-allow-empty-hostname.patch
@@ -0,0 +1,44 @@
+From 21a925a4ac7955e7d7e6cfd477e96d3a2aaee7db Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 12 Dec 2019 19:01:21 +0900
+Subject: [PATCH 1/1] network-generator: allow empty hostname
+
+Fixes #14319.
+
+[Brandon: backport from https://github.com/systemd/systemd/commit/21a925a4ac7955e7d7e6cfd477e96d3a2aaee7db]
+Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
+---
+ src/network/generator/network-generator.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
+index 81afa95307..bed1e42697 100644
+--- a/src/network/generator/network-generator.c
++++ b/src/network/generator/network-generator.c
+@@ -574,7 +574,7 @@ static int parse_netmask_or_prefixlen(int family, const char **value, unsigned c
+ 
+ static int parse_cmdline_ip_address(Context *context, int family, const char *value) {
+         union in_addr_union addr = {}, peer = {}, gateway = {};
+-        const char *hostname, *ifname, *dhcp_type, *dns, *p;
++        const char *hostname = NULL, *ifname, *dhcp_type, *dns, *p;
+         unsigned char prefixlen;
+         int r;
+ 
+@@ -599,9 +599,11 @@ static int parse_cmdline_ip_address(Context *context, int family, const char *va
+         if (!p)
+                 return -EINVAL;
+ 
+-        hostname = strndupa(value, p - value);
+-        if (!hostname_is_valid(hostname, false))
+-                return -EINVAL;
++        if (p != value) {
++                hostname = strndupa(value, p - value);
++                if (!hostname_is_valid(hostname, false))
++                        return -EINVAL;
++        }
+ 
+         value = p + 1;
+ 
+-- 
+2.23.0
+
