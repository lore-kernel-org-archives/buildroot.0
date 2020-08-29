From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:17:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: new package
In-Reply-To: <20200829075901.19860-1-egorenar-dev@posteo.net>
References: <20200829075901.19860-1-egorenar-dev@posteo.net>
Message-ID: <20200829221711.3327c5ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Sat, 29 Aug 2020 09:59:01 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Thanks for your contribution! See below for a number of comments.

>  package/Config.in                             |  1 +
>  .../0001-Cross-compilation-fixes.patch        | 13 +++++++
>  package/makedumpfile/0002-gcc10-fixes.patch   | 35 +++++++++++++++++++
>  package/makedumpfile/Config.in                | 11 ++++++
>  package/makedumpfile/makedumpfile.hash        |  3 ++
>  package/makedumpfile/makedumpfile.mk          | 23 ++++++++++++
>  6 files changed, 86 insertions(+)

For all new packages, we need an entry to be added to the DEVELOPERS
file so we know who is in charge of which package, and you will receive
e-mail notifications when this package fails to build or needs to be
updated.

> diff --git a/package/makedumpfile/0001-Cross-compilation-fixes.patch b/package/makedumpfile/0001-Cross-compilation-fixes.patch
> new file mode 100644
> index 0000000000..ebe495d89d
> --- /dev/null
> +++ b/package/makedumpfile/0001-Cross-compilation-fixes.patch
> @@ -0,0 +1,13 @@

We need all patches to have a description and Signed-off-by line, and
be generated using "git format-patch -N" when the upstream project uses
git.

> +Index: makedumpfile-1.6.7/Makefile
> +===================================================================
> +--- makedumpfile-1.6.7.orig/Makefile
> ++++ makedumpfile-1.6.7/Makefile
> +@@ -8,7 +8,7 @@ ifeq ($(strip $CC),)
> + CC	= gcc
> + endif
> + 
> +-CFLAGS_BASE := $(CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \
> ++CFLAGS_BASE := $(EXTRA_CFLAGS) -g -O2 -Wall -D_FILE_OFFSET_BITS=64 \

It's not clear to me why you need this change though. I think the
intention of this code is that if you pass CFLAGS in the environment of
make and not as an option, it will do the right thing. Quick demo:

$ cat toto.mk 
CFLAGS_BASE := $(CFLAGS) -foobar
CFLAGS := $(CFLAGS_BASE) -barfoo

all:
	@echo $(CFLAGS)

$
$ make -f toto.mk CFLAGS=-baz
-baz
$ CFLAGS=-baz make -f toto.mk
-baz -foobar -barfoo


> + 		-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> + CFLAGS      := $(CFLAGS_BASE) -DVERSION='"$(VERSION)"' -DRELEASE_DATE='"$(DATE)"'
> + CFLAGS_ARCH := $(CFLAGS_BASE)
> diff --git a/package/makedumpfile/0002-gcc10-fixes.patch b/package/makedumpfile/0002-gcc10-fixes.patch
> new file mode 100644
> index 0000000000..10c4bf72c7
> --- /dev/null
> +++ b/package/makedumpfile/0002-gcc10-fixes.patch
> @@ -0,0 +1,35 @@

Again, we need this to have a proper description and Signed-off-by.
Also, could you submit it upstream ?

> diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
> new file mode 100644
> index 0000000000..6751282ea6
> --- /dev/null
> +++ b/package/makedumpfile/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_MAKEDUMPFILE
> +	bool "makedumpfile"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS # dlopen

elfutils has plenty more dependencies that you need to replicate:

        depends on BR2_USE_WCHAR
        depends on !BR2_STATIC_LIBS
        # Only glibc and uClibc implement the myriad of required GNUisms
        depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC

> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_BZIP2
> +	select BR2_PACKAGE_LZO
> +	select BR2_PACKAGE_XZ
> +	help
> +	  Makes a small dumpfile of kdump.

You need to add the upstream URL of the project in the Config.in help
text, look at other packages for example.

Also, you need to add a comment about the Config.in dependencies. Look
at other packages for direction on how to do this. For example, in
package/elfutils/Config.in, we have:

comment "elfutils needs a uClibc or glibc toolchain w/ wchar, dynamic library"
        depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
                || !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

> +MAKEDUMPFILE_VERSION = 1.6.7
> +MAKEDUMPFILE_SITE = https://github.com/makedumpfile/makedumpfile/releases/download/Released-$(subst .,-,$(MAKEDUMPFILE_VERSION))
> +MAKEDUMPFILE_DEPENDENCIES = zlib xz lzo

Your Config.in file also selects bzip2 and elfutils... so it seems odd
they are not needed at build time. Could you confirm this ?

In any case, make sure you can run this:

$ make clean
$ make makedumpfile

if that doesn't work, you forgot some build dependencies.

Also, run:

$ cat > snippet.cfg<<EOF
BR2_PACKAGE_MAKEDUMPFILE=y
EOF
$ ./utils/test-pkg -c snippet.cfg -p makedumpfile

> +MAKEDUMPFILE_LICENSE = GPL-2.0
> +MAKEDUMPFILE_LICENSE_FILES = COPYING
> +
> +define MAKEDUMPFILE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> +		EXTRA_CFLAGS="$(TARGET_CFLAGS)" TARGET=$(BR2_ARCH) USELZO=on LINKTYPE=dynamic

Could you instead pass TARGET_CONFIGURE_OPTS in the environment, like
this:

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		TARGET=$(BR2_ARCH) USELZO=on LINKTYPE=dynamic

TARGET=$(BR2_ARCH): did you check it builds with all CPU architectures
supported by Buildroot? In the above proposed test with test-pkg, I'd
suggest doing one run with the -a option to check with all toolchains
supported by Buildroot.

Also, USELZO=on indicates that the LZO dependency, could you make it
optional? I.e, drop the select BR2_PACKAGE_LZO from Config.in, and in
the .mk file, do something like:

ifeq ($(BR2_PACKAGE_LZO),y)
MAKEDUMPFILE_DEPENDENCIES += lzo
MAKEDUMPFILE_MAKE_OPTS += USELZO=on
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
