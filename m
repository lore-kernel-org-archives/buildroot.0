From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Jun 2014 23:16:56 +0200
Subject: [Buildroot] [PATCH 1/1] Adding pifmrds package
In-Reply-To: <1403210695-7526-1-git-send-email-limpens@gmail.com>
References: <1403210695-7526-1-git-send-email-limpens@gmail.com>
Message-ID: <20140619211656.GD3534@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

On 2014-06-19 22:44 +0200, Eric Limpens spake thusly:
> Signed-off-by: Eric Limpens <limpens@gmail.com>
[--SNIP--]
> diff --git a/package/pifmrds/Config.in b/package/pifmrds/Config.in
> new file mode 100644
> index 0000000..4667977
> --- /dev/null
> +++ b/package/pifmrds/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PIFMRDS
> +	bool "pifmrds"
> +	depends on BR2_arm
> +	depends on BR2_PACKAGE_LIBSNDFILE
> +	help
> +	pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM

The format for help text is: one tab, two spaces, the help text.

Also, it is customary to include the upstream location for the package.
If there is no 'homepage', then pointing to the git repo is OK.

> +
> +	comment "pifmrds requires libsndfile"

This 'comment' should not be indented.

> +	depends on !BR2_PACKAGE_LIBSNDFILE

We usally do not 'depends on' libraries, we 'select' them. If the
selected library has dependencies, we inherit the dependencies from that
library. So, you'd get something like:
    config BR2_PACKAGE_PIFMRDS
        bool "pifmrds"
        depends on BR2_arm
        depends on BR2_LARGEFILE # libsndfile
        select BR2_PACKAGE_LIBSNDFILE
        help
          FM-RDS transmitter using the Raspberry Pi's PWM.

          https://github.com/ChristopheJacquet/PiFmRds

> diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
> new file mode 100644
> index 0000000..5a91089
> --- /dev/null
> +++ b/package/pifmrds/pifmrds.mk
> @@ -0,0 +1,18 @@
> +PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
> +PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
> +PIFMRDS_INSTALL_TARGET = YES
> +PIFMRDS_AUTORECONF = YES
> +PIFMRDS_DEPENDENCIES += libsndfile
> +
> +define PIFMRDS_BUILD_CMDS
> +	$(MAKE) -C $(@D)/src CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -c"

(see below) Also pass $(TARGET_LDFLAGS).

> +endef
> + 
> +define PIFMRDS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/pi_fm_rds $(TARGET_DIR)/usr/bin/pi_fm_rds
> +	$(INSTALL) -D -m 0755 $(@D)/src/rds_wav $(TARGET_DIR)/usr/bin/rds_wav
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/pifmrds/
> +	$(INSTALL) -D -m 0644 $(@D)/src/*.wav	$(TARGET_DIR)/usr/share/pifmrds/

Are the .wav files really necessary, or are they not just for testing
purposes? If only for testing, do not install them; let the user provide
his own collection of files to play.

> +endef
> + 
> +$(eval $(generic-package))
> diff --git a/package/pifmrds/pifmrds.patch b/package/pifmrds/pifmrds.patch
> new file mode 100644
> index 0000000..8b8cd49
> --- /dev/null
> +++ b/package/pifmrds/pifmrds.patch

Patches should be named package-number-title.patch, so something like:
    pifmrds-0000-Makefile-make-it-cross-compile-friendly.patch

Also, patches should contain a standard commit log, something like:

    Makefile: make it cross-compile friendly

    The current Makefile makes heavy assumption that it is natively
    compiled on the RPi.

    Fix that so it plays nicely in Buildroot.

    Signed-off-by: You <you@there>

> @@ -0,0 +1,25 @@
> +diff -purN PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
> +--- PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-05-04 18:21:40.000000000 +0200
> ++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-19 21:21:14.220328601 +0200
> +@@ -1,20 +1,8 @@
> +-CC = gcc
> +-STD_CFLAGS = -Wall -std=gnu99 -c -g -O3
> +-
> +-# Enable ARM-specific options only on ARM, and compilation of the app only on ARM
> +-UNAME := $(shell uname -m)
> +-
> +-ifeq ($(UNAME), armv6l)
> +-	CFLAGS = $(STD_CFLAGS) -march=armv6 -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -ffast-math
> ++all:	app rds_wav
> + 
> + app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
> + 	$(CC) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile

You may want to pass the $(LDFLAGS) here:

    $(CC) $(LDFLAGS) -o [.....]

and pass LDFLAGS the same way you pass CFLAGS, in the .mk file.

Regards,
Yann E. MORIN.

> + 
> +-else
> +-	CFLAGS = $(STD_CFLAGS)
> +-endif
> +-
> +-
> + rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
> + 	$(CC) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
> + 
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
