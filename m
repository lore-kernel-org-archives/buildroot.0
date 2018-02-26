From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:45:39 +0100
Subject: [Buildroot] [git commit] php: disable on configurations using
 BR2_BINFMT_FLAT
Message-ID: <20180226224614.23A8D882EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0eec7a4f752364b5ca2580979f28435be0a41a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_BINFMT_FLAT configurations require the use of elf2flt. However,
PHP uses -export-dynamic which breaks badly with elf2flt. Even a
simple program fails to build:

$ ./output/host/bin/arm-linux-gcc -Wl,-export-dynamic -o toto toto.c
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: section .junk LMA [0000000000000000,0000000000000027] overlaps section .text LMA [0000000000000000,0000000000006d07]

-export-dynamic is clearly not useful for FLAT configurations, which
are always statically linked, but it's quite a bit of work to change
the PHP build system to use it only conditionall.

It looks more like an interaction bug between gcc (which wants to put
the .text section at address 0x0 in its linker script) and elf2flt,
which wants to put its .junk section (containing the .rel.text stuff)
also at address 0x0.

Fixes (works around) the "section overlap" part of:

  http://autobuild.buildroot.net/results/35cbed8927bb10500ecf2816aa728ea240a0be21/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 0fb80063af..11514e04b1 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -6,6 +6,10 @@ config BR2_PACKAGE_PHP
 	       !BR2_PACKAGE_PHP_SAPI_FPM &&  \
 	       BR2_USE_MMU
 	select BR2_PACKAGE_PHP_SAPI_CLI if !BR2_USE_MMU
+	# PHP uses -export-dynamic, which breaks with elf2flt with a
+	# message like "ld.real: section .junk LMA [...,...] overlaps
+	# section .text LMA [...,...]"
+	depends on !BR2_BINFMT_FLAT
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
