From: =?utf-8?Q?=C3=89meric?= Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 3 Apr 2014 11:32:14 -0400 (EDT)
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <1080754998.70934.1396536817436.JavaMail.root@mail>
Message-ID: <504826970.101021.1396539134908.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Builders,

I am facing two basic issues after adding a new library to buildroot:

1. "make" does not build it
---------------------------
What I did can be summed up in these files:

  $ grep company package/Config.in 
  source "package/company/Config.in"

  $ cat package/company/libfpga/Config.in 
  config BR2_PACKAGE_COMPANY_LIBFPGA
	bool "libfpga"
	select BR2_TOOLCHAIN_USES_GLIBC
	help
	  library providing access to FPGA functions

  $ cat package/company/company.mk 
  include $(sort $(wildcard package/company/*/*.mk))

  $ cat package/company/libfpga/libfpga.mk
  ################################################################################
  #
  # libfpga
  #
  ################################################################################

  LIBFPGA_VERSION = 1.0
  LIBFPGA_SOURCE = libfpga-$(LIBFPGA_VERSION).tar.gz
  LIBFPGA_SITE = $(TOPDIR)/../libfpga/
  LIBFPGA_SITE_METHOD = local

  LIBFPGA_INSTALL_STAGING = YES
  # defaults to YES
  LIBFPGA_INSTALL_TARGET = YES
  LIBFPGA_DEPENDENCIES = glibc
  #LIBFPGA_CONFIG_SCRIPTS = 

  define LIBFPGA_BUILD_CMDS
      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
  endef
  $(eval $(generic-package))

  $ grep COMPANY .config
  BR2_PACKAGE_COMPANY=y
  BR2_PACKAGE_COMPANY_LIBFPGA=y

  $ make
  (no luck)

Does anyone see what I am missing here?


2. AR cross-prefix is not passed by buildroot to make
-----------------------------------------------------
I can build my package manually though:

  $ make libfpga
>>> libfpga 1.0 Syncing from source dir /home/evigier/buildroot-2013.11/../libfpga/
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS /home/evigier/buildroot-2013.11/../libfpga// /home/evigier/buildroot-2013.11/output/build/libfpga-1.0
>>> libfpga 1.0 Configuring
>>> libfpga 1.0 Building
/usr/bin/make -j5 CC="/home/evigier/buildroot-2013.11/output/host/usr/bin/powerpc-buildroot-linux-gnu-gcc" LD="/home/evigier/buildroot-2013.11/output/host/usr/bin/powerpc-buildroot-linux-gnu-ld" -C /home/evigier/buildroot-2013.11/output/build/libfpga-1.0 all
make[1]: Entering directory `/home/evigier/buildroot-2013.11/output/build/libfpga-1.0'
ar rcs libfpga.a fpga.o
/home/evigier/buildroot-2013.11/output/host/usr/bin/powerpc-buildroot-linux-gnu-gcc -shared -o libfpga.so fpga.o
make[1]: Leaving directory `/home/evigier/buildroot-2013.11/output/build/libfpga-1.0'

Why is AR prefix not passed to make here? Is this related to the generic-package?

Thanks,
Emeric
