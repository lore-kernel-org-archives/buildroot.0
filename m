From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:06:16 +0100
Subject: [Buildroot] [git commit] assimp: disable package with the ADI
	Blackfin toolchain
Message-ID: <20161107220619.E7ED081922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c30dd540c4a82ea527fe9f5dd94443d9dc0c4919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

assimp fails to build with an internal compiler error with the ADI
Blackfin toolchain, while it builds fine with the mainline gcc for
Blackfin. So let's disable this package (which has no reverse
dependencies that select it) for the ADI Blackfin toolchain.

Fixes:

  http://autobuild.buildroot.net/results/394e3545a7bbe5d6fbaf4c97f0a3eb51c7d57076

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/assimp/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 93020f7..8fa6429 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -4,6 +4,11 @@ config BR2_PACKAGE_ASSIMP
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124, that
 	# cause an infinite loop in gcc when building this package.
 	depends on !BR2_microblaze
+	# The ADI Blackfin toolchain does not build assimp properly,
+	# fails with "internal compiler error: in simplify_subreg, at
+	# simplify-rtx.c:5001". It builds fine with a mainline gcc for
+	# Blackfin.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	help
