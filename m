From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Fri, 7 Apr 2017 09:54:46 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <20170406185739.3caf46f6@free-electrons.com>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
 <CAOf5uwkL9FX3Fq2Dou1jnixat2CWxtWSbXG+Q=RQ=y3pSyjRzA@mail.gmail.com>
 <20170406183218.66cab07e@free-electrons.com>
 <20170406185739.3caf46f6@free-electrons.com>
Message-ID: <20170407075444.GA12962@panicking>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

On Thu, Apr 06, 2017 at 06:57:39PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Adding Matthias in Cc here.
> 
> On Thu, 6 Apr 2017 18:32:18 +0200, Thomas Petazzoni wrote:
> 
> > On Thu, 6 Apr 2017 18:12:15 +0200, Michael Nazzareno Trimarchi wrote:
> > 
> > > '/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593'
> > >   DTC     arch/arm/boot/dts/am335x-bone.dtb
> > >   DTC     arch/arm/boot/dts/am335x-evm.dtb
> > > make[2]: *** No rule to make target
> > > 'arch/arm/boot/dts/am335x-bonegreen.dtb'.  Stop.
> > > arch/arm/Makefile:314: recipe for target 'am335x-bonegreen.dtb' failed  
> > 
> > This is caused by the recent commit
> > https://git.buildroot.org/buildroot/commit/configs?id=4b2440b7dcc68369548c0f2be6984fe645fc6bb0
> > from Matthias Fritzsche. Matthias, are you sure you tested the
> > beaglebone_qt5_defconfig ?
> > 

Those are my changes

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index cfc1039ec..ba60297dd 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -9,7 +9,6 @@ image boot.vfat {
 			"am335x-evmsk.dtb",
 			"am335x-bone.dtb",
 			"am335x-boneblack.dtb",
-			"am335x-bonegreen.dtb",
 		}
 	}
 	size = 16M
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1d464d967..edfc27fa7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -195,8 +195,9 @@ endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 define UBOOT_BUILD_CMDS
-	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
-		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
+	UBOOT_CUSTOM_DTS_PATH=$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
+	$(if $(UBOOT_CUSTOM_DTS_PATH),
+		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 78dc10973..cdf8b96c1 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -26,6 +26,7 @@ BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
index 853322cab..5e0fbe23c 100644
--- a/package/qt5/qt5declarative/Config.in
+++ b/package/qt5/qt5declarative/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5XMLPATTERNS
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5BASE_EXAMPLES
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	help
 	  Qt is a cross-platform application and UI framework for
> > Indeed, beaglebone_defconfig and beaglebone_qt5_defconfig don't use the
> > same kernel version, and the one used in beaglebone_qt5_defconfig
> > doesn't have the Beagle Bone Green Device Tree.
> > 
> > So either we should revert Matthias patch on beaglebone_qt5_defconfig,
> > or someone tests upgrading beaglebone_qt5_defconfig to the same kernel
> > version as the one used in beaglebone_defconfig.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
