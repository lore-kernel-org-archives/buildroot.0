From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:29:35 +0200
Subject: [Buildroot] [git commit] boot/syslinux: disable syslinux
	legacy-BIOS for broken toolchains
Message-ID: <20170704162705.77E1D803C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42638a1d124faa287bb0ae4e5a5c23df585736d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since [1] syslinux is built with the target toolchain in order to
properly build with gnu-efi package. But toolchains built with
binutils 2.26 break the syslinux legacy-BIOS build as reported at [2],
due to binutils bug #19615.

Thanks to Beno??t Allard for the investigation and the link to the
binutils bug [3].

[1] 6e432d5ecb46959f3c27dbbca48e41512bb40a70
[2] http://lists.busybox.net/pipermail/buildroot/2017-July/196253.html
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=19615

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 299a559..da03549 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -35,6 +35,7 @@ config BR2_TARGET_SYSLINUX_PXELINUX
 
 config BR2_TARGET_SYSLINUX_MBR
 	bool "install mbr"
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 	select BR2_TARGET_SYSLINUX_LEGACY_BIOS
 	help
 	  Install the legacy-BIOS 'mbr' image, to boot off a
