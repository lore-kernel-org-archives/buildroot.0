From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 11 Jun 2019 15:21:40 -0400
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix build with NLS
In-Reply-To: <20190611185542.21391-1-fontaine.fabrice@gmail.com>
References: <20190611185542.21391-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFSsvmp7ODpQgTYaDSenwNUpMuta061HhOO4CcbUSO2NEAxkLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Fabrice!

We are discussing this currently on IRC and I think we have two
options, perhaps you should join us?

Basically, the two options are:
1) Use your above patch (which is what I originally suggested,
although my code was a bit more hacky.)
2) What Yann is suggesting which is to expand pkg-meson.mk with
something like: http://code.bulix.org/onc7x0-767490?raw
    and then add the $(TARGET_NLS_LIBS) to the mk file.

I am liking option 2 a bit more, as it is another patch that we don't
have to maintain.

What do you think?

Adam

On Tue, Jun 11, 2019 at 2:55 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> cc_has_function('ngettext') is broken when cross-compiling, see:
> https://github.com/mesonbuild/meson/issues/3740
>
> As a result, a false positive is returned and build fails because of the
> missing lintl dependency
>
> Fixes:
>  - http://autobuild.buildroot.org/results/f0d85d76786343d767fba9c7c5c01f042ecfc018
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...005-meson.build-fix-build-with-lintl.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/libglib2/0005-meson.build-fix-build-with-lintl.patch
>
> diff --git a/package/libglib2/0005-meson.build-fix-build-with-lintl.patch b/package/libglib2/0005-meson.build-fix-build-with-lintl.patch
> new file mode 100644
> index 0000000000..5abe87b32a
> --- /dev/null
> +++ b/package/libglib2/0005-meson.build-fix-build-with-lintl.patch
> @@ -0,0 +1,52 @@
> +From d1b5dc6ffc8dde4c413c832e178b758cdf3b4187 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 11 Jun 2019 20:40:44 +0200
> +Subject: [PATCH] meson.build: fix build with lintl
> +
> +cc_has_function('ngettext') is broken when cross-compiling, see:
> +https://github.com/mesonbuild/meson/issues/3740
> +
> +As a result, a false positive is returned and build fails because of the
> +missing lintl dependency
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/f0d85d76786343d767fba9c7c5c01f042ecfc018
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b85ff7661..5b22fcfd2 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1785,10 +1785,12 @@ endif
> + # proxy-libintl subproject.
> + # FIXME: glib-gettext.m4 has much more checks to detect broken/uncompatible
> + # implementations. This could be extended if issues are found in some platforms.
> +-if cc.has_function('ngettext')
> +-  libintl = []
> +-  have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset')
> +-else
> ++# FIXME: cc.has_function('ngettext') is broken when cross-compiling, see
> ++# https://github.com/mesonbuild/meson/issues/3740
> ++#if cc.has_function('ngettext')
> ++#  libintl = []
> ++#  have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset')
> ++#else
> +   libintl = cc.find_library('intl', required : false)
> +   if not libintl.found()
> +     libintl = subproject('proxy-libintl').get_variable('intl_dep')
> +@@ -1797,7 +1799,7 @@ else
> +     have_bind_textdomain_codeset = cc.has_function('bind_textdomain_codeset',
> +                                                    dependencies : libintl)
> +   endif
> +-endif
> ++#endif
> +
> + glib_conf.set('HAVE_BIND_TEXTDOMAIN_CODESET', have_bind_textdomain_codeset)
> +
> +--
> +2.20.1
> +
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
