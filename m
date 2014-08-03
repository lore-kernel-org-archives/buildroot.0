From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Aug 2014 13:36:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltrace: Fix "unmet direct
	dependencies"
Message-ID: <1407065792-19859-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/ltrace/Config.in |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.10.4
