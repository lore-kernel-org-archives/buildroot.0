From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 2 Oct 2011 08:41:07 +0200
Subject: [Buildroot] [PATCHv2] package: add the poco C++ libraries
	collection
In-Reply-To: <87sjnhvlne.fsf@macbook.be.48ers.dk>
References: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
 <87mxdsxpe8.fsf@macbook.be.48ers.dk>
 <20110926064459.GB28996@sapphire.tkos.co.il>
 <87pqinvyci.fsf@macbook.be.48ers.dk>
 <20110927162627.GB5437@sapphire.tkos.co.il>
 <87sjnhvlne.fsf@macbook.be.48ers.dk>
Message-ID: <20111002064107.GB14908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Sep 27, 2011 at 09:19:01PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>  Baruch> Well, it seems that the Poco configure script can do just that
>  Baruch> when told to.  The --no-fpenvironment option replaces
>  Baruch> FPEnvironment_C99.h with FPEnvironment_DUMMY.h. You can even
>  Baruch> pass --no-wstring to disable std::wstring support. So the
>  Baruch> question is, is there a way to detect the 'defined(__UCLIBC__)
>  Baruch> && !defined (__UCLIBC_HAS_FENV__)' condition at configuration
>  Baruch> time? This seems to be much cleaner than patching the code for
>  Baruch> build time detection.
> 
> Ahh ok, good. As far as I can see, the uClibc fenv support is not really
> extensive enough to ever work, so simply detecting uClibc should be
> enough. Remember we can use uClibc through
> internal/external/crosstool-ng toolchains, so you'll need to do
> something like
> 
> ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
> POCO_CONF_OPT += --no-fpenvironment
> endif

Can't we just use $(LIBC) that is set in package/Makefile.in? Hence:

ifeq ($(LIBC),uclibc)
POCO_CONF_OPT += --no-fpenvironment
endif

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
