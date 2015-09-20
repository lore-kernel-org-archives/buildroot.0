From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:23:03 +0200
Subject: [Buildroot] [PATCH] package/mono: fix linking options for
 locale_charset
In-Reply-To: <1441437891-6420-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1441437891-6420-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150920152303.78dc79ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Sat,  5 Sep 2015 09:24:51 +0200, Angelo Compagnucci wrote:

> + AC_CHECK_HEADERS(getopt.h sys/select.h sys/time.h sys/wait.h pwd.h langinfo.h iconv.h localcharset.h sys/types.h sys/resource.h)
> ++AC_CHECK_LIB([iconv], [locale_charset],[],[AC_CHECK_LIB([charset], [locale_charset],[LIBS+="-liconv -lcharset"])])

Why are you doing LIBS+="-liconv -lcharset" when locale_charset() is
found is libcharset ?

Here is what the Git configure.ac is doing for the same problem:

# Define CHARSET_LIB if libiconv does not export the locale_charset symbol
# and libcharset does
CHARSET_LIB=
AC_CHECK_LIB([iconv], [locale_charset],
       [CHARSET_LIB=-liconv],
       [AC_CHECK_LIB([charset], [locale_charset],
                     [CHARSET_LIB=-lcharset])])
GIT_CONF_SUBST([CHARSET_LIB])

> diff --git a/package/mono/Config.in b/package/mono/Config.in
> index 0f57703..cf18a03 100644
> --- a/package/mono/Config.in
> +++ b/package/mono/Config.in
> @@ -8,7 +8,6 @@ config BR2_PACKAGE_MONO
>  	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE

What guarantees you that if libiconv is not available, then libcharset
will be? What will provide the locale_charset() function?

This really need a few more explanations.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
