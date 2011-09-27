From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Sep 2011 19:26:27 +0300
Subject: [Buildroot] [PATCHv2] package: add the poco C++ libraries
	collection
In-Reply-To: <87pqinvyci.fsf@macbook.be.48ers.dk>
References: <bc337c3bfe93b6d50d40f042d53480f38a8dd0b8.1314792605.git.baruch@tkos.co.il>
 <87mxdsxpe8.fsf@macbook.be.48ers.dk>
 <20110926064459.GB28996@sapphire.tkos.co.il>
 <87pqinvyci.fsf@macbook.be.48ers.dk>
Message-ID: <20110927162627.GB5437@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Sep 26, 2011 at 10:32:29PM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  >> The FE_* macros afaik only supposed to be defined if the arch can
>  >> efficiently handle it, which isn't the case for ARM.
> 
>  Baruch> It builds here for ARM (BR2_ARM_TYPE="ARM926T") using the CodeSourcery 
>  Baruch> toolchain (with a little toolchain support fix I'll send shortly).
> 
> Indeed. The codesourcery toolchain presumably uses glibc. The problem is
> with uClibc - But I don't want to add a package which doesn't work with
> the internal toolchain.
> 
>  >> fenv.h the
>  >> supporting functions are only enabled on uClibc if UCLIBC_HAS_FENV is
>  >> enabled in the .config, which it isn't for our uClibc defconfigs.
>  >> 
>  >> I'm not exactly sure how to fix this. Any ideas?
> 
>  Baruch> Is there a way to depend on UCLIBC_HAS_FENV?
>  Baruch> Is depending on glibc an option?
> 
> I would rather see a patch which uses the dummy fenv implementation on
> uClibc without UCLIBC_HAS_FENV.
> 
> You can detect that using something like
> 
> #include <fetures.h>
> #if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_FENV__)
> ..
> 
> But I haven't looked at the poco build system to see how easy that would
> be.

Well, it seems that the Poco configure script can do just that when told to.  
The --no-fpenvironment option replaces FPEnvironment_C99.h with 
FPEnvironment_DUMMY.h. You can even pass --no-wstring to disable std::wstring 
support. So the question is, is there a way to detect the 'defined(__UCLIBC__) 
&& !defined (__UCLIBC_HAS_FENV__)' condition at configuration time? This seems 
to be much cleaner than patching the code for build time detection.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
