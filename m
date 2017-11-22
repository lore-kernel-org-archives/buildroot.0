From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 23:25:40 +0100
Subject: [Buildroot] [git commit] boost: do not allow selecting fiber module
 on mips32/mips64
Message-ID: <20171122221945.9A4057FE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=914bd57db76941f4ca7c33eb8e217f06f790a6c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fiber module uses the cpu_relax() macro, for which the MIPS
implementation uses the "pause" instruction, only available since
mips32r2 and mips64r2. In order to avoid build failures on
mips32/mips64, we disallow the selection of the fiber module for such
architecture variants.

This solution was suggested by Arnout Vandecappelle.

Fixes:

  http://autobuild.buildroot.net/results/0439790b6f472e3d4b2d5431a05aa5b408f62e56/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 8610932..8925982 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -101,6 +101,9 @@ config BR2_PACKAGE_BOOST_EXCEPTION
 config BR2_PACKAGE_BOOST_FIBER
 	bool "boost-fiber"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	# mips support uses the "pause" instruction, only available
+	# since mips32r2/mips64r2.
+	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
 	help
 	  C++11 userland threads library.
 
