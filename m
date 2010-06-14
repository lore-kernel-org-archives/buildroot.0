From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] grub2: only available on x86
	and PowerPC and mark as BROKEN
Message-ID: <20100614203440.460A8804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=38a88b691834eece3fc9c0719d08b4f41ab2c474
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build process of grub2 breaks the compilation. It breaks with:

./configure: line 4766: syntax error near unexpected token `external'
./configure: line 4766: `AM_GNU_GETTEXT(external)'

In addition to this, it later requires Ruby. Do we really want to make
Buildroot depend on Ruby being installed on the host ? Do we really
want to build our own Ruby ? Do we even care about Grub2 ?

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index d27cb4c..1301b5b 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -1,4 +1,9 @@
 config BR2_TARGET_GRUB2
 	bool "grub2"
+	# Only supports PC, Mac (Power, x86 and x86-64), Pegasos
+	depends on BR2_i386 || BR2_powerpc
+	# Build process is broken (./configure doesn't work, Ruby
+	# required, etc.)
+	depends on BROKEN
 	help
 	  The GRand Unified Bootloader for x86 systems, take #2.
-- 
1.7.1
