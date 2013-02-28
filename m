From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 28 Feb 2013 17:04:23 +0200
Subject: [Buildroot] Help needed with cross-compiling libotr
Message-ID: <512F71F7.20409@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

I have been trying to cross-compile libotr package that makes it possible,
with the help of pidgin-otr plugin, to send encrypted messages with
Pidgin IM software
(which I already have successfully cross-compiled for buildroot and plan
to submit soon).

Now, the problem is that no matter what I do that damn package picks
"-I/usr/include" somewhere
and the build will fail complaining about undefined reference to
__isoc99_sscanf (which it picks wrongly from
host system stdio.h).

Several remakes, autoreconf and configure switche changes and still no
closer to success.

Even grepped the source for -I/usr/include and the only place it shows
it is from
something called oldinclude from configure file...

Im totally lost here.

Could somebody more knowledgeable about autoconf/make please take a look
of this package ?
It's not big and the only dependencies it needs are libgcrypt and
libgpg-error

It can be downloaded from here:
http://www.cypherpunks.ca/otr/pidgin-otr-4.0.0.tar.gz

And here are my unworking Config.in and libotr.mk so far

config BR2_PACKAGE_LIBOTR
    bool "libotr"
    select BR2_PACKAGE_LIBGRCRYPT
    select BR2_PACKAGE_LIBGPG_ERROR
    help
      libotr

      http://www.cypherpunks.ca/otr

#############################################################
#
# libotr
#
#############################################################

LIBOTR_VERSION = 4.0.0
LIBOTR_SITE = http://www.cypherpunks.ca/otr
LIBOTR_AUTORECONF = YES
LIBOTR_AUTORECONF_OPTS = --install --force
LIBOTR_DEPENDENCIES = libgcrypt libgpg-error

LIBOTR_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
LIBOTR_CONF_OPT += --disable-gcc-hardening --disable-linker-hardening 
--with-pic \
           --with-libgcrypt-prefix="$(STAGING_DIR)/usr" \
           --disable-dependency-tracking \
           --oldincludedir="$(STAGING_DIR)/usr/include"


# disable rpath stuff
define    LIBOTR_POST_CONFIGURE_FIXUP
    (cd $(@D); \
    sed -i
's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool ; \
    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g'
libtool )
endef

LIBOTR_POST_CONFIGURE_HOOKS += LIBOTR_POST_CONFIGURE_FIXUP

$(eval $(autotools-package))



Thank you!

Regards
Stefan
