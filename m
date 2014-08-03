From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 14:37:04 +0200
Subject: [Buildroot] [git commit] package/ltrace: Fix "unmet direct
	dependencies"
Message-ID: <20140803123718.3A7429D365@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a68777b66f0d883f9c498d52a34734de654051e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build error in elfutils
http://autobuild.buildroot.net/results/37f/37f87ad7ba087d42d0001f55305f7468c2a172b6/

eblwstrtab.c:(.text+0x43): undefined reference to `wmempcpy'
eblwstrtab.c:(.text+0x1ba): undefined reference to `wcslen'
eblwstrtab.c:(.text+0x2df): undefined reference to `wmemcmp'

because ltrace did not take into account that elfutils depends on
BR2_LARGEFILE & BR2_USE_WCHAR. This is also visible here:

wget http://autobuild.buildroot.net/results/37f/37f87ad7ba087d42d0001f55305f7468c2a172b6/defconfig
make defconfig BR2_DEFCONFIG=defconfig

warning: (BR2_PACKAGE_LTRACE) selects BR2_PACKAGE_ELFUTILS which has unmet direct
dependencies (BR2_LARGEFILE && BR2_USE_WCHAR && !BR2_avr32 && !BR2_bfin)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index aee14bd..4389210 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LTRACE
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 	select BR2_PACKAGE_LIBELF
 	select BR2_PACKAGE_ELFUTILS
+	depends on BR2_LARGEFILE # elfutils
+	depends on BR2_USE_WCHAR # elfutils
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
