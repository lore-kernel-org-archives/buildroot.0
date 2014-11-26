From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Nov 2014 12:01:25 +0000
Subject: [Buildroot] [PATCH] autobuild-run: disable gdb & conntrack-tools
	for non-working toolchains
Message-ID: <1417003285-8983-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This MIPS uClibc toolchain doesn't have the needed fix in order to build
gdb and conntrack-tools packages statically for uClibc. It fails with
messages like these ones:

libdl.c:(.text+0x1840): undefined reference to `TLS_DTPREL_VALUE'
libdl.c:(.text+0x1884): undefined reference to `TLS_TPREL_VALUE'

This is due to certain missing fixes in uClibc, as built by
Crosstool-NG.

Related:
  http://lists.uclibc.org/pipermail/uclibc/2013-April/047708.html
  http://git.buildroot.net/buildroot/commit/?id=c0b4c45780e4ffe23101a407e7c4cde22e27815a

Fixes:
  http://autobuild.buildroot.net/results/77e/77e5f95ec4f0b3284eb7a48b8152690f8bf81a2a/
  http://autobuild.buildroot.net/results/977/977d901c500074a6b26f331ae43808bafab58239/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 13752f9..993c578 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -290,6 +290,14 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
+    # This MIPS uClibc toolchain fails to build the gdb package
+    if 'BR2_PACKAGE_GDB=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+        return False
+    # This MIPS uClibc toolchain fails to build the conntrack-tools package
+    if 'BR2_PACKAGE_CONNTRACK_TOOLS=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
+        return False
     # This MIPS uClibc toolchain fails to build the rt-tests package
     if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.08.tar.bz2"\n' in configlines:
-- 
1.9.0
