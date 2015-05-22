From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 May 2015 09:56:35 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-05-21
In-Reply-To: <874mn52i52.fsf@dell.be.48ers.dk>
References: <20150522063013.33F0D100C04@stock.ovh.net>
 <874mn52i52.fsf@dell.be.48ers.dk>
Message-ID: <20150522095635.2311d66f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri, 22 May 2015 09:20:09 +0200, Peter Korsgaard wrote:

>  > Build statistics for 2015-05-21
>  > ===============================
> 
>  >         success : 293
>  >        failures : 8  
> 
> Wee, looks good!

Yeah!

> > Detail of failures
>  > ===================
> 
>  >      powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/23af5e660dd5b1cc0dd274f8fa809e772245b028/
> 
> Looks like a static linking issue. Unless somebody feels like digging
> into the cmake setup I'll simply mark it as !BR2_STATIC_LIBS.

No, it's not a CMake setup problem. It's once again a uClibc bug with
redefined symbols between libc.a and libpthread.a. For now, we should
add an exception to the autobuilders. Long term, we'll switch to
uClibc-ng, which has fixed those problems (and if not, with an upstream
that is responsive: we have reported such problems to uClibc since
years and they have never been fixed).

>  >      powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7faece26b986e7db42472f6db66c137038573555/
>  >          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7d73337ad9b50cc04dbd3414d85d3d125ad4108d/
>  >          arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/739c4f448568eb6ba5ccffe8a075e0f797c7109b/
> 
> The funky erlang issues on gcc75.

Yeah, I don't know what's going on.

> 
>  >         i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/04a1c48d484debd7894fd32997ed50d3a0110b93/
>  >       x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9accdfec87aa9922a4096b84a61a6e2dfd53561e/
> 
> Gaah, more ipmiutil issues. I believe Yann is looking into this.

Ok, let's Yann have some fun. This package is causing a lot of
troubles, even though it's just some random not so complicated utility.

>  >         bfin |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/5d215b8895ac082002b38159beb94693a04a51bb/
> 
> Sounds like a -lstdc++ issue with static linking. I'll try to find time
> to have a closer look.

Yes, that's it.

>  >         bfin |                      php-5.6.9 | NOK | http://autobuild.buildroot.net/results/b4c0e62a2ce718cf4bfad0ce328c853dc0de7f11/
> 
> Sounds like the php bump brough some extra architecture dependencies:
> 
> /ssd1/thomas/autobuild/instance-1/output/build/php-5.6.9/ext/pcre/pcrelib/pcre_jit_compile.c:65:2: error: #error Unsupported architecture
> 
> It apparently also breaks for arc:
> 
> http://autobuild.buildroot.net/results/641/6418b26140b16b6f04452a9b05431c392de04238/build-end.log
> 
> I doubt there's a lot of php users on any of those archs, so perhaps we
> should just disable it there?

It's only the new PCRE JIT stuff that isn't available on all
architectures. There is a --disable-pcregrep-jit option in pcre to
disable it, but I'm not sure how to convince PHP to pass this down to
PCRE.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
