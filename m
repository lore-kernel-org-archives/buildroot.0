From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 20:44:17 +0200
Subject: [Buildroot] eaccelerator
In-Reply-To: <CAE9DZUSLuiDgK0fPGoSE=bBQLinvDRKFLBq6ifzPxJwpMBD-zQ@mail.gmail.com>
References: <CAE9DZURE9s7eH_N2vhv1wK73Pip9wAVDmYtbU8Ynxn_3XpGpdQ@mail.gmail.com>
 <20120919221012.3646aa7b@skate>
 <CAE9DZUQFsysouX9sNvJj9qLRqJQB6-goVOSezxjNc2e7a_cG4Q@mail.gmail.com>
 <20120920111001.371f5b01@skate>
 <CAE9DZUSLuiDgK0fPGoSE=bBQLinvDRKFLBq6ifzPxJwpMBD-zQ@mail.gmail.com>
Message-ID: <20120920204417.784829de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

You should send such contributions to the Buildroot list and not just
to me. Also, your contribution should be a proper Git patch, see
http://elinux.org/Buildroot_how_to_contribute.

On Thu, 20 Sep 2012 11:34:54 -0500, Dallas Clement wrote:
> #############################################################
> #
> # eaccelerator
> #
> #############################################################
> EACCELERATOR_VERSION = 0.9.6.1
> EACCELERATOR_SITE = http://eaccelerator.net/
> EACCELERATOR_SOURCE = eaccelerator-$(EACCELERATOR_VERSION).tar.bz2
> EACCELERATOR_UNZIP = bzcat

Line useless.

> EACCELERATOR_DEPENDENCIES = php
> EACCELERATOR_DIR = $(BUILD_DIR)/eaccelerator-$(EACCELERATOR_VERSION)

Line useless.

> EACCELERATOR_CONF_OPT = --prefix=/usr --enable-eaccelerator=shared \
>   --with-php-config=$(STAGING_DIR)/usr/bin/php-config

The --prefix=/usr is useless, this is already passed by default.

> STAGING_INCLUDE_DIR = $(STAGING_DIR)/usr/include
> EACCELERATOR_CONF_ENV = CPPFLAGS="$(TARGET_CFLAGS) -DMM_SEM_IPC
> -DMM_SHM_IPC -I$(STAGING_INCLUDE_DIR)/php
> -I$(STAGING_INCLUDE_DIR)/php/main -I$(STAGING_INCLUDE_DIR)/php/Zend
> -I$(STAGING_INCLUDE_DIR)/php/TSRM"

This big sequence of -I looks strange. Doesn't the configure script
figures those one out?

> EACCELERATOR_MAKE_ENV = INSTALL_ROOT="$(TARGET_DIR)"
> 
> EACCELERATOR_CONFFILES = /etc/php/cgi-php5/ext/eaccelerator.ini

Is this used somewhere?

> 
> define PHPIZE_HOOK
> 	cd $(EACCELERATOR_DIR) && phpize
> endef

The hook should have a name starting with EACCELERATOR, to avoid
clashing with other packages.

EACCELERATOR_DIR should be replaced by $(@D).

> define FIXUP_HOOK
> 	sed -i 's/mm_shm_mmap_anon=no/mm_shm_mmap_anon=yes\n
> mm_sem_pthread=yes/' $(EACCELERATOR_DIR)/config.m4
> endef

EACCELERATOR_DIR should be replaced by $(@D). A comment is needed to
explain what you are doing.

> EACCELERATOR_PRE_CONFIGURE_HOOKS += FIXUP_HOOK
> EACCELERATOR_PRE_CONFIGURE_HOOKS += PHPIZE_HOOK

Then you could probably do both things within a single hook.

> $(eval $(autotools-package))

There is a bit of rework to do, but it is good start. Keep posting
updated versions that take into account the comments!

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
