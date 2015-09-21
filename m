From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 21 Sep 2015 08:28:41 +0200
Subject: [Buildroot] [PATCH] package/mono: fix linking options for
	locale_charset
In-Reply-To: <20150920152303.78dc79ec@free-electrons.com>
References: <1441437891-6420-1-git-send-email-angelo.compagnucci@gmail.com>
 <20150920152303.78dc79ec@free-electrons.com>
Message-ID: <CA+TH9VkoiiqDW7PLHQcv6aMf8jiJF-y_aYdu5WSjSq3mwJm+dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-09-20 15:23 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> On Sat,  5 Sep 2015 09:24:51 +0200, Angelo Compagnucci wrote:
>
>> + AC_CHECK_HEADERS(getopt.h sys/select.h sys/time.h sys/wait.h pwd.h langinfo.h iconv.h localcharset.h sys/types.h sys/resource.h)
>> ++AC_CHECK_LIB([iconv], [locale_charset],[],[AC_CHECK_LIB([charset], [locale_charset],[LIBS+="-liconv -lcharset"])])
>
> Why are you doing LIBS+="-liconv -lcharset" when locale_charset() is
> found is libcharset ?

Cause it segfaults at runtime if only linked with -lcharset.

> Here is what the Git configure.ac is doing for the same problem:
>
> # Define CHARSET_LIB if libiconv does not export the locale_charset symbol
> # and libcharset does
> CHARSET_LIB=
> AC_CHECK_LIB([iconv], [locale_charset],
>        [CHARSET_LIB=-liconv],
>        [AC_CHECK_LIB([charset], [locale_charset],
>                      [CHARSET_LIB=-lcharset])])
> GIT_CONF_SUBST([CHARSET_LIB])
>
>> diff --git a/package/mono/Config.in b/package/mono/Config.in
>> index 0f57703..cf18a03 100644
>> --- a/package/mono/Config.in
>> +++ b/package/mono/Config.in
>> @@ -8,7 +8,6 @@ config BR2_PACKAGE_MONO
>>       depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>>       depends on !BR2_STATIC_LIBS
>> -     select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>
> What guarantees you that if libiconv is not available, then libcharset
> will be? What will provide the locale_charset() function?

Libcharest is only taken into account if libiconv is present but is not
exporting the locale_charset function.
If libiconv is not available, mono will switch to an internal library,
the appropriate logic is already present in various places in source
code.

> This really need a few more explanations.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
