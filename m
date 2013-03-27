From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 27 Mar 2013 14:39:04 +0100
Subject: [Buildroot] [PATCH 1/1] add mongrel2 package
In-Reply-To: <20130327140940.07fea819@skate>
References: <1364382926-26133-1-git-send-email-lionel.orry@gmail.com>
 <20130327140940.07fea819@skate>
Message-ID: <CAKAx1ciLADoG8ShR85cZtZc3J8yVWVcf0Z9FDUs3bJ=aUEa-aA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thank you for reviewing, this is my first real patch to buildroot so
I'm still learning :)

A few comments below.


On Wed, Mar 27, 2013 at 2:09 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Lionel Orry,
>
> Nitpick: we generally like the title to be "mongrel2: new package".

I saw this but after sending the email. Will fix.

>
> On Wed, 27 Mar 2013 12:15:26 +0100, Lionel Orry wrote:
>
>> diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
>> new file mode 100644
>> index 0000000..fb9fb76
>> --- /dev/null
>> +++ b/package/mongrel2/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_MONGREL2
>> +     bool "mongrel2"
>> +     select BR2_PACKAGE_SQLITE
>> +     select BR2_PACKAGE_ZEROMQ
>
> You should replicate the dependencies of zeromq here:
>
>         depends on BR2_INSTALL_LIBSTDCPP # zeromq
>         depends on BR2_INET_IPV6 # zeromq
>         depends on BR2_LARGEFILE # zeromq -> util-linux
>         depends on BR2_USE_WCHAR # zeromq -> util-linux
>

Ok.

>
>> +     help
>> +       Mongrel2 is an application, language, and network architecture agnostic web server
>> +       that focuses on web applications using modern browser technologies.
>> +
>> +       Mongrel2 supports 17 languages and platforms, HTTP, Flash sockets, WebSockets,
>> +       Long Polling, and many ways to deploy and hack on it.
>
> The lines are too long here I think. It should be wrapped under 80
> characters per line.

Will fix.

>
>> +       Mongrel2 depends on sqlite3 and zeromq.
>> +
>> +       http://www.mongrel2.org
>> diff --git a/package/mongrel2/mongrel2-001-fix-procer-compiler.patch b/package/mongrel2/mongrel2-001-fix-procer-compiler.patch
>> new file mode 100644
>> index 0000000..81f4690
>> --- /dev/null
>> +++ b/package/mongrel2/mongrel2-001-fix-procer-compiler.patch
>> @@ -0,0 +1,11 @@
>
> The patch lacks a description and Signed-off-by line.

Indeed. Aside note, I sent a pull request upstream so that they fix it
and the patch would not be needed but I don't know their reactivity.

>
>> +--- a/tools/procer/Makefile  2012-07-26 07:57:52.000000000 +0200
>> ++++ b/tools/procer/Makefile  2013-03-26 11:04:26.881184128 +0100
>> +@@ -8,7 +8,7 @@
>> +
>> +
>> + procer: ../../build/libm2.a ${OBJECTS}
>> +-    gcc $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
>> ++    $(CC) $(OPTFLAGS) $(OPTLIBS) -o $@ ${OBJECTS} ../../build/libm2.a ${LIBS}
>> +
>> + clean:
>> +     rm -f *.o procer
>> diff --git a/package/mongrel2/mongrel2-002-do-not-run-tests.patch b/package/mongrel2/mongrel2-002-do-not-run-tests.patch
>> new file mode 100644
>> index 0000000..87ef30e
>> --- /dev/null
>> +++ b/package/mongrel2/mongrel2-002-do-not-run-tests.patch
>> @@ -0,0 +1,22 @@
>
> Ditto, missing description.
>
>> +--- a/Makefile       2013-03-26 10:56:47.315241223 +0100
>> ++++ b/Makefile       2013-03-26 10:57:24.578499095 +0100
>> +@@ -16,7 +16,7 @@
>> + TESTS=$(patsubst %.c,%,${TEST_SRC})
>> + MAKEOPTS=OPTFLAGS="${NOEXTCFLAGS} ${OPTFLAGS}" OPTLIBS="${OPTLIBS}" LIBS="${LIBS}" DESTDIR="${DESTDIR}" PREFIX="${PREFIX}"
>> +
>> +-all: bin/mongrel2 tests m2sh procer
>> ++all: bin/mongrel2 m2sh procer filters config_modules
>> +
>> + dev: CFLAGS=-g -Wall -Isrc -Wall -Wextra $(OPTFLAGS) -D_FILE_OFFSET_BITS=64
>> + dev: all
>> +--- a/tools/m2sh/Makefile    2013-03-26 11:01:57.221103774 +0100
>> ++++ b/tools/m2sh/Makefile    2013-03-26 11:02:14.300772505 +0100
>> +@@ -9,7 +9,7 @@
>> + LIB_SRC=$(filter-out src/m2sh.c,${SOURCES})
>> + LIB_OBJ=$(filter-out src/m2sh.o,${OBJECTS})
>> +
>> +-all: ../lemon/lemon tests build/m2sh
>> ++all: ../lemon/lemon build/m2sh
>> +
>> + dev: CFLAGS=-g -Wall -Wextra -Isrc -I../../src $(OPTFLAGS)
>> + dev: all
>> diff --git a/package/mongrel2/mongrel2.mk b/package/mongrel2/mongrel2.mk
>> new file mode 100644
>> index 0000000..a7593ad
>> --- /dev/null
>> +++ b/package/mongrel2/mongrel2.mk
>> @@ -0,0 +1,43 @@
>> +#############################################################
>> +#
>> +# Mongrel2
>> +#
>> +#############################################################
>
> Please add a blank line here.
>
>> +MONGREL2_VERSION = 1.8.0
>> +MONGREL2_SOURCE = mongrel2_$(MONGREL2_VERSION).tar.gz
>> +MONGREL2_SITE = https://github.com/zedshaw/mongrel2/tarball/v1.8.0
>> +MONGREL2_LICENSE = BSD-3c
>> +MONGREL2_LICENSE_FILES = LICENSE
>> +MONGREL2_DEPENDENCIES = sqlite zeromq
>> +
>> +export OPTFLAGS = $(TARGET_CFLAGS) -ffunction-sections -fdata-sections
>> +export OPTLIBS = $(TARGET_LDFLAGS) -Wl,--gc-sections
>
> Ouch, no, don't export such globally named variables, pass them in the
> environment. That said, I'm not sure why you need those additional
> flags in the first place.

Apart from the size optimisations given by the explicit flags, I
noticed their Makefiles do not honor CFLAGS correctly and additional
flags had to be passed through OPTFLAGS and OPTLIBS. I'll pass them to
the environment though, and forget about the size optimisation flags,
they are leftovers for my own purpose.

>
>> +define MONGREL2_CLEAN_CMDS
>> +     $(MAKE1) -C $(@D) clean
>> +endef
>
> You can remove this CLEAN_CMDS, we are deprecating these.

Ok

>
>> +
>> +define MONGREL2_BUILD_CMDS
>> +     export CC="$(TARGET_CC)" && \
>> +             export CXX="$(TARGET_CXX)" && \
>> +             $(MAKE1) -C $(@D) PREFIX=/usr all
>> +endef
>
> Look at other packages and see how they pass these informations. This
> should look like:
>
> define MONGREL2_BUILD_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>                 PREFIX=/usr all
> endef
>
> TARGET_MAKE_ENV ensures that the PATH is correct, and
> TARGET_CONFIGURE_OPTS pass the correct values for CC, CXX, etc.

I'll try with these, thanks

>
>> +define MONGREL2_INSTALL_TARGET_CMDS
>> +     export CC="$(TARGET_CC)" && \
>> +             export CXX="$(TARGET_CXX)" && \
>> +             $(MAKE1) -C $(@D) PREFIX=/usr install DESTDIR=$(TARGET_DIR)
>
> Same as above:
>
>         $(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
>                 PREFIX=/usr DESTDIR=$(TARGET_DIR) install
>
>> +     $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mongrel2
>> +     $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/m2sh
>> +     $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/procer
>> +     find $(TARGET_DIR)/usr/lib/mongrel2 -type f -name '*.so' -exec $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) {} \;
>
> No, stripping shouldn't be done by the package, it's done globally by
> Buildroot at the end of the build. Just remove those lines.

Ok

>
>> +endef
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Thanks again for the review.

Best regards,
Lionel
