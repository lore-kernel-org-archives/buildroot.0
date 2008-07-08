From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 17:31:44 +0200
Subject: [Buildroot] [buildroot 0004004]: Default ngw100-base config
 fails to find u-boot config
In-Reply-To: <490107ef7cc12284af8e165a0c530aae@bugs.uclibc.org>
References: <490107ef7cc12284af8e165a0c530aae@bugs.uclibc.org>
Message-ID: <48738860.9000606@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

bugs at busybox.net skrev:
> The following issue has been SUBMITTED. 
> ====================================================================== 
> http://busybox.net/bugs/view.php?id=4004 
> ====================================================================== 
> Reported By:                mpfj
> Assigned To:                buildroot
> ====================================================================== 
> Project:                    buildroot
> Issue ID:                   4004
> Category:                   Architecture Specific
> Reproducibility:            always
> Severity:                   major
> Priority:                   normal
> Status:                     assigned
> ====================================================================== 
> Date Submitted:             07-08-2008 03:45 PDT
> Last Modified:              07-08-2008 03:45 PDT
> ====================================================================== 
> Summary:                    Default ngw100-base config fails to find u-boot
> config
> Description: 
> Adding u-boot to the default ngw100-base config does not work.  The
> following error occurs ...
> 
> 		/usr/bin/make MAKE='/usr/bin/make -j1 ' -C
> /usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3	\
> 		"atngw100-base"_config
> make[1]: Entering directory
> `/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3'
> make[1]: *** No rule to make target `atngw100-base_config'. Stop.
> make[1]: Leaving directory
> `/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3'
> make: ***
> [/usr/local/dev/avr32/buildroot-cvs/project_build_avr32/atngw100-base/u-boot-1.3.3/.configured]
> Error 2
> 
> This can be temp fixed by changing the u-boot board name from $BOARD_NAME
> to atngw100.

I think the real problem is that the gcc-3.mk file is used instead
of gcc-4.mk.

This should fix the problem:

Index: toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
- --- toolchain/gcc/gcc-uclibc-3.x.mk	(revision 22686)
+++ toolchain/gcc/gcc-uclibc-3.x.mk	(arbetskopia)
@@ -36,7 +36,7 @@
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
- -GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
+GCC_PATCH_DIR:=toolchain/gcc/ext_source/$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
 endif

 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2



The names gcc-uclibc-3.x.mk and gcc-uclibc-4.x.mk are really
misleading since the first will be used if sysroot is not enabled
and the second will be used if sysroot is enabled.
It would probably be better to name them

gcc-without-sysroot.mk and gcc-with-sysroot.mk



> ====================================================================== 
> 
> Issue History 
> Date Modified   Username       Field                    Change               
> ====================================================================== 
> 07-08-08 03:45  mpfj           New Issue                                    
> 07-08-08 03:45  mpfj           Status                   new => assigned     
> 07-08-08 03:45  mpfj           Assigned To               => buildroot       
> ======================================================================
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIc4hgAyRRH5cXxqwRAsudAJ0XpoyfcHvD+CvvsoW3QHme/0PeYQCgg3KM
/eFrrb4R80Hk36uBOxSdJAA=
=1CAx
-----END PGP SIGNATURE-----
