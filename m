From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 21:46:00 +0100
Subject: [Buildroot] [git commit] mplayer: disable for FLAT
Message-ID: <20161121205104.585F181D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a227cf11f4bbc4149d3f13e3f5aee59c34b9c49a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mplayer uses a homegrown configure script that calls 'gcc -v | tail -1'
to find the gcc version. However, our toolchain wrapper adds
-Wl,-elf2flt to the gcc arguments. This triggers gcc to do an actual
compile (rather than just printing version info and exiting), and that
compile fails because of the missing definition of main(). The last
line of the output is therefore:
collect2: error: ld returned 1 exit status
and configure doesn't find a version in there. It then falls back to
using the host gcc instead, which breaks things completely a bit
further down the line.

Since mplayer probably isn't very useful on noMMU architectures anyway,
just disable it completely for FLAT.

Fixes:
http://autobuild.buildroot.net/results/58cf28a3acd518633a1d8ea719bc70aefbdfb311

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 76bb6f0..8474b0e 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -6,6 +6,9 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 		|| BR2_m68k || BR2_microblaze || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
+	# configure script barfs on the -Wl,-elf2flt we add in the toolchain
+	# wrapper, so just disable completely for FLAT
+	depends on !BR2_BINFMT_FLAT
 
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
