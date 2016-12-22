From: James Knight <james.knight@rockwellcollins.com>
Date: Thu, 22 Dec 2016 15:02:17 -0500
Subject: [Buildroot] [PATCH 1/2] net-tools: bump version to ea3935
Message-ID: <20161222200218.15052-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following bumps the hash for net-tools package to a newer commit.
The primary reason for this bump is to fix build issues observed when
building for a Linux 4.8 target or higher. The previous version may
result in the following error message:

    In file included from .../sysroot/usr/include/linux/if_tunnel.h:6:0,
                     from iptunnel.c:34:
    .../sysroot/usr/include/linux/ip.h:85:8: error: redefinition of ?struct iphdr?
     struct iphdr {
            ^
    In file included from iptunnel.c:29:0:
    .../sysroot/usr/include/netinet/ip.h:44:8: note: originally defined here
     struct iphdr
            ^
    ...-gcc -O2 -g -Wall -fno-strict-aliasing  -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -I. -I.../build/net-tools-3f170bff115303e92319791cbd56371e33dcbf6d/include -Ilib -c ipmaddr.c
    Makefile:94: recipe for target 'iptunnel.o' failed
    make[2]: *** [iptunnel.o] Error 1

The specific commits below address the above issue:

    iptunnel: fix building w/older linux headers
        ea3935bd7c0f36c86c40e5785326698fa3336c6a
    iptunnel: drop netinet/ip.h include
        45d573a89386c934d3ebac499d00c1670437813b

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/net-tools/net-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index f0c61d5..dd9be01 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NET_TOOLS_VERSION = 3f170bff115303e92319791cbd56371e33dcbf6d
+NET_TOOLS_VERSION = ea3935bd7c0f36c86c40e5785326698fa3336c6a
 NET_TOOLS_SITE = git://git.code.sf.net/p/net-tools/code
 NET_TOOLS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 NET_TOOLS_LICENSE = GPLv2+
-- 
2.8.4.windows.1
