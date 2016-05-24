From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 23:26:25 +0200
Subject: [Buildroot] [git commit] oprofile: not available on Microblaze
Message-ID: <20160524212703.9674D81F05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b71bdd68562f82db9d5515de1ca4a33789c05cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c45979c732cb610ad5d54e23dd7d4d49e519d45b marked OProfile as not
available on the Xtensa architecture, due to the lack of memory
barrier operations. This commit does the same for the Microblaze
architecture, for the same reason, which allows to fix the following
autobuilder failure:

  http://autobuild.buildroot.org/results/9a872ddc906e9d552d30762e849a1b537b4e5095/

It is worth mentioning that most likely Xtensa and Microblaze are
architectures implementing a strongly-ordered memory model, in which
case we could define the memory barriers as no-ops. But until someone
who actually cares about OProfile on Xtensa and Microblaze shows up,
it's probably better to disable the package on those architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 9cf5693..7a88e4a 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -7,7 +7,8 @@ config BR2_PACKAGE_OPROFILE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
-	depends on !BR2_xtensa
+	# no memory barrier functions
+	depends on !BR2_xtensa && !BR2_microblaze
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
 	help
@@ -28,7 +29,7 @@ config BR2_PACKAGE_OPROFILE
 
 comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
+	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa && !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 comment "oprofile needs a toolchain w/ NPTL on PPC"
