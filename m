From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:11:45 +0200
Subject: [Buildroot] [git commit] package/trinity: needs headers >= 3.4
Message-ID: <20161022141233.8794F7F9DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=637c1372bb9b5d7874cb2b365547ab12dbf0ad9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
net/proto-ipv6.c:157:12: error: ???IPV6_UNICAST_IF??? undeclared here (not in a function)
  { .name = IPV6_UNICAST_IF, },

not yet caught by autobuilders using this defconfig:
http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 4a31ba0..35b54d8 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -10,11 +10,13 @@ config BR2_PACKAGE_TRINITY
 	bool "trinity"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # FTW_ACTIONRETVAL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # IPV6_UNICAST_IF
 	help
 	  A Linux System call fuzz tester
 
 	  http://codemonkey.org.uk/projects/trinity/
 
-comment "trinity needs a uClibc or glibc toolchain"
+comment "trinity needs a uClibc or glibc toolchain w/ headers >= 3.4"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
