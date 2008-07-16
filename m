From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 16 Jul 2008 09:30:07 +0200
Subject: [Buildroot] alsa unknown ioctl
In-Reply-To: <408540dd0807141520m5f4886f8tcde913bba1232afe@mail.gmail.com>
References: <408540dd0807132122y2c49881dy964c9caf9732622f@mail.gmail.com>	<487B0F51.7090702@promwad.com>
	<408540dd0807141520m5f4886f8tcde913bba1232afe@mail.gmail.com>
Message-ID: <487DA37F.8070205@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthew Dombroski skrev:
| Hi,
| Thanks for pointing this out for me, the interesting thing now is that
| i had to *disable* the -mabi=aapcs-linux option and everything started
| working.
| Maybe there is a way we can detect that the kernel has been built with
| this option, blindly assuming that it's needed for arm doesn't seem to
| be working.
|
| ~Matt
|
| On Mon, Jul 14, 2008 at 8:33 PM, Ivan Kuten <ivan.kuten@promwad.com>
wrote:
|> Hello,
|>
|>> ALSA sound/core/control.c:1224: unknown ioctl = 0xc2c85512
|>>
|>> alsamixer: function snd_mixer_load failed: Inappropriate ioctl for
device.
|>
|> Try to check this previous buildroot thread:
|> http://busybox.net/lists/buildroot/2007-November/006326.html
|>

This is from arch/arm/Makefile of linux-2.6.25.10:

ifeq ($(CONFIG_AEABI),y)
CFLAGS_ABI	:=-mabi=aapcs-linux -mno-thumb-interwork
else
CFLAGS_ABI	:=$(call cc-option,-mapcs-32,-mabi=apcs-gnu) $(call
cc-option,-mno-thumb-interwork,)
endif

so -mabi=aapcs-linux should only be enabled if the toolchain is using EABI.


alsa-lib.mk:

ifeq ($(BR2_arm),y)
ALSA_LIB_ABI:=-mabi=aapcs-linux
else
ALSA_LIB_ABI:=
endif

should probably be replaced with:

ifeq ($(BR2_ARM_EABI),y)
ALSA_LIB_ABI:=-mabi=aapcs-linux
else
ALSA_LIB_ABI:=
endif

BR
Ulf Samuelsson

|>
|> BR,
|> Ivan
|>
|>
| _______________________________________________
| buildroot mailing list
| buildroot at uclibc.org
| http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIfaN/AyRRH5cXxqwRAoRCAJ9l1GKa5gfVryoTIg+r9SUc0eSgswCfaXb2
8GqFhVDnFyVt4NEuXteQhe4=
=kOrL
-----END PGP SIGNATURE-----
