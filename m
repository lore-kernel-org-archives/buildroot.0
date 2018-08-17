From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Fri, 17 Aug 2018 14:06:35 +0000
Subject: [Buildroot] Can not create driver package with local sources
Message-ID: <VI1PR0802MB22211E2F46DD87FB8C69FFF6EA3D0@VI1PR0802MB2221.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I try to create a custom package to build a linux driver which sources are stored locally, but this doesn't work, because source files are not copy to build directory.
I am using BuildRoot 2018.05.

Here is my mk file:
---
BR2_PACKAGE_SITEC_S4_LP_VERSION      = 1.0
BR2_PACKAGE_SITEC_S4_LP_SITE         = $(TOPDIR)/package/sitec-s4-lp/src
BR2_PACKAGE_SITEC_S4_LP_SITE_METHOD  = local
BR2_PACKAGE_SITEC_S4_LP_DEPENDENCIES = linux

define BR2_PACKAGE_SITEC_S4_LP_BUILD_CMDS
	#$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR)
	$(MAKE) -C '$(@D)' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)' LD='$(TARGET_LD)' modules

endef

$(eval $(kernel-module))
$(eval $(generic-package))

---

When I build my BSP, I've got
>>> sitec-s4-lp  Extracting
>>> sitec-s4-lp  Patching
>>> sitec-s4-lp  Configuring
>>> sitec-s4-lp  Building
>>> sitec-s4-lp  Building kernel module(s)
PATH="/opt/crosstools/sitec-s4/bin:/opt/crosstools/sitec-s4/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" BR_BINARIES_DIR=/home/fabrice/Projects/truckpc/buildroot-2018.05/output/images /usr/bin/make -j9 -C /home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/linux-4.1.15 HOSTCC="/usr/bin/gcc -O2 -I/opt/crosstools/sitec-s4/include -L/opt/crosstools/sitec-s4/lib -Wl,-rpath,/opt/crosstools/sitec-s4/lib" ARCH=arm INSTALL_MOD_PATH=/home/fabrice/Projects/truckpc/buildroot-2018.05/output/target CROSS_COMPILE="/opt/crosstools/sitec-s4/bin/arm-geocept-linux-gnueabihf-" DEPMOD=/opt/crosstools/sitec-s4/sbin/depmod LOADADDR="0x80008000" INSTALL_MOD_STRIP=1  PWD=/home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/sitec-s4-lp/. M=/home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/sitec-s4-lp/. modules
./scripts/Makefile.build:44: /home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/sitec-s4-lp/./Makefile: Aucun fichier ou dossier de ce type
make[3]: *** Pas de r?gle pour fabriquer la cible ? /home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/sitec-s4-lp/./Makefile ?. Arr?t.
make[2]: *** [_module_/home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/sitec-s4-lp/.] Erreur 2
make[1]: *** [/home/fabrice/Projects/truckpc/buildroot-2018.05/output/build/sitec-s4-lp/.stamp_built] Erreur 2
make: *** [_all] Erreur 2

When I copy the sources to the build directory, building driver works.

What I am doing wrong?

Thanks for any support

Best regards

Fabrice Mousset
