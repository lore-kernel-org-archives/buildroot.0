From: Marie Maurer <marie.maurer@pixida.de>
Date: Mon, 24 Aug 2020 14:06:40 +0000
Subject: [Buildroot] Problem adding a new package tpm2-tss-engine
Message-ID: <VI1PR03MB45286A4A50F37EBB0DC2E56298560@VI1PR03MB4528.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am just trying to add a package tpm2-tss-engine.

I found build instruction here:

https://github.com/tpm2-software/tpm2-tss-engine/blob/master/INSTALL.md

I can build locally. Now I wanted to add this as buildroot package.

What I have done so far:

Config.in

config BR2_PACKAGE_TPM2_TSS_ENGINE
             bool "tpm2-tss-engine"
             depends on !BR2_STATIC_LIBS # tpm2-tss
             depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
             select BR2_PACKAGE_LIBQRENCODE
             select BR2_PACKAGE_TPM2_TSS
             help
               The tpm2-tss-engine project implements a cryptographic engine
               for OpenSSL for Trusted Platform Module (TPM 2.0) using the
               tpm2-tss software stack that follows the Trusted Computing
               Groups (TCG) TPM Software Stack (TSS 2.0). It uses the
               Enhanced System API (ESAPI) interface of the TSS 2.0 for
               downwards communication.
               It supports RSA decryption and signatures as well as
               ECDSA signatures.

               https://github.com/tpm2-software/tpm2-tss-engine

comment "tpm2-tss-engine needs a toolchain w/ dynamic library"
             depends on BR2_STATIC_LIBS
             depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM

tpm2-tss-engine.hash

# Locally computed:
sha256 2c92205c9d8c8f98bb6d4c68e810552fe0a8b4df3a08991bb5dac7087df004a2  tpm2-tss-engine-1.1.0-rc1.tar.gz
sha256 67bc21a0bff2b0890307cfaa883bd3f5337f461eb6d8a612a015cea6d704e9ed  LICENSE

tpm2-tss-engine.mk

################################################################################
#
# tpm2-tss-engine
#
################################################################################

TPM2_TSS_ENGINE_VERSION = 1.1.0-rc1
TPM2_TSS_ENGINE_SITE = $(call github,tpm2-software,tpm2-tss-engine,v$(TPM2_TSS_ENGINE_VERSION))
TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
TPM2_TSS_ENGINE_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
TPM2_TSS_AUTORECONF = YES
TPM2_TSS_ENGINE_CONF_OPTS = \
             --disable-defaultflags \
             --disable-doxygen-doc \
             --disable-plymouth \
             --without-initramfstoolsdir \
             --without-mkinitcpiodir

define TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP
    cd $(@D)/ && ./bootstrap

endef

TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS += TPM2_TSS_ENGINE_PRE_CONFIGURE_BOOTSTRAP

# uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"

# do not build man pages
TPM2_TSS_ENGINE_CONF_ENV += ac_cv_path_PANDOC=''

$(eval $(autotools-package))

So far so good. It is downloading the package, calls bootstrap, which is part of the downloaded package.
Inside file bootstrap there is a call to autoreconf. The command autoreconfig is not found.

marie@2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ make
>>> tpm2-tss-engine 1.1.0-rc1 Configuring
cd /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1/ && ./bootstrap
./bootstrap: line 5: autoreconf: command not found
make: *** [package/pkg-generic.mk:239: /home/marie/buildroot-2020.08-rc1/buildroot-2020.08-rc1/output/build/tpm2-tss-engine-1.1.0-rc1/.stamp_configured] Error 127
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$<mailto:marie@2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$>

How do I solve this? Do I need some dependency that I want to used autoreconf?

Searching for autoreconf I find the following:

marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$ find . | grep autoreconf
./output/build/host-autoconf-2.69/bin/autoreconf
./output/build/host-autoconf-2.69/bin/autoreconf.in
./output/build/host-autoconf-2.69/man/autoreconf.1
./output/build/host-autoconf-2.69/man/autoreconf.x
./output/build/host-autoconf-2.69/tests/autoreconf
./output/host/bin/autoreconf
./output/host/share/man/man1/autoreconf.1
./package/dc3dd/0002-fix-autoreconf.patch
./package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch
./package/libstrophe/0001-make-autoreconfable.patch
./package/libtheora/0002-fix-autoreconf.patch
./package/popt/0002-fix-autoreconf.patch
marie at 2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$<mailto:marie@2020L009:~/buildroot-2020.08-rc1/buildroot-2020.08-rc1$>

BTW: I am using raspberrypi3_defconfig for testing my changes.

Many thanks!

Best regards,

Marie








Pixida GmbH
Ungererstr. 129
80805 M?nchen

Amtsgericht M?nchen - HRB 173520
Gesch?ftsf?hrer Johann Neubauer, Panagiota Dimou



www.pixida.de<http://www.pixida.de/>

[PIXIDA]



Unsere Datenschutzgrunds?tze<http://www.pixida.com/grundsaetze.html>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200824/c82242ae/attachment.html>
