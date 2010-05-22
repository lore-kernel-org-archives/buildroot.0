From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 May 2010 09:34:55 +0200
Subject: [Buildroot] [PATCH 02/19] Make all package using gettext rely
	on BR2_NEEDS_GETTEXT
In-Reply-To: <20100522001149.2ef4a5bb@surf> (Thomas Petazzoni's message of
	"Sat, 22 May 2010 00:11:49 +0200")
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<542fbe8520c981f9c96705a57e4263f34f2ab2e6.1274428595.git.thomas.petazzoni@free-electrons.com>
	<87mxvtt4fe.fsf@macbook.be.48ers.dk> <20100522001149.2ef4a5bb@surf>
Message-ID: <87ocg8qti8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> So we have two cases :

 Thomas>  * Packages like Avahi. They understand --disable-nls and therefore
 Thomas>    when locale support is not enabled, they don't need gettext.

 Thomas>  * Packages like libglib2. They don't understand --disable-nls, so even
 Thomas>    when locale is not enabled, they need gettext. libglib2 builds
 Thomas>    fine in the previous situation, where BR2_NEEDS_GETTEXT was set
 Thomas>    to yes as soon as an uClibc toolchain was used (regardless of
 Thomas>    whether BR2_ENABLE_LOCALE is set or not). So it is possible to build
 Thomas>    libglib2 with a !BR2_ENABLE_LOCALE toolchain, but it requires
 Thomas>    gettext to be built.

Yes, but note that gettext needs wchar - So there's a wchar dependency here.

 Thomas> So either we decide that packages such as libglib2 do require
 Thomas> BR2_ENABLE_LOCALE, or we need to find some smarter way.

A lot of stuff depends on libglib2, so I would prefer if we wouldn't add
a "fake" dependency on localization.

We could handle it in several different ways:
- Make gettext a dummy kconfig/make target when glibc is used
- Make BR2_NEEDS_GETTEXT simply be always enabled on uclibc and then
  - select gettext if BR2_NEEDS_GETTEXT (and depends on BR2_USE_WCHAR)
    for stuff like libglib2
  - select getttext if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE) for
    stuff like avahi

 Thomas> In general, this locale/gettext/libintl/libiconv thing still
 Thomas> isn't 100% clear to me. Why is iconv selected only when
 Thomas> !BR2_ENABLE_LOCALE ?

I'm definately not localization expert, but this is how I understand it:

Because it's a replacement for the iconv() implementation that uclibc
has available when BR2_ENABLE_LOCALE is enabled.

 Thomas> Does gettext works when the toolchain doesn't support locales ?

I believe it does - Possible together with libiconv if needed.

-- 
Bye, Peter Korsgaard
