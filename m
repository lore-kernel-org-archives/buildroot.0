From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 19:58:07 +0100
Subject: [Buildroot] [PATCH v4 3/5] libenca: new package
In-Reply-To: <1390772341-6790-4-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 26 Jan 2014 22:38:59 +0100")
References: <1390772341-6790-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1390772341-6790-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87r47s2atc.fsf@dell.be.48ers.dk>
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
 > Cc: Bernd Kuhls <berndkuhls@hotmail.com>
 > ---
 > Changes v3 --> v4:
 >   - Add support for libiconv (Patch from Bernd Kuhls)
 > Changes v2 --> v3:
 >   - Bump libenca to 1.15 (1.9 was 4 years ago)
 >   - Rework the whole libenca.mk file
 >   - Switch source to github
 >   - New patch against Makefile.am and do AUTORECONF (Thomas Petazzoni,
 >     Yann E. Morin)
 >   - Remove the uses of prefix by adding a patch which removes a hack in
 >     the configure.ac (Yann E. Morin)
 > Changes v1 --> v2:
 >   - Rename patch files (Thomas Petazzoni)
 >   - Fix header of the mk files (Thomas Petazzoni)
 >   - Fix indent (Thomas Petazzoni)
 >   - Put LIBENCA_CONF_ENV on one line (Thomas Petazzoni)
 > ---
 >  package/Config.in                                  |  1 +
 >  package/libenca/Config.in                          |  7 ++++
 >  .../libenca/libenca-000-do-not-build-tools.patch   | 44 ++++++++++++++++++++++
 >  .../libenca-001-fix-installation-error.patch       | 44 ++++++++++++++++++++++
 >  ...benca-002-remove-prefix-hack-in-configure.patch | 33 ++++++++++++++++
 >  package/libenca/libenca-003-iconv.patch            | 15 ++++++++
 >  package/libenca/libenca.mk                         | 33 ++++++++++++++++
 >  7 files changed, 177 insertions(+)
 >  create mode 100644 package/libenca/Config.in
 >  create mode 100644 package/libenca/libenca-000-do-not-build-tools.patch
 >  create mode 100644 package/libenca/libenca-001-fix-installation-error.patch
 >  create mode 100644 package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
 >  create mode 100644 package/libenca/libenca-003-iconv.patch
 >  create mode 100644 package/libenca/libenca.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 397cc11..677f01e 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -773,6 +773,7 @@ menu "Text and terminal handling"
 >  source "package/enchant/Config.in"
 >  source "package/icu/Config.in"
 >  source "package/libedit/Config.in"
 > +source "package/libenca/Config.in"
 >  source "package/libfribidi/Config.in"
 >  source "package/libiconv/Config.in"
 >  source "package/linenoise/Config.in"
 > diff --git a/package/libenca/Config.in b/package/libenca/Config.in
 > new file mode 100644
 > index 0000000..58217dc
 > --- /dev/null
 > +++ b/package/libenca/Config.in
 > @@ -0,0 +1,7 @@
 > +config BR2_PACKAGE_LIBENCA
 > +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

A quick test shows that locale / libiconv actually isn't
needed. Configure warns if they aren't available, but it does build.

 > +	bool "libenca"
 > +	help
 > +	  Extremely Naive Charset Analyser
 > +
 > +	  http://cihar.com/software/enca/
 > diff --git a/package/libenca/libenca-000-do-not-build-tools.patch b/package/libenca/libenca-000-do-not-build-tools.patch
 > new file mode 100644
 > index 0000000..83db61b
 > --- /dev/null
 > +++ b/package/libenca/libenca-000-do-not-build-tools.patch
 > @@ -0,0 +1,44 @@
 > +From be1fe3e057ccb90fd476bf855f19ecbe97bf4e1e Mon Sep 17 00:00:00 2001
 > +From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > +Date: Wed, 15 Jan 2014 00:18:34 +0100
 > +Subject: [PATCH 1/3] Do not build tools
 > +
 > +We don't want to build tools using buildroot because there is currently no
 > +support for cross compile.
 > +And we need to execute make_hash (which seems to be the only things that get
 > +compiled in tools) to create encodings.h which will later be used during the
 > +build process.
 > +Thus, we disable the build of the tools, and we do ourselves using a
 > +POST_CONFIGURE_HOOKS.

As long as we build make_hash in advance, the make file won't try to
rebuild it so we don't actually need this patch.


 > +define LIBENCA_MAKE_HOST_TOOL
 > +	cd $(@D)/tools && sed -e 's/^#define \([A-Z0-9_]*\) \(.*\)/@\1@ \2/' \
 > +		-e 's/"//g' \
 > +		-e 's/NULL$$//' \
 > +		-e 's/ /\//' \
 > +		-e 's/^\(.*\)$$/s\/\1\//' \
 > +		../iconvenc.h >encodings.sed
 > +	cd $(@D)/tools && $(HOSTCC) -o make_hash make_hash.c
 > +	cd $(@D)/tools && sed -f encodings.sed ./encodings.dat | ./make_hash >encodings.h

It would be good to use HOST_CFLAGS / HOST_LDFLAGS as well. We might as
well use util/Makefile instead of hardcoding all these steps.

Committed with those changes, thanks.

-- 
Bye, Peter Korsgaard
