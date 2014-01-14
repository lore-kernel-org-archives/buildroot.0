From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Jan 2014 23:14:23 +0100
Subject: [Buildroot] [PATCH 02/14] libenca: new package
In-Reply-To: <1389549208-19078-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389549208-19078-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389549208-19078-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140114221423.GB3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

At long last, my comments below... ;-)

Since I'm basing my review not on this patch, but on the one you have in
your repo, there might be some discrepancies...

On 2014-01-12 18:53 +0100, Maxime Hadjinlian spake thusly:
> Extremely Naive Charset Analyser.

Muarf! :-)

> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>

Maybe it would be nice to at least Cc gimli, out of courtesy?

> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
  Cc: gimli

[--SNIP--]
> diff --git a/package/libenca/libenca-1.9-dont-build-tools.patch b/package/libenca/libenca-1.9-dont-build-tools.patch
> new file mode 100644
> index 0000000..43b3420
> --- /dev/null
> +++ b/package/libenca/libenca-1.9-dont-build-tools.patch

Your repo now has a commit log + SoB-line, but it does not explain why
you want to avoid buildign the tools. Please expand on this in the
patch' commit log (what you said on IRC is OK, I guess).

Also, your patch touches Makefile.in. You should modify Makefile.am to
remove the tools, and set LIBENCA_AUTORECONF=yes.

Or better yet: prepare a patch for upstream that adds the possibility to
enable/disable the tools:
    ./configure --enable-tools
    ./configure --disable-tools

That way, we can get rid of the patch altogether (and _AUTORECONF) when
upstream releases a new version and we bump to it.

> diff --git a/package/libenca/libenca-1.9-fix-clean.patch b/package/libenca/libenca-1.9-fix-clean.patch
> new file mode 100644
> index 0000000..9c206ad
> --- /dev/null
> +++ b/package/libenca/libenca-1.9-fix-clean.patch

This patch in your repo is still missing a commit log + SoB-line.

Also, it looks like it is an install fix, not a clean fix (name of the
patch).

Again, you're touching Makefile.in. You should modify Makefile.am and
set AUTORECONF=yes.

> diff --git a/package/libenca/libenca-1.9-fix-prefix.patch b/package/libenca/libenca-1.9-fix-prefix.patch
> new file mode 100644
> index 0000000..6fd195b

It seems you dropped that one from your repo.

> index 0000000..e9dba18
> --- /dev/null
> +++ b/package/libenca/libenca.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# libenca
> +#
> +#############################################################

Here I'm pasting the content of your repo:

> +LIBENCA_VERSION = 1.15
> +LIBENCA_SITE = $(call github,nijel,enca,$(LIBENCA_VERSION))
> +LIBENCA_INSTALL_STAGING = YES
> +LIBENCA_LICENSE = GPLv2
> +LIBENCA_LICENSE_FILES = COPYING
> +
> +LIBENCA_CONF_OPT += --prefix=$(TARGET_DIR)/usr

Why do you need to fake the prefix? Doesn't DESTDIR work as expected?

> +LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes \
> ac_cv_file__dev_urandom=yes \
> ac_cv_file__dev_arandom=no \
> ac_cv_file__dev_srandom=no

Check indentation on those three lines: they appear to be right-shifted.
Myabe your tabls are too small in your editor? We're using 8-space wide
tabs.

> +define LIBENCA_MAKE_HOST_TOOL
> +     cd $(@D)/tools && sed -e 's/^#define \([A-Z0-9_]*\) \(.*\)/@\1@ \2/' -e 's/"//g' -e 's/NULL$$//' -e 's/ /\//' -e 's/^\(.*\)$$/s\/\1\//' ../iconvenc.h >encodings.sed

Please split this long line before each -e:
    cd $(@D)/tools && sed -e 's/^#define \([A-Z0-9_]*\) \(.*\)/@\1@ \2/' \
                          -e 's/"//g' -e 's/NULL$$//' -e 's/ /\//' \
                          -e 's/^\(.*\)$$/s\/\1\//' ../iconvenc.h \
                          >encodings.sed

> +     cd $(@D)/tools && $(HOSTCC) -o make_hash make_hash.c
> +     cd $(@D)/tools && sed -f encodings.sed ./encodings.dat | ./make_hash >encodings.h
> +endef
> +
> +LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL

Should it be a POST_CONFIGURE, or a _PRE_BUILD hook? But we don't have a
_PRE_BUILD HOOK, so let it be a _POST_CONFIGURE.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
