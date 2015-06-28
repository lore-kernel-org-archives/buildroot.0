From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 28 Jun 2015 14:58:37 +0200
Subject: [Buildroot] [PATCH] uclibc: deprecate locale support
In-Reply-To: <20150628140153.4a657fdd@free-electrons.com>
References: <20150628071417.GA13377@waldemar-brodkorb.de>
 <20150628140153.4a657fdd@free-electrons.com>
Message-ID: <20150628125837.GX31780@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Waldemar Brodkorb,
> 
> On Sun, 28 Jun 2015 09:14:17 +0200, Waldemar Brodkorb wrote:
> > The quality of the locale implementation in uClibc seems
> > to be bad. Recently a discussion on the uClibc mailinglist
> > showed that the uClibc maintainer has no time to fix
> > remaining issues in the locale implementation.
> > http://lists.uclibc.org/pipermail/uclibc/2015-June/049000.html
> > 
> > Because of the bad state of the code I would like to deprecate
> > it. I never used it myself and see no good reason why I would
> > need it for an embedded system.
> > 
> > I believe not many people are using it. For good working
> > locale support there is still GNU libc and musl.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> Can you assess the impact on the packages we currently have in
> Buildroot ? I.e, which packages can only work with locale support?

I think no package really needs locale support in the C library.

May be there is some misunderstanding about the locale stuff.
Here is how I understand the stuff.

I think we have mixed up two different things here:
- iconv: perform character set conversion, needed for a lot of
  packages, f.e. Kodi. Is included in Glibc and Musl. Libiconv can
  be used with uClibc-ng/uClibc.
- locale: defines the user's language, country, ..
  If you want f.e. german error messages on your embedded system
  you would need locale support and locale data.
  env LC_ALL=de_DE ls foo

Who is really using the locale stuff?
I think the iconv functions, which are automatically enabled
when UCLIBC_HAS_LOCALE is set are neither complete not used
externally. If libiconv is to big, libiconv-tiny for simple
UTF-8 <-> ASCII conversion could be used.
 
> If we remove BR2_TOOLCHAIN_BUILDROOT_LOCALE, then there's a lot of
> possible further cleanup: BR2_ENABLE_LOCALE should be removed, all
> packages doing select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE should
> be changed, etc.

May be something like this:
select BR2_PACKAGE_LIBICONV if BR2_LIBC_WITHOUT_ICONV
 
> Also, do you have an idea of what is the state of the locale support in
> musl ? Does musl provide the functions provided by libiconv ?

Yes. Like GNU libc, musl already provides iconv functions out of the
box.
 
> It would be good to take this opportunity to make sure the locale
> support is OK.

Yes, that would be good.

best regards
 Waldemar
