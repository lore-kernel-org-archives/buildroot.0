From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 15:08:22 +0200
Subject: [Buildroot] [PATCH] uclibc: deprecate locale support
In-Reply-To: <20150628125837.GX31780@waldemar-brodkorb.de>
References: <20150628071417.GA13377@waldemar-brodkorb.de>
 <20150628140153.4a657fdd@free-electrons.com>
 <20150628125837.GX31780@waldemar-brodkorb.de>
Message-ID: <20150628150822.46f6861e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jun 2015 14:58:37 +0200, Waldemar Brodkorb wrote:

> I think no package really needs locale support in the C library.
> 
> May be there is some misunderstanding about the locale stuff.
> Here is how I understand the stuff.
> 
> I think we have mixed up two different things here:
> - iconv: perform character set conversion, needed for a lot of
>   packages, f.e. Kodi. Is included in Glibc and Musl. Libiconv can
>   be used with uClibc-ng/uClibc.
> - locale: defines the user's language, country, ..
>   If you want f.e. german error messages on your embedded system
>   you would need locale support and locale data.
>   env LC_ALL=de_DE ls foo

Fully agreed here. But in uClibc, enabling locale support actually
gives both: the iconv functions *and* the locale support itself.

> Who is really using the locale stuff?
> I think the iconv functions, which are automatically enabled
> when UCLIBC_HAS_LOCALE is set are neither complete not used
> externally.

Of course they are used externally: many of our packages do "select
BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE" because they
unconditionally use the iconv function, and uClibc only provide these
functions if locale support is enabled. From
libc/misc/wchar/Makefile.in (in original uClibc, I haven't looked at
uClibc-ng) :

CSRC-$(UCLIBC_HAS_LOCALE) += iconv.c

> If libiconv is to big, libiconv-tiny for simple UTF-8 <-> ASCII
> conversion could be used. 

This could be useful, but this would be a separate matter.

> > If we remove BR2_TOOLCHAIN_BUILDROOT_LOCALE, then there's a lot of
> > possible further cleanup: BR2_ENABLE_LOCALE should be removed, all
> > packages doing select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> > should be changed, etc.
> 
> May be something like this:
> select BR2_PACKAGE_LIBICONV if BR2_LIBC_WITHOUT_ICONV

Yes, correct.

> > Also, do you have an idea of what is the state of the locale
> > support in musl ? Does musl provide the functions provided by
> > libiconv ?
> 
> Yes. Like GNU libc, musl already provides iconv functions out of the
> box.

Ok, so BR2_LIBC_WITHOUT_ICONV would be simple: it's y if uClibc, and n
otherwise.

Or should we instead have in uClibc the iconv functions enabled by
default (by having a UCLIBC_HAS_ICONV option separate from
UCLIBC_HAS_LOCALE), so that uClibc is like all other C libraries from
an iconv() point of view ? And of course, get rid completely of locale
support in uClibc ?

There are still lots of packages that use BR2_ENABLE_LOCALE in
Buildroot, we will have to check what they do exactly with it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
