From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Thu, 20 Sep 2012 11:37:32 -0500
Subject: [Buildroot] eaccelerator
In-Reply-To: <20120920111001.371f5b01@skate>
References: <CAE9DZURE9s7eH_N2vhv1wK73Pip9wAVDmYtbU8Ynxn_3XpGpdQ@mail.gmail.com>
 <20120919221012.3646aa7b@skate>
 <CAE9DZUQFsysouX9sNvJj9qLRqJQB6-goVOSezxjNc2e7a_cG4Q@mail.gmail.com>
 <20120920111001.371f5b01@skate>
Message-ID: <CAE9DZUQRiVFEW8Huq7qvYvvEWhzNs=QNM9LeFJpBsZasX2=s2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here it is:

Config.in
======

config BR2_PACKAGE_EACCELERATOR
        bool "eaccelerator"
	depends on BR2_PACKAGE_PHP
        help
          PHP accelerator and optimizer.

          http://eaccelerator.net/

eaccelerator.mk
============

#############################################################
#
# eaccelerator
#
#############################################################
EACCELERATOR_VERSION = 0.9.6.1
EACCELERATOR_SITE = http://eaccelerator.net/
EACCELERATOR_SOURCE = eaccelerator-$(EACCELERATOR_VERSION).tar.bz2
EACCELERATOR_UNZIP = bzcat
EACCELERATOR_DEPENDENCIES = php
EACCELERATOR_DIR = $(BUILD_DIR)/eaccelerator-$(EACCELERATOR_VERSION)
EACCELERATOR_CONF_OPT = --prefix=/usr --enable-eaccelerator=shared \
  --with-php-config=$(STAGING_DIR)/usr/bin/php-config
STAGING_INCLUDE_DIR = $(STAGING_DIR)/usr/include
EACCELERATOR_CONF_ENV = CPPFLAGS="$(TARGET_CFLAGS) -DMM_SEM_IPC
-DMM_SHM_IPC -I$(STAGING_INCLUDE_DIR)/php
-I$(STAGING_INCLUDE_DIR)/php/main -I$(STAGING_INCLUDE_DIR)/php/Zend
-I$(STAGING_INCLUDE_DIR)/php/TSRM"
EACCELERATOR_MAKE_ENV = INSTALL_ROOT="$(TARGET_DIR)"

EACCELERATOR_CONFFILES = /etc/php/cgi-php5/ext/eaccelerator.ini

define PHPIZE_HOOK
	cd $(EACCELERATOR_DIR) && phpize
endef

define FIXUP_HOOK
	sed -i 's/mm_shm_mmap_anon=no/mm_shm_mmap_anon=yes\n
mm_sem_pthread=yes/' $(EACCELERATOR_DIR)/config.m4
endef

EACCELERATOR_PRE_CONFIGURE_HOOKS += FIXUP_HOOK
EACCELERATOR_PRE_CONFIGURE_HOOKS += PHPIZE_HOOK

$(eval $(autotools-package))



On Thu, Sep 20, 2012 at 4:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Dallas Clement,
>
> On Wed, 19 Sep 2012 15:36:58 -0500, Dallas Clement wrote:
>> Thanks Thomas.  You are sure right.  I figured this out earlier today.
>>  I have a .mk file for it which I am happy to share with anyone who
>> cares.  How dost one go about sharing build recipes?  I realize this
>> one may not be one that you want to include in the general buildroot
>> distribution.
>
> Why so? Just sent a patch that adds your new package, so that we can
> include it in Buildroot.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
