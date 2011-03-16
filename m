From: =?ISO-8859-1?Q?P=E4r_Degerman?= <par@degerman.org>
Date: Wed, 16 Mar 2011 15:36:52 +0100
Subject: [Buildroot] Adding owfs to buildroot fails with "cannot find
	/lib//libc.so.0"
Message-ID: <AANLkTikv8x-OmUoOvhJF-3Ly-fV6oLRzSKYY1ZP8s3R5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to add owfs to buildroot, but I'm having problems with the
compile. I have added a new package named owfs with files below. I
also added owfs to package/Config.in.

When I try to compile it fails with the error message:
/usr/bin/ld: cannot find /lib//libc.so.0
collect2: ld returned 1 exit status

As you can see in the files below I have tried disabling most of owfs
and adding linker environment variables.

Does anyone have any pointers on what the problem can be?

Regards
Par Degerman

### Begin owfs/Config.in ###

config BR2_PACKAGE_OWFS
        bool "owfs"
        select BR2_PACKAGE_LIBFUSE
        help
          OWFS is an easy way to use the powerful 1-wire system of
          Dallas/Maxim.

          http://owfs.org/

### End owfs/Config.in ###


### Begin owfs/owfs.mk ###

###############################################################################
#
# owfs
#
###############################################################################
OWFS_VERSION = 2.8p7
OWFS_SOURCE = owfs-$(OWFS_VERSION).tar.gz
OWFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/owfs
OWFS_INSTALL_STAGING = YES
OWFS_INSTALL_TARGET = YES
OWFS_CONF_OPT = --disable-owshell --disable-owhttpd --disable-owftpd
--disable-owserver --disable-ownet --disable-ownetlib --disable-owtap
--disable-owmon --disable-owcapi --disable-swig --disable-owperl
--disable-owphp --disable-owpython --disable-owtcl
OWFS_DEPENDENCIES = libfuse
OWFS_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib"

$(eval $(call AUTOTARGETS,package,owfs))

### End owfs/owfs.mk ###
