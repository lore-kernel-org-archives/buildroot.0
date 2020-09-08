From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 22:31:51 +0200
Subject: [Buildroot] [git commit] package/kbd: needs gcc 4.9
Message-ID: <20200908202358.72C8A88932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffba905653b306d7f143e24c2e6eb4a6d6d69a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kbd uses _Generic since version 2.2.90 and
https://github.com/legionus/kbd/commit/da5feb8fd90c3a0df9d505d4604c629d051d3d7d

However, _Generic is not available until gcc 4.9:
https://gcc.gnu.org/wiki/C11Status

As a result, build with gcc 4.8 fails on:

setleds.c:352:3: warning: implicit declaration of function '_Generic' [-Wimplicit-function-declaration]
   ndefflags = BITMASK_SET(BITMASK_UNSET(odefflags, ndef), nval);
   ^
setleds.c:22:2: error: expected expression before 'unsigned'
  unsigned char: (unsigned char)(~(x)) \
  ^

Fixes:
 - http://autobuild.buildroot.org/results/b74ecdda44543da1d47fa2c027fb046a3ca1e2d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: propagate the MMU dependency to the comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kbd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kbd/Config.in b/package/kbd/Config.in
index 6cf2fc0dc6..27cadf1af2 100644
--- a/package/kbd/Config.in
+++ b/package/kbd/Config.in
@@ -2,7 +2,12 @@ config BR2_PACKAGE_KBD
 	bool "kbd"
 	# Uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Generic
 	help
 	  Keytable files and keyboard utilities.
 
 	  http://kernel.org/pub/linux/utils/kbd/
+
+comment "kbd needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
