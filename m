From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:03 +0200
Subject: [Buildroot] [PATCH 29/49] grub2: only available on x86 and PowerPC
	and mark as BROKEN
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <38a88b691834eece3fc9c0719d08b4f41ab2c474.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
