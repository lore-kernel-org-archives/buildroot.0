From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 May 2010 00:11:49 +0200
Subject: [Buildroot] [PATCH 02/19] Make all package using gettext rely
 on BR2_NEEDS_GETTEXT
In-Reply-To: <87mxvtt4fe.fsf@macbook.be.48ers.dk>
References: <cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<cover.1274428595.git.thomas.petazzoni@free-electrons.com>
	<542fbe8520c981f9c96705a57e4263f34f2ab2e6.1274428595.git.thomas.petazzoni@free-electrons.com>
	<87mxvtt4fe.fsf@macbook.be.48ers.dk>
Message-ID: <20100522001149.2ef4a5bb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 May 2010 21:56:05 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> I unfortunately now get the following error when building with an
> internal toolchain and locales NOT enabled:
> 
> checking libintl.h usability... no
> checking libintl.h presence... no
> checking for libintl.h... no
> configure: error: 
> *** You must have either have gettext support in your C library, or
> use the *** GNU gettext library.
> (http://www.gnu.org/software/gettext/gettext.html
> 
> make: *** [/tmp/br/build/libglib2-2.22.5/.stamp_configured] Error 1
> 
> Seems like we need to make libglib2 depend on locale support?

I can reproduce the same problem (strange because I thought I tested
this case, but anyway).

So we have two cases :

 * Packages like Avahi. They understand --disable-nls and therefore
   when locale support is not enabled, they don't need gettext.

 * Packages like libglib2. They don't understand --disable-nls, so even
   when locale is not enabled, they need gettext. libglib2 builds
   fine in the previous situation, where BR2_NEEDS_GETTEXT was set
   to yes as soon as an uClibc toolchain was used (regardless of
   whether BR2_ENABLE_LOCALE is set or not). So it is possible to build
   libglib2 with a !BR2_ENABLE_LOCALE toolchain, but it requires
   gettext to be built.

So either we decide that packages such as libglib2 do require
BR2_ENABLE_LOCALE, or we need to find some smarter way.

In general, this locale/gettext/libintl/libiconv thing still isn't 100%
clear to me. Why is iconv selected only when !BR2_ENABLE_LOCALE ? Does
gettext works when the toolchain doesn't support locales ? What is the
exact role of all these components ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
