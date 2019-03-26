From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2019 20:28:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <20190315023456.15988-1-vadim4j@gmail.com>
References: <20190315023456.15988-1-vadim4j@gmail.com>
Message-ID: <20190326192819.GL2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-03-15 04:34 +0200, Vadim Kochan spake thusly:
> Add custom ecryptfs-common script which provides gettext wrapper as
> function, script checks if there is gettext tool, if no - the "printf"
> will be used instead. Each script which uses gettext is patched with
> including this ecryptfs-common script.
> 
> gettext package is now selected automatically only if NLS is enabled.
> 
> Also replaced AM_GLIB_GNU_GETTEXT by AM_GNU_GETTEXT because original
> macro is removed during autoreconf. Actually AM_GLIB_GNU_GETTEXT is
> marked as deprecated in:
> 
>     https://gitlab.gnome.org/GNOME/glib/blob/master/m4macros/glib-gettext.m4#L437
> 
> so it is ok to use the gettext's one.

I know you've pourred quite some effort into this solution, but I am
still not entirely convinced.

So, my position on how we should handle this in Buildroot is as follows:

 1. When the real 'gettext' utility is not available (for whatever
    reason), then we should install our own, fake gettext, like the one
    I previously suggested.

 2. If you are really interested, push a change upstream that makes
    ecryptfs-utils not require gettext, but with a solution that does
    not use a wrapper. see below for more on that.

 3. If/when upstream supports running without a gettext utility, then
    we can either bump the version in Buildroot, or backport the
    patches.

Now, for (1), what package should be responsible for providing the fake
gettext is not clear-cut. gettext-tiny would look like a good candidate,
though.

For (2), see below...

> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
[--SNIP--]
> diff --git a/package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch b/package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch
> new file mode 100644
> index 0000000000..7fe8756323
> --- /dev/null
> +++ b/package/ecryptfs-utils/0003-utils-Use-printf-if-gettext-does-not-exist.patch
> @@ -0,0 +1,217 @@
> +From e2a69d509653ff189dd8dd7ed30ff568a0183f1a Mon Sep 17 00:00:00 2001
> +From: Vadim Kochan <vadim4j@gmail.com>
> +Date: Tue, 12 Mar 2019 02:15:33 +0200
> +Subject: [PATCH] utils: Use "printf" if gettext does not exist

You should definitely send this upstream.

> +There might be a case when gettext does not exist on the system,
> +so use just "printf" instead. Added gettext wrapper which imitates
> +gettext behaviour, wrapper is used only if gettext is not found
> +by "which". ecryptfs-common is included by each script which uses
> +gettext tool.

I think upstream will want a solution that does not require a fake
wrapper that really mimicks the reall gettext entirely, this their use
of it is entirely confined to their scripts, and they always call it
with just the message to display.

In this case, the wrapper-function would probably be just as easy as:

    # This is in ${libdir}/ecryptfs-utils/sh-functions
    if ! which gettext >/dev/null 2>&1; then
        gettext() {
            if [ -n "${GETTEXT}" ]; then
                "${GETTEXT}" "${@}"
            else
                printf "%s" "${*}"
            fi || return $?  # Trick for 'set -e' to fail at call-site, not here
        }
    fi

and be done with it.

> +AM_GLIB_GNU_GETTEXT is replaced by AM_GNU_GETTEXT, to get rid of
> +glib2 dependency just only for this macro. Actually this macro is marked
> +as deprecated in:
> +
> +    https://gitlab.gnome.org/GNOME/glib/blob/master/m4macros/glib-gettext.m4#L437

So, when you send this upstream, you should probably split it up in
different patches:

 1. fix for the call to AM_INIT_AUTOMAKE()
 2. change from AM_GLIB_GNU_GETTEXT() to AM_GNU_GETTEXT()
 3. Convert of scripts to use the gettext wrapper-function

> +Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> +---
> + configure.ac                      | 12 ++++++++++--
> + src/utils/Makefile.am             |  4 +++-
> + src/utils/ecryptfs-common         | 30 ++++++++++++++++++++++++++++++
> + src/utils/ecryptfs-migrate-home   |  2 ++
> + src/utils/ecryptfs-mount-private  |  2 ++
> + src/utils/ecryptfs-rewrite-file   |  2 ++
> + src/utils/ecryptfs-setup-private  |  3 +++
> + src/utils/ecryptfs-setup-swap     |  2 ++
> + src/utils/ecryptfs-umount-private |  2 ++
> + src/utils/ecryptfs-verify         |  2 ++
> + 10 files changed, 58 insertions(+), 3 deletions(-)
> + create mode 100755 src/utils/ecryptfs-common
> +
> +diff --git a/configure.ac b/configure.ac
> +index bbc6ffc..eec1ebc 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -13,7 +13,7 @@ AC_PREREQ(2.59)
> + AC_INIT([ecryptfs-utils],[111])
> + AC_CANONICAL_HOST
> + AC_CANONICAL_TARGET
> +-AM_INIT_AUTOMAKE([${PACKAGE_NAME}], [${PACKAGE_VERSION}])
> ++AM_INIT_AUTOMAKE([foreign])
> + AC_CONFIG_SRCDIR([src/libecryptfs])
> + AC_CONFIG_HEADERS([config.h])
> + AC_SUBST(AM_CPPFLAGS, '-include $(top_builddir)/config.h')
> +@@ -369,7 +369,8 @@ AC_SUBST(GETTEXT_PACKAGE)
> + AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE",
> +                    [the gettext translation domain])
> + 
> +-AM_GLIB_GNU_GETTEXT
> ++AM_GNU_GETTEXT_VERSION([0.19])
> ++AM_GNU_GETTEXT([external])
> + 
> + IT_PROG_INTLTOOL([0.41.0])
> + 
> +@@ -439,6 +440,13 @@ AC_CONFIG_FILES([
> + 	tests/kernel/Makefile
> + 	tests/userspace/Makefile
> + 	po/Makefile.in
> ++	src/utils/ecryptfs-migrate-home:src/utils/ecryptfs-migrate-home
> ++	src/utils/ecryptfs-mount-private:src/utils/ecryptfs-mount-private
> ++	src/utils/ecryptfs-rewrite-file:src/utils/ecryptfs-rewrite-file
> ++	src/utils/ecryptfs-setup-private:src/utils/ecryptfs-setup-private
> ++	src/utils/ecryptfs-setup-swap:src/utils/ecryptfs-setup-swap
> ++	src/utils/ecryptfs-umount-private:src/utils/ecryptfs-umount-private
> ++	src/utils/ecryptfs-verify:src/utils/ecryptfs-verify

Since those will now undergo pattern substitution, they should be
renamed with a .in extension.

Also, it is usualy bad practice to generate such scripts from configure.
Instead, they should be generated in Makefile.am as new targets. Yes,
this is a bit more involved, but is much cleaner: when you change such a
script, you just have to run 'make' again, rather than re-run configure.

> ++commonlibdir=$(libdir)/ecryptfs-utils
> ++commonlib_SCRIPTS=ecryptfs-common

I think 'sh-functions' is more appropriate.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
