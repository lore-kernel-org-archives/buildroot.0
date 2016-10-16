From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Oct 2016 15:24:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/trinity: needs headers >= 3.4
Message-ID: <20161016132411.17404-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

IPV6_UNICAST_IF was added with kernel 3.4:
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/linux/in6.h?id=refs/tags/v3.4.112

To prove this compare with kernel 3.3:
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/linux/in6.h?h=linux-3.3.y

The trinity package contains some compat code in
https://github.com/kernelslacker/trinity/blob/master/include/compat.h

but it does not trigger for IPV6_UNICAST_IF
https://github.com/kernelslacker/trinity/blob/master/include/compat.h#L662

Instead of hacking compat.h to death just depend on headers >= 3.4.

Fixes a build error
net/proto-ipv6.c: At top level:
net/proto-ipv6.c:157:12: error: ?IPV6_UNICAST_IF? undeclared here (not in a function)
  { .name = IPV6_UNICAST_IF, },

not yet caught by autobuilders using this defconfig:
http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/trinity/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 2495e5d..48fa608 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -4,7 +4,15 @@ config BR2_PACKAGE_TRINITY
 	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
 		BR2_powerpc64le || BR2_sparc || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # IPV6_UNICAST_IF
 	help
 	  A Linux System call fuzz tester
 
 	  http://codemonkey.org.uk/projects/trinity/
+
+comment "trinity needs a toolchain w/ headers >= 3.4"
+	depends on BR2_USE_MMU
+	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
+		BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sparc || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-- 
2.9.3
