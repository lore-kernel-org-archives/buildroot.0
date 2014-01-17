From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Jan 2014 09:10:35 +0100
Subject: [Buildroot] [PATCH v2 11/12] libenca: new package
In-Reply-To: <1389831355-19983-12-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Thu, 16 Jan 2014 01:15:54 +0100")
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389831355-19983-12-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87zjmvni4k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Extremely Naive Charset Analyser.
 > This package was originally found at : https://github.com/huceke/buildroot-rbp
 > By gimli <ebsi4711@gmail.com>

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: gimli <ebsi4711@gmail.com>
 > ---
 > Changes v3 --> v4:
 >   - New patch against Makefile.am and do AUTORECONF (Thomas Petazzoni,
 >     Yann E. Morin)
 >   - Remove the uses of prefix by adding a patch which removes a hack in
 >     the configure.ac (Yann E. Morin)

 > @@ -0,0 +1,36 @@
 > +################################################################################
 > +#
 > +# libenca
 > +#
 > +################################################################################
 > +
 > +LIBENCA_VERSION = 1.15
 > +LIBENCA_SITE = $(call github,nijel,enca,$(LIBENCA_VERSION))
 > +LIBENCA_INSTALL_STAGING = YES
 > +LIBENCA_AUTORECONF = YES
 > +LIBENCA_LICENSE = GPLv2
 > +LIBENCA_LICENSE_FILES = COPYING
 > +
 > +LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes \
 > +			ac_cv_file__dev_urandom=yes \
 > +			ac_cv_file__dev_arandom=no \
 > +			ac_cv_file__dev_srandom=no
 > +
 > +define LIBENCA_MAKE_HOST_TOOL
 > +	cd $(@D)/tools && sed -e 's/^#define \([A-Z0-9_]*\) \(.*\)/@\1@ \2/' \
 > +		-e 's/"//g' \
 > +		-e 's/NULL$$//' \
 > +		-e 's/ /\//' \
 > +		-e 's/^\(.*\)$$/s\/\1\//' \
 > +		../iconvenc.h >encodings.sed
 > +	cd $(@D)/tools && $(HOSTCC) -o make_hash make_hash.c
 > +	cd $(@D)/tools && sed -f encodings.sed ./encodings.dat | ./make_hash >encodings.h
 > +endef
 > +
 > +LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
 > +
 > +$(eval $(autotools-package))
 > +
 > +XERCES_CONF_OPT = --disable-threads \
 > +		  --with-gnu-ld
 > +

Huh, what is this about?

-- 
Bye, Peter Korsgaard
